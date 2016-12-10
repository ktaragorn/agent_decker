class Card extends GameObject
	constructor: (image) ->
		@image= image
		@flipped = false
	flip: (state=true) ->
		@flipped = state

	draw: (ctx) ->
		#
