<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/icon/favicon.ico">
  <title>게시판 목록페이지: IYF 영업관리시스템</title>

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
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">게시글목록</h5>
					<div class="btn-group mt-3 mb-3" role="group" aria-label="Basic outlined example">
		                <button type="button" class="btn btn-${board_type eq null or board_type == '' ? '' : 'outline-'}secondary btnBoardType" data-board-type="">전체글</button>
		                <button type="button" class="btn btn-${board_type == '01' ? '' : 'outline-'}secondary btnBoardType" data-board-type="01">일반</button>
		                <button type="button" class="btn btn-${board_type == '02' ? '' : 'outline-'}secondary btnBoardType" data-board-type="02">질문</button>
		                <button type="button" class="btn btn-${board_type == '03' ? '' : 'outline-'}primary btnBoardType" data-board-type="03">공지</button>
	              	</div>
					<p>
						<select name="rowAmountPerPage" id="rowAmountPerPage">
							<option value="10">10개</option>
							<option value="20">20개</option>
							<option value="50">50개</option>
							<option value="100">100개</option>
						</select>
					</p>
					<select name="scope" id="scope">
						<option value="TC">제목 + 본문</option>
						<option value="T">제목</option>
						<option value="C">본문</option>
						<option value="U">작성자</option>
					</select>
					<input type="text" name="keyword" id="keyword" placeholder="키워드 입력">
					<button type="button" id="btnKeywordSearch">검색</button>
					<table class="table mt-3">
						<colgroup>
							<col style="width: 5%;"/>
							<col style="width: 5%;"/>
							<col style="width: auto;"/>
							<col style="width: 10%;"/>
							<col style="width: 10%;"/>
						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="text-center">번호</th>
								<th scope="col" class="text-center">유형</th>
								<th scope="col" class="text-center">제목</th>
								<th scope="col" class="text-center">작성자</th>
								<th scope="col" class="text-center">작성일</th>
							</tr>
						</thead>
	
						<tbody id="boardTbody">
							<c:forEach var="board" varStatus="boardStatus" items="${boardList}">
	
								<tr data-id="${board.board_id}">
									<td class="boardId text-center">
										<c:out value="${board.board_id}" />
									</td>
									<td class="boardType text-center">
										<c:choose>
				                    		<c:when test="${board.board_type == '01'}"><span class="badge rounded-pill bg-secondary">일반</span></c:when>
				                    		<c:when test="${board.board_type == '02'}"><span class="badge rounded-pill bg-secondary">질문</span></c:when>
				                    		<c:when test="${board.board_type == '03'}"><span class="badge rounded-pill bg-primary">공지</span></c:when>
				                    	</c:choose>
									</td>
									<td class="boardTitle">
										<span class="title"><c:out value="${board.board_title}" /></span>
										
										<c:if test="${board.reply_count != 0}">
    										<span class="reply-count text-muted">[${board.reply_count}]</span>
										</c:if>
									</td>
									<td class="systemCreator text-center">
										<c:out value="${board.system_creator}" />
									</td>
									<td class="systemCreatedAt text-center" style="font-size: 14px;">
										<c:out value="${board.system_created_at.substring(0, 10) == today ? board.system_created_at.substring(10, 16) : board.system_created_at.substring(0, 10)}" />
									</td>
								</tr>
	
							</c:forEach>	
						</tbody>	
					</table>
				</div>
			</div>
	
	
	
		</div>
	</div>
	<nav aria-label="Page navigation example">
	  <ul class="pagination" style="justify-content:center;">
	    <c:if test="${pagingCreator.prev}">
			<li class="page-item">
				<a class="page-link" href="?pageNum=1&rowAmountPerPage=${param.rowAmountPerPage ne null ? param.rowAmountPerPage : 10}${param.scope eq null ? '' : '&scope='.concat(param.scope)}${param.keyword eq null ? '' : '&keyword='.concat(param.keyword)}${board_type eq null ? '' : '&board_type='.concat(board_type)}">처음</a>
			</li>
		</c:if>
		<c:if test="${pagingCreator.prev}">
			<li class="page-item">
				<a class="page-link" href="?pageNum=${pagingCreator.startPagingNum - 1}&rowAmountPerPage=${param.rowAmountPerPage ne null ? param.rowAmountPerPage : 10}${param.scope eq null ? '' : '&scope='.concat(param.scope)}${param.keyword eq null ? '' : '&keyword='.concat(param.keyword)}${board_type eq null ? '' : '&board_type='.concat(board_type)}">이전</a>
			</li>
		</c:if>
		
		<c:forEach var="pageNum" begin="${pagingCreator.startPagingNum }" end="${pagingCreator.endPagingNum }">
			<li class="page-item">
				<a class="page-link" href="?pageNum=${pageNum}&rowAmountPerPage=${param.rowAmountPerPage ne null ? param.rowAmountPerPage : 10}${param.scope eq null ? '' : '&scope='.concat(param.scope)}${param.keyword eq null ? '' : '&keyword='.concat(param.keyword)}${board_type eq null ? '' : '&board_type='.concat(board_type)}">${pageNum}</a>
			</li>
		</c:forEach>
		
		<c:if test="${pagingCreator.next}">
			<li class="page-item">
				<a class="page-link" href="?pageNum=${pagingCreator.endPagingNum + 1}&rowAmountPerPage=${param.rowAmountPerPage ne null ? param.rowAmountPerPage : 10}${param.scope eq null ? '' : '&scope='.concat(param.scope)}${param.keyword eq null ? '' : '&keyword='.concat(param.keyword)}${board_type eq null ? '' : '&board_type='.concat(board_type)}">다음</a>
			</li>
		</c:if>
		
		<c:if test="${pagingCreator.next}">
			<li class="page-item">
				<a class="page-link" href="?pageNum=${pagingCreator.lastPageNum}&rowAmountPerPage=${param.rowAmountPerPage ne null ? param.rowAmountPerPage : 10}${param.scope eq null ? '' : '&scope='.concat(param.scope)}${param.keyword eq null ? '' : '&keyword='.concat(param.keyword)}${board_type eq null ? '' : '&board_type='.concat(board_type)}">끝</a>
			</li>
		</c:if>
	  </ul>
	</nav>
	
	<div class="row">
		<div class="col-3">
			<button type="button" class="btn btn-secondary" id="btnBoardList">전체글</button>
		</div>
		<div class="col-9 text-end">
			<button type="button" class="btn btn-primary" id="btnBoardRegister">글쓰기</button>
		</div>
	</div>
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>


  <script>
  const searchParams = new URLSearchParams(window.location.search);
  
  function retainSelectedParams() {

		const rowAmountPerPage = searchParams.get("rowAmountPerPage");
		const scope = searchParams.get("scope");
		const keyword = searchParams.get("keyword");
		
		if (rowAmountPerPage) {
			$("#rowAmountPerPage").val(rowAmountPerPage);
		} else {
			$("#rowAmountPerPage").val(10);
		}

		if (scope) {
			$("#scope").val(scope);
			
		} else {
			$("#scope").val("TC");
		}

		if (keyword) {
			$("#keyword").val(keyword);
		} else {
			$("#keyword").val("");
		}

	}
  
    $(document).ready(function () {
		retainSelectedParams()
		
		$("a.page-link").filter(function() {
			const pageNum = new URLSearchParams(window.location.search).get("pageNum");
			
			if (!pageNum) {
				return $(this).text() == 1
			} else {
				return $(this).text() == pageNum;
			}
		}).parent("li").addClass("active");
		
		
		$("#boardTbody tr").hover(function() {
			$(this).find('.title').css({ "text-decoration": "underline" });
			
			$(this).css({ "background-color": "lightgray" })
				   .click(function() {
					   window.location.href = '${pageContext.request.contextPath}/board/' + $(this).attr('data-id')
				   });
			
		}, function() {
			$(this).find('.title').css({ "text-decoration-line" : "none" });
			
			$(this).css({ "background-color": "" });
		});


		$("#rowAmountPerPage").change(function() {
			window.location.href = "?pageNum=1&rowAmountPerPage=" + $(this).val() + "&scope=" +$("#scope").val() + "&keyword=" + $("#keyword").val() + '&board_type=${board_type}'
		})


		// 키워드 엔터입력 이벤트
		$('#keyword').keydown(function(e) {
			
	        if (e.keyCode === 13) { // Enter 키의 keyCode는 13입니다.
	            $("#btnKeywordSearch").trigger('click');
	        }
	    });
		
		// 키워드 검색 클릭 이벤트
		$("#btnKeywordSearch").click(function() {
			window.location.href = "?pageNum=1&rowAmountPerPage=" + $("#rowAmountPerPage").val() + "&scope=" +$("#scope").val() + "&keyword=" + $("#keyword").val() + '&board_type=${board_type}'
		})
		
		// 글유형 클릭 이벤트
		$('.btnBoardType').click(function() {
			if (!$(this).attr('data-board-type')) {
				window.location.href = '${pageContext.request.contextPath}/board/list';
			} else {
				window.location.href = '${pageContext.request.contextPath}/board/list?board_type=' + $(this).attr('data-board-type');
			}
		});
		
		// 목록 버튼 클릭 이벤트
		$('#btnBoardList').click(function() {
			window.location.href = '${pageContext.request.contextPath}/board/list';
		})
		
		// 글쓰기 버튼 클릭 이벤트
		$('#btnBoardRegister').click(function() {
			window.location.href = '${pageContext.request.contextPath}/board/register';
		})
		
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