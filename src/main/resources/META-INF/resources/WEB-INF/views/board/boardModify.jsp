<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/icon/favicon.ico">
  <title>게시판 수정페이지: IYF 영업관리시스템</title>

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">

  <!-- NiceAdmin: Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/bootstrap/css/bootstrap.min.css"
    rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/bootstrap-icons/bootstrap-icons.css"
    rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/boxicons/css/boxicons.min.css"
    rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/quill/quill.snow.css"
    rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/quill/quill.bubble.css"
    rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/remixicon/remixicon.css"
    rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/simple-datatables/style.css"
    rel="stylesheet">

  <!-- NiceAdmin: Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/css/style.css" rel="stylesheet">

  <!-- toast-grid -->
  <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />

  <!-- toastui-editor -->	
  <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
  
  <!-- jquery -->
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

  <!-- toast-grid -->
  <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
  
  <!-- toastui-editor -->
  <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

</head>

<body>

	<!-- ======= Header ======= -->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<!-- End Header -->
	
	<!-- ======= Sidebar ======= -->
	<jsp:include page="/WEB-INF/views/sidebar.jsp"></jsp:include>
	<!-- End Sidebar-->

	<main id="main" class="main" style="width: 80vw;">
        <!-- 글 유형 입력 -->
        <div class="mt-5 mb-3">
	        <div class="form-check form-check-inline col-sm-2">
	            <input class="form-check-input" type="radio" name="boardType" id="discussion" value="01" ${board.board_type == '01' ? 'checked' : ''}>
	            <label class="form-check-label" for="discussion">일반</label>
	        </div>
	        <div class="form-check form-check-inline col-sm-2">
	            <input class="form-check-input" type="radio" name="boardType" id="question" value="02" ${board.board_type == '02' ? 'checked' : ''}>
	            <label class="form-check-label" for="question">질문</label>
	        </div>
	        <div class="form-check form-check-inline col-sm-2">
	            <input class="form-check-input" type="radio" name="boardType" id="announcement" value="03" ${board.board_type == '03' ? 'checked' : ''}>
	            <label class="form-check-label" for="announcement">공지</label>
	        </div>
        </div>
            
        <!-- 제목 입력 -->
        <div class="mb-3">
            <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력해주세요" value='${board.board_title}'>
        </div>
		<div id="editor"></div>
		
	    <div class="row mt-5 mb-5">
			<div class="text-end">
				<button type="button" class="btn btn-primary" id="btnModify">수정</button>
				<button type="button" class="btn btn-secondary mx-3" id="btnCancle">취소</button>
			</div>
		</div>		
	</main><!-- End #main -->

	
	<!-- ======= Footer ======= -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>


  <script>
  	let editor;
  	let boardId;
    $(document).ready(function() {
        boardId = '${board.board_id}';
        
    	editor = new toastui.Editor({
            el: document.querySelector('#editor'),
            toolbarItems: [
                ['heading', 'bold', 'italic', 'strike'],
                ['ul', 'ol'],
            ],
            width: '500px',
            height: '500px',
            initialEditType: 'wysiwyg', // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
            initialValue: '${board.board_content}',
            previewStyle: 'tab', // 마크다운 프리뷰 스타일 (tab || vertical)
            plugins: []
        });
    	
    	// 수정버튼 이벤트
    	$('#btnModify').click(function() {
    		console.log("btnRegister ::: " + editor.getHTML());
    		if (!$('input[name=boardType]:checked').val()) {
    			alert("글유형을 선택해주세요.");
    			return;
    		} else if (!$('#boardTitle').val()) {
    			alert("제목을 기입해주세요.");
    			return;
    		} else if (!$('<div>').html(editor.getHTML()).text()) {
    			alert("본문 내용을 기입해주세요.");
    			return;
    		}
    		
    		if (!confirm('게시글을 수정하시겠습니까?')) {
    			return;
    		}
    		const board = {
   				board_type: $('input[name=boardType]:checked').val(), // 01 일반 02 질문 03 공지
   				board_title: $('#boardTitle').val(),
   				board_content: editor.getHTML(),
   				del: 'N',
   			};
    		
   			$.ajax({
   			    type: 'PUT',
   			    url: '${pageContext.request.contextPath}/board.ajax/' + boardId,
   			    data: JSON.stringify(board),
   			    contentType: 'application/json',
   			    success: function () {
   			        alert('게시글이 수정되었습니다.');
   			     	window.location.href = '${pageContext.request.contextPath}/board/' + boardId;
   			    },
   			    error: function () {
   			    	alert('내부 서버 오류입니다.');
   			     	window.location.href = '${pageContext.request.contextPath}/board/' + boardId;
   			    }
   			});
    	});
    	
    	// 취소버튼 이벤트
    	$('#btnCancle').click(function() {
    		if (!confirm('작성 중인 게시글 수정을 취소하시겠습니까?')) {
    			return;
    		}
    		window.location.href = '${pageContext.request.contextPath}/board/' + boardId;
    	});
    	
   		// 사이드바 접을 때 그리드 리사이징
        $('i.toggle-sidebar-btn').click(function() {
        	if ($('body').attr('class') === 'toggle-sidebar') {
        		$('#main').attr('style', 'width: 93vw;');
        		$('#footer').attr('style', 'width: 93vw;');
        	} else {
        		$('#main').attr('style', 'width: 80vw;');
        		$('#footer').attr('style', 'width: 80vw;');
        	}
        	
        });
    });



  </script>


  <!-- Vendor JS Files -->
  <script
    src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script
    src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/chart.js/chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/echarts/echarts.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/quill/quill.min.js"></script>
  <script
    src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/tinymce/tinymce.min.js"></script>
  <script
    src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/php-email-form/validate.js"></script>

  <!-- NiceAdmin: Template Main JS File -->
  <script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/js/main.js"></script>

</body>

</html>