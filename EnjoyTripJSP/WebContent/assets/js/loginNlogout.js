
// jsp파일의 script실행을 위해 주석처

window.onload = function () {
  let before = document.querySelector("#beforeLogin");
  let after = document.querySelector("#afterLogin");
//  let userLoginEmail = document.querySelector("#userLoginEmail");
//  let userLoginPwd = document.querySelector("#userLoginPwd");
//  let loginBtn = document.querySelector("#loginBtn");
  let logoutBtn = document.querySelector("#logoutBtn");

  // 모달창의 로그인 버튼을 눌렀을 때
//  loginBtn.onclick = function () {
//    if (
//      // 임시 비밀번호와 이메일로 처리
//      userLoginEmail.value == "ssafy@ssafy.com" &&
//      userLoginPwd.value == "1234"
//    ) {
//      alert("로그인 성공~");
//      before.classList.add("d-none");
//      after.style.display = "";
//    } else {
//      alert("로그인 실패~");
//      after.classList.add("d-none");
//      before.classList.remove("d-none");
//    }
//  };

  logoutBtn.onclick = function () {
    after.classList.add("d-none");
    before.classList.remove("d-none");
  };
};

