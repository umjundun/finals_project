const hamburger = document.getElementById('hamburger-icon');

const hamburgerMenu = document.getElementById('hamburger-menu');

hamburger.addEventListener("click", (event) => {
  console.log("here");
  hamburgerMenu.classList.toggle("hidden");
});
