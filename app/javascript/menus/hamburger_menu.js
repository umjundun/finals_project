const hamburger = document.getElementById('hamburger-icon');

const hamburgerMenu = document.getElementById('hamburger-menu');

const body = document.getElementById('global-content-container');

const logo = document.getElementById('nav-logo-link');
const search = document.getElementById('nav-center-items');
const avatar = document.getElementById('nav-avatar-block');
const messages = document.getElementById('nav-notifications-block');

export const hamburgerEvent = () => {

  if (hamburger) {
    hamburger.addEventListener("click", (event) => {
      hamburgerMenu.style.display = "block";
    });

    body.addEventListener("click", (event) => {
      hamburgerMenu.style.display = "none";
    });

    // NAVBAR COMPONENTS
    logo.addEventListener("click", (event) => {
      hamburgerMenu.style.display = "none";
    });

    avatar.addEventListener("click", (event) => {
      hamburgerMenu.style.display = "none";
    });

    // messages.addEventListener("click", (event) => {
    //   hamburgerMenu.style.display = "none";
    // });
  }
}
