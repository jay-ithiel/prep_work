const Asteroid = require("./asteroid");
const Util = require("./util");

function Game() {
  this.asteroids = [];
  this.addAsteroids();
}

Game.DIM_X = 800;
Game.DIM_Y = 800;
Game.NUM_ASTEROIDS = 20;
Game.BG_COLOR = "#000000";

Game.prototype.randomPosition = function() {
  return [
    Game.DIM_X * Math.random(),
    Game.DIM_Y * Math.random()
  ];
}

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++){
    this.asteroids.push(new Asteroid({ game: this }));
  }
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  ctx.fillStyle = Game.BG_COLOR;
  ctx.fillRect(0, 0, Game.DIM_X, Game.DIM_Y);

  for (let i = 0; i < this.asteroids.length; i++){
    this.asteroids[i].draw(ctx);
  }
}

Game.prototype.moveObjects = function() {
  for (let i = 0; i < this.asteroids.length; i++){
    this.asteroids[i].move();
  }
}

Game.prototype.wrap = function() {
  
}

module.exports = Game;
