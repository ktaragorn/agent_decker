Player = class(ObjectManager, function(a, cards)
	ObjectManager.init(a)
	a.play_area = {}
	a.hand = {}
	a.equipped = {}
	a.draw_pile = CardDeck(cards, true)
	a.draw_pile:shuffle()
	a.draw_pile:set_pos({x=0, b = vars.screen.h})
	a:add_object(a.draw_pile)
end)

function Player:draw_card()
	local card = self.draw_pile:draw_from_top()[1]
	table.insert(self.hand, card)
	card:flip_back(false)
	self:add_object(card)

	local x, y = 0, 300
	card:set_pos(x + card.w * #self.hand, y)
end

function Player:add_to_play_area(cards)
	local x, y = 0, 300
	for i, card in ipairs(cards) do
		index = #self.play_area
		card:flip_back(false)
		card:set_pos(x + card.w * index, y)
		table.insert(self.play_area, card)
		self:add_object(card)
	end
end

function Player:mousepressed(x,y)
	if self.draw_pile:mousepressed(x,y) then
		self:draw_card()
	else
		return false
	end
	return true
end
