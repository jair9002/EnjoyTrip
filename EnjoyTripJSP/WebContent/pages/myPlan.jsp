<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="../assets/css/eyi.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/kyu_css.css" />
    <title>ENJOY-TRIP</title>
    <link rel="shortcut icon" href="./assets/img/favicon.ico" />

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
      crossorigin="anonymous"
    ></script>

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

    <link rel="stylesheet" href="../assets/css/eyi.css" />
  </head>
  <div>
    <!-- 상단 navbar start -->
     <%@ include file="../common/nav.jsp" %>
    <!-- 상단 navbar end -->
    <!-- 중앙 content start -->
    <br/><br/>
    <div class = " d-flex justify-content-center">
        <h1 class = "hColor">조회한 관광지 목록</h1>
    </div>
    <hr/>
<br/>
    <div class = " d-flex justify-content-center f-gd m-1">
        <ul class="list-group list-group-horizontal-lg">
        <li class="list-group-item">
            <span class="badge bg-secondary">New</span>
            경복궁</li>
        <li class="list-group-item">
            <span class="badge bg-secondary">New</span>
            창덕궁</li>
        <li class="list-group-item">
          <span class="badge bg-primary">HIT</span> 경주월드</li>
        <li class="list-group-item">해운대 센텀시티</li>
        <li class="list-group-item">김해 워터파크</li>
      </ul>
    </div>
    <div class = " d-flex justify-content-center  f-gd m-1">
      <ul class="list-group list-group-horizontal-lg">
        <li class="list-group-item">
            <span class="badge bg-secondary">New</span>
            매미성</li>
        <li class="list-group-item">
            <span class="badge bg-secondary"></span>
            김덕규 베이커리</li>
        <li class="list-group-item">거제도 바람의언덕</li>
        <li class="list-group-item">창원 수목원</li>
        <li class="list-group-item">진해 군항제</li>
      </ul>
    </div>
    </div>


    <br/><br/>
    <div class = " d-flex justify-content-center">
        <h1 class = "hColor">여행 계획</h1>
    </div>
    <hr/>

    <div class="container text-center">
      <form class="d-flex my-3" onsubmit="return false;" role="search">
        <select id="search-area" class="form-select me-2">
          <option value="0" selected>검색 할 지역 선택</option>
        </select>
        <select id="search-content-id" class="form-select me-2">
          <option value="0" selected>관광지 유형</option>
          <option value="12">관광지</option>
          <option value="14">문화시설</option>
          <option value="15">축제공연행사</option>
          <option value="25">여행코스</option>
          <option value="28">레포츠</option>
          <option value="32">숙박</option>
          <option value="38">쇼핑</option>
          <option value="39">음식점</option>
        </select>
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
          style="width: 13%"
          type="button"
        >
          검색
        </button>
      </form>
      <!-- 검색창 end -->

      <!-- kakao map start -->
      <div id="map" class="my-3" style="width: 100%; height: 350px"></div>
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


    <br/>
    <div class = " d-flex justify-content-center">

      <div class="row d-flex justify-content-center">
        <div class="card col-6 m-1" style="width: 18rem;">
            <img src="../assets/img/kyu_testImage/1.png" class="card-img-top mt-3" alt="...">
            <div class="card-body">
            <h5 class="card-title f-gd">경상남도 모음집 🥚</h5>
            <p class="card-text f-gd">예상경비: 150,000
              <br/>
              여행날짜: 1월 둘째주
              <br/>
              계획: 창원갔다가 김해갔다가 본가갔다가
              <br/>
              <p class="card-text f-gd">일반적인 냉면과 달리 해물을 육수의 재료로 사용하며, 모양새가 화려하다는 특징이 있다. 진주헛제사...</p>
            </p>
          
            <footer class="blockquote-footer">평점: <cite title="Source Title">⭐⭐⭐⭐⭐</cite></footer>
            </div>
        </div>
        <div class="card col-6 m-1" style="width: 18rem;">
            <img src="../assets/img/kyu_testImage/2.png" class="card-img-top  mt-3" alt="...">
            <div class="card-body">
            <h5 class="card-title f-gd">충청북도 모음집 🥚</h5>
            <p class="card-text f-gd">예상경비: 230,000
              <br/>
              여행날짜: 3월 8일
              <br/>
              계획: 남자친구와 2주년 기념으로 갈 곳
              <br/>
              <p class="card-text f-gd">일반적인 냉면과 달리 해물을 육수의 재료로 사용하며, 모양새가 화려하다는 특징이 있다. 진주헛제사...</p>
            </p>
<footer class="blockquote-footer">평점: <cite title="Source Title">⭐⭐⭐⭐</cite></footer>
            </div>
        </div>
        <div class="card col-6 m-1" style="width: 18rem;">
            <img src="../assets/img/kyu_testImage/3.png" class="card-img-top  mt-3" alt="...">
            <div class="card-body">
            <h5 class="card-title f-gd">경기도 모음집 🥚</h5>
            <p class="card-text f-gd">예상경비: 300,000
              <br/>
              여행날짜: 12월 언젠가
              <br/>
              계획: 취업한 후에 첫 월차내고 가족들이랑 갈 것임
              <br/>
              <p class="card-text f-gd">일반적인 냉면과 달리 해물을 육수의 재료로 사용하며, 모양새가 화려하다는 특징이 있다. 진주헛제사...</p>
            </p>
<footer class="blockquote-footer">평점: <cite title="Source Title">⭐⭐⭐⭐</cite></footer>
            </div>
        </div>
    </div>
    </div>

    <br/><br/>
    <div class = " d-flex justify-content-center">
        <h1 class = "hColor">여행 경로</h1>
    </div>
    <hr/>
<br/>
<div class = " d-flex justify-content-center">

    <div class="row d-flex justify-content-center">
      <div class="card col-6 m-1" style="width: 18rem;">
          <img src="../assets/img/kyu_testImage/2.png" class="card-img-top  mt-3" alt="...">
          <div class="card-body">
          <h5 class="card-title f-gd">1. 해운대맛집 🍘 : 횟집</h5>
          <p class="card-text f-gd">산광역시는 부산 시민들의 애향심과 자긍심을 고취시키기 위해 부산을 대표하는 10가지 자랑거리를 선정할 계획을 세우고, 1985년 6월 한 달...</p>
            <a href="#" class="card-link"> > 자세히 봐볼까요? </a>
          </div>
      </div>
      <div class="card col-6 m-1" style="width: 18rem;">
          <img src="../assets/img/kyu_testImage/3.png" class="card-img-top  mt-3" alt="...">
          <div class="card-body">
          <h5 class="card-title f-gd">2. 서면맛집 🍘 : 라멘</h5>
          <p class="card-text f-gd">산광역시는 부산 시민들의 애향심과 자긍심을 고취시키기 위해 부산을 대표하는 10가지 자랑거리를 선정할 계획을 세우고, 1985년 6월 한 달...</p>
            <a href="#" class="card-link"> > 자세히 봐볼까요? </a>
          </div>
      </div>
      <div class="card col-6 m-1" style="width: 18rem;">
          <img src="../assets/img/kyu_testImage/1.png" class="card-img-top  mt-3" alt="...">
          <div class="card-body">
          <h5 class="card-title f-gd">3. 김해맛집 🍘 : 김해불고기</h5>
          <p class="card-text f-gd">산광역시는 부산 시민들의 애향심과 자긍심을 고취시키기 위해 부산을 대표하는 10가지 자랑거리를 선정할 계획을 세우고, 1985년 6월 한 달...</p>
          <a href="#" class="card-link"> > 자세히 봐볼까요? </a>
          </div>
      </div>
  </div>
  </div>
</div>
    <!-- 하단 footer start -->
     <%@ include file="../common/footer.jsp" %>
    <!-- 하단 footer end -->

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9386cc73410429e9716c9e03472794f2"
    ></script>
    <script>
      // 페이지 첫 로딩시 TODO:
      document.getElementById("btn-search").addEventListener("click", () => {
        let searchUrl = `https://apis.data.go.kr/B551011/KorService1/detailImage1?serviceKey=qc89BNAu4C3d9bNk1FPnjeT3lBTmEUCL94fFDctEQ7S52gtr8NM4n%2FvafW84%2BTVun8hAjAl0QArat%2FovlxUPww%3D%3D&MobileOS=ETC&MobileApp=AppTest&_type=json&contentId=1095732&imageYN=Y&subImageYN=Y&numOfRows=10&pageNo=1`;
        fetch(searchUrl)
          .then((response) => response.json())
          .then((data) => makeList(data));
      });

      var positions; // marker 배열.
      function makeList(data) {
        document.querySelector("sampleImg").setAttribute("style", "display: ;");
        let trips = data.response.body.items.item;
        let imgList = ``;
        positions = [];
        trips.forEach((area) => {
          tripList += `
              <tr onclick="moveCenter(${area.mapy}, ${area.mapx});">
                <td><img src="${area.firstimage}" width="100px"></td>
                <td>${area.title}</td>
                <td>${area.addr1} ${area.addr2}</td>
                <td>${area.mapy}</td>
                <td>${area.mapx}</td>
              </tr>
            `;

          let markerInfo = {
            title: area.title,
            latlng: new kakao.maps.LatLng(area.mapy, area.mapx),
          };
          positions.push(markerInfo);
        });
        document.getElementById("trip-list").innerHTML = tripList;
        displayMarker();
      }

      // 카카오지도
      var mapContainer = document.getElementById("map"), // 지도를 표시할 div
        mapOption = {
          center: new kakao.maps.LatLng(37.500613, 127.036431), // 지도의 중심좌표
          level: 5, // 지도의 확대 레벨
        };

      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption);

      function displayMarker() {
        // 마커 이미지의 이미지 주소입니다
        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

        for (var i = 0; i < positions.length; i++) {
          // 마커 이미지의 이미지 크기 입니다
          var imageSize = new kakao.maps.Size(24, 35);

          // 마커 이미지를 생성합니다
          var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

          // 마커를 생성합니다
          var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image: markerImage, // 마커 이미지
          });
        }

        // 첫번째 검색 정보를 이용하여 지도 중심을 이동 시킵니다
        map.setCenter(positions[0].latlng);
      }

      function moveCenter(lat, lng) {
        map.setCenter(new kakao.maps.LatLng(lat, lng));
      }
    </script>
  </body>
</html>
