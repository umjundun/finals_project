const tabContent = document.getElementsByClassName("tab-content");

const tablinks = document.getElementsByClassName("tab-links");

const tabEvent = tablinks.addEventListener("click", (event) => {
  hamburgerMenu.classList.toggle("hidden");
});
export { hamburgerEvent };
