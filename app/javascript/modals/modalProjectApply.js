// Get the modal
const modal = document.getElementById("modal-projectApply-window");

// Get the button that opens the modal
const buttons = document.querySelectorAll("#modal-projectApply-button");

// Get the <span> element that closes the modal
// const close = document.getElementById("modal-signup-close");

export const projectApplyEvent = () => {

  if (buttons.length > 0) {
  // When the user clicks the button, open the modal
    buttons.forEach((button) => {
      console.log('button', button)
      button.addEventListener("click", (event) => {
        document.getElementById(`modal-projectApply-window_${event.currentTarget.getAttribute('data-target')}`).style.display = "block";
      });
    })

    // When the user clicks anywhere outside of the modal, close it
    window.addEventListener("click", (event) => {
      if (event.target == modal) {
        console.log("window clicked");
        modal.style.display = "none";
      }
    });
  }
}