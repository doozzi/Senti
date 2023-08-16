<%@page import="Model.DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/vocalTestIng.css">
<title>Senti</title>
</head>
<body>
	<%
	DTO info = (DTO) session.getAttribute("info");
	%>
	<div class="p-3 mb-2" id="top">
		<h1 id="pitch"></h1>
		<a href="./playList.jsp">
			<h1 id="senti">
				<img src="img/facebook.png" id="logo"> Senti
			</h1>
		</a>
	</div>
	<br>
	<h1 class="display-5 fw-bold lh-1 mb-1"
		style="font-family: 'GmarketSansBold'; text-align: center;">음역대
		테스트</h1>
	<div class="container col-xxl-8 px-4 py-4">
		<div class="row flex-lg-row-reverse align-items-center g-5 py-5">
			<div class="controls__btns">
				<button id="btnLow">최저 음역 테스트</button>
				<button id="btnHigh">최고 음역 테스트</button>
			</div>
			<!-- 최저음 테스트 -->
			<div class="vocalTestLow">
				<!-- 비디오  -->
				<video id="vocalTestLowVideo" src="video/low.mp4" controls></video>
			</div>
			<!-- 최고음 테스트 -->
			<div class="vocalTestHigh hidden">
				<!-- 비디오 -->
				<video id="vocalTestHighVideo" src="video/high.mp4" controls></video>
			</div>
			<div class="record">
				<input type=checkbox id="chk-hear-mic"> <label
					for="chk-hear-mic" style="font-family: 'GmarketSansLight';">마이크
					소리 듣기</label>
			</div>
			<form action="Testing" class="userInfo">
				<div id="select">
					<select name="lowSelect">
						<option selected>최저 음역 입력</option>
						<option value="C3">C3</option>
						<option value="D3">D3</option>
						<option value="E3">E3</option>
						<option value="F3">F3</option>
						<option value="G3">G3</option>
						<option value="A3">A3</option>
						<option value="B3">B3</option>
						<option value="C4">C4</option>
						<option value="D4">D4</option>
						<option value="E4">E4</option>
						<option value="F4">F4</option>
						<option value="G4">G4</option>
					</select> <select name="highSelect">
						<option selected>최고 음역 입력</option>
						<option value="C4">C4</option>
						<option value="D4">D4</option>
						<option value="E4">E4</option>
						<option value="F4">F4</option>
						<option value="G4">G4</option>
						<option value="A4">A4</option>
						<option value="B4">B4</option>
						<option value="C5">C5</option>
						<option value="D5">D5</option>
						<option value="E5">E5</option>
						<option value="F5">F5</option>
						<option value="G5">G5</option>
						<option value="A5">A5</option>
						<option value="B5">B5</option>
						<option value="C6">C6</option>
					</select>
				</div>
				<div id="checkbox" class="">
					<div>
						<h5>
							<strong>선호하는 장르</strong>
						</h5>
					</div>
					<div class="genre">
						<input class="ballad" type="checkbox" name="genres" value="ballad"
							style="display: none;" />
						<button id="ballad">발라드</button>
						<br /> <input class="soul" type="checkbox" name="genres"
							value="soul" style="display: none;" />
						<button id="soul">
							R&B<br>/소울
						</button>
						<br /> <input class="dance" type="checkbox" name="genres"
							value="dance" style="display: none;" />
						<button id="dance">댄스</button>
						<br /> <input class="rock" type="checkbox" name="genres"
							value="rock" style="display: none;" />
						<button id="rock">Rock</button>
						<br /> <input class="indi" type="checkbox" name="genres"
							value="indi" style="display: none;" />
						<button id="indi">인디</button>
						<input type="text" name="nick" value=<%=info.getNick()%>
							style="display: none" />
					</div>
				</div>
				<button type="submit" class="btn btn-primary">음원 추천받기</button>
			</form>
		</div>
	</div>
	<!-- 하단 네비게이션 -->
	<%
	if (info.getHigh() == null) {
	} else {
	%>
	<div class="nav fixed-bottom"
		style="font-family: 'GmarketSansLight'; background-color: white; border: 1px solid darkgray; font-size: 15px;">
		<ul class="nav nav-pills justify-content-center">
			<li class="nav-item"><a class="nav-link  active"
				href="vocalTest.jsp">음역대측정</a></li>
			<li class="nav-item"><a class="nav-link" href="playList.jsp">플레이리스트</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="musicSearch.jsp"
				aria-current="page">노래검색</a></li>
			<li class="nav-item"><a class="nav-link" href="myPage.jsp">마이페이지</a></li>
		</ul>
	</div>
	<%
	}
	%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="js/vocalTestIng.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- alert 꾸미기  -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script>
		function alert() {
			Swal.fire({
				title : '<strong>마이크 사용 권장</strong>',
				icon : 'info',
				html : '<b>마이크</b>를 사용하시면 더 정확한 측정이' + '<br>' + '가능합니다',
				showCloseButton : true,
				focusConfirm : false,
				confirmButtonText : '확인',
			})
		}
		alert();
	</script>
</body>

</html>