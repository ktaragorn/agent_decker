require "luasrc/card"


function love.load()
	assets = {}
	assets.back = love.graphics.newImage("assets/card_back.png")
	for i = 1,6 do
		assets[i] = love.graphics.newImage("assets/card_sheets/"..i..".png")
	end
	c = Card({
		name="hide",
		sprite= {1, {0,0}},
		type= "starter",
		stealth= 1,
		count= 3,
	})
end

function love.draw()
    c:draw()
end

function love.mousepressed(x,y)
	c:flip_back(not c.flipped_back)
	c:set_pos(x,y)
end