class Player
  constructor: (@deck, @x, @y) ->
    @discard = []
    @equip = []
    @play_area = []
    @hand = []

  draw: ->