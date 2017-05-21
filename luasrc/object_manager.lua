ObjectManager = class(function(a) a.objects = {} end)

function ObjectManager:add_object(object)
	table.insert(self.objects, object)
end

function ObjectManager:draw()
	for index = #self.objects, 1, -1 do
		self.objects[index]:draw()
	end
end

function ObjectManager:update(dt)
	for index = #self.objects, 1, -1 do
		self.objects[index]:update(dt)
	end
end

function ObjectManager:mousepressed(x,y)
	for index = #self.objects, 1, -1 do
		print(index)
		consumed = self.objects[index]:mousepressed(x,y)
		if consumed then
			return true
		end
	end
	return false
end