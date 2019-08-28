//= require action_cable

this.App = {};

App.cable = ActionCable.createConsumer();

App.notifications = App.cable.subscriptions.create("NotificationsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("we received data");
    $("#notifications").prepend(data.html);
  }
});
