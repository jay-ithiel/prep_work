const Game = require("./game.js")

function GameView(ctx) {
  this.ctx = ctx
  this.game = new Game();
}

GameView.prototype.start = function () {
  setInterval(this.game.draw.bind(this.game, this.ctx), 200);
};

module.exports = GameView;
