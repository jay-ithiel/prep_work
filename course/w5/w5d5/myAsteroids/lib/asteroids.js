const Game = require("./game");
const GameView = require("./game_view")

document.addEventListener("DOMContentLoaded", function() {
  const canvas = document.getElementById("game-canvas");
  canvas.width = Game.DIM_X;
  canvas.height = Game.DIM_Y;

  const ctx = canvas.getContext("2d");
  const game = new Game();
  const gameView = new GameView(game, ctx);
  gameView.start();
});
