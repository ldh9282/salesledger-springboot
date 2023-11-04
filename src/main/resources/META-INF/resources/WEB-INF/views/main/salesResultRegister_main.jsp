<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <main id="main" class="main">

        <section>
            <div class="container">
                <h3>${company} ${department_kr} 매출실적 수기데이터 등록 페이지</h3>
                <hr>
                <form id="salesResultForm">
                    <div class="form-group mb-3">
                        <label for="batch_month">해당년월:</label>
                        <input type="text" class="form-control" id="batch_month" name="batch_month" placeholder="YYYYMM">
                    </div>
                    <div class="form-group mb-3">
                        <label for="company">회사:</label>
                        <input type="text" class="form-control" id="company" name="company" readonly value="${company}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="department">사업부서:</label>
                        <input type="text" class="form-control" id="display-department" name="display-department" value="${department_kr}" readonly>
                   		<input type="hidden" class="form-control" id="department" name="department" value="${department}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="site">사이트명:</label>
                        <input type="text" class="form-control" id="site" name="site">
                    </div>
                    <div class="form-group mb-3">
                        <label for="client">진행업체:</label>
                        <input type="text" class="form-control" id="client" name="client">
                    </div>
                    <div class="form-group mb-3">
                        <label for="project_name">프로젝트명:</label>
                        <input type="text" class="form-control" id="project_name" name="project_name">
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
                        url: "${pageContext.request.contextPath}/salesResult.ajax/company/${company}/department/${department}/batch_month/" + $('#batch_month').val(),
                        contentType: "application/json",
                        data: JSON.stringify({
                            batch_month: $('#batch_month').val(),
                            company: $('#company').val(),
                            department: $('#department').val(),
                            site: $('#site').val(),
                            client: $('#client').val(),
                            project_name: $('#project_name').val(),
                            brief: $('#brief').val(),
                            total_sales_amount: $('#total_sales_amount').val().replaceAll(',', ''),
                            total_purchase_amount: $('#total_purchase_amount').val().replaceAll(',', ''),
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