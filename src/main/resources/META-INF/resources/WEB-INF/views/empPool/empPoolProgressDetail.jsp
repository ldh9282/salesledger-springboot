<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<tr>
							<td>투입</td>
							<td>IYCNC</td>
							<td>ITO</td>
							<td>12345</td>
							<td>12345</td>
							<td>12345</td>
							<td>2023-11-06</td>
							<td>2023-11-06</td>
							<td>2023-11-06</td>
							<td>1</td>
							<td>1</td>
							<td>10,000,000</td>
							<td>5,000,000</td>
						</tr>
					</tbody>
				</table>
			</div>
        </section>

    </main><!-- End #main -->
    

    <script>
        $(document).ready(function () {
            const urlParmas = new URLSearchParams(window.location.search);
            const empPoolId = urlParmas.get('emp_pool_id');


            // 인력 상세 정보 조회
            $.ajax({
                url: '${pageContext.request.contextPath}/empPool.ajax/' + empPoolId,
                type: 'GET',
                dataType: 'json',
                success: function (empPool) {
                    // 생년월일 Formatting
                    const birthdate = new Date(empPool.birthdate);
                    empPool.birthdate = birthdate.getFullYear() + '-' + String(Number(birthdate.getMonth() + 1)).padStart(2, '0') + '-' + String(birthdate.getDate()).padStart(2, '0');
					
                    // 전화번호 Formatting
                    empPool.phonenumber = empPool.phonenumber.replace(/(\d{3})(\d{0,4})(\d{0,4})/, '$1-$2-$3');
                    
                    $('#emp_pool_id').val(empPool.emp_pool_id);
                    $('#sourcing_manager').val(empPool.sourcing_manager);
                    $('#name').val(empPool.name);
                    $('#phonenumber').val(empPool.phonenumber);
                    $('#birthdate').val(empPool.birthdate);
                    $('#email').val(empPool.email);
                    $('#address').val(empPool.address);
                    $('#education').val(empPool.education);
                    $('#school_name').val(empPool.school_name);
                    $('#major').val(empPool.major);
                    $('#career_years').val(empPool.career_years);
                    $('#career_field').val(empPool.career_field);
                    $('#career_level').val(empPool.career_level);
                    $('#project_assign').val(empPool.project_assign);
                    $('#del').val(empPool.del);
                    $('#hope_purchase_unit').val(empPool.hope_purchase_unit.toLocaleString('ko-KR'));
                },
                error: function (xhr, status, error) {

                }
            });

            // 수정 버튼 클릭 시 이벤트
            $('#btnUpdate').click(function() {
            	
            	// 필수값 체크
            	if (!$('#name').val()) {
            		$('#name').focus();
            		alert('등록하려는 인력의 이름을 입력하셔야합니다');
            		return;
            	} else if (!$('#phonenumber').val()) {
            		$('#phonenumber').focus();
            		alert('등록하려는 인력의 전화번호를 입력하셔야합니다');
            		return;
            	}
            	
                const empPool = {
                    emp_pool_id: $('#emp_pool_id').val(),
                    sourcing_manager: $('#sourcing_manager').val(),
                    name: $('#name').val(),
                    phonenumber: $('#phonenumber').val().replaceAll('-', ''),
                    email: $('#email').val(),
                    address: $('#address').val(),
                    education: $('#education').val(),
                    school_name: $('#school_name').val(),
                    major: $('#major').val(),
                    career_years: $('#career_years').val(),
                    career_field: $('#career_field').val(),
                    career_level: $('#career_level').val(),
                    project_assign: $('#project_assign').val(),
                    birthdate: new Date($('#birthdate').val()),
                    del: $('#del').val(),
                    hope_purchase_unit: $('input[name=hope_purchase_unit]').val().replaceAll(',', '') ? $('input[name=hope_purchase_unit]').val().replaceAll(',', '') : 0,
                }
                
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/empPool.ajax/name/' + empPool.name + '/phonenumber/' + empPool.phonenumber,
                    success: function(theEmpPool) {
                    	if (theEmpPool.emp_pool_id == empPool.emp_pool_id || !theEmpPool) {
                            $.ajax({
                                type: 'PUT',
                                url: '${pageContext.request.contextPath}/empPool.ajax/',
                                data: JSON.stringify(empPool),
                                contentType: 'application/json',
                                success: function() {
                                	alert('인력 정보가 수정되었습니다')
                                    opener.parent.location.reload();
                                	window.close();
                                    
                                },
                                error: function() {
                                    opener.parent.location.reload();
                                    window.close();
                                }
                            })            
                        } else {
                        	$('#phonenumber').focus();
                            alert('성명과 전화번호가 같은 인력이 있습니다.');
                        }                    	
                    },
                })
                
            });

            

            // 삭제 버튼 클릭 시 이벤트: 실제 삭제가 아니라 del 컬럼 'Y'로 수정
            $('#btnDelete').click(function () {
                const emp_pool_id = $('#emp_pool_id').val();
                const del = 'Y';

                if ($('#project_assign').val() <= 0) {
                    
                    $.ajax({
                        type: 'PATCH',
                        url: '${pageContext.request.contextPath}/empPool.ajax/' + emp_pool_id + '/del/' + del,
                        success: function () {
                        	alert('인력이 삭제되었습니다')
                            opener.parent.location.reload();
                            window.close();
                        },
                        error: function () {
                            opener.parent.location.reload();
                            window.close();
                        }
                    });
                } else {
                    alert('진행중인 프로젝트가 없는 인력만 삭제할 수 있습니다.');
                }
            })
            
            $('#btnDetail').click(function() {
				const popupUrl = '${pageContext.request.contextPath}/empPoolDetail?emp_pool_id=' + 38;
				const popupName = 'empPoolDetail-popup2';
				const popupWidth = 600;
				const popupHeight = 400;
				const left = (screen.width - popupWidth) / 2;
				const top = (screen.height - popupHeight) / 2;
				
				window.open(popupUrl, popupName, 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + left + ', top=' + top);
            })
            
            
            // 금액에 문자 입력 방지 및 세자리 단위 콤마로 디스플레이
            $('input[data-type="money"]').keyup(function(e) {
                let value = e.target.value;
                value = Number(value.replaceAll(',', ''))
                if (isNaN(value)) {
                    e.target.value = 0;
                    return;
                }
                let formattedValue = value.toLocaleString('ko-KR');
                e.target.value = formattedValue;
                
            });
            
            // 전화번호 010-xxxx-xxxx 디스플레이
            $('#phonenumber').keyup(function(e) {
				const input = $(this);
				let value = input.val().replace(/\D/g, ''); // 숫자만 추출
				
				if (value.length > 10) {
				  // 입력된 번호가 11자리 이상이라면 11자리까지만 유효한 값으로 간주
				  value = value.substring(0, 11);
				}
				
				if (value.length >= 3 && value.length <= 11) {
				  // 전화번호 형식에 따라 포맷팅
				  value = value.replace(/(\d{3})(\d{0,4})(\d{0,4})/, '$1-$2-$3');
				}
				
				input.val(value);
            });
            
            $('#btnDelete').tooltip();
			
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