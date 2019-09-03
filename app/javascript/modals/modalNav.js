// Get the modal
const modal = document.getElementById("modal-nav-window");

// Get the button that opens the modal
const button = document.getElementById("hamburger-nav");
const close = document.getElementById("click-to-close");

export const navEvent = () => {

  if (button) {
  // When the user clicks the button, open the modal
    button.addEventListener("click", (event) => {
      console.log("button clicked");
      modal.style.display = "flex";
    });

    // When the user clicks anywhere outside of the modal, close it
    window.addEventListener("click", (event) => {
      if (event.target == modal) {
        console.log("window clicked");
        modal.style.display = "none";
      }
    });

    close.addEventListener("click", (event) => {
      console.log("close clicked");
      modal.style.display = "none";
    });
  }
}
