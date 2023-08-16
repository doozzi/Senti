<%@page import="Model.DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.88.1">
<title>Senti</title>

<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.1/examples/checkout/">
<link rel="stylesheet" href="css/myPage.css">

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>

<body>
<% DTO info = (DTO) session.getAttribute("info"); %>
	<div class="p-3 mb-2" id="top">
		<h1 id="pitch">
			<%-- <%= info.getLow() %>~<%= info.getHigh() %> --%>
		</h1>
		<a href="./playList.jsp">
			<h1 id="senti">
				<img src="img/facebook.png" id="logo"> Senti
			</h1>
		</a>
	</div>
	<br>
	<h1 class="display-5 lh-1 mb-1"
		style="text-align: center; font: revert; font-family: 'GmarketSansBold';">마이
		페이지</h1>
	<div class="container" id="join">
		<main>
			<div class="col-md-7 col-lg-8" style="margin-top: 25px;">
				<div class="image-container">
					<img id="preview-image" src="img/women.jpg"> <input
						style="display: none;" type="file" id="input-image">
				</div>
				<form class="needs-validation" action="infoUpdate" method="post">
					<hr class="my-3">
					<div class="col-12">
						<label for="id" class="form-label">아이디</label> <input type="text"
							class="form-control" id="id" name="id" placeholder="<%= info.getId() %>"
							maxlength='10' disabled>
						<input type="text" name="id" value=<%=info.getId()%> style="display: none" />
						<div class="invalid-feedback">Please enter a valid email
							address for shipping updates.</div>
					</div>

					<div class="col-12">
						<label for="password" class="form-label">비밀번호</label> <input
							required type="password" class="form-control" id="password"
							name="pw" placeholder="" required maxlength='10'
							value="<%= info.getPw() %>" disabled>
						<div class="invalid-feedback">Please enter your shipping
							address.</div>
					</div>

					<div class="col-12">
						<label for="gender" class="form-label">성별</label> <input required
							type="text" class="form-control" id="gender" name="gender"
							placeholder="<%= info.getGender() %>" maxlength='10' disabled>
						<div class="invalid-feedback">Please enter a valid email
							address for shipping updates.</div>
					</div>

					<div class="col-12">
						<label for="lowHigh" class="form-label">음역대</label> <input
							type="text" class="form-control" id="lowHigh" name="lowHigh"
							placeholder="<%= info.getLow() %>~<%= info.getHigh() %>" maxlength='10' disabled>
						<div class="invalid-feedback">Zip code required.`</div>
					</div>

					<div class="col-12">
						<label for="nick" class="form-label">닉네임</label> <input
							type="text" class="form-control" id="nick" name="nick"
							placeholder="<%= info.getNick() %>" maxlength='10' disabled>
						<div class="invalid-feedback">Zip code required.`</div>
					</div>

					<hr class="my-3">
					<input id="updateBtn"
						class="updateBtn w-100 btn btn-warning btn-lg" type="submit"
						value="회원정보수정 완료"
						style="margin-bottom: 10px; margin-top: 10px; color: white;"></input>
				</form>
				<button id="" class="update w-100 btn btn-warning btn-lg"
					style="margin-bottom: 10px; margin-top: 10px; color: white; font-family: 'GmarketSansMedium';">회원정보수정</button>
				<a href="LogoutServiceCon"><input id="logout"
					class="w-100 btn btn-secondary btn-lg" type="submit" value="로그아웃"
					style="font-family: 'GmarketSansMedium';"></input></a>
			</div>
		</main>
		<!-- 하단 네비게이션 -->
		<div class="nav fixed-bottom"
			style="font-family: 'GmarketSansLight'; background-color: white; border: 1px solid darkgray; font-size: 13.5px;">
			<ul class="nav nav-pills justify-content-center">
				<li class="nav-item"><a class="nav-link" href="vocalTest.jsp">음역대측정</a></li>
				<li class="nav-item"><a class="nav-link" href="playList.jsp">플레이리스트</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="musicSearch.jsp"
					aria-current="page">노래검색</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="myPage.jsp">마이페이지</a></li>
			</ul>
		</div>
	</div>
	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<!-- join.js -->
	<script src="js/myPage.js"></script>

	<!-- <script src="form-validation.js"></script> -->
</body>

</html>