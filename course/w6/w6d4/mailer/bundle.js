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

	const Router = __webpack_require__(1);
	const Inbox = __webpack_require__(2);

	const routes = {
	  compose: "compose",
	  inbox: Inbox,
	  sent: "sent"
	};

	document.addEventListener("DOMContentLoaded", (e) => {
	  let lis = document.querySelectorAll(".sidebar-nav li");
	  lis.forEach(el => el.addEventListener("click", (e2) => {
	    let newLoc = e2.currentTarget.innerText;
	    window.location.hash = newLoc.toLowerCase();
	  }));

	  let content = document.querySelector(".content");
	  let router = new Router(content, routes);
	  router.start();
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Router {
	  constructor(node, routes) {
	    this.node = node;
	    this.routes = routes;
	  }

	  start() {
	    this.render();
	    window.addEventListener("hashchange", (e) => {
	      this.render();
	    });
	  }

	  activeRoute() {
	    let hashFrag = window.location.hash;
	    hashFrag = hashFrag.replace('#', '');
	    return this.routes[hashFrag];
	  }

	  render() {
	    let component = this.activeRoute();
	    if (component === undefined) {
	      this.node.innerHTML = "";
	    } else {
	      this.node.innerHTML = "";
	      this.node.appendChild(component.render());
	    }
	  }
	}

	module.exports = Router;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const MessageStore = __webpack_require__(3);

	const Inbox = {
	  render() {
	    let ul = document.createElement("ul");
	    ul.className = "messages";
	    ul.innerHTML = "Inbox Message";
	    let inboxMessages = MessageStore.getInboxMessages();
	    for (let i = 0; i < inboxMessages.length; i++) {
	      console.log('we made it');
	      let msg = inboxMessages[i];
	      let newNode = this.renderMessage(msg);
	      ul.appendChild(newNode);
	    }
	    return ul;
	  },

	  renderMessage(msg) {
	    let newLi = document.createElement('li');
	    newLi.classList.add('message');
	    newLi.innerHTML = `<span class='from'>${msg.from}</span>`;
	    newLi.innerHTML += `<span class='subject'>${msg.subject}</span>`;
	    newLi.innerHTML += `<span class='body'>${msg.body}</span>`;
	    return newLi;
	  }
	};

	module.exports = Inbox;


/***/ },
/* 3 */
/***/ function(module, exports) {

	let messages = {
	  sent: [
	    {to: "friend@mail.com", subject: "Check this out", body: "It's so cool"},
	    {to: "person@mail.com", subject: "zzz", body: "so booring"}
	  ],
	  inbox: [
	    {from: "grandma@mail.com", subject: "Fwd: Fwd: Fwd: Check this out", body: "Stay at home mom discovers cure for leg cramps. Doctors hate her"},
	    {from: "person@mail.com", subject: "Questionnaire", body: "Take this free quiz win $1000 dollars"}
	  ]
	};

	const MessageStore = {
	  getInboxMessages() {
	    return messages.inbox;
	  },

	  getSentMessages() {
	    return messages.sent;
	  }
	};

	module.exports = MessageStore;


/***/ }
/******/ ]);