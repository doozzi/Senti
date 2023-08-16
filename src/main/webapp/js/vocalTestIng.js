const colors = ["#4e4376", "#2b5876"];
const button = document.querySelector("#top");
const btnLow = document.querySelector("#btnLow");
const btnHigh = document.querySelector("#btnHigh");
const videoLow = document.querySelector(".vocalTestLow");
const videoHigh = document.querySelector(".vocalTestHigh");
const body = document.querySelector("body");

function topColor() {
	const color1 = colors[0];
	const color2 = colors[1];
	button.style.background = `linear-gradient(${color1},${color2})`;
}

function paintVideoLow() {
	videoLow.classList.remove("hidden");
	videoHigh.classList.add("hidden");
}
function paintVideoHigh() {
	videoLow.classList.add("hidden");
	videoHigh.classList.remove("hidden");
}

btnLow.addEventListener("click", paintVideoLow);
btnHigh.addEventListener("click", paintVideoHigh);

topColor();

// 마이크 녹음
const chkHearMic = document.getElementById("chk-hear-mic")

const audioCtx = new (window.AudioContext || window.webkitAudioContext)() // 오디오 컨텍스트 정의

const analyser = audioCtx.createAnalyser()
        const distortion = audioCtx.createWaveShaper()
        const gainNode = audioCtx.createGain()
        const biquadFilter = audioCtx.createBiquadFilter()

function makeSound(stream) {
	const source = audioCtx.createMediaStreamSource(stream)

	source.connect(analyser)
	            analyser.connect(distortion)
	            distortion.connect(biquadFilter)
	            biquadFilter.connect(gainNode)
	            gainNode.connect(audioCtx.destination) // connecting the different audio graph nodes together
	analyser.connect(audioCtx.destination)

}

if (navigator.mediaDevices) {
	console.log('getUserMedia supported.')

	const constraints = {
		audio: true
	}
	let chunks = []

	navigator.mediaDevices.getUserMedia(constraints)
		.then(stream => {

			const mediaRecorder = new MediaRecorder(stream)

			chkHearMic.onchange = e => {
				if (e.target.checked == true) {
					audioCtx.resume()
					makeSound(stream)
				} else {
					audioCtx.suspend()
				}
			}

			mediaRecorder.onstop = e => {
				console.log("data available after MediaRecorder.stop() called.")

				const clipName = prompt("오디오 파일 제목을 입력하세요.", new Date())

				const clipContainer = document.createElement('article')
				const clipLabel = document.createElement('p')
				const audio = document.createElement('audio')
				const deleteButton = document.createElement('button')

				clipContainer.classList.add('clip')
				audio.setAttribute('controls', '')
				deleteButton.innerHTML = "삭제"
				clipLabel.innerHTML = clipName
				result.classList.remove("hidden");

				clipContainer.appendChild(audio)
				clipContainer.appendChild(clipLabel)
				clipContainer.appendChild(deleteButton)
				soundClips.appendChild(clipContainer)

				audio.controls = true
				const blob = new Blob(chunks, {
					'type': 'audio/ogg codecs=opus'
				})
				chunks = []
				const audioURL = URL.createObjectURL(blob)
				audio.src = audioURL
				console.log("recorder stopped")

				deleteButton.onclick = e => {
					evtTgt = e.target
					evtTgt.parentNode.parentNode.removeChild(evtTgt.parentNode)
					result.classList.add("hidden");
				}
			}

			mediaRecorder.ondataavailable = e => {
				chunks.push(e.data)
			}
		})
		.catch(err => {
			console.log('The following error occurred: ' + err)
		})
}

// checkbox
const btnBallad = document.querySelector("#ballad");
const ballad = document.querySelector(".ballad");
const btnSoul = document.querySelector("#soul");
const soul = document.querySelector(".soul");
const btnDance = document.querySelector("#dance");
const dance = document.querySelector(".dance");
const btnRock = document.querySelector("#rock");
const rock = document.querySelector(".rock");
const btnIndi = document.querySelector("#indi");
const indi = document.querySelector(".indi");

let checkBallad = false;
let checkSoul = false;
let checkDanse = false;
let checkRock = false;
let checkIndi = false;

function onCheckedBallad(event) {
  event.preventDefault();
  if (!checkBallad) {
    ballad.checked = true;
    checkBallad = true;
    btnBallad.style.color = "white";
    btnBallad.style.background = "black";
  } else {
    ballad.checked = false;
    checkBallad = false;
    btnBallad.style.color = "rgba(0, 0, 0, 0.7)";
    btnBallad.style.background = "white";
  }
}

function onCheckedSoul(event) {
  event.preventDefault();
  if (!checkSoul) {
    soul.checked = true;
    checkSoul = true;
    btnSoul.style.color = "white";
    btnSoul.style.background = "black";
  } else {
    soul.checked = false;
    checkSoul = false;
    btnSoul.style.color = "rgba(0, 0, 0, 0.7)";
    btnSoul.style.background = "white";
  }
}

function onCheckedDanse(event) {
  event.preventDefault();
  if (!checkDanse) {
    dance.checked = true;
    checkDanse = true;
    btnDance.style.color = "white";
    btnDance.style.background = "black";
  } else {
    dance.checked = false;
    checkDanse = false;
    btnDance.style.color = "rgba(0, 0, 0, 0.7)";
    btnDance.style.background = "white";
  }
}

function onCheckedRock(event) {
  event.preventDefault();
  if (!checkRock) {
    rock.checked = true;
    checkRock = true;
    btnRock.style.color = "white";
    btnRock.style.background = "black";
  } else {
    rock.checked = false;
    checkRock = false;
    btnRock.style.color = "rgba(0, 0, 0, 0.7)";
    btnRock.style.background = "white";
  }
}

function onCheckedIndi(event) {
  event.preventDefault();
  if (!checkIndi) {
    indi.checked = true;
    checkIndi = true;
    btnIndi.style.color = "white";
    btnIndi.style.background = "black";
  } else {
    indi.checked = false;
    checkIndi = false;
    btnIndi.style.color = "rgba(0, 0, 0, 0.7)";
    btnIndi.style.background = "white";
  }
}


btnBallad.addEventListener("click", onCheckedBallad);
btnSoul.addEventListener("click", onCheckedSoul);
btnDance.addEventListener("click", onCheckedDanse);
btnRock.addEventListener("click", onCheckedRock);
btnIndi.addEventListener("click", onCheckedIndi);


