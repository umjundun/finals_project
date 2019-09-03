const buttonProfile = document.getElementById('dash-profile-button');
const buttonProjects = document.getElementById('dash-projects-button');
const buttonEngagements = document.getElementById('dash-engagements-button');
const buttonSettings = document.getElementById('dash-settings-button');

const contentProfile = document.getElementById('dash-profile-content');
const contentProjects = document.getElementById('dash-projects-content');
const contentEngagements = document.getElementById('dash-engagements-content');
const contentSettings = document.getElementById('dash-settings-content');

buttonProfile.addEventListener("click", (event) => {
  if (buttonProfile) {
    console.log("profile");
    contentProfile.classList.add("dash-active");
    contentProfile.classList.remove("dash-inactive");

    contentEngagements.classList.remove("dash-active");
    contentEngagements.classList.add("dash-inactive");

    contentSettings.classList.remove("dash-active");
    contentSettings.classList.add("dash-inactive");

    if (contentProjects) {
      contentProjects.classList.remove("dash-active");
      contentProjects.classList.add("dash-inactive");
    }
  }
});

buttonEngagements.addEventListener("click", (event) => {
  if (buttonEngagements) {
    console.log("engagement");
    contentProfile.classList.remove("dash-active");
    contentProfile.classList.add("dash-inactive");

    contentEngagements.classList.add("dash-active");
    contentEngagements.classList.remove("dash-inactive");

    contentSettings.classList.remove("dash-active");
    contentSettings.classList.add("dash-inactive");

    if (contentProjects) {
      contentProjects.classList.remove("dash-active");
      contentProjects.classList.add("dash-inactive");
    }
  }
});

buttonSettings.addEventListener("click", (event) => {
  if (buttonSettings) {
    console.log("settings");
    contentProfile.classList.remove("dash-active");
    contentProfile.classList.add("dash-inactive");

    contentEngagements.classList.remove("dash-active");
    contentEngagements.classList.add("dash-inactive");

    contentSettings.classList.add("dash-active");
    contentSettings.classList.remove("dash-inactive");

    if (contentProjects) {
      contentProjects.classList.remove("dash-active");
      contentProjects.classList.add("dash-inactive");
    }
  }
});

if (buttonProjects) {
  buttonProjects.addEventListener("click", (event) => {
    console.log("projects");
    contentProfile.classList.remove("dash-active");
    contentProfile.classList.add("dash-inactive");

    contentProjects.classList.add("dash-active");
    contentProjects.classList.remove("dash-inactive");

    contentEngagements.classList.remove("dash-active");
    contentEngagements.classList.add("dash-inactive");

    contentSettings.classList.remove("dash-active");
    contentSettings.classList.add("dash-inactive");
  });
}
