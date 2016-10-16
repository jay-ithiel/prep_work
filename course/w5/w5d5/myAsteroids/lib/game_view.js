const Game = require("./game");
const Ship = require("./ship");

function GameView(ctx) {
  this.game = new Game();
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  setInterval(() => {
    this.game.moveObjects();
    this.game.draw();
  }, 200);
}

module.exports = GameView;
