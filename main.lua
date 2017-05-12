require "luasrc/card"
require "luasrc/alarm_card"

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
	a = AlarmCard({
		name ="alarm",
		sprite = {1, {2, 2}},
		type = "special"
	})
	a:set_pos(200,200)
end

function love.draw()
    c:draw()
    a:draw()
end

function love.update(t)

end

function love.mousepressed(x,y)
	if c:mousepressed(x,y) then
		c:flip_back(not c.flipped_back)
		c:set_pos(x,y)
	end
end

