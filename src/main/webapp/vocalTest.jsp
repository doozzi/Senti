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
<link rel="stylesheet" href="css/vocalTest.css">
<!-- font  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
	rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
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
	<h1 class="display-5 lh-1 mb-1"
		style="font-family: 'GmarketSansBold'; text-align: center;">음역대
		테스트</h1>
	<div class="container col-xxl-8 px-4 py-3">
		<div class="row flex-lg-row-reverse align-items-center g-5 py-5">
			<div class="col-10 col-sm-8 col-lg-6">
				<img src="img/vocalTest.jpg" id="thumbnail" />
			</div>
			<div class="col-lg-6">
				<div class="d-grid gap-2 d-md-flex justify-content-md-start">
					<button id="vocalTest" type="button"
						class="btn btn-primary btn-lg px-4 me-md-2"
						onclick="location.href='./vocalTestIng.jsp';"
						style="font-family: 'GmarketSansMedium';">직접 테스트</button>
					<label class="btn btn-warning btn-lg px-4 me-md-2" for="input-file"
						style="font-family: 'GmarketSansMedium'; color: white;">
						녹음한 파일 올리기 </label> <input class="" type="file" id="input-file"
						style="display: none" />
				</div>
			</div>
		</div>
	</div>
	<!-- 하단 네비게이션 -->
	<%
	if (info.getHigh() == null) {
	} else {
	%>
	<div class="nav fixed-bottom"
		style="font-family: 'GmarketSansLight'; background-color: white; border: 1px solid darkgray; font-size: 13.5px;">
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
	<script src="js/vocalTest.js"></script>
</body>

</html>