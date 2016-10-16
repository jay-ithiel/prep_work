const Game = require("./game");
const Ship = require("./ship");

const GameView = function(game, ctx) {
  this.game = game;
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  setInterval(() => {
    this.game.step();
    this.game.draw(this.ctx);
  }, 200);
}

module.exports = GameView;
