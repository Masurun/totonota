function hover() {
  const menus = document.querySelectorAll(".menu");
  menus.forEach((menu) => {
    menu.addEventListener('mouseover', () => {
      menu.setAttribute("style", "opacity: .6;");
    });
    menu.addEventListener('mouseout', () => {
      menu.removeAttribute("style");
    });
  });
}

setInterval(hover, 1000);