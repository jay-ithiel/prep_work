const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


class Game {
  constructor(numDiscs = 3) {
    this.stack = [[], [], []];
    for (let i = 1; i <= numDiscs; i++) {
      this.stack[0].unshift(i);
    }

    this.startTowerIdx;
    this.endTowerIdx;
  }


  promptMove(completionCallback) {
    console.log(this.stack)

    reader.question("Please enter your move:\n starting tower : ", (startTowerIdx) => {
      reader.question("Ending tower : ", (endTowerIdx) => {
        this.move(startTowerIdx, endTowerIdx);
        this.run(completionCallback);
      });
    });
  }

  isValidMove(startTowerIdx, endTowerIdx) {
    let to_stack = this.stack[endTowerIdx];
    let from_stack = this.stack[startTowerIdx];

    if (from_stack.length == 0) {
      console.log("Cannot move from empty tower.");
      return false;
    } else if (to_stack.length == 0) {
      return true;
    } else if (to_stack.slice(-1) > from_stack.slice(-1)) {
      return true;
    } else {
      console.log("Cannot move larger disc on top of smaller disc.");
      return false;
    }
  }

  move(startTowerIdx, endTowerIdx){
    if( this.isValidMove(startTowerIdx, endTowerIdx) ){
      let to_stack = this.stack[endTowerIdx];
      let from_stack = this.stack[startTowerIdx];

      let disc = from_stack.pop();
      to_stack.push(disc);

      this.print();
      return true;
    }
    return false;
  }

  print() {
    console.log(JSON.stringify(this.stack));
  }

  isWon() {
    if (this.stack[0].length === 0) {
      if (this.stack[1].length === 0 || this.stack[2].length === 0) {
        return true;
      }
    }
    return false;
  }

  run(completionCallback){
    if (this.isWon()) {
      reader.close();
      completionCallback();
    } else {
      this.promptMove(completionCallback);
    }

  }

}


let g = new Game();
g.run(function(){console.log("You've won");});
