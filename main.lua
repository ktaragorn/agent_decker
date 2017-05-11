require "luasrc/card"

c = Card({
		name="hide",
		sprite= {1, {0,0}},
		type= "starter",
		stealth= 1,
		count= 3,
	})
function love.load()
    back = love.graphics.newImage("assets/card_back.png")
end
function love.draw()
    c:draw()
end