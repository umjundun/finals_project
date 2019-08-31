console.log('hello');
// Get the modal
const modal = document.getElementById("modal-signup-window");

// Get the button that opens the modal
const button = document.getElementById("modal-signup-button");

// Get the <span> element that closes the modal
// const close = document.getElementById("modal-signup-close");

export const signUpEvent = () => {
  // When the user clicks the button, open the modal
  button.addEventListener("click", (event) => {
    console.log("button clicked");
    modal.style.display = "block";
  });

  // When the user clicks on <span> (x), close the modal
  // close.addEventListener("click", (event) => {
  //   console.log("close clicked");
  //   modal.style.display = "block";
  // });

  // When the user clicks anywhere outside of the modal, close it
  window.addEventListener("click", (event) => {
    if (event.target == modal) {
      console.log("window clicked");
      modal.style.display = "none";
    }
  });
}
