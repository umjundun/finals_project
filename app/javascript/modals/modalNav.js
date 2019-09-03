// Get the modal
const modal = document.getElementById("modal-nav-window");

// Get the button that opens the modal
const button = document.getElementById("hamburger-nav");

// Get the <span> element that closes the modal
// const close = document.getElementById("modal-signup-close");

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
  }
}
