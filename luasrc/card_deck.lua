CardDeck = class(GameObject, function(a, cards, flipped_back)
	a.cards = {}
	a.flipped_back = flipped_back
	a:add_cards_to_top(cards)
end)

function CardDeck:shuffle()
	shuffle(a.cards)
end

function CardDeck:draw()
	a.cards[#a.cards]:draw(self.x, self.y)
end

function CardDeck:add_to_top(card)
	card:set_pos(self.x, self.y)
	card:flip_back(self.flipped_back)
	self.cards[#self.cards + 1] = card
end

function CardDeck:add_cards_to_top(cards)
	for i,card in ipairs(self.cards) do self:add_card_to_top(card) end
end

function CardDeck:draw_from_top(count)
	count = count or 1
	drawn = {}

	for i = 1, count do
		table.insert(drawn, table.remove(a.cards, #a.cards))
	end
	return drawn
end