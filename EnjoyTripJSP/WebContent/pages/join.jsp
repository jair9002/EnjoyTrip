<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%
    String contextPath = request.getContextPath();    
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입 페이지</title>
    <link rel="stylesheet" href="../assets/css/eyi.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
      integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
      integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
      crossorigin="anonymous"
    ></script>

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
    <div class="p-5 row bg-primary">
      <p class="fs-3 text-center f-gd fw-bold">이메일 회원가입</p>
    </div>
    <div class="row justify-content-center p-4 my-5">
      <div class="col-4">
        <p class="fs-3 text-center f-gd fw-bold">이메일 계정 회원가입</p>
        <!-- 회원가입 입력창 start -->
        <form>
          <div class="form-floating mb-3">
            <input
              type="text"
              class="form-control"
              id="userName"
              placeholder="Password"
            />
            <label class="f-gd" for="userName">이름</label>
            <div class = "valid-feedback"> Valid</div>
            <div class ="invalid-feedback">Invalid</div>
          </div>
          <div class="form-floating mb-3">
            <input
              type="email"
              class="form-control"
              id="userEmail"
              placeholder="name@example.com"
            />
            <label class="f-gd" for="userEmail">이메일</label>
            <div class = "valid-feedback"> Valid</div>
            <div class ="invalid-feedback">Invalid</div>
          </div>
          <div class="form-floating mb-3">
            <input
              type="password"
              class="form-control"
              id="userPassword"
              placeholder="Password"
            />
            <label class="f-gd" for="userPassword">비밀번호</label>
            <div class = "valid-feedback"> Valid</div>
            <div class ="invalid-feedback">Invalid</div>
          </div>
          <div class="form-floating mb-3">
            <input
              type="password"
              class="form-control"
              id="userPassword2"
              placeholder="Password confirm"
            />
            <label class="f-gd" for="userPassword2">비밀번호 확인</label>
            <div class = "valid-feedback"> Valid</div>
            <div class ="invalid-feedback">Invalid</div>
          </div>

          <div class="form-floating mb-3">
            <div class="row">
              <div class="form-floating col">
                <select class="form-select" id="gugun" required>
                  <option selected disabled value="">Choose...</option>
                  <option>...</option>
                </select>
                <label for="gugun" class="form-label">구군선택</label>
              </div>
              <div class="form-floating col">
                <select class="form-select" id="sido" required>
                  <option selected disabled value="">Choose...</option>
                  <option>...</option>
                </select>
                <label for="sido" class="form-label">시도선택</label>
              </div>
            </div>
          </div>
	        <!-- 회원가입 버튼 -->
	        <div class="d-grid gap-2">
	          <button id="btnRegister" type="button" class="btn btn-primary f-gd">
	            회원가입
	          </button>
	        </div>
	        <!-- 회원가입 버튼 -->
        </form>
        <!-- 회원가입 입력창 end -->
      </div>
    </div>
    <script>
     // let button = document.querySelector("#btnRegister");
     // button.onclick = function () {
     //   location.href = "../index.html";
     // };
    </script>
    
    <script>
    // 입력값에 대한 validation
    // Back-End에 입력값 전송(ajax - fetch 이용)- 결과에 따른 행동
   	// Success -> print SuccessMessage & move Page
   	// Fail -> print FailMessage
   
   window.onload = function(){
       document.querySelector("#userName").focus();
       document.querySelector("#userName").onblur = function(){
           // this.value하면 해당 선택자의 값이 나온다
           if (validateUserName(this.value)){
               this.classList.remove("is-invalid");
               this.classList.add("is-valid");
               console.log(1);
           }else{
               this.classList.remove("is-valid");
               this.classList.add("is-invalid");
           }
       }
       document.querySelector("#userPassword").onblur = function(){
           if (validateUserPassword(this.value)){
               this.classList.remove("is-invalid");
               this.classList.add("is-valid");
               console.log(1);
           }else{
               this.classList.remove("is-valid");
               this.classList.add("is-invalid");
           }
       }
       document.querySelector("#userPassword2").onblur = function(){
           if (validateUserPassword2(this.value)){
               this.classList.remove("is-invalid");
               this.classList.add("is-valid");
               console.log(1);
           }else{
               this.classList.remove("is-valid");
               this.classList.add("is-invalid");
           }

       }
       document.querySelector("#userEmail").onblur = function(){
           if (validateUserEmail(this.value)){
               this.classList.remove("is-invalid");
               this.classList.add("is-valid");
               console.log(1);
           }else{
               this.classList.remove("is-valid");
               this.classList.add("is-invalid");
           }
       }
       document.querySelector("#btnRegister").onclick = function(){
           if( document.querySelectorAll("form .is-invalid").length > 0 ){
               alert("입력이 올바르지 않습니다. ");
           }else{
               register();
           }
       }

   
   //for Validation
   function validateUserName(userName){
       if ( userName.length >= 4)
           return true;
       return false;
   }
   
   function validateUserPassword(userPassword){
       
       // regExp for PasswordValidation
       var patternEngAtListOne = new RegExp(/[a-zA-Z]+/);// + for at least one
       var patternSpeAtListOne = new RegExp(/[~!@#$%^&*()_+|<>?:{}]+/);// + for at least one
       var patternNumAtListOne = new RegExp(/[0-9]+/);// + for at least one
       if ( patternEngAtListOne.test(userPassword)
               && patternSpeAtListOne.test(userPassword)
               && patternNumAtListOne.test(userPassword))
           return true;
       return false;
   }
   
   
   function validateUserPassword2(userPassword2){
       if ( userPassword2 == document.querySelector("#userPassword").value) return true;
       return false;
   }
   
   
   function validateUserEmail(userEmail){
       let regexp = new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
       if ( regexp.test(userEmail))
           return true;
       return false;
   }
    
   async function register(){
       let userName = document.querySelector("#userName").value;
       let userPassword = document.querySelector("#userPassword").value;
       let userEmail = document.querySelector("#userEmail").value;
       
       // POST /user/register
       let urlParams = new URLSearchParams({
           userName: userName,
           userPassword: userPassword,
           userEmail: userEmail,
           
       });
       
       let fetchOptions = {
               method: "POST",
               body: urlParams
       }
       
       let response = await fetch("<%=contextPath%>/member/register", fetchOptions);
       let data = await response.json(); // json -> javascript object
       // data.result시, "success" || "fail" 이 나오도록 Backend에 규정되어있다.
       if (data.result == "success") {
    	   alert("회원가입을 축하합니다. 로그인 페이지로 이동합니다.");
    	   window.location.href = "<%=contextPath%>/index.jsp"
       }
       else alert("fail");
   }
}
    </script>
  </body>
</html>
