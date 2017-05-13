GameObject = class(function(a)
	a.x = 0
	a.y = 0
	a.w = 0
	a.h = 0
end)

function GameObject:set_pos(x,y)
   self.x = x
   self.y = y
end

function GameObject:set_size(w,h)
   self.w = w
   self.h = h
end

function GameObject:mousepressed(x,y)
	return x >= self.x and x <= (self.x + self.w) and
		y >= self.y and y <= (self.y + self.h)
end