<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<aside id="sidebar" class="sidebar">

	<ul class="sidebar-nav" id="sidebar-nav">
		<li class="nav-heading">공통</li>
		<security:authorize access="isAuthenticated()">
			<li class="nav-item">
				<a class="nav-link collapsed" href="${pageContext.request.contextPath}/empPoolList">
					<i class="bi bi-person"></i>
					<span>인력풀</span>
				</a>
			</li><!-- End EmpPool Nav -->
		</security:authorize>
		
		<security:authorize access="hasAuthority('통합 관리자') or hasAuthority('IYCNC 관리자')">
			<!-- Start IYCNC Nav  -->
			<li class="nav-heading">IYCNC</li>
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#iycnc-ito-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>ITO</span><i class="bi bi-chevron-down ms-auto"></i>
				</a>
				
				<ul id="iycnc-ito-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				
					<li>
						<a href="${pageContext.request.contextPath}/iycnc/ito/empLedgerList">
							<i class="bi bi-circle"></i><span>인력기초원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iycnc/ito/salesLedgerList">
							<i class="bi bi-circle"></i><span>매출원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iycnc/ito/salesEstimationList">
							<i class="bi bi-circle"></i><span>추정</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iycnc/ito/salesResultList">
							<i class="bi bi-circle"></i><span>실적</span>
						</a>
					</li>
				</ul>
			</li><!-- End ITO Nav -->
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#iycnc-idc-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>IDC</span><i class="bi bi-chevron-down ms-auto"></i>
				</a>
				
				<ul id="iycnc-idc-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				
					<li>
						<a href="${pageContext.request.contextPath}/iycnc/idc/empLedgerList">
							<i class="bi bi-circle"></i><span>인력기초원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iycnc/idc/salesLedgerList">
							<i class="bi bi-circle"></i><span>매출원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iycnc/idc/salesEstimationList">
							<i class="bi bi-circle"></i><span>추정</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iycnc/idc/salesResultList">
							<i class="bi bi-circle"></i><span>실적</span>
						</a>
					</li>
				</ul>
			</li><!-- End IDC Nav -->
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#iycnc-conversion-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>컨버전스</span><i class="bi bi-chevron-down ms-auto"></i>
				</a>
				
				<ul id="iycnc-conversion-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				
					<li>
						<a href="${pageContext.request.contextPath}/iycnc/conversion/empLedgerList">
							<i class="bi bi-circle"></i><span>인력기초원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iycnc/conversion/salesLedgerList">
							<i class="bi bi-circle"></i><span>매출원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iycnc/conversion/salesEstimationList">
							<i class="bi bi-circle"></i><span>추정</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iycnc/conversion/salesResultList">
							<i class="bi bi-circle"></i><span>실적</span>
						</a>
					</li>
				</ul>
			</li><!-- End CONVERSION Nav -->
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#iycnc-infra-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>인프라</span><i class="bi bi-chevron-down ms-auto"></i>
				</a>
				<ul id="iycnc-infra-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
					<li>
						<a class="nav-link collapsed" data-bs-target="#iycnc-infra-maintenance-nav" data-bs-toggle="collapse" href="#">
							<i class="bi bi-grid"></i><span>유지보수</span>
						</a>
						<ul id="iycnc-infra-maintenance-nav" class="nav-content collapse " data-bs-parent="#iycnc-infra-nav">
							<li>
								<a href="${pageContext.request.contextPath}/iycnc/infra/maintenance/salesEstimationInfraList" style="padding: 10px 0 10px 61px; font-size: 13px;">
									<i class="bi bi-circle"></i><span>추정</span>
								</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/iycnc/infra/maintenance/salesResultInfraList" style="padding: 10px 0 10px 61px; font-size: 13px;">
									<i class="bi bi-circle"></i><span>실적</span>
								</a>
							</li>
						</ul>
					</li>
					<li>
						<a class="nav-link collapsed" data-bs-target="#iycnc-infra-merchandise-nav" data-bs-toggle="collapse" href="#">
							<i class="bi bi-grid"></i><span>상품</span>
						</a>
						<ul id="iycnc-infra-merchandise-nav" class="nav-content collapse " data-bs-parent="#iycnc-infra-nav">
							<li>
								<a href="${pageContext.request.contextPath}/iycnc/infra/merchandise/salesEstimationInfraList" style="padding: 10px 0 10px 61px; font-size: 13px;">
									<i class="bi bi-circle"></i><span>추정</span>
								</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/iycnc/infra/merchandise/salesResultInfraList" style="padding: 10px 0 10px 61px; font-size: 13px;">
									<i class="bi bi-circle"></i><span>실적</span>
								</a>
							</li>
						</ul>
					</li>
					<li>
						<a class="nav-link collapsed" data-bs-target="#iycnc-infra-support-nav" data-bs-toggle="collapse" href="#">
							<i class="bi bi-grid"></i><span>기술지원</span>
						</a>
						<ul id="iycnc-infra-support-nav" class="nav-content collapse " data-bs-parent="#iycnc-infra-nav">
							<li>
								<a href="${pageContext.request.contextPath}/iycnc/infra/support/salesEstimationInfraList" style="padding: 10px 0 10px 61px; font-size: 13px;">
									<i class="bi bi-circle"></i><span>추정</span>
								</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/iycnc/infra/support/salesResultInfraList" style="padding: 10px 0 10px 61px; font-size: 13px;">
									<i class="bi bi-circle"></i><span>실적</span>
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</li><!-- End INFRA Nav -->
			<!-- End IYCNC Nav  -->
		</security:authorize>
		
		<security:authorize access="hasAuthority('통합 관리자') or hasAuthority('IBTS 관리자')">
			<!-- Start IBTS Nav  -->
			<li class="nav-heading">IBTS</li>
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#ibts-ito-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>ITO</span><i class="bi bi-chevron-down ms-auto"></i>
				</a>
				
				<ul id="ibts-ito-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				
					<li>
						<a href="${pageContext.request.contextPath}/ibts/ito/empLedgerList">
							<i class="bi bi-circle"></i><span>인력기초원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/ibts/ito/salesLedgerList">
							<i class="bi bi-circle"></i><span>매출원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/ibts/ito/salesEstimationList">
							<i class="bi bi-circle"></i><span>추정</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/ibts/ito/salesResultList">
							<i class="bi bi-circle"></i><span>실적</span>
						</a>
					</li>
				</ul>
			</li><!-- End ITO Nav -->
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#ibts-idc-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>IDC</span><i class="bi bi-chevron-down ms-auto"></i>
				</a>
				
				<ul id="ibts-idc-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				
					<li>
						<a href="${pageContext.request.contextPath}/ibts/idc/empLedgerList">
							<i class="bi bi-circle"></i><span>인력기초원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/ibts/idc/salesLedgerList">
							<i class="bi bi-circle"></i><span>매출원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/ibts/idc/salesEstimationList">
							<i class="bi bi-circle"></i><span>추정</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/ibts/idc/salesResultList">
							<i class="bi bi-circle"></i><span>실적</span>
						</a>
					</li>
				</ul>
			</li><!-- End IDC Nav -->
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#ibts-conversion-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>컨버전스</span><i class="bi bi-chevron-down ms-auto"></i>
				</a>
				
				<ul id="ibts-conversion-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				
					<li>
						<a href="${pageContext.request.contextPath}/ibts/conversion/empLedgerList">
							<i class="bi bi-circle"></i><span>인력기초원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/ibts/conversion/salesLedgerList">
							<i class="bi bi-circle"></i><span>매출원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/ibts/conversion/salesEstimationList">
							<i class="bi bi-circle"></i><span>추정</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/ibts/conversion/salesResultList">
							<i class="bi bi-circle"></i><span>실적</span>
						</a>
					</li>
				</ul>
			</li><!-- End CONVERSION Nav -->
		<!-- End IBTS Nav  -->
		</security:authorize>
		
		<security:authorize access="hasAuthority('통합 관리자') or hasAuthority('IYS 관리자')">
			<!-- Start IYS Nav  -->
			<li class="nav-heading">IYS</li>
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#iys-ito-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>ITO</span><i class="bi bi-chevron-down ms-auto"></i>
				</a>
				
				<ul id="iys-ito-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				
					<li>
						<a href="${pageContext.request.contextPath}/iys/ito/empLedgerList">
							<i class="bi bi-circle"></i><span>인력기초원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iys/ito/salesLedgerList">
							<i class="bi bi-circle"></i><span>매출원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iys/ito/salesEstimationList">
							<i class="bi bi-circle"></i><span>추정</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iys/ito/salesResultList">
							<i class="bi bi-circle"></i><span>실적</span>
						</a>
					</li>
				</ul>
			</li><!-- End ITO Nav -->
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#iys-idc-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>IDC</span><i class="bi bi-chevron-down ms-auto"></i>
				</a>
				
				<ul id="iys-idc-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				
					<li>
						<a href="${pageContext.request.contextPath}/iys/idc/empLedgerList">
							<i class="bi bi-circle"></i><span>인력기초원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iys/idc/salesLedgerList">
							<i class="bi bi-circle"></i><span>매출원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iys/idc/salesEstimationList">
							<i class="bi bi-circle"></i><span>추정</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iys/idc/salesResultList">
							<i class="bi bi-circle"></i><span>실적</span>
						</a>
					</li>
				</ul>
			</li><!-- End IDC Nav -->
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#iys-conversion-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>컨버전스</span><i class="bi bi-chevron-down ms-auto"></i>
				</a>
				
				<ul id="iys-conversion-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				
					<li>
						<a href="${pageContext.request.contextPath}/iys/conversion/empLedgerList">
							<i class="bi bi-circle"></i><span>인력기초원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iys/conversion/salesLedgerList">
							<i class="bi bi-circle"></i><span>매출원장</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iys/conversion/salesEstimationList">
							<i class="bi bi-circle"></i><span>추정</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/iys/conversion/salesResultList">
							<i class="bi bi-circle"></i><span>실적</span>
						</a>
					</li>
				</ul>
			</li><!-- End CONVERSION Nav -->
			<!-- End IYS Nav -->
		</security:authorize>
			
		
		<security:authorize access="hasAuthority('통합 관리자')">
			<!-- Start 통합관리자 Nav -->
			<li class="nav-heading">관리자</li>
			<li class="nav-item">
				<a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/memberList">
					<i class="bi bi-person"></i>
					<span>회원관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/salesResultChart">
					<i class="bi bi-bar-chart"></i>
					<span>통계</span>
				</a>
			</li><!-- End 통합관리자 Nav -->
		</security:authorize>
	</ul>
</aside>
