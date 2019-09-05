// Get the button that opens the modal
const buttons = document.querySelectorAll(".button-project-apply-modal");

export const applyEvent = () => {

  if (buttons) {
    buttons.forEach((button) => {
      button.addEventListener("click", (event) => {
        let n = event.currentTarget.getAttribute("data-target");
        let modal = document.getElementById(`modal-form-container-${n}`);
        modal.style.display = "flex";
      });
    });
  }

  window.addEventListener("click", (event) => {
    if (event.target.getAttribute("data-target") != null) {
      let n = event.target.getAttribute("data-target");
      let delimiter = document.getElementById(`modal-apply-form-delimiter-${n}`);
      let modal = document.getElementById(`modal-form-container-${n}`);

      if (event.target != delimiter && event.target === modal) {
        if (modal.style.display === "flex") {
          event.target.style.display = "none";
        };
      };
    };
  });
}
