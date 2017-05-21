Player = class(ObjectManager, function(a, cards)
	ObjectManager.init(a)
	a:add_object(cards[1])
	a.play_area = {cards[1]}
	a.hand = {}
	a.equipped = {}
	a.discard = CardDeck(cards, true)
end)

function Player:draw_cards()

end

function Player:mousepressed( x,y )
	local c = self.play_area[1]
	if c:mousepressed(x,y) then
		c:flip_back(not c.flipped_back)
		c:set_pos(x,y)
	end
end

