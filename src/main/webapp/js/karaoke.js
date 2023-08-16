const colors = ["#4e4376", "#2b5876"];
const music = document.getElementById("music");
const lyrics = document.getElementById("lyrics");
const back = document.querySelector("#back");
const result = document.querySelector(".result");

function topColor() {
	const color1 = colors[0];
	const color2 = colors[1];
	button.style.background = `linear-gradient(${color1},${color2})`;
}

const button = document.querySelector("#top");
topColor();


// 마이크 녹음
const record = document.getElementById("recordStart")
const stop = document.getElementById("recordStop")
const soundClips = document.getElementById("sound-clips")
const chkHearMic = document.getElementById("chk-hear-mic")

const audioCtx = new (window.AudioContext || window.webkitAudioContext)() // 오디오 컨텍스트 정의

const analyser = audioCtx.createAnalyser()
//        const distortion = audioCtx.createWaveShaper()
//        const gainNode = audioCtx.createGain()
//        const biquadFilter = audioCtx.createBiquadFilter()

function makeSound(stream) {
	const source = audioCtx.createMediaStreamSource(stream)

	source.connect(analyser)
	//            analyser.connect(distortion)
	//            distortion.connect(biquadFilter)
	//            biquadFilter.connect(gainNode)
	//            gainNode.connect(audioCtx.destination) // connecting the different audio graph nodes together
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

			record.onclick = () => {
				music.play();
				mediaRecorder.start()
				console.log(mediaRecorder.state)
				console.log("recorder started")
				record.style.background = "red"
				record.style.color = "black"
			}

			stop.onclick = () => {
				mediaRecorder.stop()
				console.log(mediaRecorder.state)
				console.log("recorder stopped")
				record.style.background = ""
				record.style.color = ""
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
				deleteButton.setAttribute("class","btnDelete");
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

function onBack(){
	window.history.back();
}

back.addEventListener("click",onBack);