// Get the button that opens the modal
const buttons = document.querySelectorAll("#modal-projectEdit-button");
const closeButtons = document.querySelectorAll("#project-edit-close");

export const projectEditEvent = () => {

  if (buttons.length > 0) {

  // When the user clicks the button, open the modal
    buttons.forEach((button) => {
      button.addEventListener("click", (event) => {
        let btn = event.currentTarget;
        let n = btn.getAttribute('data-target');
        let modal = document.getElementById(`modal-projectEdit-window_${n}`);
        modal.style.display = "block";
      });
    })

    closeButtons.forEach((close) => {
      close.addEventListener("click", (event) => {
        let btn = event.currentTarget;
        let n = btn.getAttribute('data-target');
        let modal = document.getElementById(`modal-projectEdit-window_${n}`);
        modal.style.display = "none";
      });
    })
  }
}























// Get the modal
// const modal = document.getElementById("modal-projectEdit-window");

// Get the button that opens the modal
// const buttons = document.querySelectorAll("#modal-projectEdit-button");

// Get the <span> element that closes the modal
// const close = document.getElementById("modal-signup-close");

// export const projectEditEvent = () => {

//   if (buttons.length > 0) {
//   // When the user clicks the button, open the modal
//     buttons.forEach((button) => {
//       console.log('button', button)
//       button.addEventListener("click", (event) => {
//         document.getElementById(`modal-projectEdit-window_${event.currentTarget.getAttribute('data-target')}`).style.display = "block";
//       });
//     })

//     // When the user clicks anywhere outside of the modal, close it
//     window.addEventListener("click", (event) => {
//       if (event.target == modal) {
//         console.log("window clicked");
//         modal.style.display = "none";
//       }
//     });
//   }
// }
