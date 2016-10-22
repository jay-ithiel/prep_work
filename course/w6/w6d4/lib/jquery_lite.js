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

	const DOMNodeCollection = __webpack_require__(1);

	window.$l = function (arg) {
	  let nodeList;
	  if (typeof(arg) === 'string') {
	    nodeList = document.querySelectorAll(arg);
	  } else if (arg instanceof HTMLElement) {
	    return new DOMNodeCollection([arg]);
	  }
	  let array = Array.from(nodeList);

	  const collection = new DOMNodeCollection(array);
	  return collection;
	};


/***/ },
/* 1 */
/***/ function(module, exports) {

	class DOMNodeCollection {
	  constructor(htmls) {
	    this.htmls = htmls;
	  }

	  html(string) {
	    if (string != null) {
	      this.htmls.forEach((el) => (el.innerHTML = string));
	    } else {
	      return this.htmls[0].innerHTML;
	    }
	  }

	  empty() {
	    this.htmls.forEach((el) => el.html(""));
	  }

	  append(args) {
	    if (!(args instanceof DOMNodeCollection)) {
	      args = [args];
	    }
	    for (let i = 0; i < this.htmls.length; i++) {
	      for (let j = 0; j < args.length; j++) {
	        if (args[j] instanceof HTMLElement) {
	        this.htmls[i].innerHTML += args[j].outerHTML;
	        } else {
	        this.htmls[i].innerHTML += args[j];
	        }
	      }
	    }
	  }

	  attr(attribute, value) {
	    if (value == undefined) {
	      return this.htmls.map((el) => el.getAttribute(attribute));
	    }
	    this.htmls.forEach((el) => {
	      el.setAttribute(attribute, value);
	    });
	  }

	  addClass(className) {
	    if (className != undefined) {
	      this.htmls.forEach((el) => {
	        el.classList.add(className);
	      });
	    }
	  }

	  removeClass(className) {
	    if (className != undefined) {
	      this.htmls.forEach((el) => {
	        el.classList.remove(className);
	      });
	    }
	  }

	  // traversal

	  children() {
	    let childrens = [];
	    this.htmls.forEach(function (el) {
	      childrens = childrens.concat(el.children);
	    });
	    return childrens;
	  }

	  parent() {
	    let parents = [];
	    this.htmls.forEach(function (el) {
	      parents = parents.concat(el.parentNode);
	    });
	    return parents;

	  }

	  find(selector) {
	    let descendents = [];
	    this.htmls.forEach(el => {
	      descendents = descendents.concat(el.querySelectorAll(selector));
	    });
	    return descendents;
	  }

	  remove() {
	    let parents = this.parent();
	    this.htmls.forEach((el, idx) => {
	      parents[idx].removeChild(el);
	    });
	  }

	  on(happeningType, things) {
	    this.htmls.forEach((el) => {
	      el.addEventListener(happeningType, things);
	      el["listeners"] === undefined ? el["listeners"] = [things] : el["listeners"].push(things);
	    });
	  }

	  off(happeningType, things) {
	      this.htmls.forEach((el) => {
	        let listeners = el["listeners"];
	        for (let i = 0; i < listeners.length; i++) {
	          debugger;
	          console.log(listeners[i] === things);
	            el.removeEventListener(happeningType, listeners[i]);
	        }
	      });
	  }

	}



	module.exports = DOMNodeCollection;


/***/ }
/******/ ]);