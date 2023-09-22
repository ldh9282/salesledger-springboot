<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/icon/favicon.ico">
    <title>회원 상세페이지: IYF 영업관리시스템</title>


    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">

    <!-- NiceAdmin: Vendor CSS Files -->
    <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/bootstrap/css/bootstrap.min.css"
        rel="stylesheet">
    <link
        href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/bootstrap-icons/bootstrap-icons.css"
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

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>

	
    <main id="main" class="main">
        <section>
            <div class="container">
                <h1>회원 상세페이지</h1>
                <div class="form-group mb-3">
                    <label for="username">아이디:</label>
                    <input type="text" class="form-control" id="username" name="username" value="${member.username}" readonly>
                </div>
                <div class="form-group mb-3">
                    <label for="name">이름:</label>
                    <input type="text" class="form-control" id="name" name="name" value="${member.name}" readonly>
                </div>
                <div class="form-group mb-3">
                    <label for="name">회사명:</label>
                    <input type="text" class="form-control" id="name" name="name" value="${member.company}" readonly>
                </div>
                <div class="form-group mb-3">
                    <span>
                        <label for="auth">권한:</label>
                        <select id="auth" name="auth">
                        	
                            <option value="통합 관리자" <c:if test="${member.authorities[0].authority == '통합관리자'}">selected</c:if>>통합 관리자</option>
                            <option value="IYCNC 관리자" <c:if test="${member.authorities[0].authority == 'IYCNC 관리자'}">selected</c:if>>IYCNC 관리자</option>
                            <option value="IBTS 관리자" <c:if test="${member.authorities[0].authority == 'IBTS 관리자'}">selected</c:if>>IBTS 관리자</option>
                            <option value="IYS 관리자" <c:if test="${member.authorities[0].authority == 'IYS 관리자'}">selected</c:if>>IYS 관리자</option>
                            <option value="권한 없음" <c:if test="${member.authorities[0].authority == '권한 없음'}">selected</c:if>>권한 없음</option>
                        </select>
                    </span>

                    <span class="float-end">
                        <label for="enabled">가입승인:</label>
                        <select name="enabled" id="enabled">
                        <c:choose>
                            <c:when test="${member.enabled == '0'}">
                                <option value="0" selected>미승인</option>
                                <option value="1">승인완료</option>
                            </c:when>
                            <c:when test="${member.enabled == '1'}">
                                <option value="0">미승인</option>
                                <option value="1" selected>승인완료</option>
                            </c:when>
                        </c:choose>
                        </select>
                    </span>
                </div>
                <div class="form-group mt-3">
                    <button type="button" class="btn btn-primary" id="btnUpdate">수정</button>
                    <button type="button" class="btn btn-danger float-end" id="btnDelete">삭제</button>
                </div>
            </div>
        </section>

    </main><!-- End #main -->
    

    <script>
        $(document).ready(function () {


            // 수정 버튼 클릭 시 이벤트
            $('#btnUpdate').click(function() {
                const member = {
             		username: $('#username').val(),
             		auth: $('#auth').val(),
             		enabled: $('#enabled').val()
                };
                
                $.ajax({
                    type: 'PUT',
                    url: '${pageContext.request.contextPath}/member.ajax/',
                    data: JSON.stringify(member),
                    contentType: 'application/json',
                    success: function() {
                        opener.parent.location.reload();
                       	window.location.href = window.location.href; 
                        
                    },
                    error: function() {
                        opener.parent.location.reload();
                        window.close();
                    }
                })
            });

            

            // 삭제 버튼 클릭 시 이벤트: 실제 삭제가 아니라 del 컬럼 'Y'로 수정
            $('#btnDelete').click(function () {
                if (!confirm('해당 회원을 정말로 삭제하시겠습니까?')) {
                    return;
                } else {
                    $.ajax({
                        type: 'DELETE',
                        url: '${pageContext.request.contextPath}/member.ajax/username/' + $('#username').val(),
                        success: function () {
                            opener.parent.location.reload();
                            window.close();
                        },
                        error: function () {
                            opener.parent.location.reload();
                            window.close();
                        }
                    });
                }
                    
            })
            

        });

    </script>


    

    <!-- Excel Export JS File-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>


    <!-- toast-grid -->
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

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