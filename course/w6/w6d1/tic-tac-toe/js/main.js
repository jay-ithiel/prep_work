const View = require("./ttt-view");// require appropriate file
const Game = require("../solution/game");// require appropriate file


$( () => {
  // Your code here
  const game = new Game();
  let $figure = $(".ttt");
  const view = new View(game, $figure);
});
