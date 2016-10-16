const Asteroid = require("./asteroid");
const Util = require("./util");

function Game() {
  this.asteroids = [];
  this.addAsteroids();
}

Game.DIM_X = 800;
Game.DIM_Y = 800;
Game.NUM_ASTEROIDS = 20;

Game.prototype.randomPosition = function() {
  return [
    Game.DIM_X * Math.Random(),
    Game.DIM_Y * Math.Random()
  ];
}

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < this.NUM_ASTEROIDS; i++){
    this.asteroids.push(new Asteroid());
  }
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);

  for (let i = 0; i < this.asteroids.length; i++){
    this.asteroids[i].draw();
  }
}

Game.prototype.moveObjects = function() {
  for (let i = 0; i < this.asteroids.length; i++){
    this.asteroids[i].move();
  }
}

module.exports = Game;
