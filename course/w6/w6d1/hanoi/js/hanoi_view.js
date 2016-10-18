class HanoiView {
  constructor(hanoiGame, domEl) {
    this.game = hanoiGame;
    this.domEl = domEl;
    this.setupTowers();
    this.clickTower();
    this.render();
    this.clickHandler = [];
  }

  setupTowers() {
    for (let i = 0; i < 3; i++) {
      let $ul = $("<ul></ul>");
      $ul.addClass("group");
      $ul.attr("id", i);

      let $div = $('<div></div>');
      $div.addClass("bottom-bar");

      for (let li = 0; li < 3; li++){
        let $li = $("<li></li>");
        $li.attr("id", li);
        $ul.append($li);
      }

      $ul.append($div);
      this.domEl.append($ul);
    }
  }

  render() {
    // const towers = this.game.towers;
    const towers = [[3,2],[],[1]];

    for (let pileIdx = 0; pileIdx < towers.length; pileIdx++){
      let pile = towers[pileIdx];
      let $ul = $(`#${pileIdx}`);
      let $lis = $ul.children('li');

      for (let discIdx = 0, liIdx = pile.length - 1; discIdx < pile.length; discIdx++, liIdx--){

        let disc = pile[discIdx];
        let discSize = disc * 50;
        let $div = $("<div></div>");

        $div.addClass("pile");
        $div.css("width", discSize);
        $div.css("height", discSize / 2);
        $div.css("background-color", "gray");
        let $li = $($lis[liIdx]);
        debugger

        // if ($li.children.length > pile.length) {
        //   $(".pile").remove();
        //   $li.prepend($div);
        // } else {
          $li.prepend($div);
        // }

      }

    }

  }

  clickTower(){
    let $ul = $('ul');

    $ul.click((event) => {
      if (this.clickHandler.length > 0 ){
        let fromTow = parseInt(this.clickHandler[0]);
        let toTow = parseInt(event.currentTarget.id);
        if (this.game.isValidMove(fromTow, toTow)) {
          this.game.move(fromTow, toTow);
          this.clickHandler = [];
          this.render();
        } else {
          alert("Invalid Move");
        }
      } else {

        this.clickHandler.push(event.currentTarget.id);
      }
    });
    // this.render();

  }

}
module.exports = HanoiView;
