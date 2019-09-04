const buttons = document.querySelectorAll(".dash-button")
const panels = document.querySelectorAll(".dash-panel")

export const dashButtons = () => {
  buttons.forEach((button) => {
    button.addEventListener("click", (event) => {
      let attribute = event.currentTarget.getAttribute("data-target");
      console.log(attribute);

      panels.forEach((element) => {
        element.style.display = "none";
      });

      let panel = document.getElementById(`${attribute}`);
      console.log(panel);

      panel.style.display = "flex";

    });
  });
}
