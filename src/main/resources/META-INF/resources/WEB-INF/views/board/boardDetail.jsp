<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/icon/favicon.ico">
  <title>게시판 상세페이지: IYF 영업관리시스템</title>

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
	<div class="container mt-4">
		<c:choose>
			<c:when test="${empty board}">
				<div class="alert alert-danger" role="alert">
				    해당 게시물은 존재하지 않습니다
				</div>
			</c:when>
			<c:otherwise>
				<div class="card">
					<div class="card-header">
		                <div class="row">
		                    <div class="col-9">
		                    	<c:choose>
		                    		<c:when test="${board.board_type == '01'}"><span class="badge rounded-pill bg-secondary">일반</span></c:when>
		                    		<c:when test="${board.board_type == '02'}"><span class="badge rounded-pill bg-secondary">질문</span></c:when>
		                    		<c:when test="${board.board_type == '03'}"><span class="badge rounded-pill bg-primary">공지</span></c:when>
		                    	</c:choose>
		                    	<span>|</span>
		                        <span class="card-title">${board.board_title}</span>
		                    </div>
		                    <div class="col-3 text-end">
		                    	<strong class="text-body">${board.system_modifier}</strong>
		                    	<span>|</span>
		                        <span class="text-body">${board.system_modified_at}</span>
		                        <c:choose>
		                        	<c:when test="${board.system_modified_at > board.system_created_at}">
		                        		<span>(수정됨)</span>
		                        	</c:when>
		                        </c:choose>
		                    	
		                    </div>
		                </div>
		            </div>
				    <div class="card-body">
				        <p class="card-text">
				            ${board.board_content}
				        </p>
				    </div>
				</div>
				
				<div class="container mt-4">
					<c:choose>
						<c:when test="${empty boardReplyList}">
							<!-- 해당 게시물의 댓글은 존재하지 않습니다 -->
							<ul class="list-group">
							</ul>
						</c:when>
						<c:otherwise>
						    <ul class="list-group">
								<c:forEach var="boardReply" items="${boardReplyList}">
							        <!-- 댓글 아이템 -->
							        <li class="list-group-item" data-reply-id="${boardReply.reply_id}" data-ref-reply-id="${boardReply.ref_reply_id}">
						            	<c:choose>
							            	<c:when test="${boardReply.ref_reply_id eq null}">
							            		<div class="row p-2" data-path-lenght="${boardReply.recursive_path_length}">
							            			<c:choose>
							            				<c:when test="${boardReply.del == 'Y'}">
							            					<div class="col-12" data-del="Y">삭제된 댓글입니다</div>
							            				</c:when>
							            				<c:otherwise>
									            			<div class="col-1">
									            				<c:choose>
									            					<c:when test="${boardReply.anonymous_name eq null or boardReply.anonymous_name == ''}">
																        <strong class="text-body">${boardReply.system_creator}</strong>
									            					</c:when>
									            					<c:otherwise>
									            						<strong class="text-body">${boardReply.system_creator}<br><span class="text-muted">(익명)</span></strong>
									            					</c:otherwise>
									            				</c:choose>
									            			</div>
												            <div class="col-9">
												            	${boardReply.reply_content}
												            </div>
									            			<div class="col-2 text-end">
														        <span class="me-1">${boardReply.system_created_at}</span>
														        <span onClick="boardReplyDelete('${boardReply.reply_id}')"><i class="bi bi-x-square-fill text-muted"></i></span>
									            			</div>
				                                            <div class="row mt-2" id="row-reply-delete-password-${boardReply.reply_id}" style="display: none;">
				                                            	<div class="col-8">
				                                            	</div>
				                                            	<div class="col-4 text-end">
													                <input type="password" class="reply-delete-password" id="reply-delete-password-${boardReply.reply_id}" placeholder="비밀번호">
													                <button type="button" class="reply-delete-confirm" onClick="boardReplyDeleteConfirm('${boardReply.reply_id}')">확인</button>
													                <button type="button" class="reply-delete-cancle" onClick="boardReplyDeleteCancle('${boardReply.reply_id}')">취소</button>
				                                            	</div>
				                                            </div>
							            				</c:otherwise>
							            			</c:choose>
							            		</div>
							            	</c:when>
							            	<c:otherwise>
							            		<div class="row p-1" data-path-lenght="${boardReply.recursive_path_length}">
			        								<div class="col" style="max-width: ${(boardReply.recursive_path_length - 1) * 25}px;"></div>
			        								<div class="col">
									            		<div class="p-3 bg-light border">
										            		<div class="row">
										            			<c:choose>
										            				<c:when test="${boardReply.del == 'Y'}">
										            					<div class="col-12" data-del="Y">삭제된 댓글입니다</div>
										            				</c:when>
										            				<c:otherwise>
												            			<div class="col-1">
	        									            				<c:choose>
												            					<c:when test="${boardReply.anonymous_name eq null or boardReply.anonymous_name == ''}">
																			        <strong class="text-body">${boardReply.system_creator}</strong>
												            					</c:when>
												            					<c:otherwise>
												            						<strong class="text-body">${boardReply.system_creator}<br><span class="text-muted">(익명)</span></strong>
												            					</c:otherwise>
												            				</c:choose>
												            			</div>
												            			<div class="col" style="max-width: 10px;">
														                	<i class="bi bi-arrow-return-right"></i>
												            			</div>
												            			<div class="col">
														                	${boardReply.reply_content}
												            			</div>
												            			<div class="col-3 text-end">
																	        <span class="me-1">${boardReply.system_created_at}</span>
																	        <span onClick="boardReplyDelete('${boardReply.reply_id}')"><i class="bi bi-x-square-fill text-muted"></i></span>
												            			</div>
							                                            <div class="row mt-2" id="row-reply-delete-password-${boardReply.reply_id}" style="display: none;">
							                                            	<div class="col-8">
							                                            	</div>
							                                            	<div class="col-4 text-end">
																                <input type="password" class="reply-delete-password" id="reply-delete-password-${boardReply.reply_id}" placeholder="비밀번호">
																                <button type="button" class="reply-delete-confirm" onClick="boardReplyDeleteConfirm('${boardReply.reply_id}')">확인</button>
																                <button type="button" class="reply-delete-cancle" onClick="boardReplyDeleteCancle('${boardReply.reply_id}')">취소</button>
							                                            	</div>
							                                            </div>
												            			
										            				</c:otherwise>
										            			</c:choose>
										            		</div>
				                       					</div>
			        								
			        								</div>
		                       					</div>
							            	</c:otherwise>
						            	</c:choose>
							        </li>
								
								</c:forEach>
						    </ul>
						</c:otherwise>
					</c:choose>
				
				
				    <!-- 댓글 입력 폼 -->
				    <div class="mt-4">
			            <div class="mb-3">
			            		
			            	<div id="anonyout-check" class="form-check text-end mb-3">
						        <label class="form-check-label" for="anonymous">익명으로 댓글쓰기</label>
						        <input type="checkbox" id="anonymous" name="anonymous">
			            	</div>
			                <div id="anonymous-form" style="display: none">
								
								<div class="mb-3">
								    <label for="replyAnonymousCreator" class="form-label">익명 이름</label>
								    <input type="text" class="form-control" id="replyAnonymousCreator" name="replyAnonymousCreator">
								</div>
								
								<div class="mb-3">
								    <label for="replyPassword" class="form-label">비밀번호</label>
								    <input type="password" class="form-control" id="replyPassword" name="replyPassword">
								</div>
			                </div>
							
							<div id="user-form">
				                <security:authorize access="isAuthenticated()">
					          		<security:authentication var="principal" property="principal"/>
				                	<label for="replyCreator" class="form-label">작성자</label>
					                <input type="text" class="form-control" id="replyCreator" name="replyCreator" value="${principal.username}" readonly>
					          	</security:authorize>
							</div>
			            </div>
			            <div class="mb-3">
			                <label for="replyContent" class="form-label">댓글 내용</label>
			                <textarea class="form-control" id="replyContent" name="replyContent" rows="4"></textarea>
			            </div>
			            <div class="row">
			            	<div class="text-end">
				            	<button type="button" class="btn btn-primary" id="btnBoardReplyRegister">등록</button>
			            	</div>
			            </div>
				    </div>
				    
					<div class="row mt-5">
						<div class="col-3">
							<button type="button" class="btn btn-secondary" id="btnBoardList">전체글</button>
						</div>
						<div class="col-9 text-end">
							<security:authorize access="hasAuthority('통합 관리자')">
								<c:set var="isAdmin" value="true"/>
							</security:authorize>
							<security:authentication var="principal" property="principal"/>
							<c:choose>
								<c:when test="${principal.username == board.system_creator or isAdmin}">
									<button type="button" class="btn btn-secondary" id="btnBoardModify">수정</button>
									<button type="button" class="btn btn-secondary" id="btnBoardRemove">삭제</button>
									<button type="button" class="btn btn-primary" id="btnBoardRegister">글쓰기</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-primary" id="btnBoardRegister">글쓰기</button>
								</c:otherwise>
							</c:choose>
						</div>
					</div>	
				</div>
								
			</c:otherwise>
		</c:choose>
	</div>
	
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>


  <script>
	const boardId = '${board.board_id}';
	
	// 댓글 등록 및 삭제 이벤트 후 => 댓글목록 리프레시
   	function refreshBoardReplyList() {
   		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath}/boardReply.ajax/board_id/' + boardId,
			success: function(boardReplyList) {
				$('.list-group').html('');
				
				let theHtml = '';
				
				boardReplyList.forEach(function(boardReply) {
					let innerHTML = '';
					innerHTML += '<li class="list-group-item" data-reply-id="' + boardReply.reply_id + '" data-ref-reply-id="' + boardReply.ref_reply_id + '">';
		    		if (!boardReply.ref_reply_id) {
		                innerHTML += '<div class="row p-2" data-path-lenght="' + boardReply.recursive_path_length + '">';
		                if (boardReply.del === 'Y') {
		                	innerHTML += '<div class="col-12" data-del="Y">삭제된 댓글입니다</div>'
		                } else {
		                	if (!boardReply.anonymous_name) {
		                	innerHTML += '<div class="col-1"><strong class="text-body">' + boardReply.system_creator + '</strong></div>';
		                	} else {
	                		innerHTML += '<div class="col-1"><strong class="text-body">' + boardReply.system_creator + '</strong><br><span class="text-muted">(익명)</span></div>';
		                	}
			                innerHTML += '<div class="col-9">' + boardReply.reply_content + '</div>';
			                innerHTML += '<div class="col-2 text-end">';
			                innerHTML += '	<span class="me-1">' + boardReply.system_created_at + '</span>';
			                innerHTML += '	<span onClick="boardReplyDelete(\'' + boardReply.reply_id +'\')"><i class="bi bi-x-square-fill text-muted"></i></span>';
			                innerHTML += '</div>';
			                innerHTML += '<div class="row mt-2" id="row-reply-delete-password-' + boardReply.reply_id + '" style="display: none;">';
			                innerHTML += '	<div class="col-8">';
			                innerHTML += '	</div>';
			                innerHTML += '	<div class="col-4 text-end">';
			                innerHTML += '		<input type="password" class="reply-delete-password" id="reply-delete-password-' + boardReply.reply_id + '" placeholder="비밀번호">';
			                innerHTML += '		<button type="button" class="reply-delete-confirm" onClick="boardReplyDeleteConfirm(\'' + boardReply.reply_id + '\')">확인</button>';
			                innerHTML += '		<button type="button" class="reply-delete-cancle" onClick="boardReplyDeleteCancle(\'' + boardReply.reply_id + '\')">취소</button>';
			                innerHTML += '	</div>';
			                innerHTML += '</div>';
		                }
		                innerHTML += '</div>';
		            } else {
		                innerHTML += '<div class="row p-1" data-path-lenght="' + boardReply.recursive_path_length + '">';
		                innerHTML += '	<div class="col" style="max-width: ' + (boardReply.recursive_path_length - 1) * 25 + 'px;"></div>';
		                innerHTML += '	<div class="col">';
		                innerHTML += '		<div class="p-3 bg-light border">';
		                innerHTML += '			<div class="row">';
		                if (boardReply.del === 'Y') {
		                	innerHTML += '			<div class="col-12" data-del="Y">삭제된 댓글입니다</div>'
		                } else {
		                	if (!boardReply.anonymous_name) {
			                	innerHTML += '		<div class="col-1"><strong class="text-body">' + boardReply.system_creator + '</strong></div>';
		                	} else {
		                		innerHTML += '		<div class="col-1"><strong class="text-body">' + boardReply.system_creator + '</strong><br><span class="text-muted">(익명)</span></div>';
		                	}
			                innerHTML += '			<div class="col" style="max-width: 10px;"><i class="bi bi-arrow-return-right"></i></div>';
			                innerHTML += '			<div class="col">' + boardReply.reply_content + '</div>';
			                innerHTML += '			<div class="col-3 text-end">';
			                innerHTML += '				<span class="me-1">' + boardReply.system_created_at + '</span>';
			                innerHTML += '				<span onClick="boardReplyDelete(\'' + boardReply.reply_id +'\')"><i class="bi bi-x-square-fill text-muted"></i></span>';
			                innerHTML += '			</div>';
			                innerHTML += '			<div class="row mt-2" id="row-reply-delete-password-' + boardReply.reply_id + '" style="display: none;">';
			                innerHTML += '				<div class="col-8">';
			                innerHTML += '				</div>';
			                innerHTML += '				<div class="col-4 text-end">';
			                innerHTML += '					<input type="password" class="reply-delete-password" id="reply-delete-password-' + boardReply.reply_id + '" placeholder="비밀번호">';
			                innerHTML += '					<button type="button" class="reply-delete-confirm" onClick="boardReplyDeleteConfirm(\'' + boardReply.reply_id + '\')">확인</button>';
			                innerHTML += '					<button type="button" class="reply-delete-cancle" onClick="boardReplyDeleteCancle(\'' + boardReply.reply_id + '\')">취소</button>';
			                innerHTML += '				</div>';
			                innerHTML += '			</div>';
		                }
		                innerHTML += '			</div>';
		                innerHTML += '		</div>';
		                innerHTML += '	</div>';
		                innerHTML += '</div>';
		            }
		    		innerHTML += '</li>';
		    		theHtml += innerHTML;
					
				});
				
				$('.list-group').html(theHtml);
			}
		});
   	}
   	
 	// 댓글 삭제 버튼 클릭 이벤트 => 댓글 삭제 비밀번호 영역 전개
   	function boardReplyDelete(replyId) {
   		$('#row-reply-delete-password-' + replyId).show();

   	}
   	
 	// 댓글 삭제 확인 클릭 이벤트
   	function boardReplyDeleteConfirm(replyId) {
   		
   		let isError = false;
   		let isDelete = false;
 		
   		
   		let password = $('#reply-delete-password-' + replyId).val();
   		
   		if (!password) {
   			alert('비밀번호를 입력해주세요.')
			return;
   		}
   		
   		
		$.ajax({
		    type: 'GET',
		    url: '${pageContext.request.contextPath}/boardReply.ajax/' + replyId + '/password/validate?password=' + password,
		    async: false,
		    contentType: 'application/json',
		    success: function (response) {
		   		if (response.valid === '0') {
		   			isDelete = false;
					alert('비밀번호가 틀립니다.')
				} else {
			    	isDelete = true;
					
				}
		   		
		    },
		    error: function () {
		    	isError = true;
		    	alert('내부 서버 오류입니다.');
		    }
		});
   		
   		let boardReply = {
   				
   		};
   		
		if (isError) {
			return;
		}
		
		if (isDelete) {
	   		if (!confirm('정말로 댓글을 삭제하시겠습니까?')) {
	   			return;
	   		}
	   		
			$.ajax({
			    type: 'DELETE',
			    url: '${pageContext.request.contextPath}/boardReply.ajax/' + replyId,
			    data: JSON.stringify(boardReply),
			    async: false,
			    contentType: 'application/json',
			    success: function () {
			        alert('댓글이 삭제되었습니다.');
			     	refreshBoardReplyList();
			    },
			    error: function () {
			    	alert('내부 서버 오류입니다.');
			    	refreshBoardReplyList();
			    }
			});
		}
   	}
   	
 	// 댓글 삭제 취소 클릭 이벤트
   	function boardReplyDeleteCancle(replyId) {
   		$('#row-reply-delete-password-' + replyId).hide();
   	}
   	
   	
    $(document).ready(function () {
    	<c:choose>
			<c:when test="${empty board}">
				// 없는 게시글일 때 3초뒤 게시글 목록으로 리다이렉트
				setTimeout(function() {
					window.location.href = '${pageContext.request.contextPath}/board/list';
				}, 3000);
			</c:when>
		</c:choose>
    	
    	// 댓글: 영역 클릭이벤트 => 대댓글 입력 영역 전개
    	$(document).on('click', '.list-group-item:not(#reply2)', function(e) {
    		let theReplyId = $('#reply2').attr('data-reply-id');
    		
    		// 댓글 삭제 버튼 클릭시 => 대댓글 입력 영역 전개 하지않음
    		// 댓글 삭제 비밀번호 확인버튼 클릭시 => 대댓글 입력 영역 전개 하지않음
    		// 댓글 삭제 비밀번호 취소버튼 클릭시 => 대댓글 입력 영역 전개 하지않음
    		// 삭제된 댓글 영역 클릭시 => 대댓글 입력 영역 전개 하지않음
    		if ($(e.target).is('.bi-x-square-fill') ||
    				$(e.target).is('.reply-delete-confirm') ||
    				$(e.target).is('.reply-delete-cancle') ||
    				$('#row-reply-delete-password-' + $(this).attr('data-reply-id')).css('display') === 'flex' ||
   					$(this).find('[data-del]').attr('data-del') === 'Y') {
    			return;
    		}
    		
    		
    		// 기존 대댓글 입력 영역 제거
    		$('#reply2').remove();
    		
   			// 대댓글 입력 영역 전개
   			// 연속 클릭시 ::: 전개 -> 제거 / 제거 -> 전개 
   			if ($(this).attr('data-reply-id') !== theReplyId) {
   				
	    		let pathLength = $(this).find('[data-path-lenght]').attr('data-path-lenght')
	    		
	    		innerHtml = '';
				innerHtml += '<li id="reply2" class="mt-1 list-group-item" data-reply-id=' + $(this).attr('data-reply-id')  + '>';
	    		innerHtml += '<!-- 대댓글 입력 폼 -->';
				innerHtml += '    <div class="row">';
				innerHtml += '        <div class="col" style="max-width: '+ (pathLength * 25) + 'px"></div>';
				innerHtml += '        <div class="col">';
				innerHtml += '            <div class="mb-3">';
				innerHtml += '                <div id="anonyout-check" class="form-check text-end mb-3">';
				innerHtml += '                    <label class="form-check-label" for="anonymous2">익명으로 댓글쓰기</label>';
				innerHtml += '                    <input type="checkbox" id="anonymous2" name="anonymous2">';
				innerHtml += '                </div>';
				innerHtml += '                <div id="anonymous-form2" style="display: none">';
				innerHtml += '                    <div class="mb-3">';
				innerHtml += '                        <label for="replyAnonymousCreator2" class="form-label">익명 이름</label>';
				innerHtml += '                        <input type="text" class="form-control" id="replyAnonymousCreator2" name="replyAnonymousCreator2">';
				innerHtml += '                    </div>';
				innerHtml += '                    <div class="mb-3">';
				innerHtml += '                        <label for="replyPassword2" class="form-label">비밀번호</label>';
				innerHtml += '                        <input type="password" class="form-control" id="replyPassword2" name="replyPassword2">';
				innerHtml += '                    </div>';
				innerHtml += '                </div>';
				innerHtml += '                <div id="user-form2">';
				innerHtml += '                    <security:authorize access="isAuthenticated()">';
				innerHtml += '                        <security:authentication var="principal" property="principal"/>';
				innerHtml += '                        <label for="replyCreator2" class="form-label">작성자</label>';
				innerHtml += '                        <input type="text" class="form-control" id="replyCreator2" name="replyCreator2" value="${principal.username}" readonly>';
				innerHtml += '                    </security:authorize>';
				innerHtml += '                </div>';
				innerHtml += '            </div>';
				innerHtml += '            <div class="mb-3">';
				innerHtml += '                <label for="replyContent2" class="form-label">댓글 내용</label>';
				innerHtml += '                <textarea class="form-control" id="replyContent2" name="replyContent2" rows="4"></textarea>';
				innerHtml += '            </div>';
				innerHtml += '        </div>';
				innerHtml += '    </div>';
				innerHtml += '    <div class="row">';
				innerHtml += '        <div class="text-end">';
				innerHtml += '            <button type="button" class="btn btn-primary" id="btnBoardReplyRegister2">등록</button>';
				innerHtml += '        </div>';
				innerHtml += '    </div>';
				innerHtml += '</li>';


				$(this).after(innerHtml);
    		}
    	})
    	
    	// 댓글: 등록 클릭이벤트
    	$('#btnBoardReplyRegister').click(function() {
    		let boardReply;
    		
    		if (!$('#replyContent').val().trim()) {
    			alert('댓글 내용을 입력해주세요.')
    			return;
    		}
    		
    		if ($('#anonymous').prop('checked')) {
    			boardReply = {
   					anonymous: "1",
   					board_id: boardId,
   					anonymous_name: $('#replyAnonymousCreator').val(),
   					anonymous_password: $('#replyPassword').val(),
   					reply_content: $('#replyContent').val().replaceAll('\n', ' '),
    			};
    		} else {
    			boardReply = {
   					anonymous: "0",
   					board_id: boardId,
   					reply_content: $('#replyContent').val().replaceAll('\n', ' '), 
       			};
    		}
    		
    		$.ajax({
   			    type: 'POST',
   			    url: '${pageContext.request.contextPath}/boardReply.ajax',
   			    data: JSON.stringify(boardReply),
   			    contentType: 'application/json',
   			    success: function () {
   			        alert('댓글이 등록되었습니다.');
   			     	$('#replyAnonymousCreator').val('');
   			     	$('#replyPassword').val('');
   			     	$('#replyContent').val('');
   			     	refreshBoardReplyList();
   			    },
   			    error: function () {
   			    	alert('내부 서버 오류입니다.');
   			    	$('#replyAnonymousCreator').val('');
   			     	$('#replyPassword').val('');
   			     	$('#replyContent').val('');
   			    	refreshBoardReplyList();
   			    }
   			});
    		
    	})
    	
    	// 대댓글: 등록 클릭이벤트
    	$(document).on('click', '#btnBoardReplyRegister2', function() {
    		let boardReply;
    		
    		if (!$('#replyContent2').val().trim()) {
    			alert('댓글 내용을 입력해주세요.')
    			return;
    		}
    		
    		if ($('#anonymous2').prop('checked')) {
    			boardReply = {
   					anonymous: "1",
   					ref_reply: "1",
   					ref_reply_id: $('#reply2').attr('data-reply-id'),
   					board_id: boardId,
   					anonymous_name: $('#replyAnonymousCreator2').val(),
   					anonymous_password: $('#replyPassword2').val(),
   					reply_content: $('#replyContent2').val().replaceAll('\n', ' '),
    			};
    		} else {
    			boardReply = {
   					anonymous: "0",
   					ref_reply: "1",
   					ref_reply_id: $('#reply2').attr('data-reply-id'),
   					board_id: boardId,
   					reply_content: $('#replyContent2').val().replaceAll('\n', ' '), 
       			};
    		}
    		
    		$.ajax({
   			    type: 'POST',
   			    url: '${pageContext.request.contextPath}/boardReply.ajax',
   			    data: JSON.stringify(boardReply),
   			    contentType: 'application/json',
   			    success: function () {
   			        alert('댓글이 등록되었습니다.');
   			     	$('#replyAnonymousCreator2').val('');
   			     	$('#replyPassword2').val('');
   			     	$('#replyContent2').val('');
   			     	refreshBoardReplyList();
   			    },
   			    error: function () {
   			    	alert('내부 서버 오류입니다.');
   			    	$('#replyAnonymousCreator2').val('');
   			     	$('#replyPassword2').val('');
   			     	$('#replyContent2').val('');
   			    	refreshBoardReplyList();
   			    }
   			});
    		
    	})
    	
        // 댓글: 익명으로 댓글쓰기 클릭이벤트
        $("#anonymous").change(function() {

            if ($(this).is(":checked")) {
            	$("#anonymous-form").show();
            	$("#user-form").hide();
            } else {
            	$("#anonymous-form").hide();
            	$("#user-form").show();
            }
        });
    	
     	// 대댓글: 익명으로 댓글쓰기 클릭이벤트
        $(document).on('change', '#anonymous2', function() {

            if ($(this).is(":checked")) {
            	$("#anonymous-form2").show();
            	$("#user-form2").hide();
            } else {
            	$("#anonymous-form2").hide();
            	$("#user-form2").show();
            }
        });
        
     	// 목록 버튼 클릭 이벤트
        $('#btnBoardList').click(function() {
        	window.location.href = '${pageContext.request.contextPath}/board/list';
        });
     	
     	// 수정 버튼 클릭 이벤트
        $('#btnBoardModify').click(function() {
        	window.location.href = '${pageContext.request.contextPath}/board/modify/' + boardId;
        });
     	
     	// 삭제 버튼 클릭 이벤트
        $('#btnBoardRemove').click(function() {
    		if (!confirm('게시글을 삭제하시겠습니까?')) {
    			return;
    		}
   			$.ajax({
   			    type: 'DELETE',
   			    url: '${pageContext.request.contextPath}/board.ajax/' + boardId,
   			    contentType: 'application/json',
   			    success: function () {
   			        alert('게시글이 삭제되었습니다.');
   			     	window.location.href = '${pageContext.request.contextPath}/board/list';
   			    },
   			    error: function () {
   			    	alert('내부 서버 오류입니다.');
   			    	window.location.href = '${pageContext.request.contextPath}/board/list';
   			    }
   			});
        });
     	
     	// 글쓰기 버튼 클릭 이벤트
        $('#btnBoardRegister').click(function() {
        	window.location.href = '${pageContext.request.contextPath}/board/register';
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