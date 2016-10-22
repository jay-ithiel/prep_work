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
