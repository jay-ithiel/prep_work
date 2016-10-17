const Game = require("./game");
const Ship = require("./ship");

const GameView = function(game, ctx) {
  this.game = game;
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  setInterval(() => {
    this.game.draw(this.ctx);
    this.game.step();
  }, 150);
}

GameView.KEY_BINDS = {
  'w': [0, 1],
  'a': [-1, 0],
  's': [0, -1],
  'd': [1, 0]
};

GameView.prototype.bindKeyHandlers = function(key) {
  let offset = GameView.KEY_BINDS[key];
  this.game.ship.power(offset);
}

module.exports = GameView;
