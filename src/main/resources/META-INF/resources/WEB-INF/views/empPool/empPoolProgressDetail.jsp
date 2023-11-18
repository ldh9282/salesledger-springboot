<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/icon/favicon.ico">
    <title>인력 상세 페이지: IYF 영업관리시스템</title>


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
				<h1>진행 프로젝트</h1>
				<br><br>
				<table class="table">
					<thead>
						<tr>
							<th>진행</th>
							<th>소속</th>
							<th>사업부서</th>
							<th>사이트명</th>
							<th>진행업체</th>
							<th>프로젝트명</th>
							<th>투입일</th>
							<th>종료일</th>
							<th>철수날짜</th>
							<th>매출<br>MM</th>
							<th>매입<br>MM</th>
							<th>매출<br>단가</th>
							<th>매입<br>단가</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty empPoolProgressDetail1 and empty empPoolProgressDetail2}">
								<tr>
			                        <td colspan="13" style="text-align: center;">투입예정 및 투입된 프로젝트 없음</td>
			                    </tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${empPoolProgressDetail1}">
									<tr>
										<td>${item.progress}</td>
										<td>${item.company}</td>
										<td>
											<c:choose>
												<c:when test="${item.department == 'CONVERSION'}">
													컨버전스
												</c:when>
												<c:otherwise>
													${item.department}
												</c:otherwise>
											</c:choose>
										</td>
										<td>${item.site}</td>
										<td>${item.client}</td>
										<td>${item.project_name}</td>
										<td>${item.assign_date}</td>
										<td>${item.end_date}</td>
										<td>${item.resign_date}</td>
										<td>${item.sales_mm}</td>
										<td>${item.purchase_mm}</td>
										<td class="moneyType">${item.sales_unit}</td>
										<td class="moneyType">${item.purchase_unit}</td>
									</tr>
								</c:forEach>
								<c:forEach var="item" items="${empPoolProgressDetail2}">
									<tr>
										<td>${item.progress}</td>
										<td>${item.company}</td>
										<td>
											<c:choose>
												<c:when test="${item.department == 'CONVERSION'}">
													컨버전스
												</c:when>
												<c:otherwise>
													${item.department}
												</c:otherwise>
											</c:choose>
										</td>
										<td>${item.site}</td>
										<td>${item.client}</td>
										<td>${item.project_name}</td>
										<td>${item.assign_date}</td>
										<td>${item.end_date}</td>
										<td>${item.resign_date}</td>
										<td>${item.sales_mm}</td>
										<td>${item.purchase_mm}</td>
										<td class="moneyType">${item.sales_unit}</td>
										<td class="moneyType">${item.purchase_unit}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
        </section>

    </main><!-- End #main -->
    

    <script>
        $(document).ready(function () {

			console.log('empPoolProgressDetail1' + ' ::: ' + JSON.stringify('${empPoolProgressDetail1}'))
			console.log('empPoolProgressDetail2' + ' ::: ' + JSON.stringify('${empPoolProgressDetail2}'))
			
			// moneyType comma Formatting
			$('.moneyType').each(function() {
				$(this).text(moneyUtils.commaFormatting($(this).text()));
			});
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
    
    <!-- common utils : formatting or unformatting -->
    <script src="${pageContext.request.contextPath}/resources/common/utils.js"></script>

</body>

</html>