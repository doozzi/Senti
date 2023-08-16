<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Senti</title>
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/sign-in/">

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#7952b3">

    <!-- login.css -->
    <link rel="stylesheet" href="css/login.css">
</head>

<body class="text-center">
	<% String errMsg = (String)session.getAttribute("errMsg");
	if(errMsg == null) errMsg ="";
	session.invalidate();
		%>
    <main class="form-signin">
        <form action="LoginServiceCon" method="post">
            <div class="p-3 mb-2" id="top">
                <br>
                <br>
                <h1 id="senti">Senti</h1>
                <br>
                <br>
            </div>
            <br>
            <div class="form-floating">
                <input required type="text" class="form-control" id="floatingInput" name="id" placeholder="Id" >
                <label for="floatingInput">아이디를 입력해주세요</label>
            </div>
          
            <div class="form-floating">
                <input required type="password" class="form-control" id="floatingPassword" name="pw" placeholder="Password">
                <label for="floatingPassword">비밀번호를 입력해주세요</label>
            </div>
            <br>
            <div id = "loginFalse"><%= errMsg %></div>
            <br>
            <button class="w-75 btn btn-lg btn-primary" type="submit" id="login">로그인</button>
            <br>
            <button type="button" class="w-75 btn btn-lg btn-warning" id="join" onclick="location.href='./join.jsp';">회원가입</button>
            <p class="mt-5 mb-3 text-muted">&copy; Senti Boys</p>
        </form>
    </main>

<!-- 부트스트랩 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<!-- login.js  -->
<script src="js/login.js"></script>
</body>

</html>