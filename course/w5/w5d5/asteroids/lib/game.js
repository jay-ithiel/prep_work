const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");

function Game() {
  this.DIM_X = 800;
  this.DIM_Y = 800;
  this.NUM_ASTEROIDS = 10;
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    let asteroid = new Asteroid();
    this.asteroids.push(asteroid);
  }
}

Game.prototype.randomPosition = function() {

}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0,0, this.DIM_X, this.DIM_Y);

  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    this.asteroids[i].draw(ctx);
  }
}

Game.prototype.moveObjects = function() {
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    this.asteroids[i].move();
  }
}

module.exports = Game;
