Player = class(ObjectManager, function(a, cards)
	ObjectManager.init(a)
	a.play_area = {}
	a.hand = {}
	a.equipped = {}
	a.draw_pile = CardDeck(cards, true)
end)

function Player:draw_cards()

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
