<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/icon/favicon.ico">
    <title>IYCNC 인프라 유지보수 매출실적 수기데이터 등록 페이지: IYF 영업관리시스템</title>

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
                <h3>IYCNC 인프라 유지보수 매출실적 수기데이터 등록 페이지</h3>
                <hr>
                <form id="salesResultInfraForm">
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
                        <input type="text" class="form-control" id="display-category" name="display-category" value="유지보수" readonly>
                        <input type="hidden" class="form-control" id="category" name="category" value="MAINTENANCE">
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

                <div class="form-group mt-3">
                    <button type="button" class="btn btn-primary float-end" id="btnInsert">등록</button>
                </div>
            </div>
        </section>

    </main><!-- End #main -->

    <script>
        $(document).ready(function () {
            $('#btnInsert').click(function() {
            	
                if (!$('#batch_month').val()) {
                    alert('해당년월(YYYYMM)을 입력해주세요');
                    return;
                }
                const year = $('#batch_month').val().substring(0, 4);
                const month = $('#batch_month').val().substring(4);

                if (!confirm(year + '년 ' + month + '월 매출 실적에 해당 데이터를 수기로 추가하시겠습니까?')) {
                    return;
                } else {
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/salesResultInfra.ajax/company/IYCNC/department/INFRA/category/maintenance/batch_month/" + $('#batch_month').val(),
                        contentType: "application/json",
                        data: JSON.stringify({
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
                            
                        }),
                        success: function () {
                        	opener.parent.location.href = opener.parent.location.pathname + '?batch_month=' + $('#batch_month').val();
                            window.close();
                        },
                        error: function () {
                            opener.parent.location.reload();
                            window.close();
                        }
                    });

                }
            });

            $('#batch_month').change(function() {
                const regex = /^(19|20)\d\d(0[1-9]|1[0-2])$/;

                if (regex.test($('#batch_month').val())) {
                    
                } else {
                    alert('올바른 해당년월(YYYYMM)을 입력해주세요');
                    $('#batch_month').val('');
                }
            })

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