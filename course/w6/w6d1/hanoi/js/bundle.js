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

	const HanoiGame = __webpack_require__(1);
	const HanoiView = __webpack_require__(3);

	$( () => {
	  const rootEl = $('.hanoi');
	  const game = new HanoiGame();
	  new HanoiView(game, rootEl);
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Game {
	  constructor() {
	    this.towers = [[3, 2, 1], [], []];
	  }

	  isValidMove(startTowerIdx, endTowerIdx) {
	      const startTower = this.towers[startTowerIdx];
	      const endTower = this.towers[endTowerIdx];

	      if (startTower.length === 0) {
	        return false;
	      } else if (endTower.length == 0) {
	        return true;
	      } else {
	        const topStartDisc = startTower[startTower.length - 1];
	        const topEndDisc = endTower[endTower.length - 1];
	        return topStartDisc < topEndDisc;
	      }
	  }

	  isWon() {
	      // move all the discs to the last or second tower
	      return (this.towers[2].length == 3) || (this.towers[1].length == 3);
	  }

	  move(startTowerIdx, endTowerIdx) {
	      if (this.isValidMove(startTowerIdx, endTowerIdx)) {
	        this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());
	        return true;
	      } else {
	        return false;
	      }
	  }

	  print() {
	      console.log(JSON.stringify(this.towers));
	  }

	  promptMove(reader, callback) {
	      this.print();
	      reader.question("Enter a starting tower: ", start => {
	        const startTowerIdx = parseInt(start);
	        reader.question("Enter an ending tower: ", end => {
	          const endTowerIdx = parseInt(end);
	          callback(startTowerIdx, endTowerIdx)
	        });
	      });
	  }

	  run(reader, gameCompletionCallback) {
	      this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
	        if (!this.move(startTowerIdx, endTowerIdx)) {
	          console.log("Invalid move!");
	        }

	        if (!this.isWon()) {
	          // Continue to play!
	          this.run(reader, gameCompletionCallback);
	        } else {
	          this.print();
	          console.log("You win!");
	          gameCompletionCallback();
	        }
	      });
	  }
	}

	module.exports = Game;


/***/ },
/* 2 */,
/* 3 */
/***/ function(module, exports) {

	class HanoiView {
	  constructor(hanoiGame, domEl) {
	    this.game = hanoiGame;
	    this.domEl = domEl;
	    this.setupTowers();
	    this.clickTower();
	    this.render();
	    this.clickHandler = [];
	  }

	  setupTowers() {
	    for (let i = 0; i < 3; i++) {
	      let $ul = $("<ul></ul>");
	      $ul.addClass("group");
	      $ul.attr("id", i);

	      let $div = $('<div></div>');
	      $div.addClass("bottom-bar");

	      for (let li = 0; li < 3; li++){
	        let $li = $("<li></li>");
	        $li.attr("id", li);
	        $ul.append($li);
	      }

	      $ul.append($div);
	      this.domEl.append($ul);
	    }
	  }

	  render() {
	    // const towers = this.game.towers;
	    const towers = [[3,2],[],[1]];

	    for (let pileIdx = 0; pileIdx < towers.length; pileIdx++){
	      let pile = towers[pileIdx];
	      let $ul = $(`#${pileIdx}`);
	      let $lis = $ul.children('li');

	      for (let discIdx = 0, liIdx = pile.length - 1; discIdx < pile.length; discIdx++, liIdx--){

	        let disc = pile[discIdx];
	        let discSize = disc * 50;
	        let $div = $("<div></div>");

	        $div.addClass("pile");
	        $div.css("width", discSize);
	        $div.css("height", discSize / 2);
	        $div.css("background-color", "gray");
	        let $li = $($lis[liIdx]);
	        debugger

	        // if ($li.children.length > pile.length) {
	        //   $(".pile").remove();
	        //   $li.prepend($div);
	        // } else {
	          $li.prepend($div);
	        // }

	      }

	    }

	  }

	  clickTower(){
	    let $ul = $('ul');

	    $ul.click((event) => {
	      if (this.clickHandler.length > 0 ){
	        let fromTow = parseInt(this.clickHandler[0]);
	        let toTow = parseInt(event.currentTarget.id);
	        if (this.game.isValidMove(fromTow, toTow)) {
	          this.game.move(fromTow, toTow);
	          this.clickHandler = [];
	          this.render();
	        } else {
	          alert("Invalid Move");
	        }
	      } else {

	        this.clickHandler.push(event.currentTarget.id);
	      }
	    });
	    // this.render();

	  }

	}
	module.exports = HanoiView;


/***/ }
/******/ ]);