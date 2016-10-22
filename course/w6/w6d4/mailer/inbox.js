const MessageStore = require("./message_store");

const Inbox = {
  render() {
    let ul = document.createElement("ul");
    ul.className = "messages";
    ul.innerHTML = "Inbox Message";
    let inboxMessages = MessageStore.getInboxMessages();
    for (let i = 0; i < inboxMessages.length; i++) {
      console.log('we made it');
      let msg = inboxMessages[i];
      let newNode = this.renderMessage(msg);
      ul.appendChild(newNode);
    }
    return ul;
  },

  renderMessage(msg) {
    let newLi = document.createElement('li');
    newLi.classList.add('message');
    newLi.innerHTML = `<span class='from'>${msg.from}</span>`;
    newLi.innerHTML += `<span class='subject'>${msg.subject}</span>`;
    newLi.innerHTML += `<span class='body'>${msg.body}</span>`;
    return newLi;
  }
};

module.exports = Inbox;
