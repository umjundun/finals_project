let hamburger = document.getElementById('hamburger-icon');

let hamburgerMenu = document.getElementById('hamburger-menu');

export const hamburgerEvent = () => {
  if (hamburger) {
    hamburger.addEventListener("click", (event) => {
      hamburgerMenu.classList.toggle("hidden");
    });

    // When the user clicks anywhere outside of the modal, close it
    window.addEventListener("click", (event) => {
      if (event.target == hamburgerMenu) {
        console.log("window clicked");
        hamburgerMenu.style.display = "none";
      }
    });
  }
}
//
// export { hamburgerEvent };
