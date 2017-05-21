GameObject = class(function(a)
	a.x = 0
	a.y = 0
	a.w = 0
	a.h = 0
end)

function GameObject:set_pos(x_or_pos,y)
	if type(x_or_pos) == "table" then
		self.x = x_or_pos.x or (x_or_pos.r - self.w)
		self.y = x_or_pos.y or (x_or_pos.b - self.h)
	else
		self.x = x_or_pos
		self.y = y
	end
end

function GameObject:set_size(w,h)
	self.w = w
	self.h = h
end

function GameObject:mousepressed(x,y)
	return x >= self.x and x <= (self.x + self.w) and
		y >= self.y and y <= (self.y + self.h)
end

function GameObject:draw() end
function GameObject:update(dt) end