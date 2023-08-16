<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap core CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/join.css">
        <title>Senti</title>
    </head>

    <body>
        <div>
            <div class="p-3 mb-2" id="top2">
                <h4 class="mb-3 col-lg-6"><b>로그인 실패</b></h4>
            </div>
            <br>
            <br>
            <br>
            <br>
            <img id="profileImg" src="img/fail.png" alt="">
            <div style="visibility: hidden;">
                <br>
                <% String nick=request.getParameter("nick"); %>
                    <h4>
                        <%= nick %>님!
                    </h4>
                    <br>
                    <h5>Senti의 회원이 되신 것을 축하합니다!</h5>
            </div>
            <div>
                <a id="next" class="w-100 btn btn-secondary btn-lg" href="Login.jsp">로그인 다시하기</a>
            </div>
        </div>
        <!-- 부트스트랩 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    </body>

    </html>