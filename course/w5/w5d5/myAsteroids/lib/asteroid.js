const Game = require("./game");
const MovingObject = require("./moving_object");
const Util = require("./util");

function Asteroid(options) {
  this.color = "#505050";
  this.radius = this.randomRadius();
  this.pos = options.pos || Game.randomPosition();
  this.vel = options.vel || Util.randomVec(50);

  MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject)

Asteroid.prototype.randomRadius = function(maxX, maxY) {
  let radius = Math.random() * 20 + 5;
  return radius;
}

module.exports = Asteroid;
