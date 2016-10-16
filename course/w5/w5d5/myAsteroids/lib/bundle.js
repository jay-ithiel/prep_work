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
	const GameView = __webpack_require__(5)

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
	const Util = __webpack_require__(4);

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


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const Game = __webpack_require__(1);
	const MovingObject = __webpack_require__(3);
	const Util = __webpack_require__(4);

	function Asteroid(options) {
	  this.color = "#D3D3D3";
	  this.radius = this.genRadius();
	  this.pos = options.pos || Game.randomPosition();
	  this.vel = options.vel || Util.randomVec(50);

	  MovingObject.call(this, options);
	}

	Util.inherits(Asteroid, MovingObject)

	Asteroid.prototype.randomRadius = function(maxX, maxY) {
	  let radius = Math.random() * 20 + 5;
	  return radius;
	}

	module.exports = Asteroid;


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	const Util = __webpack_require__(4);

	const MovingObject = function(options) {
	  this.pos = options.pos;
	  this.vel = options.vel;
	  this.radius = options.radius;
	  this.color = options.color;
	  this.game = options.game;
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
	    false
	  );

	  ctx.fill();
	}

	MovingObject.prototype.move = function() {
	  this.pos[0] += this.vel[0];
	  this.pos[1] += this.vel[1];
	}

	module.exports = MovingObject;


/***/ },
/* 4 */
/***/ function(module, exports) {

	const Util = {
	  inherits(childClass, ParentClass) {
	    function Surrogate() {};
	    Surrogate.prototype = ParentClass.prototype;
	    childClass.prototype = new Surrogate();
	    childClass.prototype.constructor = childClass;
	  },

	  randomVec(length) {
	    let x = Math.random() * length;
	    let y = Math.random() * length;
	    return [x, y];
	  }
	}

	module.exports = Util;


/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	const Game = __webpack_require__(1);
	const Ship = __webpack_require__(6);

	const GameView = function(game, ctx) {
	  this.game = game;
	  this.ctx = ctx;
	}

	GameView.prototype.start = function() {
	  setInterval(() => {
	    this.game.moveObjects();
	    this.game.draw(this.ctx);
	  }, 200);
	}

	module.exports = GameView;


/***/ },
/* 6 */
/***/ function(module, exports) {

	

/***/ }
/******/ ]);