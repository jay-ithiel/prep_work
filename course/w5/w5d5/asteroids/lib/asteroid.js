const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");

function Asteroid(pos) {
  this.color = this.genColor();
  this.radius = this.genRadius();
  this.pos = Util.randomVec(800);
  this.vel = Util.randomVec(50);
}

Util.inherits(Asteroid, MovingObject);

window.Asteroid = Asteroid;
module.exports = Asteroid;





// let a = new Asteroid();
// let b = new MovingObject({pos: [0,5], vel: [10,10], radius: 10, color: 'blue'});
// a.testMe();
// b.testMe();
