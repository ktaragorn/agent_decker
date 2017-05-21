CardDeck = class(GameObject, function(a, cards, flipped_back)
	a.cards = {}
	a.flipped_back = flipped_back
	a:add_cards_to_top(cards)
end)

function CardDeck:shuffle()
	shuffle(self.cards)
end

function CardDeck:draw()
	if #self.cards > 0 then
		self.cards[#self.cards]:draw(self.x, self.y)
	end
end

function CardDeck:set_pos(x,y)
	GameObject.set_pos(self, x,y)
	for i,card in ipairs(self.cards) do card:set_pos(x,y) end
end

function CardDeck:add_card_to_top(card)
	card:set_pos(self.x, self.y)
	card:flip_back(self.flipped_back)
	self.cards[#self.cards + 1] = card
end

function CardDeck:add_cards_to_top(cards)
	for i,card in ipairs(cards) do self:add_card_to_top(card) end
end

function CardDeck:draw_from_top(count)
	count = count or 1
	drawn = {}

	for i = 1, count do
		table.insert(drawn, table.remove(self.cards, #self.cards))
	end
	return drawn
end

function CardDeck:mousepressed(x,y)
	if #self.cards > 0 then
		return self.cards[1]:mousepressed(x,y)
	else
		return false
	end
end