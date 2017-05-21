require 'luasrc/vendor/class'
require "luasrc/card"
require "luasrc/card_deck"
require "luasrc/object_manager"
require "luasrc/alarm_card"
require "luasrc/game"
json = require "luasrc/vendor/dkjson"
require "luasrc/utils"

function love.load()
	local w,h, f = love.window.getMode()
	print(inspect(f))
	vars = {
		scale = {
			x = 0.6,
			y = 0.6
		}
	}
	vars.screen ={
		w = w / vars.scale.x,
		h = h / vars.scale.y
	}
	assets = {}
	assets.back = love.graphics.newImage("assets/card_back.png")
	for i = 1,6 do
		assets[i] = love.graphics.newImage("assets/card_sheets/"..i..".png")
	end
	assets.card_info = json.decode(io.open("./src/sprites.json"):read("*all"))
	game = Game()
end

function love.draw()
 	love.graphics.scale(vars.scale.x, vars.scale.x)
	game:draw()
end

function love.update(t)
	game:update(t)
end

function love.mousepressed(x,y)
	game:mousepressed(x/vars.scale.x, y/vars.scale.y)
end

