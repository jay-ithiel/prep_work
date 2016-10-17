const Ship = require("./ship")
const MovingObject = require("./moving_object");
const Util = require("./util");

function Asteroid(options = {}) {
  options.color = "#505050";
  options.radius = Util.randomRadius();
  options.pos = options.pos || options.game.randomPosition();
  options.vel = options.vel || Util.randomVec(50);
  options.id = options.id;

  MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject)

Asteroid.prototype.collideWith = function (otherObject) {
  if (otherObject instanceof Ship) {
    Ship.relocate();
  }
}

module.exports = Asteroid;
