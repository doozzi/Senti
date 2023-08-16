<%@page import="Model.DTO"%>
<%@page import="Model.songinfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.DAO"%>
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
<link rel="stylesheet" href="css/karaoke.css">
<title>Senti</title>
</head>
<body>
	<%
	String keys = request.getParameter("keys");

	DAO dao = new DAO();
	ArrayList<songinfoDTO> dto = new ArrayList<songinfoDTO>();
	dto = dao.detail(keys);
	DTO info = (DTO) session.getAttribute("info");
	%>

	<div class="p-3 mb-2" id="top">
		<h1 id="pitch"><%= info.getLow() %>~<%= info.getHigh() %></h1>
		<a href="./playList.jsp">
			<h1 id="senti">
				<img src="img/facebook.png" id="logo"> Senti
			</h1>
		</a>
	</div>
	<button id="back" type="button" class="bi bi-arrow-left fs-1"
		aria-label="Close" style="margin-left: 21px;"></button>
	<div class="card" style="width: 18rem;">
		<div class="card-body">
			<h5 class="card-title" id="title">
				<strong><%=dto.get(0).getTitle()%></strong>
			</h5>
			<p class="card-text mb-1" id="singer"><%=dto.get(0).getSinger()%></p>
			<img src="<%=dto.get(0).getAlbumimg()%>"
				class="card-img-top shadow-sm p-3 mb-1 bg-body rounded"
				id="albumimg" alt="...">
			<div class="shadow-sm p-1 mb-1 bg-body rounded" id="lyrics">
				<span> <%=dto.get(0).getLyrics()%>
				</span>
			</div>
		</div>
	</div>
	<audio id = "music" src="music/snow.mp3" controls></audio>
	<div class="record">
		<input type=checkbox id="chk-hear-mic"> <label
			for="chk-hear-mic">마이크 소리 듣기</label>
		<button id="recordStart">녹음</button>
		<button id="recordStop">녹음 정지/저장</button>
		<div id="sound-clips"></div>
	</div>
	<br>
	<div class = "result hidden">
		<button type="button" class="btn btn-primary btn-lg" onclick="location.href='karaokeResult.jsp';">점수 확인</button>
	</div>
	<br>
	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="js/karaoke.js"></script>
</body>
</html>