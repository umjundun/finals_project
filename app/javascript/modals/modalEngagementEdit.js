// Get the modal
const modal = document.getElementById("modal-engagementEdit-window");

// Get the buttons that opens the modal
const buttons = document.querySelectorAll("#modal-engagementEdit-button");

// Get the buttons that closes the modal
const cancels = document.querySelectorAll("#modal-engagementEdit-cancel-button");

export const engagementEditEvent = () => {
  console.log('function open')

  if (buttons.length > 0) {
  // When the user clicks the button, open the modal
    buttons.forEach((button) => {
      console.log('button', button)
      button.addEventListener("click", (event) => {
        document.getElementById(`modal-engagementEdit-window_${event.currentTarget.getAttribute('data-target')}`).style.display = "block";
      });
    })

    // When the user clicks anywhere outside of the modal, close it
    cancels.forEach((cancel) => {
      cancel.addEventListener("click", (event) => {
        modal.style.display = "none";
      });
    })
  }
}
