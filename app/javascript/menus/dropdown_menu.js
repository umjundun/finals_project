let hamburger = document.getElementById('hamburger-icon');

let hamburgerMenu = document.getElementById('hamburger-menu');

const hamburgerEvent = hamburger.addEventListener("click", (event) => {
  hamburgerMenu.classList.toggle("hidden");
});

// export { hamburgerEvent };
