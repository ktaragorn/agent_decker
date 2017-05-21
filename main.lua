require 'src/vendor/class'
require "src/card"
require "src/card_deck"
require "src/object_manager"
require "src/alarm_card"
require "src/game"
json = require "src/vendor/dkjson"
require "src/utils"

function love.load()
	local w,h, f = love.window.getMode()
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

	assets.card_info = json.decode(io.open("./assets/sprites.json"):read("*all"))

	assets.bg = love.graphics.newImage("assets/bg.jpg")
	assets.bg:setWrap("repeat", "repeat")
	assets.bg_quad = love.graphics.newQuad(
	    0, 0,
	    vars.screen.w, vars.screen.h,
	    assets.bg:getWidth(), assets.bg:getHeight()
	)

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

