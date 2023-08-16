const colors = ["#4e4376", "#2b5876"];
const button = document.querySelector("#top");
const fileInput = document.getElementById("input-file");

function topColor() {
  const color1 = colors[0];
  const color2 = colors[1];
  button.style.background = `linear-gradient(${color1},${color2})`;
}

fileInput.onchange = () => {
  const selectedFile = fileInput.files[0];
  console.log(selectedFile);
};


topColor();



