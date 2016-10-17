const Util = require("./util");
const MovingObject = require("./moving_object")

function Ship(options = {}) {
  options.radius = 15;
  options.color = "#00FF00";
  options.vel = [0,0];
  options.pos = options.game.randomPosition();
  this.game = options.game;

  MovingObject.call(this, options);
}

Util.inherits(Ship, MovingObject);

Ship.prototype.relocate = function() {
  this.pos = this.game.randomPosition();
  this.vel = [0,0];
}

Ship.prototype.power = function(impulse) {
  let xOffset = impulse[0];
  let yOffset = impulse[1];

  this.pos[0] += xOffset * 10;
  this.pos[1] += yOffset * 10;
}

module.exports = Ship;
