<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>마이 페이지</title>

    <!-- 부트 스트랩 start -->

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
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
    <!-- 부트 스트랩 end -->

    <!-- 폰트 추가  start -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
      rel="stylesheet"
    />
    
    <link rel="stylesheet" href="../assets/css/eyi.css" />
    <!-- 폰트 추가  end -->

    
    <script src="../assets/js/loginNlogout.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  
  <style>
  .radio-buttons-container {
    display: flex;
    justify-content: center;
    align-items: center;
  }
  
  .radio-button {
    display: flex;
    align-items: center;
    margin-right: 1rem;
  }
  
  .form-floating {
	  display: flex;
	  justify-content: center;
	  align-items: center;
}
</style>
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
  
            <div class="row justify-content-center p-4 my-1">

                  
                  
                    <p class="fs-3 text-center f-gd fw-bold ">회원 정보 수정 및 탈퇴하기</p>
                    <p class="fs-6 text-center f-gd">아래의 입력 폼을 정확하게 입력하고 수정 및 탈퇴해주세요.</p>
                  
					<div class="radio-buttons-container">
					  <div class="radio-button">
					    <input type="radio" id="search" name="action" value="search" >
					    <label for="search"> 조회 칼럼 채우기 </label>
					  </div>
  					  <div class="radio-button">
					    <input type="radio" id="changePwd" name="action" value="changePwd">
					    <label for="changePwd"> 회원정보(PW) 수정 칼럼 채우기 </label>
					  </div>
					  <div class="radio-button">
					    <input type="radio" id="delete" name="action" value="delete">
					    <label for="delete"> 탈퇴 칼럼 채우기 </label>
					  </div>


					</div>
						<br/>
					  <br/>
					  <br/>
                  
                  <form>
                    <div class="form-floating mb-3  " id="userNameGroup">
                      <input
                      
                        type="text"
                        class="form-control"
                        id="userName2"
                        placeholder="name"
                      />
                      <label class="f-gd" for="userName">이름</label>
                    </div>
                    <div class="form-floating mb-3" id="userEmailGroup">
                      <input
                
                        type="email"
                        class="form-control "
                        id="userEmail2"
                        placeholder="name@example.com"
                      />
                      <label class="f-gd" for="userEmail"  >이메일</label>
                    </div>
                    <div class="form-floating mb-3" id="userPwdGroup">
                      <input
                      
                        type="password"
                        class="form-control"
                        id="userPwd2"
                        placeholder="Password"
                      />
                      <label class="f-gd" for="userPwd" >비밀번호</label>
                    </div>
          
                  </form>
                  <!-- 회원 정보 확인창 입력창 end -->
                  <!-- 회원가입 버튼 -->
                <div class="col-4">
                  <!-- 회원 정보 확인창 start -->
                  
                   <div class="d-grid gap-2">
                    <button id="userSearchBtn" type="submit" class="btn btn-success f-gd">
                        조회하기
                    </button>
                    </div>
                    <div class="d-grid gap-2">
                    <button id="userModifyBtn" type="submit" class="btn btn-warning f-gd">
                        회원정보 수정하기
                    </button>
                    </div>
                     <div class="d-grid gap-2">
                    <button id="userDeleteBtn" type="submit" class="btn btn-danger f-gd">
                        탈퇴하기
                    </button>
                  </div>
                  
                  <!-- 회원가입 버튼 -->
                </div>
              </div>
      <!-- 중앙 content end -->
    <!-- 하단 footer start -->
     <%@ include file="../common/footer.jsp" %>
    <!-- 하단 footer end -->
  </body>
  
  
  <script>
  const userNameGroup = document.querySelector("#userNameGroup");
  const userEmailGroup = document.querySelector("#userEmailGroup");
  const userPwdGroup = document.querySelector("#userPwdGroup");

  const searchRadio = document.querySelector("#search");
  const deleteRadio = document.querySelector("#delete");
  const changePwdRadio = document.querySelector("#changePwd");
  
  const searchBtn = document.querySelector("#userSearchBtn");
  const modifyBtn = document.querySelector("#userModifyBtn");
  const deleteBtn = document.querySelector("#userDeleteBtn");
  

  function showUserEmailAndDetail() {
    // userEmailGroup 보이기, 나머지 숨기기
    userNameGroup.style.display = "none";
    userPwdGroup.style.display = "none";
    userEmailGroup.style.display = "block";
    
    searchBtn.style.display = "block";
    modifyBtn.style.display = "none";
    deleteBtn.style.display = "none";
    
    
  }
  
  function showUserEmailAndDelete() {
	    // userEmailGroup 보이기, 나머지 숨기기
	    userNameGroup.style.display = "none";
	    userPwdGroup.style.display = "none";
	    userEmailGroup.style.display = "block";
	    
	    searchBtn.style.display = "none";
	    modifyBtn.style.display = "none";
	    deleteBtn.style.display = "block";
	    
	    
	  }
  
  

  function showUserPwdAndEmail() {
    // userEmailGroup, userPwdGroup 보이기, userNameGroup 숨기기
    userNameGroup.style.display = "none";
    userEmailGroup.style.display = "block";
    userPwdGroup.style.display = "block";
    
    searchBtn.style.display = "none";
    modifyBtn.style.display = "block";
    deleteBtn.style.display = "none";
  }

  function hideAllGroups() {
    // 모든 그룹 숨기기
    userNameGroup.style.display = "none";
    userEmailGroup.style.display = "none";
    userPwdGroup.style.display = "none";
    
    searchBtn.style.display = "none";
    modifyBtn.style.display = "none";
    deleteBtn.style.display = "none";
    
  }

  searchRadio.addEventListener("change", () => {
	  showUserEmailAndDetail();
  });

  deleteRadio.addEventListener("change", () => {
	  showUserEmailAndDelete();
  });

  changePwdRadio.addEventListener("change", () => {
    showUserPwdAndEmail();
  });

  hideAllGroups();
  
  
  
  	  
  // ---------- getDetailUser 시작 
  const userSearchBtn = document.querySelector("#userSearchBtn");
  
  userSearchBtn.addEventListener("click", async () => {
    const userEmail = document.querySelector("#userEmail2").value;

    try {
      const userInfo = await getUserInfo(userEmail);
      // getUserInfo를 가져왔다면, 이제 아까 그 빈칸에 나머지 내용을 채워주면 됨
      // userInfo = json파일이
      
      const dateFormat = "YYYY년 MM월 DD일 HH:mm:ss";
      const registerDate = moment(userInfo.userRegisterDate);
      const dateString = registerDate.format(dateFormat);

      window.alert( "회원 정보 - 이름: '" + userInfo.userName + "', " +
    		  "이메일: '" + userInfo.userEmail + "', " +
    		  "등록일: '" + dateString + "'", "삭제  ");
      
      
      
      
    } catch (error) {
      console.error(error);
    }
  });

  async function getUserInfo(userEmail) {
    
    console.log("userEmail: " + userEmail);
    let response = await fetch("<%=contextPath%>/user?action=detail&userEmail=" + userEmail);
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    const userInfo = await response.json();
    return userInfo;
  }
  // ---------- getDetailUser끝 
  
  
  
  // ----------- deleteUser시작 
  const userDeleteBtn = document.querySelector("#userDeleteBtn");
  
  userDeleteBtn.addEventListener("click", async () => {
    const userEmail = document.querySelector("#userEmail2").value;

    try {
      const userInfo = await deleteUserInfo(userEmail);
      window.alert( "잘 삭제했어요!", "삭제  ");
    } catch (error) {
      console.error(error);
    }
  });

  async function deleteUserInfo(userEmail) {
    
    console.log("userEmail: " + userEmail);
    let response = await fetch("<%=contextPath%>/user?action=delete&userEmail=" + userEmail);
    if (!response.ok) {
        alert(
      		  "회원 정보가 없거나, 잘못된 요청이에요!"
      		);
        
      throw new Error(`삭제실패했습니다! status: ${response.status}`);
    }
  }
  // -------------- deleteUser끝 
  
  
  
  // ----------------- updateUser
   const userUpdateBtn = document.querySelector("#userModifyBtn");
  
    userUpdateBtn.addEventListener("click", async () => {
    const userEmail = document.querySelector("#userEmail2").value;
    const userPwd = document.querySelector("#userPwd2").value;

    try {
      const userInfo = await updateUserInfo(userEmail, userPwd);
      // getUserInfo를 가져왔다면, 이제 아까 그 빈칸에 나머지 내용을 채워주면 됨
      // userInfo = json파일이
    
      window.alert("비밀번호를 교체했어요 !", "수정 ");
    } catch (error) {
      console.error(error);
    }
  });

  async function updateUserInfo(userEmail, userPwd) {
    
    console.log("userEmail: " + userEmail);
    let response = await fetch("<%=contextPath%>/user?action=update&userEmail=" + userEmail + "&userPassword=" + userPwd);
    if (!response.ok) {
        alert(
      		  "회원 정보가 없거나, 잘못된 요청이에요!"
      		);
      throw new Error(`수정 실패했습니다! status: ${response.status}`);
    } 
  } 
  
  
  // -------------------- updateUser
  
 
  
  </script>
</html>
