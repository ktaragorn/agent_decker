CardDeck = class(GameObject, function(a, cards, flipped_back)
	a.cards = cards
	for card in cards do card:flip_back(flipped_back) end
	a.flipped_back = flipped_back
end)

function CardDeck:shuffle()
	shuffle(a.cards)
end

function CardDeck:draw()
	a.cards[#a.cards]:draw(self.x, self.y)
end

function CardDeck:add_to_top(card)
	card:flip_back(self.flipped_back)
	a.cards[#a.cards + 1] = card
end

function CardDeck:draw_from_top(count)
	count = count or 1
	drawn = {}

	for i = 1, count do
		table.insert(drawn, table.remove(a.cards, #a.cards))
	end
	return drawn
end