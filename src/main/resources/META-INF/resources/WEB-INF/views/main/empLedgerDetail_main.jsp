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
                
                <h1>${company} ${department_kr} 인력기초원장 상세 페이지</h1>
                <form id="empLedgerForm">
                    <div class="form-group mb-3">
                        <label for="progress">진행 <span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="progress" name="progress" readonly>
                    </div>
                    
                    <div class="form-group mb-3">
                        <label for="progress_reason">진행사유:</label>
                        <input type="text" class="form-control" id="progress_reason" name="progress_reason">
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
                        <label for="site">사이트명: <span class="text-danger">*</span> </label>
                        <input type="text" class="form-control" id="site" name="site">
                    </div>
                    <div class="form-group mb-3">
                        <label for="client">진행업체 <span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="client" name="client">
                    </div>
                    <div class="form-group mb-3">
                        <label for="project_name">프로젝트명 <span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="project_name" name="project_name">
                    </div>
                    <div class="form-group mb-3">
                        <label for="brief">적요란</label>
                        <input type="text" class="form-control" id="brief" name="brief">
                    </div>
                	<hr>
                    <div class="form-group mb-3">
                        <label for="sourcingManager">소싱담당자:</label>
                        <input type="text" class="form-control" id="sourcing_manager" name="sourcing_manager">
                    </div>
                    <div class="form-group mb-3">
                        <label for="name">이름 <span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="name" name="name" readonly>
                    </div>
                    <div class="form-group mb-3">
                        <label for="phoneNumber">전화번호 <span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="display-phonenumber" name="display-phonenumber" readonly>
                        <input type="hidden" class="form-control" id="phonenumber" name="phonenumber">
                    </div>
                    <div class="form-group mb-3">
                        <label for="birthdate">생년월일:</label>
                        <input type="date" class="form-control" id="birthdate" name="birthdate">
                    </div>
                    <div class="form-group mb-3">
                        <label for="email">이메일:</label>
                        <input type="text" class="form-control" id="email" name="email">
                    </div>
                    <div class="form-group mb-3">
                        <label for="address">주소:</label>
                        <input type="text" class="form-control" id="address" name="address">
                    </div>
                    <div class="form-group mb-3">
                        <label for="education">학력:</label>
                        <select class="form-control" id="education" name="education">
                            <option value="미기입">미기입</option>
                            <option value="고졸">고졸</option>
                            <option value="전문졸">전문졸</option>
                            <option value="대졸">대졸</option>
                            <option value="석사">석사</option>
                            <option value="박사">박사</option>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label for="school_name">학교명:</label>
                        <input type="text" class="form-control" id="school_name" name="school_name">
                    </div>
                    <div class="form-group mb-3">
                        <label for="major">학과:</label>
                        <input type="text" class="form-control" id="major" name="major">
                    </div>
                    <div class="form-group mb-3">
                        <label for="career_years">경력:</label>
                        <input type="text" class="form-control" id="career_years" name="career_years">
                    </div>
                    <div class="form-group mb-3">
                        <label for="career_field">분야:</label>
                        <input type="text" class="form-control" id="career_field" name="career_field">
                    </div>
                    <div class="form-group mb-3">
                        <label for="career_level">등급:</label>
                        <select class="form-control" id="career_level" name="career_level">
                            <option value="미기입">미기입</option>
                            <option value="초급">초급</option>
                            <option value="중급">중급</option>
                            <option value="고급">고급</option>
                            <option value="특급">특급</option>
                        </select>
                    </div>
               		<hr>
                    <div class="form-group mb-3">
                        <label for="assign_date">투입일 <span class="text-danger">*</span> :</label>
                        <input type="date" class="form-control" id="assign_date" name="assign_date">
                    </div>
                    <div class="form-group mb-3">
                        <label for="end_date">종료일 <span class="text-danger">*</span> :</label>
                        <input type="date" class="form-control" id="end_date" name="end_date">
                    </div>
                    <div class="form-group mb-3">
                        <label for="resign_date">철수날짜 <span class="text-danger">*</span> :</label>
                        <input type="date" class="form-control" id="resign_date" name="resign_date">
                    </div>
                    <div class="form-group mb-3">
                        <label for="sales_mm">매출MM <span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="sales_mm" name="sales_mm">
                    </div>
                    <div class="form-group mb-3">
                        <label for="purchase_mm">매입MM <span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="purchase_mm" name="purchase_mm">
                    </div>
                    <div class="form-group mb-3">
                        <label for="sales_unit">매출단가(원) <span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="sales_unit" name="sales_unit" data-type="money">
                    </div>
                    <div class="form-group mb-3">
                        <label for="purchase_unit">매입단가(원) <span class="text-danger">*</span> :</label>
                        <input type="text" class="form-control" id="purchase_unit" name="purchase_unit" data-type="money">
                    </div>
                    <div class="form-group mb-3">
                        <label for="resume_submit_date">이력서제출일자:</label>
                        <input type="date" class="form-control" id="resume_submit_date" name="resume_submit_date">
                    </div>
                    <div class="form-group mb-3">
                        <label for="i_contract_date">개인계약일:</label>
                        <input type="date" class="form-control" id="i_contract_date" name="i_contract_date">
                    </div>
                    <div class="form-group mb-3">
                        <label for="c_contract_date">업체계약일:</label>
                        <input type="date" class="form-control" id="c_contract_date" name="c_contract_date">
                    </div>
                    <div class="form-group mb-3">
                        <label for="issues">특이사항:</label>
                        <input type="text" class="form-control" id="issues" name="issues">
                    </div>

                </form>

				<div class="row">
	                <div class="text-frist">
		                <button type="button" class="btn btn-primary" id="btnUpdate">수정</button>
		                <button type="button" class="btn btn-danger float-end" id="btnDelete" title="드랍된 인력만 삭제가 가능합니다">삭제</button>
	                </div>
					<div class="text-center">
		                <button type="button" class="btn btn-primary" id="btnConfirm" title="투입확정시 해당인력이 매출원장에 또한 반영됩니다">투입확정</button>
		                <button type="button" class="btn btn-danger " id="btnDrop" title="면접에서 드랍된 인력일 때 이용하세요.">드랍</button>
		                <button type="button" class="btn btn-danger " id="btnResign" title="해당 인력이 프로젝트에서 철수할 때 이용하세요. 철수일이 포함된 달까지 매출실적에 반영됩니다.">철수</button>
					</div>
					<div class="text-end">
		                <button type="button" class="btn btn-danger" id="btnForceDelete" title="강제삭제시 매출원장데이터도 강제로 삭제됩니다. 실수로 투입을 확정하였거나 이미 지급이 끝난 철수자일 때 이용하세요.">강제삭제</button>
					</div>
				</div>
            </div>
        </section>
    
    </main><!-- End #main -->

    <script>
        $(document).ready(function() {
            const urlParmas = new URLSearchParams(window.location.search);
            const emp_Id = urlParmas.get('emp_id'); 
            // ajax 1: empLedger 상세정보 조회
            $.ajax({
                url: '${pageContext.request.contextPath}/empLedger.ajax/' + emp_Id,
                type: 'GET',
                dataType: 'json',
                success: function(empLedger) {
                    if (empLedger.progress === '투입예정') {
                    	$('#btnForceDelete').css('visibility', 'hidden')
                    	$('#btnResign').css('visibility', 'hidden')
                    }
                    if (empLedger.progress === '드랍') {
                        $('#btnDrop').attr('disabled', true)
                        $('#btnConfirm').css('visibility', 'hidden')
                        $('#btnResign').css('visibility', 'hidden')
                        $('#btnForceDelete').css('visibility', 'hidden')
                    }
                    if (empLedger.progress === '투입') {
                        $('#btnConfirm').attr('disabled', true)
                        $('#btnDrop').css('visibility', 'hidden')
                        $('#btnDelete').css('visibility', 'hidden')
                    }
                    if (empLedger.progress === '철수') {
                        $('#btnResign').attr('disabled', true)
                        $('#btnConfirm').css('visibility', 'hidden')
                        $('#btnDrop').css('visibility', 'hidden')
                        $('#btnDelete').css('visibility', 'hidden')
                    }
                    
                    // Date 년월일 Formatting
                    empLedger.assign_date = dateUtils.formatYYYYMMDD(empLedger.assign_date, '-');
                    // Date 년월일 Formatting
                    empLedger.end_date = dateUtils.formatYYYYMMDD(empLedger.end_date, '-');
                    // Date 년월일 Formatting
                    empLedger.resume_submit_date = dateUtils.formatYYYYMMDD(empLedger.resume_submit_date, '-');
                    // Date 년월일 Formatting
                    empLedger.resign_date = dateUtils.formatYYYYMMDD(empLedger.resign_date, '-');
                    // Date 년월일 Formatting
                    empLedger.i_contract_date = dateUtils.formatYYYYMMDD(empLedger.i_contract_date, '-');
                    // Date 년월일 Formatting
                    empLedger.c_contract_date = dateUtils.formatYYYYMMDD(empLedger.c_contract_date, '-');

                    

                    $('#emp_id').val(empLedger.emp_id);
                    $('#emp_pool_id').val(empLedger.emp_pool_id);
                    $('#assign_date').val(empLedger.assign_date);
                    $('#end_date').val(empLedger.end_date);
                    $('#sales_mm').val(empLedger.sales_mm);
                    $('#purchase_mm').val(empLedger.purchase_mm);
                    $('#sales_unit').val(empLedger.sales_unit.toLocaleString('ko-KR'));
                    $('#purchase_unit').val(empLedger.purchase_unit.toLocaleString('ko-KR'));
                    $('#comments').val(empLedger.comments);
                    $('#resume_submit_date').val(empLedger.resume_submit_date);
                    $('#resign_date').val(empLedger.resign_date);
                    $('#i_contract_date').val(empLedger.i_contract_date);
                    $('#c_contract_date').val(empLedger.c_contract_date);
                    $('#progress').val(empLedger.progress);
                    $('#progress_reason').val(empLedger.progress_reason);
                    $('#issues').val(empLedger.issues);
                    $('#site').val(empLedger.site);
                    $('#client').val(empLedger.client);
                    $('#project_name').val(empLedger.project_name);
                    $('#brief').val(empLedger.brief);

                    // ajax 2: empPool 상세정보 조회
                    $.ajax({
                        url: '${pageContext.request.contextPath}/empPool.ajax/' + empLedger.emp_pool_id,
                        type: 'GET',
                        dataType: 'json',
                        success: function(empPool) {
                            // 생년월일 Formatting
                            empPool.birthdate = dateUtils.formatYYYYMMDD(empPool.birthdate, '-');

                            $('#emp_pool_id').val(empPool.emp_pool_id);
                            $('#sourcing_manager').val(empPool.sourcing_manager);
                            $('#name').val(empPool.name);
                            $('#display-phonenumber').val(phoneUtils.formatPhoneNumber(empPool.phonenumber));
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
                            $('#hope_purchase_unit').val(empPool.hope_purchase_unit);
                            
                        }
                    })

                },
                error: function(xhr, status, error) {
                    
                }
            });


            $('#btnConfirm').click(function() {
				
            	// 필수값 체크
            	if (!$('#company').val()) {
            		$('#company').focus();
            		alert('인력의 소속을 입력해주셔야합니다');
            		return;
            	} else if (!$('#department').val()) {
            		$('#department').focus();
            		alert('인력의 사업부서를 입력해주셔야합니다');
            		return;
            	} else if (!$('#site').val()) {
            		$('#site').focus();
            		alert('인력의 사이트명을 입력해주셔야합니다');
            		return;
            	} else if (!$('#client').val()) {
            		$('#client').focus();
            		alert('인력의 진행업체(고객사)를 입력해주셔야합니다');
            		return;
            	} else if (!$('#project_name').val()) {
            		$('#project_name').focus();
            		alert('인력의 프로젝트명을 입력해주셔야합니다');
            		return;
            	} else if (!$('#assign_date').val()) {
            		$('#assign_date').focus();
            		alert('인력의 투입일을 입력해주셔야합니다');
            		return;
            	} else if (!$('#end_date').val()) {
            		$('#end_date').focus();
            		alert('인력의 종료일을 입력해주셔야합니다');
            		return;
            	} else if (!$('#resign_date').val()) {
            		$('#resign_date').focus();
            		alert('인력의 철수날짜를 입력해주셔야합니다');
            		return;
            	} else if (!$('#sales_mm').val()) {
            		$('#sales_mm').focus();
            		alert('인력의 매출MM을 입력해주셔야합니다');
            		return;
            	} else if (!$('#purchase_mm').val()) {
            		$('#purchase_mm').focus();
            		alert('인력의 매입MM을 입력해주셔야합니다');
            		return;
            	} else if (!$('#sales_unit').val()) {
            		$('#sales_unit').focus();
            		alert('인력의 매출단가 입력해주셔야합니다');
            		return;
            	} else if (!$('#purchase_unit').val()) {
            		$('#purchase_unit').focus();
            		alert('인력의 매입단가을 입력해주셔야합니다');
            		return;
            	}
               	const jsonObject = {
                       "empLedger": {
                           "emp_id": $('input[name=emp_id]').val(),
                           "emp_pool_id": $('input[name=emp_pool_id]').val(),
                           "client_id": $('input[name=client_id]').val(),
                           "company": $('input[name=company]').val(),
                           "department": $('input[name=department]').val(),
                           "assign_date": new Date($('input[name=assign_date]').val()),
                           "end_date": new Date($('input[name=end_date]').val()),
                           "sales_mm": $('input[name=sales_mm]').val() ? $('input[name=sales_mm]').val() : 0,
                           "purchase_mm": $('input[name=purchase_mm]').val() ? $('input[name=purchase_mm]').val() : 0,
                           "sales_unit": $('input[name=sales_unit]').val().replaceAll(',', '') ? $('input[name=sales_unit]').val().replaceAll(',', '') : 0,
                           "purchase_unit": $('input[name=purchase_unit]').val().replaceAll(',', '') ? $('input[name=purchase_unit]').val().replaceAll(',', '') : 0,
                           "comments": $('input[name=comments]').val(),
                           "resume_submit_date": new Date($('input[name=resume_submit_date]').val()),
                           "resign_date": new Date($('input[name=resign_date]').val()),
                           "i_contract_date": new Date($('input[name=i_contract_date]').val()),
                           "c_contract_date": new Date($('input[name=c_contract_date]').val()),
                           "progress": '투입',
                           "progress_reason": $('input[name=progress_reason]').val(),
                           "issues": $('input[name=issues]').val(),
                           "include": $('input[name=include]').val(),
                           "site": $('input[name=site]').val(),
                           "client": $('input[name=client]').val(),
                           "project_name": $('input[name=project_name]').val(),
                           "brief": $('input[name=brief]').val(),
                       },
                       "empPool": {
                           "sourcing_manager": $('input[name=sourcing_manager]').val(),
                           "name": $('input[name=name]').val(),
                           "phonenumber": $('input[name=phonenumber]').val(),
                           "birthdate": new Date($('input[name=birthdate]').val()),
                           "email": $('input[name=email]').val(),
                           "address": $('input[name=address]').val(),
                           "education": $('select[name=education]').val(),
                           "school_name": $('input[name=school_name]').val(),
                           "major": $('input[name=major]').val(),
                           "career_years": $('input[name=career_years]').val(),
                           "career_field": $('input[name=career_field]').val(),
                           "career_level": $('select[name=career_level]').val(),
                           "project_assign": $('input[name=project_assign]').val(),
                           "del": $('input[name=del]').val(),
                           "hope_purchase_unit": $('input[name=hope_purchase_unit]').val(),
                       }
                   }
                	
                $.ajax({
                    type: "PUT",
                    url: "${pageContext.request.contextPath}/empLedger.ajax",
                    contentType: "application/json",
                    data: JSON.stringify(jsonObject),
                    success: function () {
                    	alert('해당 인력의 투입이 확정이 되어 매출원장에 등록되었습니다')
                        opener.parent.location.reload()
                        window.location.reload()
                    },
                    error: function () {
                        opener.parent.location.reload()
                        window.close()
                    }
                })


            })

            $('#btnDrop').click(function() {
                const emp_id = $('#emp_id').val();
                
         	   const progressMap = {
           			   "emp_id": $('input[name=emp_id]').val(), 
           			   "progress": '드랍', 
           			   "progress_reason": $('input[name=progress_reason]').val(), 
            	   }

                $.ajax({
                    type: 'PATCH',
                    url: '${pageContext.request.contextPath}/empLedger.ajax/' + emp_id + '/progress',
                    contentType: "application/json",
                    data: JSON.stringify(progressMap),
                    success: function() {
                       	alert('해당 인력의 투입을 드랍하였습니다')
                       	opener.parent.location.reload()
                        window.location.reload()
                                
                    },
                    error: function() {
                    	opener.parent.location.reload()
                        window.location.reload()
                    }
                });

                

                
            });


            $('#btnUpdate').click(function(){
            	// 필수값 체크
            	if (!$('#company').val()) {
            		$('#company').focus();
            		alert('인력의 소속을 입력해주셔야합니다');
            		return;
            	} else if (!$('#department').val()) {
            		$('#department').focus();
            		alert('인력의 사업부서를 입력해주셔야합니다');
            		return;
            	} else if (!$('#site').val()) {
            		$('#site').focus();
            		alert('인력의 사이트명을 입력해주셔야합니다');
            		return;
            	} else if (!$('#client').val()) {
            		$('#client').focus();
            		alert('인력의 진행업체(고객사)를 입력해주셔야합니다');
            		return;
            	} else if (!$('#project_name').val()) {
            		$('#project_name').focus();
            		alert('인력의 프로젝트명을 입력해주셔야합니다');
            		return;
            	} else if (!$('#assign_date').val()) {
            		$('#assign_date').focus();
            		alert('인력의 투입일을 입력해주셔야합니다');
            		return;
            	} else if (!$('#end_date').val()) {
            		$('#end_date').focus();
            		alert('인력의 종료일을 입력해주셔야합니다');
            		return;
            	} else if (!$('#resign_date').val()) {
            		$('#resign_date').focus();
            		alert('인력의 철수날짜를 입력해주셔야합니다');
            		return;
            	} else if (!$('#sales_mm').val()) {
            		$('#sales_mm').focus();
            		alert('인력의 매출MM을 입력해주셔야합니다');
            		return;
            	} else if (!$('#purchase_mm').val()) {
            		$('#purchase_mm').focus();
            		alert('인력의 매입MM을 입력해주셔야합니다');
            		return;
            	} else if (!$('#sales_unit').val()) {
            		$('#sales_unit').focus();
            		alert('인력의 매출단가 입력해주셔야합니다');
            		return;
            	} else if (!$('#purchase_unit').val()) {
            		$('#purchase_unit').focus();
            		alert('인력의 매입단가을 입력해주셔야합니다');
            		return;
            	}
            	
                const jsonObject = {
                    "empLedger": {
                        "emp_id": $('input[name=emp_id]').val(),
                        "emp_pool_id": $('input[name=emp_pool_id]').val(),
                        "client_id": $('input[name=client_id]').val(),
                        "company": $('input[name=company]').val(),
                        "department": $('input[name=department]').val(),
                        "assign_date": new Date($('input[name=assign_date]').val()),
                        "end_date": new Date($('input[name=end_date]').val()),
                        "sales_mm": $('input[name=sales_mm]').val() ? $('input[name=sales_mm]').val() : 0,
                        "purchase_mm": $('input[name=purchase_mm]').val() ? $('input[name=purchase_mm]').val() : 0,
                        "sales_unit": $('input[name=sales_unit]').val().replaceAll(',', '') ? $('input[name=sales_unit]').val().replaceAll(',', '') : 0,
                        "purchase_unit": $('input[name=purchase_unit]').val().replaceAll(',', '') ? $('input[name=purchase_unit]').val().replaceAll(',', '') : 0,
                        "comments": $('input[name=comments]').val(),
                        "resume_submit_date": new Date($('input[name=resume_submit_date]').val()),
                        "resign_date": new Date($('input[name=resign_date]').val()),
                        "i_contract_date": new Date($('input[name=i_contract_date]').val()),
                        "c_contract_date": new Date($('input[name=c_contract_date]').val()),
                        "progress": $('input[name=progress]').val(),
                        "progress_reason": $('input[name=progress_reason]').val(),
                        "issues": $('input[name=issues]').val(),
                        "include": $('input[name=include]').val(),
                        "site": $('input[name=site]').val(),
                        "client": $('input[name=client]').val(),
                        "project_name": $('input[name=project_name]').val(),
                        "brief": $('input[name=brief]').val(),
                    },
                    "empPool": {
                        "sourcing_manager": $('input[name=sourcing_manager]').val(),
                        "name": $('input[name=name]').val(),
                        "phonenumber": $('input[name=phonenumber]').val(),
                        "birthdate": new Date($('input[name=birthdate]').val()),
                        "email": $('input[name=email]').val(),
                        "address": $('input[name=address]').val(),
                        "education": $('select[name=education]').val(),
                        "school_name": $('input[name=school_name]').val(),
                        "major": $('input[name=major]').val(),
                        "career_years": $('input[name=career_years]').val(),
                        "career_field": $('input[name=career_field]').val(),
                        "career_level": $('select[name=career_level]').val(),
                        "project_assign": $('input[name=project_assign]').val(),
                        "del": $('input[name=del]').val(),
                        "hope_purchase_unit": $('input[name=hope_purchase_unit]').val(),
                    }
                }
                $.ajax({
                    type: "PUT",
                    url: "${pageContext.request.contextPath}/empLedger.ajax",
                    contentType: "application/json",
                    data: JSON.stringify(jsonObject),
                    success: function() {
                    	alert('해당 인력원장 정보를 수정하였습니다')
                        opener.parent.location.reload();
                        window.location.reload();
                    },
                    error: function() {
                        opener.parent.location.reload();
                        window.close();
                    }
                });
            });

            $('#btnDelete').click(function() {
                const emp_id = $('#emp_id').val();
                const del = 'Y';

                if ($('#progress').val() === '드랍') {
                    $.ajax({
                        type: 'PATCH',
                        url: '${pageContext.request.contextPath}/empLedger.ajax/' + emp_id + '/del/' + del,
                        success: function () {
                        	alert('해당 인력원장 정보를 삭제하였습니다')
                            opener.parent.location.reload();
                            window.close();
                        },
                        error: function () {
                            opener.parent.location.reload();
                            window.close();
                        }
                    });
                } else {
                    alert($('#name').val() + '은(는) 드랍되어 있지 않아 ' + $('#company').val() + ' - ' + $('#department').val() + ' 인력원장에서 삭제할 수 없습니다.');
                }
            })
            
            $('#btnForceDelete').click(function () {
            	const emp_id = $('#emp_id').val();
                const del = 'Y';
                if (confirm("강제삭제 시 인력원장 뿐만 아니라 연관된 매출원장의 데이터도 함께 삭제됩니다. 정말로 강제삭제하겠습니까?")) {
                	$.ajax({
    					type: 'PATCH',
    					url: '${pageContext.request.contextPath}/empLedger.ajax/' + emp_id + '/ForceDel/' + del,
    					success: function () {
    						alert('해당 인력의 인력원장 및 매출원장 데이터를 강제삭제하였습니다')
                            opener.parent.location.reload();
                            window.close();
                        },
                        error: function () {
                            opener.parent.location.reload();
                            window.close();
                        }
    				});
           		} else {
           			
           		}
				
			});
            
            $('#btnResign').click(function() {
            	
            	const emp_id = $('#emp_id').val();
            	
            	// 필수값 체크
            	if (!$('#company').val()) {
            		$('#company').focus();
            		alert('인력의 소속을 입력해주셔야합니다');
            		return;
            	} else if (!$('#department').val()) {
            		$('#department').focus();
            		alert('인력의 사업부서를 입력해주셔야합니다');
            		return;
            	} else if (!$('#site').val()) {
            		$('#site').focus();
            		alert('인력의 사이트명을 입력해주셔야합니다');
            		return;
            	} else if (!$('#client').val()) {
            		$('#client').focus();
            		alert('인력의 진행업체(고객사)를 입력해주셔야합니다');
            		return;
            	} else if (!$('#project_name').val()) {
            		$('#project_name').focus();
            		alert('인력의 프로젝트명을 입력해주셔야합니다');
            		return;
            	} else if (!$('#assign_date').val()) {
            		$('#assign_date').focus();
            		alert('인력의 투입일을 입력해주셔야합니다');
            		return;
            	} else if (!$('#end_date').val()) {
            		$('#end_date').focus();
            		alert('인력의 종료일을 입력해주셔야합니다');
            		return;
            	} else if (!$('#resign_date').val()) {
            		$('#resign_date').focus();
            		alert('인력의 철수날짜를 입력해주셔야합니다');
            		return;
            	} else if (!$('#sales_mm').val()) {
            		$('#sales_mm').focus();
            		alert('인력의 매출MM을 입력해주셔야합니다');
            		return;
            	} else if (!$('#purchase_mm').val()) {
            		$('#purchase_mm').focus();
            		alert('인력의 매입MM을 입력해주셔야합니다');
            		return;
            	} else if (!$('#sales_unit').val()) {
            		$('#sales_unit').focus();
            		alert('인력의 매출단가 입력해주셔야합니다');
            		return;
            	} else if (!$('#purchase_unit').val()) {
            		$('#purchase_unit').focus();
            		alert('인력의 매입단가을 입력해주셔야합니다');
            		return;
            	}
            	
            	if (!confirm('해당 인력의 철수 날짜가 ' + $('input[name=resign_date]').val() + '이 맞습니까?')) {
            		alert('철수 날짜를 수정해주세요');
            		return;
				}
            	
            	const jsonObject = {
                   "empLedger": {
                       "emp_id": $('input[name=emp_id]').val(),
                       "emp_pool_id": $('input[name=emp_pool_id]').val(),
                       "client_id": $('input[name=client_id]').val(),
                       "company": $('input[name=company]').val(),
                       "department": $('input[name=department]').val(),
                       "assign_date": new Date($('input[name=assign_date]').val()),
                       "end_date": new Date($('input[name=end_date]').val()),
                       "sales_mm": $('input[name=sales_mm]').val() ? $('input[name=sales_mm]').val() : 0,
                       "purchase_mm": $('input[name=purchase_mm]').val() ? $('input[name=purchase_mm]').val() : 0,
                       "sales_unit": $('input[name=sales_unit]').val().replaceAll(',', '') ? $('input[name=sales_unit]').val().replaceAll(',', '') : 0,
                       "purchase_unit": $('input[name=purchase_unit]').val().replaceAll(',', '') ? $('input[name=purchase_unit]').val().replaceAll(',', '') : 0,
                       "comments": $('input[name=comments]').val(),
                       "resume_submit_date": new Date($('input[name=resume_submit_date]').val()),
                       "resign_date": new Date($('input[name=resign_date]').val()),
                       "i_contract_date": new Date($('input[name=i_contract_date]').val()),
                       "c_contract_date": new Date($('input[name=c_contract_date]').val()),
                       "progress": '철수',
                       "progress_reason": $('input[name=progress_reason]').val(),
                       "issues": $('input[name=issues]').val(),
                       "include": $('input[name=include]').val(),
                       "site": $('input[name=site]').val(),
                       "client": $('input[name=client]').val(),
                       "project_name": $('input[name=project_name]').val(),
                       "brief": $('input[name=brief]').val(),
                   },
                   "empPool": {
                       "sourcing_manager": $('input[name=sourcing_manager]').val(),
                       "name": $('input[name=name]').val(),
                       "phonenumber": $('input[name=phonenumber]').val(),
                       "birthdate": new Date($('input[name=birthdate]').val()),
                       "email": $('input[name=email]').val(),
                       "address": $('input[name=address]').val(),
                       "education": $('select[name=education]').val(),
                       "school_name": $('input[name=school_name]').val(),
                       "major": $('input[name=major]').val(),
                       "career_years": $('input[name=career_years]').val(),
                       "career_field": $('input[name=career_field]').val(),
                       "career_level": $('select[name=career_level]').val(),
                       "project_assign": $('input[name=project_assign]').val(),
                       "del": $('input[name=del]').val(),
                       "hope_purchase_unit": $('input[name=hope_purchase_unit]').val(),
                   }
               }
            	
               $.ajax({
                   type: "PUT",
                   url: "${pageContext.request.contextPath}/empLedger.ajax",
                   contentType: "application/json",
                   data: JSON.stringify(jsonObject),
                   success: function() {
                	   alert('해당 인력을 철수하였습니다')
                	   opener.parent.location.reload()
                       window.location.reload()
                   },
                   error: function() {
                       opener.parent.location.reload();
                       window.close();
                   }
               });

                
			});
            
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
            
            $('#btnDelete').tooltip();
            $('#btnConfirm').tooltip();
            $('#btnDrop').tooltip();
            $('#btnForceDelete').tooltip();
            $('#btnResign').tooltip();

        });

    </script>    