Player = class(ObjectManager, function(a, cards)
	ObjectManager.init(a)
	a.play_area = {}
	a.hand = {}
	a.equipped = {}
	a.discard = CardDeck(cards, true)
end)

function Player:draw_cards()

end

