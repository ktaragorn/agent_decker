class GameManager
  constructor: ->

  start: ->
    console.log "Starting Game"
    @load_card_info()
    @load_assets()

  load_assets: ->
    console.log "Loading Game Assets"
    assets = {
      images: ["card_back.png"]
      sprites: @generate_sprite_hash()
    }
    Crafty.paths({images: "./assets/"})
    Crafty.load(assets,( -> console.log("loaded")), (-> console.log("progress?")), ((e)-> debugger))

  load_card_info: ->
    @card_info = card_info

  generate_sprite_hash: ->
    tile = 345
    tileh = 244
    hash = {
      "card_sheets/1.png":{
        tile: tile,
        tileh: tileh,
        map: {}
        },
      "card_sheets/2.png":{
        tile: tile,
        tileh: tileh,
        map: {}
        },
      "card_sheets/3.png":{
        tile: tile,
        tileh: tileh,
        map: {}
        },
      "card_sheets/4.png":{
        tile: tile,
        tileh: tileh,
        map: {}
        },
      "card_sheets/5.png":{
        tile: tile,
        tileh: tileh,
        map: {}
        },
      "card_sheets/6.png":{
        tile: tile,
        tileh: tileh,
        map: {}
      }
    }
    card_info.map (sprite) ->
      hash["card_sheets/"+ sprite["sprite"][0] + ".png"]["map"][sprite["name"]] = sprite["sprite"][1]
    hash


