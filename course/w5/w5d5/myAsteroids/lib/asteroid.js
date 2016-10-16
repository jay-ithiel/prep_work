const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");

function Asteroid(options) {
  this.color = #D3D3D3;
  this.radius = this.genRadius();
  this.pos = options.pos;
  this.vel = Util.randomVec();

  MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject)

Asteroid.prototype.randomRadius = function(maxX, maxY) {
  let radius = Math.random() * 20 + 5;
  return radius;
}
