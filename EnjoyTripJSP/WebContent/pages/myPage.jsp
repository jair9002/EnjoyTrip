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
                <div class="col-4">
                  <!-- 회원 정보 확인창 start -->
                  
                    <p class="fs-3 text-center f-gd fw-bold">회원 정보 수정 및 탈퇴하기</p>
                    <p class="fs-6 text-center f-gd">아래의 입력 폼을 정확하게 입력하고 수정 및 탈퇴해주세요.</p>
                  <form>
                    <div class="form-floating mb-3">
                      <input
                        type="text"
                        class="form-control"
                        id="userName"
                        placeholder="Password"
                      />
                      <label class="f-gd" for="userName">이름</label>
                    </div>
                    <div class="form-floating mb-3">
                      <input
                        type="email"
                        class="form-control"
                        id="userEmail"
                        placeholder="name@example.com"
                      />
                      <label class="f-gd" for="userEmail">이메일</label>
                    </div>
                    <div class="form-floating mb-3">
                      <input
                        type="password"
                        class="form-control"
                        id="userPwd"
                        placeholder="Password"
                      />
                      <label class="f-gd" for="userPwd">비밀번호</label>
                    </div>
          
                  </form>
                  <!-- 회원 정보 확인창 입력창 end -->
                  <!-- 회원가입 버튼 -->
                  <div class="d-grid gap-2">
                    <button id="userSearchBtn" type="submit" class="btn btn-success f-gd">
                        조회하기
                    </button>
                    <button id="userModifyBtn" type="submit" class="btn btn-warning f-gd">
                        회원정보 수정하기
                    </button>
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
</html>
