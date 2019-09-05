// Get the button that opens the modal
const buttons = document.querySelectorAll("#modal-projectApply-button");
const closeButtons = document.querySelectorAll("#project-apply-close");

export const projectApplyEvent = () => {

  if (buttons.length > 0) {

  // When the user clicks the button, open the modal
    buttons.forEach((button) => {
      button.addEventListener("click", (event) => {
        let btn = event.currentTarget;
        let n = btn.getAttribute('data-target');
        // document.getElementById(`modal-projectApply-window_${n}`).style.display = "block";
        let modal = document.getElementById(`modal-projectApply-window_${n}`);
        modal.style.display = "block";
      });
    })

    closeButtons.forEach((close) => {
      close.addEventListener("click", (event) => {
        let btn = event.currentTarget;
        let n = btn.getAttribute('data-target');
        console.log(n);
        let modal = document.getElementById(`modal-projectApply-window_${n}`);
        modal.style.display = "none";
      });
    })

    // // When the user clicks anywhere outside of the modal, close it
    // window.addEventListener("click", (event) => {
    //   if (event.target == modal) {
    //     console.log("window clicked");
    //     modal.style.display = "none";
    //   }
    // });
  }
}
