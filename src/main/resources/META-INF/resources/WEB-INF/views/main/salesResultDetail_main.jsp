<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <main id="main" class="main">
        <section>
            <div class="container">
                
                <h1>${company} ${department_kr} 매출실적 상세 페이지</h1>
                <form id="salesResultForm">
                	<input type="hidden" class="form-control" id="sales_result_id" name="sales_result_id">
                	<div class="form-group mb-3">
                        <label for="batch_month">해당년월:</label>
                        <input type="text" class="form-control" id="batch_month" name="batch_month" readonly>
                    </div>
                    <div class="form-group mb-3">
                        <label for="company">소속:</label>
                        <input type="text" class="form-control" id="company" name="company" value="${company}" readonly>
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
                        <label for="brief">적요란</label>
                        <input type="text" class="form-control" id="brief" name="brief">
                    </div>                    
                	<hr>
                    <div class="form-group mb-3">
                        <label for="total_sales_amount">매출가:</label>
                        <input type="text" class="form-control" id="total_sales_amount" name="total_sales_amount">
                    </div>
                    <div class="form-group mb-3">
                        <label for="total_purchase_amount">매입가:</label>
                        <input type="text" class="form-control" id="total_purchase_amount" name="total_purchase_amount">
                    </div>
                    <div class="form-group mb-3">
                        <label for="total_margin_amount">이익:</label>
                        <input type="text" class="form-control" id="total_margin_amount" name="total_margin_amount" readonly>
                    </div>
                    <div class="form-group mb-3">
                        <label for="handwrite">수기작성여부:</label>
                        <input type="text" class="form-control" id="handwrite" name="handwrite" value="Y" readonly>
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
            const sales_result_id = urlParmas.get('sales_result_id'); 
            
            // 상세정보 조회
            $.ajax({
            	url: '${pageContext.request.contextPath}/salesResult.ajax/sales_result_id/' + sales_result_id,
            	type: 'GET',
            	dataType: 'json',
            	success: function (salesResult) {
            		
            		$('#sales_result_id').val(salesResult.sales_result_id);
            		$('#batch_month').val(salesResult.batch_month);
            		$('#company').val(salesResult.company);
            		$('#department').val(salesResult.department);
            		$('#site').val(salesResult.site);
            		$('#client').val(salesResult.client);
            		$('#project_name').val(salesResult.project_name);
            		$('#brief').val(salesResult.brief);
            		$('#total_sales_amount').val(salesResult.total_sales_amount.toLocaleString('ko-KR'));
            		$('#total_purchase_amount').val(salesResult.total_purchase_amount.toLocaleString('ko-KR'));
            		$('#total_margin_amount').val((Number(salesResult.total_sales_amount) - Number(salesResult.total_purchase_amount)).toLocaleString('ko-KR'));
            		$('#handwrite').val(salesResult.handwrite);


				},
				error: function(xhr, status, error) {
                    
                }
            });
            
         	// 수정하기 버튼 클릭 시
            $('#btnUpdate').click(function() {
            	const salesResult = {
         			sales_result_id: $('#sales_result_id').val(), 
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
	            }
	            $.ajax({
	                type: "PUT",
	                url: "${pageContext.request.contextPath}/salesResult.ajax",
	                contentType: "application/json",
	                data: JSON.stringify(salesResult),
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
		                url: "${pageContext.request.contextPath}/salesResult.ajax/sales_result_id/" + sales_result_id,
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