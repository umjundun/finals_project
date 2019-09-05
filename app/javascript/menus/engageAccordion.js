const engageCards = document.querySelectorAll(".card-engage")

export const engageAccordionEvent = () => {
  engageCards.forEach((card) => {
    card.addEventListener("click", (event) => {

      let panel = event.currentTarget.nextElementSibling;
      if (panel.style.display === "block") {
        panel.style.display = "none";
      } else {
        panel.style.display = "block";
      }

    });
  });
}
