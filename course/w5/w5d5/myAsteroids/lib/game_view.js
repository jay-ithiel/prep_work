const Game = require("./game");
const Ship = require("./ship");

const GameView = function(game, ctx) {
  this.game = game;
  this.ctx = ctx;
  this.ship = this.game.ship;
}

GameView.prototype.start = function() {
  this.bindKeyHandlers();
  setInterval(() => {
    this.game.draw(this.ctx);
    this.game.step();
  }, 150);
}

GameView.KEY_BINDS = {
  'w': [0, -1],
  ',': [0, -1],
  'a': [-1, 0],
  's': [0, 1],
  'o': [0, 1],
  'd': [1, 0],
  'e': [1, 0],
};

GameView.prototype.bindKeyHandlers = function() {
  const ship = this.ship;
  Object.keys(GameView.KEY_BINDS).forEach((k) => {
    let offset = GameView.KEY_BINDS[k];
    key(k, function () { ship.power(offset) });
  });
}

module.exports = GameView;
