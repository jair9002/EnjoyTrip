<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="assets/css/kyu_css.css" />
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
<script src="./assets/js/key.js"></script>
<script src="./assets/js/loginNlogout.js"></script>

<!-- 폰트 추가  start -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet" />
<!-- 폰트 추가  end -->

<link rel="stylesheet" href="./assets/css/eyi.css" />
</head>
<div>
	<!-- 상단 navbar start -->
	<%@ include file="common/nav.jsp"%>
	<!-- 상단 navbar end -->

	<!-- 중앙 content start -->

	<div id="carouselExample" class="carousel slide f-gd"
		style="color: #F7FBFC;">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="assets/img/kyu_testImage/t_.png" class="d-block w-100"
					alt="..." />
			</div>
			<div class="carousel-item">
				<img src="assets/img/kyu_testImage/t_1.png" class="d-block w-100"
					alt="..." />
			</div>
			<div class="carousel-item">
				<img src="assets/img/kyu_testImage/t_3.png" class="d-block w-100"
					alt="..." />
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExample" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExample" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="bg-light">
		<!-- 하단 footer start -->
		<%@ include file="common/footer.jsp"%>
		<!-- 하단 footer end -->


	</body>
	
</html>
