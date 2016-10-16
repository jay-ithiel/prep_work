const Util = require("./util");

const MovingObject = function(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    true
  );

  ctx.fill();
}

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  this.pos = this.game.wrap(this.pos);
}

MovingObject.prototype.isCollidedWith = function(otherObject) {
  let radiusSum = this.radius + otherObject.radius;

  let xDiff = otherObject.pos[0] - this.pos[0];
  let yDiff = otherObject.pos[1] - this.pos[1];
  let xDist = Math.pow(xDiff, 2);
  let yDist = Math.pow(yDiff, 2);

  let centerDiff = Math.sqrt(xDiff + yDiff);

  if (centerDiff < radiusSum) { return true; }
  else { return false; }
}


module.exports = MovingObject;
