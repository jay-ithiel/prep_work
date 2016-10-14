class Board {
  constructor(){
    this.grid = [[null, null, null],
                 [null, null, null],
                 [null, null, null]];
    this.marks = ["x", "o"];
  }

  over() {
    return this.winner() || this.boardFull()
  }

  winner() {
    let rows = this.grid;
    let cols = this.transpose();
    let diagonals = this.diagonals();

    let triplets = rows.concat(cols).concat(diagonals);
    for(let i = 0; i < triplets.length; i++){
      let triplet = triplets[i];
      if(triplet.toString() === ["x","x","x"].toString()){ return "x"; }
      if(triplet.toString() === ["o","o","o"].toString()){ return "o"; }
    }

    return null;
  }

  boardFull() {
    for (let rowIdx = 0; rowIdx < this.grid.length; rowIdx++) {
      let row = this.grid[rowIdx];
      if (row.includes(null)) { return false; }
    }
    return true;
  }

  transpose() {
    let transposed = [];

    for (let rowIdx = 0; rowIdx < this.grid.length; rowIdx++) {
      let row = this.grid[rowIdx];
      let newRow = [];
      for(let colIdx = 0; colIdx < row.length; colIdx++){
        newRow.push(this.grid[colIdx][rowIdx]);
      }
      transposed.push(newRow);
    }

    return transposed;
  }

  diagonals(){
    let g = this.grid;
    let d1 = [g[0][0],g[1][1],g[2][2]];
    let d2 = [g[0][2],g[1][1],g[2][0]];
    return [d1, d2];
  }

  placeMark(pos, mark){
    let x = pos[0];
    let y = pos[1];
    this.grid[x][y] = mark;
  }

  empty(pos){
    let x = pos[0];
    let y = pos[1];
    return this.grid[x][y] === null;
  }

}

module.exports = Board;


let b = new Board();
console.log(b.winner());
