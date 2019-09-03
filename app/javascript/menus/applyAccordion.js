const applyContent = document.querySelectorAll(".project-apply-button")

export const applyAccordionEvent = () => {
  applyContent.forEach((item) => {
    item.addEventListener("click", (event) => {
      let applyButton = event.currentTarget
      let panel = applyButton.previousElementSibling;
      if (panel.style.display === "block") {
        panel.style.display = "none";
        applyButton.style.display = "block"
      } else {
        panel.style.display = "block";
        applyButton.style.display = "none"
      }

    });
  });
}
