<%@page import="Model.songrangeDTO"%>
<%@page import="Model.playListDTO"%>
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
<link rel="stylesheet" href="css/musicSearchDetail.css">
<link rel="stylesheet" href="css/playList.css">
<title>Senti</title>
</head>

<body>
	<%
	String keys = request.getParameter("keys");

	DAO dao = new DAO();

	ArrayList<songinfoDTO> dto = new ArrayList<songinfoDTO>();
	dto = dao.detail(keys);

	String dto2 = dao.range(keys);

	String dto3 = dao.range2(keys);
	
	double dto5 = dao.range3(keys);

	System.out.println("음원 frequency : "+dto5);
	
	DTO info = (DTO) session.getAttribute("info");

	DAO mdao = new DAO();
	ArrayList<playListDTO> mlist = new ArrayList<playListDTO>();

	if (info != null) {
		mlist = mdao.playListAdd(info);
	}

	String high = info.getHigh();

	double dto4 = dao.Frequency(high);
	
	System.out.println("사용자 Frequency : "+dto4);
	
	int cnt = 0;
	
	ArrayList<songrangeDTO> high_info = dao.high_info(keys);
	
	System.out.println("음원 음역대 : "+high_info.get(0).getHigh_range());
	System.out.println("음원 Frequency : "+high_info.get(0).getFrequent());
	
	%>
	<div class="p-3 mb-2" id="top">
		<h1 id="pitch"><%=info.getLow()%>~<%=info.getHigh()%></h1>
		<a href="./playList.jsp">
			<h1 id="senti">
				<img src="img/facebook.png" id="logo"> Senti
			</h1>
		</a>
	</div>
	<button id="back" type="button" class="bi bi-arrow-left fs-1"
		aria-label="Close" onclick="location.href='playList.jsp'"></button>
	<!-- <div>
        <input id="musicSearch" class="form-control me-2 w-75 h-25 d-inline-block" type="search"
            placeholder="노래, 아티스트 검색" aria-label="Search" style="visibility: hidden;">
    </div> -->
	<!-- 노래 검색하면 뜸 -->


	<!-- 노래 디테일 -->
	<main>
		<div class="card" style="width: 18rem;">
			<div class="card-body">
				<h5 class="card-title" id="title">
					<strong><%=dto.get(0).getTitle()%></strong>
				</h5>
				<p class="card-text mb-1" id="singer"><%=dto.get(0).getSinger()%></p>
				<img src="<%=dto.get(0).getAlbumimg()%>"
					class="card-img-top shadow-sm p-3 mb-1 bg-body rounded"
					id="albumimg" alt="...">
				<p class="card-text" id="genre">
					장르 :
					<%=dto.get(0).getGenre()%></p>
				<p class="card-text" id="singer">
					음역대 : <br><%=dto2%>
					~
					<%=dto3%></p>
				<p class="card-text" style="color: skyblue; font-weight: bold;">
				<%if(dto4 < dto5) {%>
				나의 음역대보다 높습니다.
				<% }else if(dto4 > dto5){ %>
				나의 음역대보다 낮습니다.
				<% }else{%>
				나의 음역대와 같습니다.
				<% } %>
				</p>

				<!-- 가사 modal -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#staticBackdrop">가사</button>

				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop"
					data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel"><%=dto.get(0).getTitle()%></h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body" style="font-size: 15px;">
								<%=dto.get(0).getLyrics()%>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				<button type="button" class="btn btn-warning" style="color: white;"
					onclick="location.href='karaoke.jsp?keys=<%=dto.get(0).getKeys()%>';">노래
					부르기</button>

				<!-- 플레이리스트 추가 modal -->
				<button type="button" class="btn btn-success" data-bs-toggle="modal"
					data-bs-target="#playList" style="margin-top: 6px;">플레이리스트
					추가</button>

				<!-- Modal -->
				<div class="modal fade" id="playList" data-bs-backdrop="static"
					data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">플레이리스트 목록</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<%
								for (int i = 0; i < mlist.size(); i++) {
									ArrayList<songinfoDTO> listDetail = dao.pDetail(mlist.get(i).getPname(), info.getId());
								%>
								<form action="listDetail2" method="post">
									<div id="music" class="my-1 p-1 bg-body rounded shadow-sm">
										<div class="d-flex text-muted pt-3">
											<a href=""> <img
												class="bd-placeholder-img flex-shrink-0 me-2 rounded"
												<%if (listDetail.size() != 0) {%>
												src="<%=listDetail.get(0).getAlbumimg()%>" <%} else {%>
												src="img/add.png" <%}%> id="musicAdd">
											</a>
											<div class="pb-3 mb-0 small lh-sm w-100">
												<div class="d-flex justify-content-between">
													<strong class="text-gray-dark" id="title"><%=mlist.get(i).getPname()%></strong>
												</div>
												<span class="d-block" id="singer" style="float: left;">
													노래 : <%=listDetail.size()%>곡
												</span>
											</div>
											<div>
												<input type="text" name="keys"
													value=<%=dto.get(0).getKeys()%> style="display: none" /> <input
													type="text" name="id" value=<%=info.getId()%>
													style="display: none" /> <input type="text" name="pname"
													value=<%=mlist.get(i).getPname()%> style="display: none" />
												<button type="submit" id="musicPlus"
													class="bi bi-plus-lg fs-1"></button>
											</div>
										</div>
									</div>
								</form>
								<%
								}
								%>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<audio src="봄여름가을겨울.mp3" controls></audio>
		</div>
	</main>
	<!-- 하단 네비게이션 -->
	<div class="nav fixed-bottom"
		style="font-family: 'GmarketSansLight'; background-color: white; border: 1px solid darkgray; font-size: 15px;">
		<ul class="nav nav-pills justify-content-center">
			<li class="nav-item"><a class="nav-link" href="vocalTest.jsp">음역대측정</a></li>
			<li class="nav-item"><a class="nav-link" href="playList.jsp">플레이리스트</a>
			</li>
			<li class="nav-item"><a class="nav-link active"
				href="musicSearch.jsp" aria-current="page">노래검색</a></li>
			<li class="nav-item"><a class="nav-link" href="myPage.jsp">마이페이지</a></li>
		</ul>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="js/musicSearchDetail.js"></script>
	<!-- alert 꾸미기  -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script>
		function onAlert() {
			Swal.fire({
				position : 'top-end',
				icon : 'success',
				title : '플레이리스트에<br> 추가되었습니다.',
				showConfirmButton : false,
			/* timer : 4500 */
			})
		}
		const addAlert = document.querySelectorAll("#musicPlus");
		var addAlertLen = addAlert.length;
		for (var i = 0; i < addAlertLen; i++) {
			addAlert[i].addEventListener("click", onAlert);
		}
	</script>
</body>

</html>