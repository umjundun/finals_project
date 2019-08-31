let hamburger = document.getElementById('hamburger-icon');

let hamburgerMenu = document.getElementById('hamburger-menu');

export const hamburgerEvent = () => {
  if (hamburger) {
    hamburger.addEventListener("click", (event) => {
      hamburgerMenu.classList.toggle("hidden");
    });
  }
}
//
// export { hamburgerEvent };
