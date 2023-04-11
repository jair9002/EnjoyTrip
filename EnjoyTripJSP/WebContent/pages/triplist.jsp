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
            <span class="badge bg-secondary">SEARCH HERE</span>
            <p class="mt-2 fs-3">관광지를 검색해봐!</p>
          </div>

          <!-- 검색 창 start -->
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
            <div id="map" class="my-3" style="width: 100%; height: 400px"></div>
            <!-- kakao map end -->

            <!-- 카드 추가-->
            <div class="card-group" id="cardSection"></div>
          </div>

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
    <!-- 중앙 content end -->
    <!-- 하단 footer start -->
     <%@ include file="../common/footer.jsp" %>
    <!-- 하단 footer end -->

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
    <!-- <script src="../assets/js/main.js"></script> -->
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9386cc73410429e9716c9e03472794f2&libraries=services,clusterer,drawing"
    ></script>
    <script>
      // index page 로딩 후 전국의 시도 설정.
      let areaUrl =
        "https://apis.data.go.kr/B551011/KorService1/areaCode1?serviceKey=" +
        serviceKey +
        "&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json";

      // fetch(areaUrl, { method: "GET" }).then(function (response) { return response.json() }).then(function (data) { makeOption(data); });
      fetch(areaUrl, { method: "GET" })
        .then((response) => response.json())
        .then((data) => makeOption(data));

      function makeOption(data) {
        let areas = data.response.body.items.item;
        // console.log(areas);
        let sel = document.getElementById("search-area");
        areas.forEach((area) => {
          let opt = document.createElement("option");
          opt.setAttribute("value", area.code);
          opt.appendChild(document.createTextNode(area.name));

          sel.appendChild(opt);
        });
      }

      // 검색 버튼을 누르면..
      // 지역, 유형, 검색어 얻기.
      // 위 데이터를 가지고 공공데이터에 요청.
      // 받은 데이터를 이용하여 화면 구성.
      document.getElementById("btn-search").addEventListener("click", () => {
        let searchUrl = `https://apis.data.go.kr/B551011/KorService1/searchKeyword1?serviceKey=${serviceKey}&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A`;

        let areaCode = document.getElementById("search-area").value;
        let contentTypeId = document.getElementById("search-content-id").value;
        let keyword = document.getElementById("search-keyword").value;

        if (parseInt(areaCode)) searchUrl += `&areaCode=${areaCode}`;
        if (parseInt(contentTypeId))
          searchUrl += `&contentTypeId=${contentTypeId}`;
        if (!keyword) {
          alert("검색어 입력 필수!!!");
          return;
        } else searchUrl += `&keyword=${keyword}`;

        fetch(searchUrl)
          .then((response) => response.json())
          .then((data) => makeList(data));
      });

      var positions; // marker 배열.
      function makeList(data) {
        document.querySelector("table").setAttribute("style", "display: ;");
        let trips = data.response.body.items.item;
        let tripList = ``;
        positions = [];

        let cnt = 0; // card에 각각 다른id를 부여하기 위함
        let default_img = "../assets/img/ssafy_logo.png"; // 이미지가 없을 때, 디폴트 이미지
        tripList += `<div class="row row-cols-2 row-cols-lg-5">`;
        trips.forEach((area) => {
          tripList += `
            <div class="col">
              <div class="card" >
                <img src="${
                  area.firstimage != "" ? area.firstimage : default_img
                }" class="card-img-top" style="height: 20rem" alt="...">
                <div class="card-body">
                  <h5 class="card-title fw-bold">${area.title}</h5>
                  <p class="card-text"> 주소 : ${area.addr1}</p>
                  <a href="#" class="btn btn-primary" >상세보기</a>
                </div>
              </div>
            </div>
              `;

          let markerInfo = {
            title: area.title,
            latlng: new kakao.maps.LatLng(area.mapy, area.mapx),
          };
          positions.push(markerInfo);
        });

        tripList += `</div>`;

        document.getElementById("cardSection").innerHTML = tripList;
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
        var imageSrc =
          "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

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
