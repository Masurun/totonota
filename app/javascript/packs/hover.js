function hover() {
  const menus = document.querySelectorAll(".menu");
  menus.forEach((menu) => {
    menu.addEventListener('mouseover', () => {
      menu.setAttribute("style", "background-color:#00b7ce;");
    });
    menu.addEventListener('mouseout', () => {
      menu.removeAttribute("style");
    });
  });
}

setInterval(hover, 1000);