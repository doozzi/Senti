const colors = ["#4e4376", "#2b5876"];

function topColor() {
  const color1 = colors[0];
  const color2 = colors[1];
  //   body.style.background = `linear-gradient(${color1},${color2})`;
  // body.style.backgroundColor = color1;
  body.style.background = `linear-gradient(${color1},${color2})`;
}
const body = document.querySelector("body");
topColor();
