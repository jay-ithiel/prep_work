const Util = require("./util");

const MovingObject = function(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
  this.id = options.id;
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

MovingObject.prototype.collideWith = function (otherObject) {
  // default do nothing
};

MovingObject.prototype.isCollidedWith = function(otherObject) {
  if (this.id === otherObject.id) { return false }
  let radiusSum = this.radius + otherObject.radius;
  const centerDiff = Util.dist(this.pos, otherObject.pos);

//   let xDiff = this.pos[0] - otherObject.pos[0];
//   let yDiff = this.pos[1] - otherObject.pos[1];
//   let xDist = Math.pow(xDiff, 2);
//   let yDist = Math.pow(yDiff, 2);
//   let diffSum = Math.abs(xDiff + yDiff);
//   let centerDiff = Math.sqrt(diffSum);

  // if (centerDiff < radiusSum) { debugger }
  return centerDiff < radiusSum;
}

module.exports = MovingObject;
