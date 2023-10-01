<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/icon/favicon.ico">
  <title>권한 없음 (접속실패): IYF 영업관리시스템</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/css/style.css" rel="stylesheet">
  <!-- jquery -->
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>

  <main>
    <div class="container">

      <section class="section error-404 min-vh-100 d-flex flex-column align-items-center justify-content-center">
        <h1>404</h1>
        <h2>권한 없음 (접속 실패)</h2>
        <a class="btn" href="${pageContext.request.contextPath}/">홈페이지로 가기</a>
      </section>

    </div>
  </main><!-- End #main -->

  <script>
  </script>
  
  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/chart.js/chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/echarts/echarts.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/quill/quill.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/js/main.js"></script>

</body>

</html>