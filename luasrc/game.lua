require "luasrc/mission"
require "luasrc/obstacle"
require "luasrc/player"

Game = class(ObjectManager, function(a)
	ObjectManager.init(a)
	a.all_cards = Game.generate_cards(assets.card_info)
	a.mission_deck  = Mission()
    a.obstacle_deck = Obstacle()
    a.player        = Player()
    a.alarm_card    = 3
    c               = Card({
		name="hide",
		sprite= {1, {0,0}},
		type= "starter",
		stealth= 1,
		count= 3,
	})
    a:add_object(a.mission_deck)
    a:add_object(a.obstacle_deck)
    a:add_object(a.player)
    a:add_object(c)
	local ac = AlarmCard({
		name ="alarm",
		sprite = {1, {2, 2}},
		type = "special"
	})
	a:add_object(ac)
	ac:set_pos(200,200)
end)

function Game.generate_cards(card_info)
	cards = {}


	return cards
end

function Game.generate_card(info)

end

function Game:mousepressed(x,y)
	ObjectManager.mousepressed(self, x,y)
	if c:mousepressed(x,y) then
		c:flip_back(not c.flipped_back)
		c:set_pos(x,y)
	end
end