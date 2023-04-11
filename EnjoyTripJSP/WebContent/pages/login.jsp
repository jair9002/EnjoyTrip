<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();    
%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

<meta charset="UTF-8">
    <!-- 폰트 추가  start -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="../assets/css/eyi.css" />
    <!-- 폰트 추가  end -->
<title>로그인 페이지</title>
</head>
<body>
<div class = "container f-gd">
    <div class= " mt-5 mb-5 b-flex justify-content-center">
        <h1>로그인하기</h1>
    </div>
    
    <div class="mb-3">
        <h2> Login </h2>
    </div>

    <div class = "mb-3">
        <form novalidate>
            <div class="form-floating mb-3">
              <input type="userEmail" class="form-control" id="userEmail" placeholder="name@example.com" value="ssafy1@ssafy.com">
              <label for="floatingInput">user Email</label>
                <div class = "valid-feedback"> Valid</div>
              <div class ="invalid-feedback">Invalid</div>
            </div>
            <div class="form-floating  mb-3">
              <input type="password" class="form-control" id="userPassword" placeholder="Password"  value="qw2!">
              <label for="floatingPassword">user Password</label>
                <div class = "valid-feedback"> Valid</div>
              <div class ="invalid-feedback">Invalid</div>
            </div>
        </form>
         <div class="d-flex justify-content-center">
         	<button id="btnLogin" type="button" class="btn btn-primary"> 로그인 </button>
         	
           <button
             class="btn btn-outline-primary ms-2"
             type="submit"
             style="--bs-btn-padding-y: 0rem; --bs-btn-padding-x: 0.5rem"
           >
             <a class="nav-link" aria-current="page" href="/EnjoyTripJSP/pages/join.jsp">회원가입</a>
           </button>
         </div>
    </div>
 </div>
 
 <script>
     // 입력값에 대한 validation
     // Back-End에 입력값 전송(ajax - fetch 이용)- 결과에 따른 행동
    // Success -> print SuccessMessage & move Page
    // Fail -> print FailMessage
    
    window.onload = function(){
        document.querySelector("#userEmail").focus();
        
        //login
        document.querySelector("#btnLogin").onclick = function(){
            if( validate() ){
            	login();
            }else{
            	alert("입력이 올바르지 않습니다")
            }
        }

    }
    
    //for Validation
    function validate(){
       let isUserEmailValid = false;
       let isUserPasswordValid = false;
       
       if( document.querySelector("#userEmail").value.length > 0 ) isUserEmailValid = true;
       if( document.querySelector("#userPassword").value.length > 0 ) isUserPasswordValid = true;
       
       if( isUserEmailValid && isUserPasswordValid ) return true;
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
        	window.location.href = "<%=contextPath%>/index.jsp"
        }
        else alert("fail");
    }

 </script>
</body>
</html>