window.onload = (e)->
  Crafty.init(1024, 768, document.getElementById('game'));
  Crafty.background('#55F');

  game_manager = new GameManager
  game_manager.start()