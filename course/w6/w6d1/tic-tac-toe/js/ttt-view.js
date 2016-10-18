class View {
  constructor(game, $el) {
    $el.append(this.setupBoard());
    this.bindEvents(game);
  }

  bindEvents(game) {
    let $li = $('li');

    ($li).click(function() {
      let pos = $(this).data();

      game.playMove(pos);
      $(this).text(game.currentPlayer);
      $(this).css('background-color', 'white');

      if (game.currentPlayer === 'x') {
        $(this).css('color', 'blue');
      } else {
        $(this).css('color', 'red');
      }

      if (game.board.isOver()){
        alert(`${game.currentPlayer} wins!` )
      }

    });

  }

  makeMove($square) {

  }

  setupBoard() {
    let $ul = $('<ul></ul>');
    let a = 0;
    let j = 0;

    for (let i = 0; i < 9; i++) {
      if (j > 2) {
        j = 0;
        a++;
      }

      let $li = $('<li></li>');
      $li.data([a, j]);
      $ul.append($li);

      j++;
    }

    return $ul;
  }
}

module.exports = View;
