require 'luasrc/game_object'
Card = class(GameObject,function(a, data)
   GameObject.init(a)
   a._data = data
   local sprite = a._data.sprite
   a.sheet = assets[sprite[1]]
   local offsetx = 2
   local offsety = 2
   local tilew = 243
   local tileh = 343
   a:set_size(tilew, tileh)
   if a:is_type("obstacle") then a.obstacle = true end
   a.quad = love.graphics.newQuad(
      offsetx+sprite[2][1]*tilew,
      offsety+sprite[2][2]*tileh,
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

function Card:flip_back(flipped_back)
   self.flipped_back = flipped_back
end

function Card:is_type(type) return self._data.type == type end

function Card:is_starter() return self:is_type("starter") end

function Card:is_obstacle() return self:is_type("obstacle") end

function Card:is_mission() return self:is_type("mission") end

function Card:is_mission_obstacle() return self:is_type("mission_obstacle") end

function Card:is_alarm_card() return false end

function Card:stealth()
   return self:_attr_value("stealth")
end

function Card:attack()
   return self:_attr_value("attack")
end

function Card:_attr_value(attr)
   if self.obstacle then
      attrs = self._data.obstacle
      return attrs.any or attrs[attr] or 0
   else
      return self._data[attr] or 0
   end
end