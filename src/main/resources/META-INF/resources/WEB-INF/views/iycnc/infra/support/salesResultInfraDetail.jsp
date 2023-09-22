<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<security:authentication var="principal" property="principal"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/icon/favicon.ico">
    <title>IYCNC 인프라 기술지원 매출실적 상세 페이지: IYF 영업관리시스템</title>

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
                
                <h1>IYCNC 인프라 기술지원 매출실적 상세 페이지</h1>
                <form id="salesResultInfraForm">
                	<input type="hidden" id="sales_result_infra_id" name="sales_result_infra_id">
                    <div class="form-group mb-3">
                        <label for="batch_month">해당년월:</label>
                        <input type="text" class="form-control" id="batch_month" name="batch_month" placeholder="YYYYMM">
                    </div>
                    <div class="form-group mb-3">
                        <label for="batch_month">날짜:</label>
                        <input type="date" class="form-control" id="date" name="date">
                    </div>
                    <div class="form-group mb-3">
                        <label for="company">회사:</label>
                        <input type="text" class="form-control" id="company" name="company" readonly value="IYCNC">
                    </div>
                    <div class="form-group mb-3">
                        <label for="department">사업부서:</label>
                        <input type="text" class="form-control" id="display-department" name="display-department" value="인프라" readonly>
                        <input type="hidden" class="form-control" id="department" name="department" value="INFRA">
                    </div>
                    <div class="form-group mb-3">
                        <label for="category">카테고리:</label>
                        <input type="text" class="form-control" id="display-category" name="display-category" value="기술지원" readonly>
                        <input type="hidden" class="form-control" id="category" name="category" value="SUPPORT">
                    </div>
                    <div class="form-group mb-3">
                        <label for="client">진행업체:</label>
                        <input type="text" class="form-control" id="client" name="client">
                    </div>
                    <div class="form-group mb-3">
                        <label for="brief">적요란:</label>
                        <input type="text" class="form-control" id="brief" name="brief">
                    </div>
                    <div class="form-group mb-3">
                        <label for="total_sales_amount">매출가:</label>
                        <input type="text" class="form-control" id="total_sales_amount" name="total_sales_amount" value="0">
                    </div>
                    <div class="form-group mb-3">
                        <label for="total_purchase_amount">매입가:</label>
                        <input type="text" class="form-control" id="total_purchase_amount" name="total_purchase_amount" value="0">
                    </div>
                    <div class="form-group mb-3">
                        <label for="total_margin_amount">이익:</label>
                        <input type="text" class="form-control" id="total_margin_amount" name="total_margin_amount" value="0" readonly="readonly">
                    </div>
                    <div class="form-group mb-3">
                        <label for="note">비고:</label>
                        <input type="text" class="form-control" id="note" name="note">
                    </div>
                    <div class="form-group mb-3">
                        <label for="business_reg_num">사업자등록번호:</label>
                        <input type="text" class="form-control" id="business_reg_num" name="business_reg_num">
                    </div>
                    <div class="form-group mb-3">
                        <label for="email">담당메일주소:</label>
                        <input type="text" class="form-control" id="email" name="email">
                    </div>
                    <div class="form-group mb-3">
                        <label for="handwrite">수기작성여부:</label>
                        <input type="text" class="form-control" id="handwrite" name="handwrite" readonly value="Y">
                    </div>
                </form>
                
                <button type="button" class="btn btn-primary" id="btnUpdate">수정</button>
                <button type="button" class="btn btn-danger float-end" id="btnDelete">삭제</button>
            </div>
        </section>
    
    </main><!-- End #main -->

    <script>
        $(document).ready(function() {

        	const urlParmas = new URLSearchParams(window.location.search);
            const sales_result_infra_id = urlParmas.get('sales_result_infra_id'); 
            
            // 상세정보 조회
            $.ajax({
            	url: '${pageContext.request.contextPath}/salesResultInfra.ajax/sales_result_infra_id/' + sales_result_infra_id,
            	type: 'GET',
            	dataType: 'json',
            	success: function (salesResultInfra) {
            		
            		$('#sales_result_infra_id').val(salesResultInfra.sales_result_infra_id);
            		$('#batch_month').val(salesResultInfra.batch_month);
            		$('#date').val(salesResultInfra.date);
            		$('#company').val(salesResultInfra.company);
            		$('#department').val(salesResultInfra.department);
            		$('#category').val(salesResultInfra.category);
            		$('#client').val(salesResultInfra.client);
            		$('#brief').val(salesResultInfra.brief);
            		$('#total_sales_amount').val(salesResultInfra.total_sales_amount.toLocaleString('ko-KR'));
            		$('#total_purchase_amount').val(salesResultInfra.total_purchase_amount.toLocaleString('ko-KR'));
            		$('#total_margin_amount').val((Number(salesResultInfra.total_sales_amount) - Number(salesResultInfra.total_purchase_amount)).toLocaleString('ko-KR'));
            		$('#note').val(salesResultInfra.note);
            		$('#business_reg_num').val(salesResultInfra.business_reg_num);
            		$('#email').val(salesResultInfra.email);
            		$('#handwrite').val(salesResultInfra.handwrite);


				},
				error: function(xhr, status, error) {
                    
                }
            });
            
         	// 수정하기 버튼 클릭 시
            $('#btnUpdate').click(function() {
            	const salesResultInfra = {
           			sales_result_infra_id: $('#sales_result_infra_id').val(), 
         			batch_month: $('#batch_month').val(), 
         			date: $('#date').val(), 
         			company: $('#company').val(), 
         			department: $('#department').val(), 
         			category: $('#category').val(), 
         			client: $('#client').val(), 
         			brief: $('#brief').val(), 
         			total_sales_amount: $('#total_sales_amount').val().replaceAll(',', ''),
                    total_purchase_amount: $('#total_purchase_amount').val().replaceAll(',', ''), 
                    note: $('#note').val(), 
                    business_reg_num: $('#business_reg_num').val(), 
                    email: $('#email').val(), 
         			handwrite: $('#handwrite').val(), 
	            }
	            $.ajax({
	                type: "PUT",
	                url: "${pageContext.request.contextPath}/salesResultInfra.ajax",
	                contentType: "application/json",
	                data: JSON.stringify(salesResultInfra),
	                success: function() {
	                    opener.parent.location.reload();
	                    window.location.reload();
	                },
	                error: function() {
	                    opener.parent.location.reload();
	                    window.close();
	                }
	            });
			});
            
         	// 삭제하기 버튼 클릭 시
            $('#btnDelete').click(function() {
            	if (!confirm('정말로 해당 수기데이터를 삭제하시겠습니까?')) {
            		return;
            	} else {
		            $.ajax({
		                type: "DELETE",
		                url: "${pageContext.request.contextPath}/salesResultInfra.ajax/sales_result_infra_id/" + sales_result_infra_id,
		                success: function() {
		                    opener.parent.location.reload();
		                    window.close();
		                },
		                error: function() {
		                    opener.parent.location.reload();
		                    window.close();
		                }
		            });
            	}
			});
         	
        	 // 금액에 문자 입력 방지 및 세자리 단위 콤마로 디스플레이
            $('#total_sales_amount').keyup(function(e) {
                let value = e.target.value;
                value = Number(value.replaceAll(',', ''))
                if (isNaN(value)) {
                    e.target.value = 0;
                    return;
                }
                let formattedValue = value.toLocaleString('ko-KR');
                e.target.value = formattedValue;
                
            });
            // 금액에 문자 입력 방지 및 세자리 단위 콤마로 디스플레이
            $('#total_purchase_amount').keyup(function(e) {
                let value = e.target.value;
                value = Number(value.replaceAll(',', ''))
                if (isNaN(value)) {
                    e.target.value = 0;
                    return;
                }
                let formattedValue = value.toLocaleString('ko-KR');
                e.target.value = formattedValue;
                
            });

            $('#total_sales_amount').change(function() {
                const total_sales_amount = 
                    !isNaN($('#total_sales_amount').val().replaceAll(',', '')) && $('#total_sales_amount').val().replaceAll(',', '').trim() !== '' ? 
                        Number($('#total_sales_amount').val().replaceAll(',', '')) : 0;
                const total_purchase_amount = 
                    !isNaN($('#total_purchase_amount').val().replaceAll(',', '')) && $('#total_purchase_amount').val().replaceAll(',', '').trim() !== '' ? 
                        Number($('#total_purchase_amount').val().replaceAll(',', '')) : 0;
                
                $('#total_margin_amount').val((total_sales_amount - total_purchase_amount).toLocaleString('ko-KR'));
            })
            $('#total_purchase_amount').change(function() {
                const total_sales_amount = 
                    !isNaN($('#total_sales_amount').val().replaceAll(',', '')) && $('#total_sales_amount').val().replaceAll(',', '').trim() !== '' ? 
                        Number($('#total_sales_amount').val().replaceAll(',', '')) : 0;
                const total_purchase_amount = 
                    !isNaN($('#total_purchase_amount').val().replaceAll(',', '')) && $('#total_purchase_amount').val().replaceAll(',', '').trim() !== '' ? 
                        Number($('#total_purchase_amount').val().replaceAll(',', '')) : 0;
                
                $('#total_margin_amount').val((total_sales_amount - total_purchase_amount).toLocaleString('ko-KR'));
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