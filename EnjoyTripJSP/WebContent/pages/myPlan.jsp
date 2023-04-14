<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.*"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.google.gson.Gson" %>
<%
	UserDto userDto = (UserDto) session.getAttribute("userDto");
%>

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
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<script src="../assets/js/key.js"></script>
<script src="../assets/js/loginNlogout.js"></script>

<!-- 폰트 추가  start -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet" />
<!-- 폰트 추가  end -->

<link rel="stylesheet" href="../assets/css/eyi.css" />
<style>
/* 버튼 스타일 */
.toggleBtn {
	border: none;
	background: none;
	padding: 0;
	margin: 0;
	cursor: pointer;
}
</style>
</head>
<div>
	<!-- 상단 navbar start -->
	<%@ include file="../common/nav.jsp"%>
	<!-- 상단 navbar end -->
	<!-- 중앙 content start -->
	<br />
	<br /> <br />
	<br />

	<!--  토글로 나타내기  -->
	<div class=" d-flex justify-content-center">
		<button class="toggleBtn" type="button" onclick="toggleContent()">
			<h1 class="hColor">즐겨찾기 할 목록 찾기</h1>
		</button>
		(클릭! )
	</div>

	<hr />


	<div id="toggleContent" style="display: none;">
		<div class="container f-gd">
			<!-- <div style="height: 70px"></div> -->
			<div class="row">
				<!-- 중앙 center content end -->
				<div class="col-md-12">


					<!--  java이용 api 가져오기 start -->
					<form class="d-flex my-3">
						<select id="area1List" class="form-select me-2">
							<option value="">시도를 선택하세요</option>
						</select> <select id="area2List" class="form-select me-2">
							<option value="">구군을 선택하세요</option>
						</select> <select id="cat1List" class="form-select me-2">
							<option value="">대분류 선택하세요</option>
						</select> <select id="cat2List" class="form-select me-2">
							<option value="">중분류 선택하세요</option>
						</select> <select id="cat3List" class="form-select me-2">
							<option value="">소분류 선택하세요</option>
						</select>
					</form>

					<div class="d-flex">
						<input id="search-keyword" class="form-control me-2" type="search"
							name="search" placeholder="검색어" aria-label="검색어" />
						<button id="btnSearch" class="btn btn-outline-success"
							type="button">검색</button>
					</div>
					<!--  java이용 api 가져오기 end -->

					<!-- kakao map start -->
					<div id="map" class="my-3" style="width: 100%; height: 400px"></div>
					<!-- kakao map end -->

					<!-- 카드 추가-->
					<div class="card-group" id="cardSection"></div>
				</div>
			</div>
		</div>
		s
	</div>
	<br />
	<br /> <br />
	<br />
	<div class=" d-flex justify-content-center">
		<h1 class="hColor">내 즐겨찾기 목록</h1>
	</div>
	<hr />
	<br />
	<div class=" d-flex justify-content-center">

		<div class="row d-flex justify-content-center">
			<div class="card col-6 m-1" style="width: 18rem;">
				<img src="../assets/img/kyu_testImage/2.png"
					class="card-img-top  mt-3" alt="...">
				<div class="card-body">
					<h5 class="card-title f-gd">1. 해운대맛집 🍘 : 횟집</h5>
					<p class="card-text f-gd">산광역시는 부산 시민들의 애향심과 자긍심을 고취시키기 위해 부산을
						대표하는 10가지 자랑거리를 선정할 계획을 세우고, 1985년 6월 한 달...</p>
					<a href="#" class="card-link"> > 자세히 봐볼까요? </a>
				</div>
			</div>
			<div class="card col-6 m-1" style="width: 18rem;">
				<img src="../assets/img/kyu_testImage/3.png"
					class="card-img-top  mt-3" alt="...">
				<div class="card-body">
					<h5 class="card-title f-gd">2. 서면맛집 🍘 : 라멘</h5>
					<p class="card-text f-gd">산광역시는 부산 시민들의 애향심과 자긍심을 고취시키기 위해 부산을
						대표하는 10가지 자랑거리를 선정할 계획을 세우고, 1985년 6월 한 달...</p>
					<a href="#" class="card-link"> > 자세히 봐볼까요? </a>
				</div>
			</div>
			<div class="card col-6 m-1" style="width: 18rem;">
				<img src="../assets/img/kyu_testImage/1.png"
					class="card-img-top  mt-3" alt="...">
				<div class="card-body">
					<h5 class="card-title f-gd">3. 김해맛집 🍘 : 김해불고기</h5>
					<p class="card-text f-gd">산광역시는 부산 시민들의 애향심과 자긍심을 고취시키기 위해 부산을
						대표하는 10가지 자랑거리를 선정할 계획을 세우고, 1985년 6월 한 달...</p>
					<a href="#" class="card-link"> > 자세히 봐볼까요? </a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 하단 footer start -->
<%@ include file="../common/footer.jsp"%>
<!-- 하단 footer end -->

<!--  토글이벤트  -->

<script>
    var userDto = <%= new Gson().toJson(userDto) %>;
    console.log(userDto.userEmail);
</script>
<script>
        function toggleContent() {
            var content = document.getElementById("toggleContent");
            if (content.style.display === "none") {
                content.style.display = "block";
            } else {
                content.style.display = "none";
            }
        }
    </script>

<!--  관광공사 & kakao지 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- <script src="../assets/js/main.js"></script> -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9386cc73410429e9716c9e03472794f2&libraries=services,clusterer,drawing"></script>


<script>

      var positions; // marker 배열.
      function makeCard(data) {
    	 
    	console.log("we are in makeCard!!");
    	console.log(data);
        let trips = data.response.body.items.item;
        let tripList = ``;
        positions = [];

        let cnt = 0; // card에 각각 다른id를 부여하기 위함
        let default_img = "../assets/img/ssafy_logo.png"; // 이미지가 없을 때, 디폴트 이미지
        tripList += `<div class="row row-cols-2 row-cols-lg-5">`;
        trips.forEach((area) => {
          tripList += `
            <div class="col">
              <div class="card">
                <img src="\${ area.firstimage != '' ? area.firstimage : default_img}" class="card-img-top" style="height: 20rem" alt="...">
                <div class="card-body">
                  <h5 class="card-title fw-bold">\${area.title}</h5>
                  <p class="card-text"> 주소 : \${area.addr1}</p>
                  <a href="#" class="btn btn-primary" >상세보기</a>
                  <button class="btn btn-success" 
                	  onclick="addToFavorites('<%=userDto.getUserEmail()%>', '\${area.contentid}')"
                  > 즐찾추가 </button>
                  
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
      
      async function addToFavorites(userEmail, contentid) {
    	  
   	  console.log(userEmail + ", " + contentid)
   	  
   	  
   	  let response = await fetch("<%=contextPath%>/user?action=addAttraction&userEmail=" + userEmail +"&contentid="+ contentid);
   	    if (!response.ok) {
   	        alert(
   	      		  "잘못된 요청이에요!"
  	      		);
   	        
   	      throw new Error(`추가 실패했어! status: ${response.status}`);
   	    }else {
   	    	window.location.href="<%=contextPath%>/pages/myPlan.jsp"
   	    } 
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

<!-- api 코드 start -->
<script>
        // areaBsedList1 Service 를 이용한다.
        // BackEnd 를 이용하므로, areaCode 와 categoryCode 를 조건으로 모두 포함하는 페이지이다.

        // 공유 전역 변수
        let numOfRows = 10;
        let pageNo = 1;
        let areaCode = '';
        let sigunguCode = '';
        let cat1 = '';
        let cat2 = '';
        let cat3 = '';
		let search = '';
		
        window.onload = async function(){
            await getArea1List();
            await getCat1List();

            document.querySelector("#btnSearch").onclick = function(){
                sigunguCode = document.querySelector("#area2List").value;
                cat3 = document.querySelector("#cat3List").value;
                search = document.querySelector("#search-keyword").value;
                getList();
            }
        };

        async function getList(){

            let url = `/EnjoyTripJSP/trip/list`;
            let urlParams = "?numOfRows=" + numOfRows + "&pageNo=" + pageNo + "&areaCode=" + areaCode + "&sigunguCode=" + sigunguCode + "&cat1=" + cat1 
            		+"&cat2="
            		+ cat2
            		+ "&cat3="
            		+ cat3
            		+ "&search="
            		+ search;

            let response = await fetch( url + urlParams );
            let data = await response.json();
            console.log("json "+data);
            
            makeCard(data);
            console.log( data );

            let itemList = data.response.body.items.item;
            console.log( itemList);

        }

        async function getArea1List(){

            let url = `/EnjoyTripJSP/trip/areaCode`;
	        let urlParams = "?numOfRows=" + numOfRows + "&pageNo= " + pageNo;

            let response = await fetch( url + urlParams );
            let data = await response.json();
            console.log( data );

            let codeList = data.response.body.items.item;
            console.log( codeList);

            let listHtml = `<option value=''>시도를 선택하세요</option>`;
            codeList.forEach( el => {
            	listHtml += "<option value=" + el.code + ">" + el.name + "</option>";
            })
            document.querySelector("#area1List").innerHTML = listHtml;

            // change event handler
            document.querySelector("#area1List").onchange = function(e){
                areaCode = e.target.value;
                getArea2List();
            }
        }

        async function getArea2List(){

            let url = `/EnjoyTripJSP/trip/areaCode`;
	        let urlParams = "?numOfRows=" + numOfRows + "&pageNo=" + pageNo + "&areaCode=" + areaCode;

            let response = await fetch( url + urlParams );
            let data = await response.json();
            console.log( data );

            let codeList = data.response.body.items.item;
            console.log( codeList);

            let listHtml = `<option value=''>구군을 선택하세요</option>`;
            codeList.forEach( el => {
            	listHtml += "<option value=" + el.code + ">" + el.name + "</option>";
            })
            document.querySelector("#area2List").innerHTML = listHtml;
        }

        async function getCat1List(){

            let url = `/EnjoyTripJSP/trip/categoryCode`;
	        let urlParams = "?numOfRows=" + numOfRows + "&pageNo=" + pageNo;

            let response = await fetch( url + urlParams );
            let data = await response.json();
            console.log( data );

            let codeList = data.response.body.items.item;
            console.log( codeList);

            let listHtml = `<option value=''>대분류 선택하세요</option>`;
            codeList.forEach( el => {
                listHtml += "<option value=" + el.code + ">" + el.name + "</option>";
            })
            document.querySelector("#cat1List").innerHTML = listHtml;

            // change event handler
            document.querySelector("#cat1List").onchange = function(e){
                cat1 = e.target.value;
                getCat2List();
            }
        }

        async function getCat2List(){
            let url = `/EnjoyTripJSP/trip/categoryCode`;
	        let urlParams = "?numOfRows=" + numOfRows +"&pageNo=" + pageNo + "&cat1=" + cat1;

            let response = await fetch( url + urlParams );
            let data = await response.json();
            console.log( data );

            let codeList = data.response.body.items.item;
            console.log( codeList);

            let listHtml = `<option value=''>중분류 선택하세요</option>`;
            codeList.forEach( el => {
            	listHtml += "<option value=" + el.code + ">" + el.name + "</option>";
            })
            document.querySelector("#cat2List").innerHTML = listHtml;

            // change event handler
            document.querySelector("#cat2List").onchange = function(e){
                cat2 = e.target.value;
                getCat3List();
            }
        }

        async function getCat3List(){
            let url = `/EnjoyTripJSP/trip/categoryCode`;
	        let urlParams = "?numOfRows=" + numOfRows + "&pageNo=" + pageNo + "&cat1=" + cat1 + "&cat2=" + cat2;

            let response = await fetch( url + urlParams );
            let data = await response.json();
            console.log( data );

            let codeList = data.response.body.items.item;
            console.log( codeList);

            let listHtml = `<option value=''>소분류 선택하세요</option>`;
            codeList.forEach( el => {
            	listHtml += "<option value=" + el.code + ">" + el.name + "</option>";
            })
            document.querySelector("#cat3List").innerHTML = listHtml;
        }
    </script>
</body>
</html>
