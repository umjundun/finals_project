// Get the button that opens the modal
const buttons = document.querySelectorAll("#modal-projectNew-button");
const closeButtons = document.querySelectorAll("#project-new-close");

export const projectNewEvent = () => {

  if (buttons.length > 0) {
  // When the user clicks the button, open the modal
    buttons.forEach((button) => {
      button.addEventListener("click", (event) => {
        console.log('new project button log')
        let modal = document.getElementById(`modal-projectNew-window`);
        modal.style.display = "block";
      });
    })

    closeButtons.forEach((close) => {
      close.addEventListener("click", (event) => {
        let modal = document.getElementById(`modal-projectNew-window`);
        modal.style.display = "none";
      });
    })
  }
}








