<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>SSAFY Enjoy Trip</title>

    <link rel="stylesheet" href="../assets/css/eyi.css" />
    <link rel="shortcut icon" href="../assets/img/favicon.ico" />

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"
    />
    <script src="../assets/js/key.js"></script>
    <script src="../assets/js/loginNlogout.js"></script>

    <!-- 폰트 추가  start -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
      rel="stylesheet"
    />
    <!-- 폰트 추가  end -->
  </head>
  <body>
    <!-- 상단 navbar start -->
     <%@ include file="../common/nav.jsp" %>
    <!-- 상단 navbar end -->
    <!-- 중앙 content start -->
    <div class="container f-gd">
      <div style="height: 70px"></div>
      <div class="row">
        <!-- 중앙 center content end -->
        <div class="col-md-12">
          <div
            class="alert alert-primary mt-3 text-center fw-bold"
            role="alert"
          >
            <p class="mt-2 fs-3">부산 해운대 상세 페이지</p>
          </div>
        </div>
        <div class="container text-center"></div>
      </div>
    </div>
    <!-- 중앙 content end -->

    <!-- 하단 footer start -->
     <%@ include file="../common/footer.jsp" %>
    <!-- 하단 footer end -->
  </body>
</html>
