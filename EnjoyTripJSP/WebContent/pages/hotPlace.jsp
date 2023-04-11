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
        <h1 class = "hColor"> 핫 플레이스</h1>
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

<br/><br/>
    <div class = "d-flex justify-content-center">
    <div class=" card mb-3" style="max-width: 1100px">
      <div class="row g-0">
        <div class="col-md-4">
          <img src="../assets/img/kyu_testImage/4.png" class="img-fluid rounded-start" alt="...">
        </div>
        <div class="col-md-8">
          <div class="card-body">
            <h3 class="card-title">대전 성심당</h3>
            <div class="input-group">

              <textarea class="form-control" aria-label="With textarea"> 대전은 대한민국의 중앙부에 위치하므로 중도(中都)라고도 부른다. 수도권과 영남·호남을 잇는 삼남의 관문이며, 고속도로와 철도, 국도가 분기하는 교통의 요지...</textarea>
              <button type="button" class="d-flex justify-content-end btn btn-light"> 기입
                <br>완료
              </button>
            </div>
            <p class="card-text f-gd"></p>
            <p class="card-text f-gd"><small class="text-muted">2022.03.04 다녀옴</small></p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class = "d-flex justify-content-center">
    <div class=" card mb-3" style="max-width: 900px;">
      <div class="row g-0">
        <div class="col-md-8">
          <div class="card-body">
            <h3 class="card-title">울산</h3>
            <div class="input-group">
              <button type="button" class="d-flex justify-content-end btn btn-light"> 기입
                <br>완료
              </button>
              <textarea class="form-control" aria-label="With textarea"> 울산 평야는 대부분 위 세 강의 퇴적 작용으로 인해 형성되었다. 평야는 열 십(十)자 형태로 강을 따라 가로축으로는 언양읍~삼남읍 지역의 '언양 평야'로부터 시작하여 ...</textarea>
            </div>
            <p class="card-text f-gd"><small class="text-muted">2022.12.11 다녀옴</small></p>
          </div>
        </div>
        <div class="col-md-4">
          <img src="../assets/img/kyu_testImage/6.png" class="img-fluid rounded-start" alt="...">
        </div>
      </div>
    </div>
  </div>

  <div class = "d-flex justify-content-center">
    <div class=" card mb-3" style="max-width: 900px;">
      <div class="row g-0">
        <div class="col-md-4">
          <img src="../assets/img/kyu_testImage/5.png" class="img-fluid rounded-start" alt="...">
        </div>
        <div class="col-md-8">
          <div class="card-body">
            <h3 class="card-title">광주</h3>
            <div class="input-group">
              <textarea class="form-control" aria-label="With textarea">광주는 북부의 첨단지구, 북서부의 수완지구, 중심부의 상무지구, 남부의 백운광장, 남동부 원도심의 충장로, 금남로 등 수많은 핵을 갖고 있는데, 2020 ...
              </textarea>
              <button type="button" class="d-flex justify-content-end btn btn-light"> 기입
                <br>완료
              </button></div>
              
                <p class="card-text f-gd"><small class="text-muted">2023.01.01 다녀옴</small></p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class = "d-flex justify-content-center">
    <div class=" card mb-3" style="max-width: 900px;">
      <div class="row g-0">
        <div class="col-md-8">
          <div class="card-body">
            <h3 class="card-title">해운대</h3>
            <div class="input-group">
              <button type="button" class="d-flex justify-content-end btn btn-light"> 기입
                <br>완료
              </button>
              <textarea class="form-control" aria-label="With textarea"> 부산광역시의 지명, 해운대란 이름은 통일신라시대 말기의 문인이었던 최치원이 현재의 해운대해수욕장 근처를 방문했다가 소나무와 ...</textarea>

            </div>
            <p class="card-text f-gd"><small class="text-muted">2021.04.04 다녀옴</small></p>
          </div>

        </div>
        <div class="col-md-4">
          <img src="../assets/img/kyu_testImage/6.png" class="img-fluid rounded-start" alt="...">
        </div>
      </div>
    </div>
  </div>

  <div class = "d-flex justify-content-center">
    <div class=" card mb-3" style="max-width: 900px;">
      <div class="row g-0">
        <div class="col-md-4">
          <img src="../assets/img/kyu_testImage/5.png" class="img-fluid rounded-start" alt="...">
        </div>
        <div class="col-md-8">
          <div class="card-body">
            <h3 class="card-title">전주</h3>
            <div class="input-group">
              <textarea class="form-control" aria-label="With textarea">대한민국 전라북도 내륙에 위치한 시이자 전라북도청 소재지이다. 대부분의 지역이 완주군에 둘러싸여 있으며, 서쪽으로는 김제시, 서북쪽으로는 ...
              </textarea>
              <button type="button" class="d-flex justify-content-end btn btn-light"> 기입
                <br>완료
              </button></div>
              <p class="card-text f-gd"><small class="text-muted">2022.08.16 다녀옴</small></p>
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
