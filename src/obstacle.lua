Obstacle = class(ObjectManager, function(a, cards)
	ObjectManager.init(a)
	a.draw_pile = CardDeck(cards, true)
	a.draw_pile:shuffle()
	a.active_obstacles = {}
	a.draw_pile:set_pos(10, vars.screen.h/2 - cards[1].h)
	a:add_object(a.draw_pile)
end)