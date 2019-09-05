//= require action_cable

this.App = {};

App.cable = ActionCable.createConsumer();

const conversationId = document.querySelector("[data-conversation-id]").dataset.conversationId;

App.messages = App.cable.subscriptions.create({ channel: 'MessageChannel', conversation_id: conversationId }, {
  received: function(data) {
    debugger;
    document.querySelector("#messages1").insertAdjacentHTML("beforeend", data.messageHTML);
  }
});
