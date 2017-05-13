require 'luasrc/vendor/class'
require "luasrc/card"
require "luasrc/alarm_card"
require "luasrc/game"
json = require "luasrc/vendor/dkjson"
require "luasrc/utils"

function love.load()
	assets = {}
	assets.back = love.graphics.newImage("assets/card_back.png")
	for i = 1,6 do
		assets[i] = love.graphics.newImage("assets/card_sheets/"..i..".png")
	end
	assets.card_info = json.decode(io.open("./src/sprites.json"):read("*all"))
	game = Game()
end

function love.draw()
	game:draw()
end

function love.update(t)
	game:update(t)
end

function love.mousepressed(x,y)
	game:mousepressed(x,y)
end

