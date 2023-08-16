<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> -->
<!DOCTYPE html>
<%@page import="java.util.Random"%>
<%@page import="Model.songinfoDTO"%>
<%@page import="Model.DTO"%>
<%@page import="Model.DAO"%>
<%@page import="Model.playListDTO"%>
<%@page import="java.util.ArrayList"%>
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
<link rel="stylesheet" href="css/playList.css">
<!-- font  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
	rel="stylesheet">
<title>Senti</title>
</head>
<body>
	<!-- <img id="profileImg" src="img/women.jpg" alt=""> -->
	<%
			String nick = (String) session.getAttribute("nick");
			String id = (String) session.getAttribute("id");
			DTO info = (DTO) session.getAttribute("info");

			DAO mdao = new DAO();
			ArrayList<playListDTO> mlist = new ArrayList<playListDTO>();

			if (info != null) {
				mlist = mdao.playListAdd(info);
			
			}
			%>
	<main>
		<div class="p-3 mb-2" id="top">
			<h1 id="pitch"><%= info.getLow() %>~<%= info.getHigh() %></h1>
			<a href="./playList.jsp">
				<h1 id="senti">
					<img src="img/facebook.png" id="logo"> Senti
				</h1>
			</a>
		</div>
		<br>
		<div>

			<h1 id="nick">
				<%=info.getNick()%>님의<br>플레이리스트
			</h1>
		</div>
		<div class="main">
			<!-- 플레이리스트 만들기 -->
			<form class="playList-form" action="playList" method="post">
				<input type="text" name="id" value=<%=info.getId()%>
					style="display: none" /> <input type="text"
					class="form-control me-2 d-inline-block w-75" id="createPlayList"
					name="playListName" placeholder="플레이리스트를 만드세요"> <input
					id="playListSubmit" type="submit"
					class="btn btn-outline-primary h-25 d-inline-block" value="입력"></input>
			</form>
		</div>
		<hr>
		<!-- 플레이리스트  예시-->
		<%
		for (int i = 0; i < mlist.size(); i++) {
		DAO dao = new DAO();
		ArrayList<songinfoDTO> listDetail = dao.pDetail(mlist.get(i).getPname(), info.getId());
		%>
		<div id="playList1" class="bg-body rounded shadow-sm col-6">
			<a href="playListDetail.jsp?pname=<%=mlist.get(i).getPname()%>">
				<div class="">
					<!-- 앨범 커버 -->
					<img class="bd-placeholder-img flex-shrink-0 me-2 rounded"
						<% if(listDetail.size() != 0){ %>
						src="<%=listDetail.get(0).getAlbumimg()%>" <% } else{ %>
						src="img/add.png" <% } %>>
					<div id="playListInfo">
						<strong class="text-gray-dark"><%=mlist.get(i).getPname()%></strong>
						<span class="d-block">노래 : <%= listDetail.size() %>곡
						</span>
					</div>
					<!-- <div class="pb-3 mb-0 small lh-sm w-100">
						<div class="d-flex justify-content-between">
							<strong class="text-gray-dark">재생목록이름</strong>
						</div>
						<button type="button" class="btn-close" aria-label="Close"></button>
						<span class="d-block"></span>
						<span class="d-block">노래 : 0곡</span>
					</div> -->
				</div>
			</a>
		</div>
		<%
		}
		%>
	</main>

	<!-- 하단 네비게이션 -->
	<div class="nav fixed-bottom"
		style="font-family: 'GmarketSansLight'; background-color: white; border: 1px solid darkgray; font-size: 15px;">
		<ul class="nav nav-pills justify-content-center">
			<li class="nav-item"><a class="nav-link" href="vocalTest.jsp">음역대측정</a></li>
			<li class="nav-item"><a class="nav-link  active"
				href="playList.jsp">플레이리스트</a></li>
			<li class="nav-item"><a class="nav-link" href="musicSearch.jsp"
				aria-current="page">노래검색</a></li>
			<li class="nav-item"><a class="nav-link" href="myPage.jsp">마이페이지</a></li>
		</ul>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="js/playList.js"></script>
</body>

</html>