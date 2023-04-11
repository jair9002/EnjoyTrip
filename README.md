# EnjoyTrip_3_BackEnd_02조_김규리_정명진

# 기본
## 1. 메인 페이지 및 메뉴 구성
session을 이용하여 현재 사용자가 로그인 상태인지에 따라 로그인 화면으로 리다이렉션 할지 결정한다.
![image](https://user-images.githubusercontent.com/64851797/227995964-aa57f956-81a0-4551-918b-25d061fa376b.png)


## 2. 관광지 정보 조회 
대, 중, 소분류 선택을 통한 API 조회 결과를 출력한다. 만약 이미지가 없는 경우라면 싸피 기본 로고를 적용한다.
![캡처](https://lab.ssafy.com/mandarining0918/enjoytrip_3_backend_02-KKR-JMJ/-/raw/279fee40b04b1934ede1830ab268425ff8e95383/ImageFiles/search1.png)
![캡처](https://lab.ssafy.com/mandarining0918/enjoytrip_3_backend_02-KKR-JMJ/-/raw/a57b217f721c1150a1bad0761a4933c137cbb548/ImageFiles/tttstst.png)




## 3. 회원관리 페이지 
### 3-1. 등록 (회원가입)
![image](https://user-images.githubusercontent.com/64851797/227997040-cd6f67dc-3e17-49ff-96c1-c45c2784010f.png)
![image](https://user-images.githubusercontent.com/64851797/227997962-8dc73e9f-8ac2-42de-b938-2a774b55bb8f.png)


### 3-2. 수정
: 수정하려는 Password 입력 후, 변경된 DB내용 비교 
![캡처](https://lab.ssafy.com/mandarining0918/enjoytrip_3_backend_02-KKR-JMJ/-/raw/40711e591c323bc4217e3be2a347b8fda33e43e4/ImageFiles/modify1UI.png)
![캡처](https://lab.ssafy.com/mandarining0918/enjoytrip_3_backend_02-KKR-JMJ/-/raw/40711e591c323bc4217e3be2a347b8fda33e43e4/ImageFiles/modify2DB.png)


### 3-3. 삭제
:삭제하려는 Email 입력 후, 변경된 DB내용 비교 
![캡처](https://lab.ssafy.com/mandarining0918/enjoytrip_3_backend_02-KKR-JMJ/-/raw/40711e591c323bc4217e3be2a347b8fda33e43e4/ImageFiles/delete1ui.png)
![캡처](https://lab.ssafy.com/mandarining0918/enjoytrip_3_backend_02-KKR-JMJ/-/raw/40711e591c323bc4217e3be2a347b8fda33e43e4/ImageFiles/delete2DB.png)

### 3-4. 조회 
:조회 후 , 출력되는 Alert내용과 DB내용 비교
![캡처](https://lab.ssafy.com/mandarining0918/enjoytrip_3_backend_02-KKR-JMJ/-/raw/40711e591c323bc4217e3be2a347b8fda33e43e4/ImageFiles/detail1UI.png)
![캡처](https://lab.ssafy.com/mandarining0918/enjoytrip_3_backend_02-KKR-JMJ/-/raw/40711e591c323bc4217e3be2a347b8fda33e43e4/ImageFiles/detail2DB.png)

## 4. 로그인/로그아웃 페이지 
: 첫 화면 접근 시 로그인, 혹은 회원가입을 통하여 메인페이지 이동
![image](https://user-images.githubusercontent.com/64851797/227995964-aa57f956-81a0-4551-918b-25d061fa376b.png)

: 로그아웃 버튼을 통하여 세션 초기화 및 초기 화면으로 리다이렉트
![캡처](https://lab.ssafy.com/mandarining0918/enjoytrip_3_backend_02-KKR-JMJ/-/raw/279fee40b04b1934ede1830ab268425ff8e95383/ImageFiles/logout.png)

# 심화

## 5-1. 게시글 생성  
게시글 목록의 왼쪽 상단에 글쓰기 버튼을 누르면 글을 작성할 수 있다.
![image](https://user-images.githubusercontent.com/64851797/227999146-1534facc-2b2c-42d0-a4a9-3e5890d6b3d8.png)
작성 성공시, alertify를 사용하여 확인할 수 있다.
![image](https://user-images.githubusercontent.com/64851797/227999154-dc0e4dee-baa1-4b67-bcde-71b001ebe96e.png)
![image](https://user-images.githubusercontent.com/64851797/227999265-af394746-ecd4-4de5-854f-ab864df10add.png)
## 5-2. 게시글 조회  
게시글 상세 조회는 원하는 게시글을 클릭할 시, 모달창을 통해 확인할 수 있다.
![image](https://user-images.githubusercontent.com/64851797/227999317-63188594-5c57-4ef3-a143-ffd2c6a6392a.png)
## 5-3. 게시글 수정
글을 수정하고 싶다면 상세조회에서 글 수정하기를 클릭하여 수정할 수 있다.
![image](https://user-images.githubusercontent.com/64851797/227999482-95013582-9a91-4af8-8f05-f3537e834448.png)
수정이 완료된 화면, alertify를 활용하여 확인 가능하다.
![image](https://user-images.githubusercontent.com/64851797/227999496-e4f344aa-ff2e-4226-af99-a7e7bfbc667d.png)
![image](https://user-images.githubusercontent.com/64851797/228000090-100919eb-34b9-4f3e-b69b-756b86b014ac.png)
## 5-4. 게시글 삭제

게시글 삭제는 원하는 게시글을 클릭할 시, 글 삭제하기 버튼을 클릭하면 된다.
![image](https://user-images.githubusercontent.com/64851797/227999317-63188594-5c57-4ef3-a143-ffd2c6a6392a.png)
alertify를 활용하여 다시 한번 확인한다.
![image](https://user-images.githubusercontent.com/64851797/228000837-8650e4aa-879e-44d0-9c20-af53d3a7ffb3.png)
![image](https://user-images.githubusercontent.com/64851797/228000842-f64f30d6-9747-47cf-9961-f3d4aaa6cc3a.png)
![image](https://user-images.githubusercontent.com/64851797/228000846-b8a7acec-069d-4777-901c-b995a762df43.png)

## 6. 사이트맵  
![캡처](https://lab.ssafy.com/mandarining0918/enjoytrip_3_backend_02-KKR-JMJ/-/raw/40711e591c323bc4217e3be2a347b8fda33e43e4/ImageFiles/SiteMap.png)


