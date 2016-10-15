function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = this.genRadius;
  this.color = this.genColor;
};

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );
  ctx.fill();
}

MovingObject.prototype.testMe = function() {
  console.log('hello');
}

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
}

const HEX_DIGITS = "0123456789ABCDEF";

MovingObject.prototype.genColor = function() {
  let color = '#';
  for (let i = 0; i < 6; i++) {
    color += HEX_DIGITS[Math.floor((Math.random() * 16))];
  }
  return color;
}

MovingObject.prototype.genRadius = function(maxX, maxY) {
  let radius = Math.random() * 20 + 5;
  return radius;
}

module.exports = MovingObject;

// window.MovingObject = MovingObject;
