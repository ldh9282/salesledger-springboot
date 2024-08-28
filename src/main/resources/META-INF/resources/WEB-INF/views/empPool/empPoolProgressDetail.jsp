<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="en">

<head>
    <title>인력 상세 페이지: IYF 영업관리시스템</title>

    <jsp:include page="/WEB-INF/views/common/metaHeader.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/cssHeader.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/common/scriptHeader.jsp"></jsp:include>
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


    <jsp:include page="/WEB-INF/views/common/scriptBody.jsp"></jsp:include>

</body>

</html>