// Get the modal
const modal = document.getElementById("modal-messages-window");

// Get the button that opens the modal
const button = document.getElementById("convo-icon");

// Get the <span> element that closes the modal
// const close = document.getElementById("modal-signup-close");

export const navMessagesEvent = () => {

  if (button) {
  // When the user clicks the button, open the modal
    button.addEventListener("click", (event) => {
      console.log("button clicked");
      modal.style.display = "block";
    });

    // When the user clicks anywhere outside of the modal, close it
    window.addEventListener("click", (event) => {
      if (event.target == modal) {
        console.log("window clicked");
        modal.style.display = "none";
      }
    });

    const newMessageForm = document.getElementById("new_message");
    const messageSubmit = document.getElementById("message-submit");
    messageSubmit.addEventListener("click", (event) => {
      event.preventDefault();
      newMessageForm.submit();
      document.getElementById("message_body").value = "";
    });
  }
}
