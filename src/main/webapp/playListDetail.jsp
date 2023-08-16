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
<link rel="stylesheet" href="css/playListDetail.css">
<!-- Bootstrap Icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<title>Senti</title>
</head>

<body>
	<%
	String pname = request.getParameter("pname");
	DAO dao = new DAO();

	DTO info = (DTO) session.getAttribute("info");
	ArrayList<songinfoDTO> listDetail = dao.pDetail(pname, info.getId());
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
		<button id="back" type="button" class="bi bi-arrow-left fs-1"
			aria-label="Close" onclick="location.href='playList.jsp' "></button>
		<br>
		<div class="shadow p-3 mb-5 bg-body rounded" id="main">
			<img class="shadow-sm p-1 mb-1 bg-body rounded "
				id="playListThumbNail" <%if (listDetail.size() != 0) {%>
				src="<%=listDetail.get(0).getAlbumimg()%>" <%} else {%>
				src="img/add.png" <%}%>>
			<div class="playListInfo">
				<div class="">
					<strong class="text-gray-dark" id="playListTitle"><%=pname%></strong>
					<!-- 재생목록 수정  -->
					<form class="playListTitleUpdate hidden" action="Update">
						<input type="text" name="pname" value=<%=pname%>
							style="display: none" /> <input id="playListTitleUpdateInput"
							class="form-control me-2 d-inline-block" type="search"
							name="update_pname" placeholder=<%=pname%> aria-label="Search">
						<input type="text" name="id" value=<%=info.getId()%>
							style="display: none" /> <input id="playListTitleUpdateSubmit"
							type="submit" class="btn btn-outline-primary d-inline-block"
							value="입력"></input>
					</form>
				</div>
				<div class="">
					<span class="" id="" style="margin-left: 10px;">노래 : <%=listDetail.size()%>곡
					</span>
				</div>
				<div>
					<a id="musicPlus" href="musicSearch.jsp">
						<button type="button" class="bi bi-plus-lg fs-1" title="노래 추가"
							style="margin-left: 6px;"></button>
					</a>
					<button type="button" class="bi bi-pencil fs-2" id="btnUpdate"
						title="재생목록이름 수정"></button>

					<!-- 재생목록 삭제 버튼 -->
					<button type="button" class="bi bi-x-lg fs-2"
						data-bs-toggle="modal" data-bs-target="#playListDelete"></button>

					<!-- 재생목록 삭제 모달 -->
					<div class="modal fade" id="playListDelete" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">플레이리스트 삭제</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">정말로 삭제하시겠습니까?</div>
								<div class="modal-footer">
									<a href="delete?pname=<%=pname%>">
										<button type="button" class="btn btn-danger"
											style="margin-right: 0px;">삭제</button>
									</a>
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<hr>
		<!-- 노래 -->
		<%
		for (int i = 0; i < listDetail.size(); i++) {
		%>
		<form action="MusicDelete" method="post">
			<div id="music1" class="shadow-sm p-1 mb-1 bg-body rounded"
				style="height: 70px;">
				<div class="d-flex text-muted pt-1">
					<a
						href="musicSearchDetail.jsp?keys=<%=listDetail.get(i).getKeys()%>">
						<img class="bd-placeholder-img flex-shrink-0 me-2 rounded"
						src="<%=listDetail.get(i).getAlbumimg()%>" width="56" height="56">
					</a>
					<div class="pb-3 mb-0 small lh-sm w-100">
						<div class="d-flex justify-content-between"
							style="margin-top: 11px;">
							<a
								href="musicSearchDetail.jsp?keys=<%=listDetail.get(i).getKeys()%>">
								<strong class="text-gray-dark" id="title"><%=listDetail.get(i).getTitle()%></strong>
							</a>
						</div>
						<span class="d-block" id="singer" style="float: left;"><%=listDetail.get(i).getSinger()%></span>
						<span class="d-block" id="singer" style="float: left;">&nbsp﻿·&nbsp﻿</span>
						<span class="d-block" id="times" style="float: left;"><%=listDetail.get(i).getTimes()%></span>
					</div>
					<div class="">
						<input type="text" name="keys"
							value=<%=listDetail.get(i).getKeys()%> style="display: none" />
						<input type="text" name="pname" value=<%=pname%>
							style="display: none" />
						<button id="musicDelete" class="musicDelete bi bi-x-lg fs-1 hidden" type="submit"></button>
						</a>
					</div>
				</div>
			</div>
		</form>
		<%
		}
		%>
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
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="js/playListDetail.js"></script>
</body>

</html>