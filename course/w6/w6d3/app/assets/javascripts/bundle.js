/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const FollowToggle = __webpack_require__(1);
	const UsersSearch = __webpack_require__(2);
	
	$( () => {
	  let $buttons = $(".follow-toggle");
	  $buttons.each( function(idx, el) {
	    return new FollowToggle(el);
	  });
	
	  let $users = $(".user-search");
	  $users.each( function(idx, user) {
	    return new UsersSearch(user);
	  });
	
	
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class FollowToggle {
	  constructor(el) {
	    this.$el = $(el);
	    this.userID = $(el).attr("data-user-id");
	    this.followState = $(el).attr("data-initial-follow-state");
	    this.$el.on("click", this.handleClick.bind(this));
	    this.render();
	  }
	
	  render() {
	    if (this.followState === "unfollowed") {
	      this.$el.html("");
	      this.$el.append("Follow");
	    } else {
	      this.$el.html("");
	      this.$el.append("Unfollow!");
	    }
	  }
	
	  handleClick(e) {
	      e.preventDefault();
	
	      this.$el.prop({ disabled: true });
	
	      if (this.followState === "unfollowed") {
	        this.adjustFollow("POST");
	        this.followState = "followed";
	      } else {
	        this.adjustFollow("DELETE");
	        this.followState = "unfollowed";
	      }
	      this.render();
	  }
	
	  adjustFollow(action) {
	    $.ajax ({
	      url: `${this.userID}/follow`,
	      type: `${action}`,
	      dataType: "json",
	      success: () => {
	        this.$el.prop({ disabled: false });
	      }
	    });
	  }
	}
	
	module.exports = FollowToggle;


/***/ },
/* 2 */
/***/ function(module, exports) {

	class UsersSearch {
	  constructor(el) {
	    this.$el = $(el);
	    this.$query = $(el).find("input[name='query']");
	    // this.$query.keypress(this.handleInput.bind(this));
	    this.$query.on('input', this.handleInput.bind(this));
	    this.$ul = $(el).find(".users");
	    this.$el.find("input[type='submit']").on("click", this.handleInput.bind(this));
	  }
	
	  handleInput(e) {
	    e.preventDefault();
	
	    $.ajax ({
	      url: '/users/search',
	      type: 'GET',
	      dataType: "json",
	      data: {query: $(this.$query).val()},
	      success: (data) => {
	        this.renderResults(data);
	      }
	    });
	
	  }
	
	  renderResults(data) {
	    let self = this;
	    this.$ul.html("<ul></ul>");
	    if (data.length === 0) {
	      this.$ul.append("<li>No users found with that name</li>");
	    }
	    data.forEach(function(user){
	      let $li = $(
	        `<li>
	        <a href='${user.id}'>${user.username}<a>
	        </li>`
	      );
	      self.$ul.append($li);
	    });
	  }
	
	
	}
	
	module.exports = UsersSearch;


/***/ }
/******/ ]);
//# sourceMappingURL=bundle.js.map