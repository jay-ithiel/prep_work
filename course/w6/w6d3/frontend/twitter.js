const FollowToggle = require("./follow_toggle");
const UsersSearch = require("./users_search");

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
