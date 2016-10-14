const Board = require("./board");
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


class Game {
  constructor() {
    this.current_mark = 'x';
    this.board = new Board();
  }

  gameWinner() {
    if (this.board.winner === 'x') { return 'x' }
    if (this.board.winner === 'o') { return 'o' }
    return null;
  }

  switchMarks() {
    if (this.current_mark === 'x') {
      this.current_mark = 'o';
    } else {
      this.current_mark = 'x';
    }
  }

  run(completionCallback){
    if (this.board.over()) {
      reader.close();
      completionCallback();
    } else {
      this.promptMove(completionCallback);
    }
  }

  promptMove(completionCallback) {
    console.log(this.board.grid)

    reader.question("Please enter position to place mark like x,y\n", (pos) => {
        let coords = pos.split(',');
        let x = parseInt(coords[0]);
        let y = parseInt(coords[1]);
        this.board.placeMark([x,y], this.current_mark);
        this.switchMarks();
        this.run(completionCallback);
    });
  }

}

let g = new Game();
g.run(function(){console.log("You've won");});
