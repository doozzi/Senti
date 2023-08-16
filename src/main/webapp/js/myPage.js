const colors = ["#4e4376", "#2b5876"];
const button = document.querySelector("#top");

// 맨 위쪽
function topColor() {
	const color1 = colors[0];
	const color2 = colors[1];
	button.style.background = `linear-gradient(${color1},${color2})`;
}

topColor();


const join = document.querySelector(".container");
const form = document.querySelector("form");
const title = document.querySelector("#title");
const span = document.querySelector("span");
const result = document.querySelector(".hidden");
const profileImg = document.querySelector("#profileImg");
let profile = "";

// 프로필 사진
const previewImage = document.getElementById("preview-image")
const inputImage = document.getElementById("input-image")

function readImage(input) {
	// 인풋 태그에 파일이 있는 경우
	if (input.files && input.files[0]) {
		// 이미지 파일인지 검사 (생략)
		// FileReader 인스턴스 생성
		const reader = new FileReader()
		// 이미지가 로드가 된 경우
		reader.onload = e => {
			previewImage.src = e.target.result
		}
		// reader가 이미지 읽도록 하기
		reader.readAsDataURL(input.files[0])
	}
}
// input file에 change 이벤트 부여
inputImage.addEventListener("change", e => {
	readImage(e.target)
})

function onChangeImg() {
	inputImage.click();
}



previewImage.addEventListener("click", onChangeImg);

// 회원정보수정
const update = document.querySelector(".update");
const updateBtn = document.querySelector(".updateBtn");
const password = document.querySelector("#password");
const nick = document.querySelector("#nick");

let updateOn = false;

function onUpdateMyPage() {
	if (!updateOn) {
		updateOn = true;
		password.removeAttribute("disabled");
		nick.removeAttribute("disabled");
		updateBtn.removeAttribute("id");
		update.setAttribute("id","update");
		}else{
		updateOn = false;
		password.disabled = true;
		nick.disabled = true;
		updateBtn.setAttribute("id","updateBtn");
		update.removeAttribute("id");
		}
	}

update.addEventListener("click", onUpdateMyPage);
