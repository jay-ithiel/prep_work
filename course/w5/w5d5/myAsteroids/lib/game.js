const Asteroid = require("./asteroid");
const Ship = require("./ship")
const Util = require("./util");

function Game() {
  this.asteroids = [];
  this.ship = new Ship({ game: this });

  this.addAsteroids();
}

Game.DIM_X = 600;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 5;
Game.BG_COLOR = "#000000";

Game.prototype.randomPosition = function() {
  return [
    Game.DIM_X * Math.random(),
    Game.DIM_Y * Math.random()
  ];
}

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++){
    this.asteroids.push(new Asteroid({ game: this, id: i }));
  }
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  ctx.fillStyle = Game.BG_COLOR;
  ctx.fillRect(0, 0, Game.DIM_X, Game.DIM_Y);

  for (let i = 0; i < this.allObjects.length; i++){
    this.allObjects[i].draw(ctx);
  }
}

Game.prototype.allObjects = function() {
  const objects = this.asteroids.concat(this.ship);
  return objects;
}

Game.prototype.moveObjects = function() {
  for (let i = 0; i < this.allObjects.length; i++){
    this.allObjects[i].move();
  }
}

Game.prototype.wrap = function(pos) {
  let x = pos[0], y = pos[1];
  let maxX = Game.DIM_X, maxY = Game.DIM_Y;

  let wrappedX = Util.wrap(x, maxX);
  let wrappedY = Util.wrap(y, maxY);

  return [wrappedX, wrappedY];
}

Game.prototype.checkCollisions = function() {
  for (var i = 0; i < allObjects.length; i++) {
    for (var j = 0; j < allObjects.length; j++) {
      let asteroid1 = allObjects[i];
      let asteroid2 = allObjects[j];

      if (asteroid1.id === asteroid2.id) { continue }

      console.log(asteroid1.isCollidedWith(asteroid2));
      console.log(asteroid1.id);
      console.log(asteroid2.id);

      if (asteroid1.isCollidedWith(asteroid2)) {
        const collision = asteroid1.collideWith(asteroid2);
        if (collision) { return }
      }
    }
  }
}

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
}

Game.prototype.remove = function(object) {
  let index = allObjects.indexOf(object);
  allObjects.splice(index, 1);
}

module.exports = Game;
