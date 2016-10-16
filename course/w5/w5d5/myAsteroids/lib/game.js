const Asteroid = require("./asteroid");
const Util = require("./util");

function Game() {
  this.asteroids = [];
  this.addAsteroids();
}

Game.DIM_X = 800;
Game.DIM_Y = 800;
Game.NUM_ASTEROIDS = 10;
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

Game.prototype.wrap = function(pos) {
  let x = pos[0], y = pos[1];
  let maxX = Game.DIM_X, maxY = Game.DIM_Y;

  let wrappedX = Util.wrap(x, maxX);
  let wrappedY = Util.wrap(y, maxY);

  // if (x > Game.DIM_X) { x -= Game.DIM_X; }
  // if (y > Game.DIM_Y) { y -= Game.DIM_Y; }

  return [wrappedX, wrappedY];
}

Game.prototype.checkCollisions = function() {
  for (var i = 0; i < this.asteroids.length; i++) {
    let asteroid1 = this.asteroids[i];
    for (var j = 0; j < this.asteroids.length; j++) {
      let asteroid2 = this.asteroids[j];
      if (i === j) { continue }
      if (asteroid1.isCollidedWith(asteroid2)) { alert ("COLLISION") }
    }
  }
}

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
}

module.exports = Game;
