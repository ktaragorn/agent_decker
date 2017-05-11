require 'luasrc/class'
Card = class(function(a, data)
   a._data = data
   local sprite = a.data.sprite
   a.sheet = assets[sprite[1]]
   local tilew = 245
   local tileh = 345
   a.quad = love.graphics.newQuad(
      sprite[2][1]*tilew,
      sprite[2][2]*tileh,
      tilew, tileh,
      a.sheet:getDimensions())
   end)

function Card:draw()
   if self.flipped_back then
      love.graphics.draw(assets.back, self.x, self.y)
   else
      love.graphics.draw(self.sheet, self.quad, self.x, self.y)
   end
end

function Card:set_pos(x,y)
   self.x = x
   self.y = y
end

function Card:flip_back(flipped_back)
   self.flipped_back = flipped_back
end

function Card:is_type(type)
   return self._data.type == type
end

function Card:is_starter()
   return self:is_type("starter")
end

function Card:stealth()
   return self._data.stealth or 0
end

function Card:attack()
   return self._data.attack or 0
end