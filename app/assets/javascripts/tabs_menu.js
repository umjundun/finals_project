function tabEvent(event, tabName) {
  let i = 0;
  const tabContent = document.getElementsByClassName("tab-content");
  for (i = 0; i < tabContent.length; i++) {
    tabContent[i].style.display = "none";
  }
  const tabLinks = document.getElementsByClassName("tab-links");
  for (i = 0; i < tabLinks.length; i++) {
    tabLinks[i].className = tabLinks[i].className.replace(" active", "");
  }
  if (document.getElementById(tabName)) {
    document.getElementById(tabName).style.display = "block";
    event.currentTarget.className += " active";
  }
}
