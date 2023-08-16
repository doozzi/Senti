const colors = ["#4e4376", "#2b5876"];
const button = document.querySelector("#top");
const btnUpdate = document.querySelector("#btnUpdate");
const btnDelete = document.querySelector("#btnDelete");
const musicDelete = document.querySelectorAll(".musicDelete");
const playListTitle = document.querySelector("#playListTitle");
const playListTitleUpdate = document.querySelector(".playListTitleUpdate ");

let update = false;


// 맨 위쪽
function topColor() {
	const color1 = colors[0];
	const color2 = colors[1];
	button.style.background = `linear-gradient(${color1},${color2})`;
}
function paintPlayListTitleUpdate() {
	if (update == true) {
		console.log("Test");
		update = false;
		playListTitle.classList.add("hidden");
		playListTitleUpdate.classList.remove("hidden");
		
		console.log(musicDelete[0]);
		console.log(musicDelete[1]);
		console.log(musicDelete[2]);
		
		for(var i=0; i<musicDelete.length;i++){
				musicDelete[i].classList.remove("hidden");
		}
	
	} else {
		update = true;
		playListTitle.classList.remove("hidden");
		playListTitleUpdate.classList.add("hidden");
		for(var i=0; i<musicDelete.length;i++){
				musicDelete[i].classList.add("hidden");
		}
	}
}
function paintPlayListTitle() {
	playListTitle.classList.remove("hidden");
	playListTitleUpdate.classList.add("hidden");
}


btnUpdate.addEventListener("click", paintPlayListTitleUpdate);
playListTitleUpdate.addEventListener("submit", paintPlayListTitle);
topColor();



