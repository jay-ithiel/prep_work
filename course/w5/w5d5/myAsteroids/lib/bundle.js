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

	const Game = __webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module \"./game\""); e.code = 'MODULE_NOT_FOUND'; throw e; }()));
	const GameView = __webpack_require__(2)

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
/* 1 */,
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const Game = __webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module \"./game\""); e.code = 'MODULE_NOT_FOUND'; throw e; }()));
	const Ship = __webpack_require__(3);

	const GameView = function(game, ctx) {
	  this.game = game;
	  this.ctx = ctx;
	}

	GameView.prototype.start = function() {
	  setInterval(() => {
	    this.game.step();
	    this.game.draw(this.ctx);
	  }, 200);
	}

	module.exports = GameView;


/***/ },
/* 3 */
/***/ function(module, exports) {

	

/***/ }
/******/ ]);