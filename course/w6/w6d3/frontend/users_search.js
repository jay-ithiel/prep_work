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
