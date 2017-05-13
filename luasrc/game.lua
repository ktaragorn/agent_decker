Game = class(function(a)
	a.all_cards = Game.generate_cards(assets.card_info)
	a.mission_deck  = 1
    a.obstacle_deck = 2
    a.alarm_card    = 3
    c = Card({
		name="hide",
		sprite= {1, {0,0}},
		type= "starter",
		stealth= 1,
		count= 3,
	})
	ac = AlarmCard({
		name ="alarm",
		sprite = {1, {2, 2}},
		type = "special"
	})
	ac:set_pos(200,200)
end)

function Game.generate_cards(card_info)
	cards = {}


	return cards
end

function Game.generate_card(info)

end

function Game:draw()
    c:draw()
    ac:draw()
end

function Game:update(dt)

end

function Game:mousepressed(x,y)
	if c:mousepressed(x,y) then
		c:flip_back(not c.flipped_back)
		c:set_pos(x,y)
	end
end