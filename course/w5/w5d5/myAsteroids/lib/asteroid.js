const MovingObject = require("./moving_object");
const Util = require("./util");

function Asteroid(options = {}) {
  options.color = "#505050";
  options.radius = this.randomRadius();
  options.pos = options.pos || options.game.randomPosition();
  options.vel = options.vel || Util.randomVec(50);

  MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject)

Asteroid.prototype.randomRadius = function(maxX, maxY) {
  let radius = Math.random() * 20 + 5;
  return radius;
}

module.exports = Asteroid;
