/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const Game = __webpack_require__(1);
	const GameView = __webpack_require__(6)

	document.addEventListener("DOMContentLoaded", function() {
	  const canvas = document.getElementById("game-canvas");
	  canvas.width = Game.DIM_X;
	  canvas.height = Game.DIM_Y;

	  const ctx = canvas.getContext("2d");
	  const game = new Game();
	  const gameView = new GameView(game, ctx);
	  gameView.start();
	});


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const Asteroid = __webpack_require__(2);
	const Ship = __webpack_require__(3)
	const Util = __webpack_require__(4);

	function Game() {
	  this.asteroids = [];
	  this.ship = new Ship({ game: this });
	  this.addAsteroids();
	  this.allObjects = this.getAllObjects();
	}

	Game.DIM_X = 600;
	Game.DIM_Y = 600;
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
	    this.asteroids.push(new Asteroid({ game: this, id: i }));
	  }
	}

	Game.prototype.draw = function(ctx) {
	  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
	  ctx.fillStyle = Game.BG_COLOR;
	  ctx.fillRect(0, 0, Game.DIM_X, Game.DIM_Y);


	  for (let i = 0; i < this.allObjects.length; i++) {
	    this.allObjects[i].draw(ctx);
	  }
	}

	Game.prototype.getAllObjects = function() {
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
	  for (var i = 0; i < this.allObjects.length; i++) {
	    for (var j = 0; j < this.allObjects.length; j++) {
	      let object1 = this.allObjects[i];
	      let object2 = this.allObjects[j];

	      if (object1.isCollidedWith(object2)) {
	        const collision = object1.collideWith(object2);
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
	  let index = this.allObjects.indexOf(object);
	  this.allObjects.splice(index, 1);
	}

	module.exports = Game;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const Ship = __webpack_require__(3)
	const MovingObject = __webpack_require__(5);
	const Util = __webpack_require__(4);

	function Asteroid(options = {}) {
	  options.color = "#505050";
	  options.radius = Util.randomRadius();
	  options.pos = options.pos || options.game.randomPosition();
	  options.vel = options.vel || Util.randomVec(50);
	  options.id = options.id;

	  MovingObject.call(this, options);
	}

	Util.inherits(Asteroid, MovingObject)

	Asteroid.prototype.collideWith = function (otherObject) {
	  if (otherObject instanceof Ship) {
	    otherObject.relocate();
	  }
	}

	module.exports = Asteroid;


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	const Util = __webpack_require__(4);
	const MovingObject = __webpack_require__(5)

	function Ship(options = {}) {
	  options.radius = 15;
	  options.color = "#00FF00";
	  options.vel = [0,0];
	  options.pos = options.game.randomPosition();
	  this.game = options.game;

	  MovingObject.call(this, options);
	}

	Util.inherits(Ship, MovingObject);

	Ship.prototype.relocate = function() {
	  this.pos = this.game.randomPosition();
	  this.vel = [0,0];
	}

	Ship.prototype.power = function(impulse) {
	  let xOffset = impulse[0];
	  let yOffset = impulse[1];

	  this.pos[0] += xOffset * 10;
	  this.pos[1] += yOffset * 10;
	}

	module.exports = Ship;


/***/ },
/* 4 */
/***/ function(module, exports) {

	const Util = {
	  inherits (childClass, ParentClass) {
	    function Surrogate() {};
	    Surrogate.prototype = ParentClass.prototype;
	    childClass.prototype = new Surrogate();
	    childClass.prototype.constructor = childClass;
	  },

	  randomVec (length) {
	    var deg = 2 * Math.PI * Math.random();
	    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
	  },

	  scale (vec, m) {
	    return [vec[0] * m, vec[1] * m];
	  },

	  wrap (coord, max) {
	    if (coord < 0) {
	      return max - (coord % max);
	    } else if (coord > max) {
	      return coord % max;
	    } else {
	      return coord;
	    }
	  },

	  dist (pos1, pos2) {
	    return Math.sqrt(
	      Math.pow(pos1[0] - pos2[0], 2) + Math.pow(pos1[1] - pos2[1], 2)
	    );
	  },

	  randomRadius (maxX, maxY) {
	    let radius = Math.random() * 20 + 5;
	    return radius;
	  }
	}

	module.exports = Util;


/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	const Util = __webpack_require__(4);

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


/***/ },
/* 6 */
/***/ function(module, exports, __webpack_require__) {

	const Game = __webpack_require__(1);
	const Ship = __webpack_require__(3);

	const GameView = function(game, ctx) {
	  this.game = game;
	  this.ctx = ctx;
	  this.ship = this.game.ship;
	}

	GameView.prototype.start = function() {
	  this.bindKeyHandlers();
	  setInterval(() => {
	    this.game.draw(this.ctx);
	    this.game.step();
	  }, 150);
	}

	GameView.KEY_BINDS = {
	  'w': [0, -1],
	  ',': [0, -1],
	  'a': [-1, 0],
	  's': [0, 1],
	  'o': [0, 1],
	  'd': [1, 0],
	  'e': [1, 0]
	};

	GameView.prototype.bindKeyHandlers = function() {
	  const ship = this.ship;
	  Object.keys(GameView.KEY_BINDS).forEach((k) => {
	    let offset = GameView.KEY_BINDS[k];
	    key(k, function () { ship.power(offset) });
	  });
	}

	module.exports = GameView;


/***/ }
/******/ ]);