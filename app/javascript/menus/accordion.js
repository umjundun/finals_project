const projectCards = document.querySelectorAll(".card-project")

export const accordionEvent = () => {
  projectCards.forEach((card) => {
    card.addEventListener("click", (event) => {
      console.log("current target: " + event.currentTarget);

      console.log("sibling: " + event.currentTarget.nextElementSibling);

      let panel = event.currentTarget.nextElementSibling;
      if (panel.style.display === "block") {
        panel.style.display = "none";
      } else {
        panel.style.display = "block";
      }

    });
  });
}
