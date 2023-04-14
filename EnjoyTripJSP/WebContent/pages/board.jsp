<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>SSAFY Enjoy Trip</title>

    <link rel="stylesheet" href="../assets/css/eyi.css" />
    <link rel="shortcut icon" href="../assets/img/favicon.ico" />

    
    <script src="../assets/js/key.js"></script>
    <script src="../assets/js/loginNlogout.js"></script>

    <!-- 부트 스트랩 start -->

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <!-- 부트 스트랩 end -->

    <!-- 폰트 추가  start -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
      rel="stylesheet"
    />
    <!-- 폰트 추가  end -->
    
    <!--  alertify  추가 start -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
    <!--  alertify  추가 end -->
    
  </head>
  <body>
    
    <!-- 상단 navbar start -->
     <%@ include file="../common/nav.jsp" %>
    <!-- 상단 navbar end -->

	<!-- 중앙 content start -->
	<div class="container f-gd">
	  <div class="row">
	    <!-- center content end -->
	    <div class="col-md-12">
	      <div class="alert alert-primary mt-3 text-center fw-bold" role="alert">
	        <p class="mt-2 fs-3">게시판</p>
	      </div>
	
	      <button class="btn btn-sm btn-primary mb-2" id="btnInsertPage">
	        글쓰기
	      </button>
	      <!-- 게시판 start -->
	      <table class="table">
	        <thead class="table-light">
	          <tr>
	            <th scope="col">#</th>
	            <th scope="col">제목</th>
	            <th scope="col">작성자</th>
	            <th scope="col">날짜</th>
	            <th scope="col">조회수</th>
	          </tr>
	        </thead>
	        <tbody id="boardTbody">
	        </tbody>
	      </table>
	      <!-- 게시판 end -->
	      <nav aria-label="Page navigation example">
	        <ul class="pagination justify-content-center">
	          <li class="page-item disabled">
	            <a class="page-link" href="#" tabindex="-1" aria-disabled="true"
	              >Previous</a
	            >
	          </li>
	          <li class="page-item"><a class="page-link" href="#">1</a></li>
	          <li class="page-item"><a class="page-link" href="#">2</a></li>
	          <li class="page-item"><a class="page-link" href="#">3</a></li>
	          <li class="page-item">
	            <a class="page-link" href="#">Next</a>
	          </li>
	        </ul>
	      </nav>
	      <!-- 검색 창 start -->
	      <div class="container text-center">
	        <form class="d-flex my-3" onsubmit="return false;" role="search">
	          <input
	            id="search-keyword"
	            class="form-control me-2"
	            type="search"
	            placeholder="검색어"
	            aria-label="검색어"
	          />
	          <button
	            id="btn-search"
	            class="btn btn-outline-success"
	            style="width: 8%"
	            type="button"
	          >
	            검색
	          </button>
	        </form>
	      </div>
	      <!-- 검색창 end -->
	    </div>
	  </div>
	</div>
	<!-- 중앙 content end -->
	


    <!-- 하단 footer start -->
     <%@ include file="../common/footer.jsp" %>
    <!-- 하단 footer end -->
    
    
	<!-- Modal insert-->
	<div class="modal" tabindex="-1" id="boardInsertModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">글 쓰기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	
			<div class="mb-3">
			  <label for="titleInsert" class="form-label">제목</label>
			  <input type="text" class="form-control" id="titleInsert">
			</div>
			<div class="mb-3">
			  <label for="contentInsert" class="form-label">내용</label>
			  <textarea class="form-control" id="contentInsert" rows="5"></textarea>  
			</div>
			<button id="btnBoardInsert" class="btn btn-sm btn-primary btn-outline float-end" data-bs-dismiss="modal" type="button">등록</button>
	
	      </div>      
	    </div>
	  </div>
	</div>
	<!-- End Modal -->
	
	
	<!-- Modal detail-->
	<div class="modal" tabindex="-1" id="boardDetailModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">글 상세</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	
	        <table class="table table-hover">
	          <tbody>
	            <tr><td>글번호</td><td id="boardIdDetail">#</td></tr>
	            <tr><td>제목</td><td id="titleDetail">#</td></tr>
	            <tr><td>내용</td><td id="contentDetail">#</td></tr>
	            <tr><td>작성자</td><td id="userNameDetail">#</td></tr>
	            <tr><td>작성일시</td><td id="regDtDetail">#</td></tr>
	            <tr><td>조회수</td><td id="readCountDetail">#</td></tr>
	          </tbody>
	        </table>
			<button id="btnBoardUpdateForm" class="btn btn-sm btn-primary btn-outline" data-bs-dismiss="modal" type="button">글 수정하기</button>
			<button id="btnBoardDeleteConfirm" class="btn btn-sm btn-warning btn-outline" data-bs-dismiss="modal" type="button">글 삭제하기</button>
	
	      </div>      
	    </div>
	  </div>
	</div>
	<!-- End Modal -->
	
	<!-- Modal update-->
	<div class="modal" tabindex="-1" id="boardUpdateModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">글 수정</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	
			<div class="mb-3">
			  <label for="titleUpdate" class="form-label">제목</label>
			  <input type="text" class="form-control" id="titleUpdate">
			</div>
			<div class="mb-3">
			  <label for="contentUpdate" class="form-label">내용</label>
			  <textarea class="form-control" id="contentUpdate" rows="5"></textarea>  
			</div>
			<button id="btnBoardUpdate" class="btn btn-sm btn-primary btn-outline float-end" data-bs-dismiss="modal" type="button">수정</button>
	
	      </div>      
	    </div>
	  </div>
	</div>
	<!-- End Modal -->		

	
    
  <script>

	var LIST_ROW_COUNT = 10;	//limit
	var OFFSET = 0;   // limit 10 offet 10
	var SEARCH_WORD = "";
	
	var PAGE_LINK_COUNT = 10;	// pagination link 갯수
	var TOTAL_LIST_ITEM_COUNT = 0;
	var CURRENT_PAGE_INDEX = 1;
	
  window.onload = function (){
	// 게시판 글 목록 조회
		boardList();
	  
		// insert modal
		document.querySelector("#btnInsertPage").onclick = function(){
			
			document.querySelector("#titleInsert").value = "";
			document.querySelector("#contentInsert").value = "";
			let modal = new bootstrap.Modal(document.querySelector("#boardInsertModal"));
			modal.show();
		}
		
		// insert
		document.querySelector("#btnBoardInsert").onclick = function(){
			
			if( validateInsert() ){
				boardInsert();
			}
		}
		
		
		
		// update
		document.querySelector("#btnBoardUpdateForm").onclick = function(){
			
			var boardId = document.querySelector("#boardDetailModal").getAttribute("data-boardId");
			document.querySelector("#boardUpdateModal").setAttribute("data-boardId", boardId);
			
			document.querySelector("#titleUpdate").value = document.querySelector("#titleDetail").innerHTML;
			document.querySelector("#contentUpdate").value = document.querySelector("#contentDetail").innerHTML;
			
			let detailModal = new bootstrap.Modal( document.querySelector("#boardDetailModal") );
			detailModal.hide();
			let updatelModal = new bootstrap.Modal( document.querySelector("#boardUpdateModal") );
			updatelModal.show();
		};
		
		document.querySelector("#btnBoardUpdate").onclick = function(){

			if( validateUpdate() ){
				boardUpdate();
			}
		};
		
		// delete
		document.querySelector("#btnBoardDeleteConfirm").onclick = function(){
			 alertify.confirm('삭제 확인', '이 글을 삭제하시겠습니까?',
	 			function() {
					boardDelete();
	 			},
				function(){
	 				console.log('cancel');
				}
			);
		};
  }
  
	//insert
	function validateInsert(){
		var isTitleInsertValid = false;
		var isContentInsertValid = false;

		var titleInsertValue = document.querySelector("#titleInsert").value;
		if( titleInsertValue.length > 0 ){
			isTitleInsertValid = true;
		}
		
		var contentInsertValue = document.querySelector("#contentInsert").value;
		if( contentInsertValue.length > 0 ){
			isContentInsertValid = true;
		}

		if(	isTitleInsertValid && isContentInsertValid ){
			return true;
		}else{
			return false;
		}
	}
	
	// update
	function validateUpdate(){
		var isTitleUpdateValid = false;
		var isContentUpdateValid = false;

		var titleUpdate = document.querySelector("#titleUpdate").value;
		var titleUpdateLength = titleUpdate.length;
		
		if( titleUpdateLength > 0 ){
			isTitleUpdateValid = true;
		}
		
		var contentUpdateValue = document.querySelector("#contentUpdate").value;
		var contentUpdateLength = contentUpdateValue.length;
		
		if( contentUpdateLength > 0 ){
			isContentUpdateValid = true;
		}

		if(	isTitleUpdateValid && isContentUpdateValid ){
			return true;
		}else{
			return false;
		}
	}
	
	async function boardInsert(){

		let title = document.querySelector("#titleInsert").value;
		let content = document.querySelector("#contentInsert").value;	
		
		let urlParams = new URLSearchParams({
			title: title,
			content: content,
	    });
		
		let fetchOptions = {
	        method: "POST",
	        body: urlParams,
	    }
		
		let url = '<%= contextPath%>/board/boardInsert';
		
		try{
			let response = await fetch(url, fetchOptions );
			let data = await response.json();
			if( data.result == "success" ){ // 백엔드 로그인 필터에서 session timeout 이 발생하면 내려주는 json 값
				alertify.success('글이 등록되었습니다.');
				boardList();
			}else{
				alertify.error('글 등록 과정에 문제가 있습니다.')
			}
		}catch( error ){
			console.error( error );
			alertify.error('글 등록 과정에 문제가 있습니다.')
		}
	}
	

	async function boardUpdate(){

		let boardId = document.querySelector("#boardUpdateModal").getAttribute("data-boardId");
		let title = document.querySelector("#titleUpdate").value;
		let content = document.querySelector("#contentUpdate").value;	
		
		let urlParams = new URLSearchParams({
			boardId: boardId,
			title: title,
			content: content,
	    });
		
		let fetchOptions = {
	        method: "POST",
	        body: urlParams,
	    }
		
		let url = '<%= contextPath%>/board/boardUpdate';
		
		try{
			let response = await fetch(url, fetchOptions );
			let data = await response.json();
			if( data.result == "success" ){
				alertify.success('글이 수정되었습니다.');
				boardList();
			}else{
				alertify.error('글 수정 과정에 문제가 있습니다.');
			}
		}catch( error ){
			console.error( error );
			alertify.error('글 수정 과정에 문제가 있습니다.');
		}
	}

	//detail
	async function boardDetail(boardId){

		var url = '<%= contextPath%>/board/boardDetail';
		var urlParams = '?boardId=' + boardId;

		try{
			let response = await fetch(url + urlParams);
			let data = await response.json();		
			console.log(data);
			makeDetailHtml(data);
		}catch( error ){
			console.error( error );
			alertify.error("글 조회 과정에 문제가 생겼습니다.");
		}
	}
	

	function makeDetailHtml(detail){
		console.log(detail);
		var boardId = detail.boardId;
		var userSeq = detail.userSeq;
		var userName = detail.userName;
		var title = detail.title;
		var content = detail.content;
		var regDt = detail.regDt;

		var regDtStr = makeDateStr(regDt.date.year, regDt.date.month, regDt.date.day, '.') + ' ' + makeTimeStr(regDt.time.hour, regDt.time.minute, regDt.time.second, ':');
		
		var readCount = detail.readCount;
		var sameUser = detail.sameUser;
		var fileList = detail.fileList;
		
		document.querySelector("#boardDetailModal").setAttribute("data-boardId", boardId);
		document.querySelector("#boardIdDetail").innerHTML = "#" + boardId;
		document.querySelector("#titleDetail").innerHTML = title;
		document.querySelector("#contentDetail").innerHTML = content;
		document.querySelector("#userNameDetail").innerHTML = userName;
		document.querySelector("#regDtDetail").innerHTML = regDtStr;
		document.querySelector("#readCountDetail").innerHTML = readCount;

		if( sameUser ){
			document.querySelector("#btnBoardUpdateForm").style.display = "inline-block";
			document.querySelector("#btnBoardDeleteConfirm").style.display = "inline-block";
		}else{
			document.querySelector("#btnBoardUpdateForm").style.display = "none";
			document.querySelector("#btnBoardDeleteConfirm").style.display = "none";
		}
		
		let modal = new bootstrap.Modal(document.querySelector("#boardDetailModal"));
		modal.show();
	}

	async function boardList(){
		let url = "<%= contextPath%>/board/boardList";
		let urlParams = "?limit=" + LIST_ROW_COUNT + "&offset=" + OFFSET + "&searchWord=" + SEARCH_WORD;
		
		try{
			let response = await fetch(url + urlParams);
			let data = await response.json();
			console.log( "boardList: "+ data );
			makeListHtml( data );
		}catch(error){
			console.error(error);
		}
	}
	
	function makeListHtml(list){
		let listHTML = ``;

		
		list.forEach( el => {
			let boardId = el.boardId;
			let userName = el.userName;
			let title = el.title;
			let content = el.content;
			let regDt = el.regDt;	// javascript of parsed from LocalDateTime
			console.log(regDt);
			let regDtStr = makeDateStr(regDt.date.year, regDt.date.month, regDt.date.day, '.');
			
			let readCount = el.readCount;		
			
			console.log("이름보여줘: " + userName);
			
			listHTML +=
				`<tr style="cursor:pointer" data-boardId=\${boardId}>
				<td>\${boardId}</td>
				<td>\${title}</td>
				<td>\${userName}</td>
					<td>\${regDtStr}</td>
					<td>\${readCount}</td></tr>`;
			
		} );
		
		document.querySelector("#boardTbody").innerHTML = listHTML;

		makeListHtmlEventHandler();
		
		//boardListTotalCnt();
	}
	

	function makeListHtmlEventHandler(){
		document.querySelectorAll("#boardTbody tr").forEach( el => {
			el.onclick = function(){
				var boardId = this.getAttribute("data-boardId");	
				boardDetail(boardId);
			}
		});
	}
	

	async function boardListTotalCnt(){
		let url = '<%=contextPath%>/board/boardListTotalCnt';
		let urlParams = '?searchWord=' + SEARCH_WORD;

		try{
			let response = await fetch(url + urlParams);
			let data = await response.json();
			console.log(data);
			TOTAL_LIST_ITEM_COUNT = data.totalCnt;
			makePaginationHtml(LIST_ROW_COUNT, PAGE_LINK_COUNT, CURRENT_PAGE_INDEX, TOTAL_LIST_ITEM_COUNT, "paginationWrapper" );
			
		}catch(error){
			console.log(error);
			alertify.error('글 전체 수 조회 과정에 문제가 생겼습니다.');
		}
	}
	

	//delete
	async function boardDelete(){
		
		var url = '<%= contextPath%>/board/boardDelete';
		var urlParams = '?boardId=' + document.querySelector("#boardDetailModal").getAttribute("data-boardId");

		try{
			let response = await fetch(url + urlParams);
			let data = await response.json();
			
			if(data.result == "success"){
				alertify.success("글이 삭제되었습니다.");
				boardList();
			}else{
				alertify.error("글 삭제 과정에 문제가 생겼습니다.");
			}
		}catch( error ){
			console.error( error );
			alertify.error("글 삭제 과정에 문제가 생겼습니다.");
		}	
	}
  
	// 날짜 관련 함수 
	
	function makeDateStr(year, month, day, type){
		//2010.05.05
		return year + type + ( (month < 10) ? '0' + month : month ) + type + ( (day < 10) ? '0' + day : day );
	}
	
	function makeTimeStr(hour, minute, second, type){
		//07:25:33
		return ( (hour < 10) ? '0' + hour : hour ) + type + ( (minute < 10) ? '0' + minute : minute ) + type + ( (second < 10) ? '0' + second : second );
	}
  </script>
  </body>
</html>
