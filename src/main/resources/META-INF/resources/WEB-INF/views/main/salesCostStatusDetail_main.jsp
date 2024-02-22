<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <main id="main" class="main">
        <section>
            <div class="container">
                <input type="hidden" id="emp_id" name="emp_id">
                <input type="hidden" id="emp_pool_id" name="emp_pool_id">
                <input type="hidden" id="project_assign" name="project_assign">
                <input type="hidden" id="del" name="del">
                <input type="hidden" id="hope_purchase_unit" name="hope_purchase_unit">
                
                <h1>${company} ${department_kr} 매출 원가 현황 상세 페이지</h1>
                <form id="empLedgerForm">
                    <div class="form-group mb-3">
                        <label for="progress">진행 <span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="progress" name="progress" value="${salesCostStatus.progress}" readonly>
                    </div>
                    
                    <div class="form-group mb-3">
                        <label for="company">소속 <span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="company" name="company" value="${company}" readonly>
                    </div>
                    <div class="form-group mb-3">
                        <label for="department">사업부서 <span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="display-department" name="display-department" value="${department_kr}" readonly>
                        <input type="hidden" class="form-control" id="department" name="department" value="${department}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="site">사이트<span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="site" name="site" value="${salesCostStatus.site}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="client">진행업체 <span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="client" name="client" value="${salesCostStatus.client}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="project_name">프로젝트명 <span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="project_name" name="project_name" value="${salesCostStatus.project_name}">
                    </div>
                	<hr>
                    <div class="form-group mb-3">
                        <label for="sourcing_manager">소싱담당자:</label>
                        <input type="text" class="form-control" id="sourcing_manager" name="sourcing_manager" value="${salesCostStatus.sourcing_manager}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="purchase_mm">인원<span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="purchase_mm" name="purchase_mm" value="${salesCostStatus.purchase_mm}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="auto_mm">자동계산MM:</label>
                        <input type="text" class="form-control" id="auto_mm" name="auto_mm" value="${salesCostStatus.auto_mm}" readonly>
                    </div>
                    <div class="form-group mb-3">
                        <label for="name">이름<span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="name" name="name" value="${salesCostStatus.name}" readonly>
                    </div>
                    <div class="form-group mb-3">
                        <label for="career_years">경력:</label>
                        <input type="text" class="form-control" id="career_years" name="career_years" value="${salesCostStatus.career_years}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="career_field">분야:</label>
                        <input type="text" class="form-control" id="career_field" name="career_field" value="${salesCostStatus.career_field}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="career_level">등급:</label>
                        <select class="form-control" id="career_level" name="career_level">
                            <option value="미기입" ${salesCostStatus.career_level == '미기입' ? 'selected' : ''}>미기입</option>
                            <option value="초급" ${salesCostStatus.career_level == '초급' ? 'selected' : ''}>초급</option>
                            <option value="중급" ${salesCostStatus.career_level == '중급' ? 'selected' : ''}>중급</option>
                            <option value="고급" ${salesCostStatus.career_level == '고급' ? 'selected' : ''}>고급</option>
                            <option value="특급" ${salesCostStatus.career_level == '특급' ? 'selected' : ''}>특급</option>
                        </select>
                    </div>
               		<hr>
                    <div class="form-group mb-3">
                        <label for="assign_date">투입일 <span class="text-danger">*</span> :</label>
                        <input type="date" class="form-control" id="assign_date" name="assign_date" value="${salesCostStatus.assign_date}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="end_date">종료일 <span class="text-danger">*</span> :</label>
                        <input type="date" class="form-control" id="end_date" name="end_date" value="${salesCostStatus.end_date}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="resign_date">철수날짜 <span class="text-danger">*</span> :</label>
                        <input type="date" class="form-control" id="resign_date" name="resign_date" value="${salesCostStatus.resign_date}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="sales_unit">매출단가<span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="sales_unit" name="sales_unit" value="${salesCostStatus.sales_unit}" data-type="money">
                    </div>
                    <div class="form-group mb-3">
                        <label for="sales_mm">청구율(%)<span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="sales_mm" name="sales_mm" value="${salesCostStatus.sales_mm}">
                    </div>
                    <div class="form-group mb-3">
                        <label for="sales_amount">청구금액:</label>
                        <input type="text" class="form-control" id="sales_amount" name="sales_amount" value="${salesCostStatus.sales_amount}" readonly>
                    </div>
                    <div class="form-group mb-3">
                        <label for="purchase_unit">원가단가<span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="purchase_unit" name="purchase_unit" value="${salesCostStatus.purchase_unit}" data-type="money">
                    </div>
                    <div class="form-group mb-3">
                        <label for="purchase_amount">M/M원가:</label>
                        <input type="text" class="form-control" id="purchase_amount" name="purchase_amount" value="${salesCostStatus.purchase_amount}" readonly>
                    </div>
                    <div class="form-group mb-3">
                        <label for="profit">이익:</label>
                        <input type="text" class="form-control" id="profit" name="profit" value="${salesCostStatus.profit}" readonly>
                    </div>
                    <div class="form-group mb-3">
                        <label for="profit_rate">이익율(%):</label>
                        <input type="text" class="form-control" id="profit_rate" name="profit_rate" value="${salesCostStatus.profit_rate}" readonly>
                    </div>
                    <div class="form-group mb-3">
                        <label for="rate">비율:</label>
                        <input type="text" class="form-control" id="rate" name="rate" value="${salesCostStatus.rate}" readonly>
                    </div>
                    <div class="form-group mb-3">
                        <label for="brief">특이사항:</label>
                        <input type="text" class="form-control" id=brief name="brief" value="${salesCostStatus.brief}">
                    </div>

                </form>

				<div class="row">
	                <div class="text-frist">
		                <button type="button" class="btn btn-primary" id="btnUpdate">수정</button>
	                </div>
				</div>
            </div>
        </section>
    
    </main><!-- End #main -->

    <script>
        $(document).ready(function() {
        	// 상세 초기값 세팅
			(function init() {
				$('#auto_mm').val(floatUtils.formatRatio('${salesCostStatus.auto_mm}'));
				$('#sales_unit').val(moneyUtils.commaFormatting('${salesCostStatus.sales_unit}'));
				$('#sales_mm').val(floatUtils.formatRatio('${salesCostStatus.sales_mm}'));
				$('#sales_amount').val(moneyUtils.commaFormatting('${salesCostStatus.sales_amount}'));
				$('#purchase_mm').val(floatUtils.formatRatio('${salesCostStatus.purchase_mm}'));
				$('#purchase_unit').val(moneyUtils.commaFormatting('${salesCostStatus.purchase_unit}'));
				$('#purchase_amount').val(moneyUtils.commaFormatting('${salesCostStatus.purchase_amount}'));
				$('#profit').val(moneyUtils.commaFormatting('${salesCostStatus.profit}'));
				$('#profit_rate').val(floatUtils.formatRatio('${salesCostStatus.profit_rate}'));
				$('#rate').val(floatUtils.formatRatio('${salesCostStatus.rate}'));
			})()
			
			// 값 변경에 따른 계산반영
			$('#purchase_mm, #purchase_unit, #sales_mm, #sales_unit').change(function updateValues() {
			    let sales_mm = Number($('#sales_mm').val()) / 100;
			    let purchase_mm = Number($('#purchase_mm').val());
			    let sales_unit = Number($('#sales_unit').val().replaceAll(',', ''));
			    let purchase_unit = Number($('#purchase_unit').val().replaceAll(',', ''));

			    $('#sales_amount').val(moneyUtils.commaFormatting(sales_mm * sales_unit));
			    $('#purchase_amount').val(moneyUtils.commaFormatting(purchase_mm * purchase_unit));
			    $('#profit').val(moneyUtils.commaFormatting(sales_mm * sales_unit - purchase_mm * purchase_unit));
			    $('#profit_rate').val(floatUtils.formatRatio((sales_mm * sales_unit - purchase_mm * purchase_unit) / (sales_mm * sales_unit) * 100));
			    $('#rate').val(floatUtils.formatRatio((sales_mm * sales_unit) / (purchase_mm * purchase_unit)));
			});
			
        	
        	$('#btnUpdate').click(function() {
        		let requestMap = {
       				emp_id : '${salesCostStatus.emp_id}',
       				emp_pool_id : '${salesCostStatus.emp_pool_id}',
       				site : $('#site').val(),
       				client : $('#client').val(),
       				project_name : $('#project_name').val(),
       				purchase_mm : Number(floatUtils.formatRatio($('#purchase_mm').val())),
       				name : $('#name').val(),
       				career_years : $('#career_years').val(),
       				career_field : $('#career_field').val(),
       				career_level : $('#career_level').val(),
       				assign_date : $('#assign_date').val(),
       				end_date : $('#end_date').val(),
       				resign_date :$('#resign_date').val(),
       				sales_unit : Number($('#sales_unit').val().replaceAll(',', '')),
       				sales_mm : floatUtils.formatRatio(Number($('#sales_mm').val()) / 100),
       				purchase_unit : Number($('#purchase_unit').val().replaceAll(',', '')),
       				brief : $('#brief').val(),
        		}
        		
                $.ajax({
                    type: "PUT",
                    url: "${pageContext.request.contextPath}/salesCostStatus.ajax",
                    contentType: "application/json",
                    data: JSON.stringify(requestMap),
                    success: function() {
                    	alert('해당 매출원가현황 정보를 수정하였습니다')
                        opener.parent.location.reload();
                        window.location.reload();
                    },
                    error: function() {
                    	alert("내부 서버 오류입니다. 잠시 후 시도해주세요.");
                        opener.parent.location.reload();
                    }
                });
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
            

        });

    </script>    