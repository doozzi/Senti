const colors = ["#4e4376", "#2b5876"];
const button = document.querySelector("#top");
const back = document.querySelector("#back");

function topColor() {
  const color1 = colors[0];
  const color2 = colors[1];
  button.style.background = `linear-gradient(${color1},${color2})`;
}
topColor();

function onBack(){
	window.history.back();
}

back.addEventListener("click",onBack);