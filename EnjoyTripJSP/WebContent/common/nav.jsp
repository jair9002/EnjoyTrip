<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();    
%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light shadow">
   <div class="container f-gd">
     <a class="navbar-brand text-primary fw-bold" href="/EnjoyTripJSP/index.jsp" >
       <img src="/EnjoyTripJSP/assets/img/ssafy_logo.png" alt="" width="60" />
       <font style="color: #769FCD" > SSAFY ENJOY-TRIP</font>
     </a>
     <button
       class="navbar-toggler"
       type="button"
       data-bs-toggle="collapse"
       data-bs-target="#navbarSupportedContent"
       aria-controls="navbarSupportedContent"
       aria-expanded="false"
       aria-label="Toggle navigation"
     >
       <span class="navbar-toggler-icon"></span>
     </button>
     <div class="collapse navbar-collapse" id="navbarSupportedContent">
       <ul class="navbar-nav me-auto mb-lg-0">
         <li class="nav-item">
           <a class="nav-link" aria-current="page" href="#"></a>
         </li>
         <li class="nav-item"></li>
         <li class="nav-item">
           <a class="nav-link" aria-current="page" href="/EnjoyTripJSP/pages/triplist.jsp"
             >🔎 관광지 검색</a
           >
         </li>
       </ul>

       <!--  임시 탭-->
       <ul id="tmp" class="navbar-nav mb-2 me-2 mb-lg-0">
         <li class="nav-item" style="margin-top: 2px; margin-left: 5px">
           <button
             class="btn btn-outline-primary"
             type="submit"
             style="--bs-btn-padding-y: 0rem; --bs-btn-padding-x: 0.5rem"
           >
             <a class="nav-link" aria-current="page" href="/EnjoyTripJSP/pages/myPlan.jsp"> 🌍 내 여행 관리</a>
           </button>
         </li>
         <li class="nav-item" style="margin-top: 2px; margin-left: 5px">
           <button
             class="btn btn-outline-primary"
             type="submit"
             style="--bs-btn-padding-y: 0rem; --bs-btn-padding-x: 0.5rem"
           >
             <a class="nav-link" aria-current="page" href="/EnjoyTripJSP/pages/hotPlace.jsp">🔥 HotPlace</a>
           </button>
         </li>
         
         <li class="nav-item" style="margin-top: 2px; margin-left: 5px">
           <button
             class="btn btn-outline-primary"
             type="submit"
             style="--bs-btn-padding-y: 0rem; --bs-btn-padding-x: 0.5rem"
           >
             <a class="nav-link" aria-current="page" href="/EnjoyTripJSP/pages/board.jsp">
               📌 게시판</a
             >
           </button>
         </li>
       </ul>
       <%-- 로그아웃 및 마이페이지 --%> 
       <ul
         id="afterLogin"
         class="navbar-nav mb-2 me-2 mb-lg-0"
       >
         <li class="nav-item" style="margin-top: 2px; margin-left: 5px">
           <button
             id="logoutBtn"
             class="btn btn-outline-primary"
             type="submit"
             style="--bs-btn-padding-y: 0rem; --bs-btn-padding-x: 0.5rem"
           >
             <a class="nav-link" aria-current="page" href="javascript:logout('<%=contextPath%>')">로그아웃</a>
           </button>
         </li>
         <li class="nav-item" style="margin-top: 2px; margin-left: 5px">
           <button
             class="btn btn-outline-primary"
             type="submit"
             style="--bs-btn-padding-y: 0rem; --bs-btn-padding-x: 0.5rem"
           >
             <a class="nav-link" aria-current="page" href="/EnjoyTripJSP/pages/myPage.jsp">마이페이지</a>
           </button>
         </li>
       </ul>
     </div>
   </div>
 </nav>
 
<script>
	async function logout( contextPath ){
		let url = `\${contextPath}/logout`;
		try{
			let response = await fetch(url); // GET
			let data = await response.json();
			if( data.result == "success" ){
				window.location.href = `\${contextPath}/pages/login.jsp`;
			}
		}catch(error){
			console.error(error);
			alertify.error('로그아웃 과정에 문제가 발생했습니다.');
		}
		
	}
</script>
</body>
</html>