<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
    
<header id="header" class="header fixed-top d-flex align-items-center">
  <div class="d-flex align-items-center justify-content-between">
    <a href="${pageContext.request.contextPath}/" class="logo d-flex align-items-center">
      <span class="d-none d-lg-block">IYF 영업관리시스템</span>
    </a>
    <i class="bi bi-list toggle-sidebar-btn"></i>
  </div><!-- End Logo -->

  <nav class="header-nav ms-auto">
    <ul class="d-flex align-items-center">

      <li class="nav-item dropdown pe-3">

        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
          <img src="${pageContext.request.contextPath}/resources/OnePage/assets/img/user-profile/user-profile-a.png"
            width="30" height="30" alt="Profile" class="rounded-circle">
          <security:authorize access="isAuthenticated()">
          	<security:authentication var="principal" property="principal"/>
          	<span id="name" class="d-none d-md-block dropdown-toggle ps-2"></span>
          </security:authorize>
        </a><!-- End Profile Iamge Icon -->

        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
          <li class="dropdown-header">
            <h6 id="auth"></h6>
            <span id="company"></span>
          </li>                 
		  <li>
          	<hr class="dropdown-divider">
          </li>
          <li>
            <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/logout">
              <i class="bi bi-box-arrow-right"></i>
              <span>로그아웃</span>
            </a>
          </li>
          

        </ul><!-- End Profile Dropdown Items -->
      </li><!-- End Profile Nav -->

    </ul>
  </nav><!-- End Icons Navigation -->

</header>

<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath}/member.ajax/username/' + '${principal.username}',
			success: function(member) {
				$('#name').text(member.name);
				$('#auth').text(member.authorities[0].authority);
				$('#company').text(member.company);
			}
		});
	});
</script>