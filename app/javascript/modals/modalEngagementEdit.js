// Get the button that opens the modal
const buttons = document.querySelectorAll("#modal-engagementEdit-button");
const closeButtons = document.querySelectorAll("#engagement-edit-close");

export const engagementEditEvent = () => {

  if (buttons.length > 0) {
  // When the user clicks the button, open the modal
    buttons.forEach((button) => {
      button.addEventListener("click", (event) => {
        let btn = event.currentTarget;
        let n = btn.getAttribute('data-target');
        let modal = document.getElementById(`modal-engagementEdit-window_${n}`);
        modal.style.display = "block";
      });
    })

    // When the user clicks anywhere outside of the modal, close it
    closeButtons.forEach((close) => {
      close.addEventListener("click", (event) => {
        let btn = event.currentTarget;
        let n = btn.getAttribute('data-target');
        let modal = document.getElementById(`modal-engagementEdit-window_${n}`);
        modal.style.display = "none";
      });
    })
  }
}
