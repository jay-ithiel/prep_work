const Router = require('./router');
const Inbox = require('./inbox');

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
