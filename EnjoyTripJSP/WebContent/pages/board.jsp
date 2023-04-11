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

    
    <script src="../assets/js/key.js"></script>
    <script src="../assets/js/loginNlogout.js"></script>

    <!-- 부트 스트랩 start -->

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <!-- 부트 스트랩 end -->

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
            <p class="mt-2 fs-3">게시판</p>
          </div>

          <!-- 게시판 start -->
          <table class="table">
            <thead class="table-light">
              <tr>
                <th scope="col">#</th>
                <th scope="col">제목</th>
                <th scope="col">지역</th>
                <th scope="col">작성자</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>여행 같이 가실 분 구해요~</td>
                <td>부산 강서구</td>
                <td>@도라에몽</td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>핫 플레이스 공유!</td>
                <td>서울 연남동</td>
                <td>@카페돌이</td>
              </tr>
              <tr>
                <th scope="row">3</th>
                <td>놀러가기 좋은 곳 알려주세요</td>
                <td>서울 강서구</td>
                <td>@twitter</td>
              </tr>
              <tr>
                <th scope="row">4</th>
                <td>부산 여행지 추천해주세요</td>
                <td>부산 금정구</td>
                <td>@떼껄룩</td>
              </tr>
              <tr>
                <th scope="row">5</th>
                <td>숨겨진 대구 찐 맛집</td>
                <td>대구 달성구</td>
                <td>@소빵</td>
              </tr>
              <tr>
                <th scope="row">6</th>
                <td>제주도 한달살이 후기</td>
                <td>제주도</td>
                <td>@귤귤</td>
              </tr>
            </tbody>
          </table>
          <!-- 게시판 end -->
          <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
              <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#">Next</a>
              </li>
            </ul>
          </nav>
          <!-- 검색 창 start -->
          <div class="container text-center">
            <form class="d-flex my-3" onsubmit="return false;" role="search">
              <input
                id="search-keyword"
                class="form-control me-2"
                type="search"
                placeholder="검색어"
                aria-label="검색어"
              />
              <button
                id="btn-search"
                class="btn btn-outline-success"
                style="width: 8%"
                type="button"
              >
                검색
              </button>
            </form>
            
            <!-- 검색창 end -->

            <!-- kakao map start -->
            <div id="map" class="my-3" style="width: 100%; height: 400px"></div>
            <!-- kakao map end -->

          <!--  DummyDATA -->
          <div class="row">
            <table class="table table-striped" style="display: flex">
              <thead>
                <tr></tr>
              </thead>
              <tbody id="trip-list"></tbody>
            </table>
          </div>
        </div>
        <div class="container text-center"></div>
      </div>
    </div>
    </div>
    <!-- 중앙 content end -->

    <!-- 하단 footer start -->
     <%@ include file="../common/footer.jsp" %>
    <!-- 하단 footer end -->
  </body>
</html>
