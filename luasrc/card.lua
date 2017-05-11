require 'luasrc/class'
Card = class(function(a, data)
   a.data = data
   sprite = a.data.sprite
   a.sheet = assets[sprite[1]]
   tilew = 245
   tileh = 345
   a.quad = love.graphics.newQuad(
      sprite[2][1]*tilew,
      sprite[2][2]*tileh,
      tilew, tileh,
      a.sheet:getDimensions())
   end)

function Card:draw()
   love.graphics.draw(self.sheet, self.quad, 0,0)
end