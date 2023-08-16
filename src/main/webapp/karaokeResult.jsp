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
<!-- Bootstrap Icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="css/karaokeResult.css">
<title>Senti</title>
</head>
<body>
	<%
	DTO info = (DTO) session.getAttribute("info");
	%>
	<main>
		<div class="p-3 mb-2" id="top">
			<h1 id="pitch"><%=info.getLow()%>~<%=info.getHigh()%></h1>
			<a href="./playList.jsp">
				<h1 id="senti">
					<img src="img/facebook.png" id="logo"> Senti
				</h1>
			</a>
		</div>
		<div class="flame">
			<div class="body">
				<h5 class="title" id="title">
					<strong>Celebrity</strong>
				</h5>
				<p class="text mb-1" id="singer">아이유</p>
			</div>
			<div class="result">
				<span>내 노래 점수는?</span>
				<div id="circle">
					<span id="point">80</span>
				</div>
			</div>
			<button id="back" type="button" class="btn btn-warning btn-lg"
				style="margin-bottom: 10px; margin-top: 10px; color: white;">다시
				부르기</button>
			<button type="button" class="btn btn-primary btn-lg"
				onclick="location.href='playList.jsp';">종료</button>
		</div>
	</main>
	<!-- 하단 네비게이션 -->
	<!-- <div class="nav fixed-bottom"
		style="font-family: 'GmarketSansLight'; background-color: white; border: 1px solid darkgray; font-size: 13.5px;">
		<ul class="nav nav-pills justify-content-center">
			<li class="nav-item"><a class="nav-link" href="vocalTest.jsp">음역대측정</a></li>
			<li class="nav-item"><a class="nav-link" href="playList.jsp">플레이리스트</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="musicSearch.jsp"
				aria-current="page">노래검색</a></li>
			<li class="nav-item"><a class="nav-link" href="myPage.jsp">마이페이지</a></li>
		</ul>
	</div> -->
	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="js/karaokeResult.js"></script>
</body>
</html>