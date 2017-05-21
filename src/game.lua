require "src/mission"
require "src/obstacle"
require "src/player"

Game = class(ObjectManager, function(a)
	ObjectManager.init(a)
	a.all_cards = Game.generate_cards(assets.card_info)
	-- not pretty.. should generate_cards generate a hash directly?
	local mission, obstacle, player, alarm_card = a:split_cards()
	a.mission_deck  = Mission(mission)
    a.obstacle_deck = Obstacle(obstacle)
    a.player        = Player(player)
    a.alarm_card    = alarm_card
    a:add_object(a.mission_deck)
    a:add_object(a.obstacle_deck)
    a:add_object(a.player)
	a:add_object(a.alarm_card)
	a.alarm_card:set_pos({r= vars.screen.w, y = 0})
end)

function Game.generate_cards(cards_info)
	local cards = {}
	for i, card_info in ipairs(cards_info) do
		count = card_info.count or 1
		for j = 1, count do
			table.insert(cards, Game.generate_card(card_info))
		end
	end
	return cards
end

function Game.generate_card(info)
	if info.type == "special" and info.name == "alarm" then
		return AlarmCard(info)
	else
		return Card(info)
	end
end

function Game:split_cards()
	local mission, obstacle, player, alarm_card = {}, {}, {}
	for i, card in ipairs(self.all_cards) do
		if card:is_alarm_card() then
			alarm_card = card
		elseif card:is_starter() then
			table.insert(player, card)
		elseif card:is_obstacle() then
			table.insert(obstacle, card)
		elseif card:is_mission() or card:is_mission_obstacle() then
			table.insert(mission, card)
		end
	end

	return mission, obstacle, player, alarm_card
end