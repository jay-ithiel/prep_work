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

	const GameView = __webpack_require__(1);

	document.addEventListener("DOMContentLoaded", function() {
	  const canvas = document.getElementById("game-canvas");
	  const ctx = canvas.getContext("2d");
	  let gameView = new GameView(ctx);
	  gameView.start();
	});


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const Game = __webpack_require__(2)

	function GameView(ctx) {
	  this.ctx = ctx
	  this.game = new Game();
	}

	GameView.prototype.start = function () {
	  setInterval(this.game.draw.bind(this.game, this.ctx), 200);
	};

	module.exports = GameView;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const MovingObject = __webpack_require__(3);
	const Asteroid = __webpack_require__(4);

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


/***/ },
/* 3 */
/***/ function(module, exports) {

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


/***/ },
/* 4 */
/***/ function(module, exports, __webpack_require__) {

	const MovingObject = __webpack_require__(3);
	const Util = __webpack_require__(5);

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


/***/ },
/* 5 */
/***/ function(module, exports) {

	const Util = {
	  inherits (childClass, parentClass) {
	    function Surrogate() {};
	    Surrogate.prototype = parentClass.prototype
	    childClass.prototype = new Surrogate();
	    childClass.prototype.constructor = childClass;
	  },

	  randomVec(length) {
	    let y = Math.random() * length;
	    let x = Math.random() * length;
	    return [x, y];
	  }
	}


	module.exports = Util;


/***/ }
/******/ ]);