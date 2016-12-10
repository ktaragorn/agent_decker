class Card extends GameObject
	constructor: (image) ->
    @front= image
    @back =
		@flipped = false
	flip: (state=true) ->
		@flipped = state

	draw: (ctx) ->
		#
