const hamburger = document.getElementById('hamburger-icon');

const hamburgerMenu = document.getElementById('hamburger-menu');

const body = document.getElementById('global-content-container');

const navbar = document.getElementById('global-navbar');

export const hamburgerEvent = () => {

  if (hamburger) {
    hamburger.addEventListener("click", (event) => {
      hamburgerMenu.style.display = "block";
    });
    
    body.addEventListener("click", (event) => {
      hamburgerMenu.style.display = "none";
    });
    //
    // navbar.addEventListener("click", (event) => {
    //   hamburgerMenu.style.display = "none";
    // });

  }
}
