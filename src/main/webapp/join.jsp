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
<link rel="stylesheet" href="css/join.css">
<!-- Bootstrap Icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">



<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.1/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<!-- <link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json"> -->
<link rel="mask-icon"
	href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg"
	color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

<!-- Custom styles for this template -->
<!-- <link href="form-validation.css" rel="stylesheet"> -->
</head>

<body class="bg-light">
	<div class="container" id="join">
		<main>
			<div class="col-md-7 col-lg-8">
				<div class="p-3 mb-2" id="top">
					<button id="back" onclick="location.href='./Login.jsp';">
						<i class="bi bi-backspace fs-2"></i>
					</button>
					<h4 class="mb-3 col-lg-6" id="title">
						<b>회원가입</b>
					</h4>
				</div>
				<!-- 프로필 사진 업로드 -->
				<!-- <div>
					<img id="thumbnail" src="img/women.jpg" alt="">
				</div>
				<span>프로필 사진</span> <input type="file" id="image" accept="image/*" /> -->

				<div class="image-container">
					<img id="preview-image"
						src="img/women.jpg">
					<input style="display: none;" type="file" id="input-image">
				</div>
				<form class="needs-validation" action="Join" method="post">
					<hr class="my-4">
					<div class="col-12">
						<label for="id" class="form-label">아이디</label> <input required
							type="text" class="form-control" id="id" name="id"
							placeholder="아이디를 입력해주세요" maxlength='10'>
						<div class="invalid-feedback">Please enter a valid email
							address for shipping updates.</div>
					</div>

					<div class="col-12">
						<label for="id" class="form-label">비밀번호</label> <input required
							type="password" class="form-control" id="password" name="pw"
							placeholder="비밀번호를 입력해주세요" required maxlength='10'>
						<div class="invalid-feedback">Please enter your shipping
							address.</div>
					</div>


					<div class="col-12">
						<label for="id2" class="form-label">비밀번호 확인</label> <input
							required type="password" class="form-control" id="password2"
							name="pwCheck" placeholder="비밀번호를 다시 입력해 주세요" maxlength='10'>
					</div>

					<div class="col-md-5">
						<label for="country" class="form-label">성별</label> <select
							class="form-select" name="gender" id="gender" required>
							<option value="여자">여자</option>
							<option value="남자">남자</option>
						</select>
						<div class="invalid-feedback">Please select a valid country.
						</div>
					</div>

					<div class="col-md-3">
						<label for="nickname" class="form-label">닉네임</label> <input
							required type="text" class="form-control" id="nick" name="nick"
							placeholder="닉네임을 입력해주세요" required maxlength='10'>
						<div class="invalid-feedback">Zip code required.`</div>
					</div>
					<hr class="my-4">
					<br> <input id="bottom" class="w-100 btn btn-primary btn-lg"
						type="submit" value="확인"></input>
				</form>
			</div>
		</main>
	</div>
	<!-- 회원가입 이후 -->
	<div class="hidden">
		<div class="p-3 mb-2" id="top2">
			<h4 class="mb-3 col-lg-6">가입 완료</h4>
		</div>
		<br> <br> <br> <br> <img id="profileImg"
			src="img/result.png" alt="">
		<div>
			<br>
			<%
			String nick = request.getParameter("nick");
			%>
			<h4>
				<%=nick%>님!
			</h4>
			<br>
			<h5>Senti의 회원이 되신 것을 축하합니다!</h5>
		</div>
		<div>
			<a id="next" class="w-100 btn btn-primary btn-lg"
				href="playListAdd.jsp">확인</a>
		</div>
	</div>



	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<!-- join.js -->
	<script src="js/join.js"></script>

	<!-- <script src="form-validation.js"></script> -->
</body>

</html>