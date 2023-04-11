<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
       
       <!-- 로그인 전 -->
       <ul id="beforeLogin" class="navbar-nav mb-2 me-2 mb-lg-0">
         <li class="nav-item" style="margin-top: 2px; margin-left: 5px">
           <button
             class="btn btn-outline-primary"
             type="submit"
             style="--bs-btn-padding-y: 0rem; --bs-btn-padding-x: 0.5rem"
           >
             <a class="nav-link" aria-current="page" href="/EnjoyTripJSP/pages/join.jsp">회원가입</a>
           </button>
         </li>
         <li class="nav-item" style="margin-top: 2px; margin-left: 5px">
           <!-- Button trigger modal -->
           <!-- nav-link 클래스는 스타일 통일을 위해 넣음 -->
           <button
             type="button"
             class="btn btn-outline-primary nav-link"
             data-bs-toggle="modal"
             data-bs-target="#loginModal"
             style="--bs-btn-padding-y: 0rem; --bs-btn-padding-x: 0.5rem"
           >
             로그인
           </button>
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

       <!-- 로그인 모달 start  -->
       <div
         class="modal fade"
         id="loginModal"
         tabindex="-1"
         aria-labelledby="exampleModalLabel"
         aria-hidden="true"
       >
         <div class="modal-dialog modal-dialog-centered">
           <div class="modal-content">
             <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">로그인</h5>
               <button
                 type="button"
                 class="btn-close"
                 data-bs-dismiss="modal"
                 aria-label="Close"
               ></button>
             </div>
             <div class="modal-body">
               <!-- 모달창 내부 start-->
               <form novalidate>
                 <div class="form-floating mb-3">
                   <input
                     type="userEmail"
                     class="form-control"
                     id="userEmail"
                     placeholder="name@example.com"
                   />
                   <label class="f-gd" for="userLoginEmail">이메일</label>
                 </div>
                 <div class="form-floating mb-3">
                   <input
                     type="password"
                     class="form-control"
                     id="userPassword"
                     placeholder="Password"
                   />
                   <label class="f-gd" for="userLoginPwd">비밀번호</label>
                 </div>
                 
                       <div class="d-grid gap-2">
                 <button
                   id="btnRegister"
                   type="button"
                   class="btn btn-primary f-gd"
                 >
                   로그인
                 </button>
               </div>
               
               </form>

               <!-- 모달창 내부 end-->
             </div>
             <div class="modal-footer">
               <button
                 type="button"
                 class="btn btn-secondary"
                 data-bs-dismiss="modal"
               >
                 닫기
               </button>
             </div>
           </div>
         </div>
       </div>
       <!-- 로그인 모달 end -->

       <!-- 로그인 후 -->
       <ul
         style="display: none"
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
             <a class="nav-link" aria-current="page" href="">로그아웃</a>
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
 	// 입력값에 대한 validation
 	// Back-End에 입력값 전송(ajax - fetch 이용)- 결과에 따른 행동
	// Success -> print SuccessMessage & move Page
	// Fail -> print FailMessage
	
	window.onload = function(){
		document.querySelector("#btnRegister").onclick = function(){
			if(validate() ){
				login();
			}else{
				alert("올바르지 않은 입력입니다");
			}
		}
		
		document.querySelector("#logoutBtn").onclick = function () {
			    after.classList.add("d-none");
			    before.classList.remove("d-none");
			  };
		
	}

	function validate(){
		let isUserEmailValid = false;
		let isUserPasswordValid = false;
		
		if ( document.querySelector("#userEmail").value.length > 0)
			isUserEmailValid = true;
		
		
		if ( document.querySelector("#userPassword").value.length > 0)
			isUserPasswordValid = true;
		
		if ( isUserEmailValid && isUserPasswordValid) return true;
		
		return false;
	}
	
	async function login(){
		let userEmail = document.querySelector("#userEmail").value;
		let userPassword = document.querySelector("#userPassword").value;
		
		// POST /login
		let urlParams = new URLSearchParams({
			userEmail: userEmail,
			userPassword: userPassword,
			
		});
		
		let fetchOptions = {
				method: "POST",
				body: urlParams
		}
		
		let response = await fetch("<%=contextPath%>/login", fetchOptions);
		let data = await response.json(); // json -> javascript object
		// data.result시, "success" || "fail" 이 나오도록 Backend에 규정되어있다.
		if (data.result == "success") {
			alert("success");
			// 원래코드 
			// window.location.href="<%=contextPath%>/index.jsp";
			document.querySelector("#beforeLogin").classList.add("d-none");
			document.querySelector("#afterLogin").style.display = "";
		}
		else {
			alert("fail");
		}
	
	}
 </script>
 
 
</body>
</html>