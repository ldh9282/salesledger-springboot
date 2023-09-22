<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/icon/favicon.ico">
    <title>IYCNC IDC 인력기초원장 상세페이지: IYF 영업관리시스템</title>

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
                <input type="hidden" id="emp_id" name="emp_id">
                <input type="hidden" id="emp_pool_id" name="emp_pool_id">
                <input type="hidden" id="project_assign" name="project_assign">
                <input type="hidden" id="del" name="del">
                <input type="hidden" id="hope_purchase_unit" name="hope_purchase_unit">
                
                <h1>IYCNC IDC 인력기초원장 상세 페이지</h1>
                <form id="empLedgerForm">
                    <div class="form-group mb-3">
                        <label for="progress">진행:</label>
                        <input type="text" class="form-control" id="progress" name="progress" readonly>
                    </div>
                    
                    <div class="form-group mb-3">
                        <label for="progress_reason">진행사유:</label>
                        <input type="text" class="form-control" id="progress_reason" name="progress_reason">
                    </div>
                    <div class="form-group mb-3">
                        <label for="company">소속:</label>
                        <input type="text" class="form-control" id="company" name="company" value="IYCNC" readonly>
                    </div>
                    <div class="form-group mb-3">
                        <label for="department">사업부서:</label>
                        <input type="text" class="form-control" id="department" name="department" value="IDC" readonly>
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
                        <label for="sourcingManager">소싱담당자:</label>
                        <input type="text" class="form-control" id="sourcing_manager" name="sourcing_manager">
                    </div>
                    <div class="form-group mb-3">
                        <label for="name">이름:</label>
                        <input type="text" class="form-control" id="name" name="name">
                    </div>
                    <div class="form-group mb-3">
                        <label for="phoneNumber">전화번호:</label>
                        <input type="text" class="form-control" id="phonenumber" name="phonenumber">
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
                        <label for="assign_date">투입일:</label>
                        <input type="date" class="form-control" id="assign_date" name="assign_date">
                    </div>
                    <div class="form-group mb-3">
                        <label for="end_date">종료일:</label>
                        <input type="date" class="form-control" id="end_date" name="end_date">
                    </div>
                    <div class="form-group mb-3">
                        <label for="resign_date">철수날짜:</label>
                        <input type="date" class="form-control" id="resign_date" name="resign_date">
                    </div>
                    <div class="form-group mb-3">
                        <label for="sales_mm">매출MM:</label>
                        <input type="text" class="form-control" id="sales_mm" name="sales_mm">
                    </div>
                    <div class="form-group mb-3">
                        <label for="purchase_mm">매입MM:</label>
                        <input type="text" class="form-control" id="purchase_mm" name="purchase_mm">
                    </div>
                    <div class="form-group mb-3">
                        <label for="sales_unit">매출단가(원):</label>
                        <input type="text" class="form-control" id="sales_unit" name="sales_unit" data-type="money">
                    </div>
                    <div class="form-group mb-3">
                        <label for="purchase_unit">매입단가(원):</label>
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
                    const assign_date = new Date(empLedger.assign_date);
                    empLedger.assign_date = assign_date.getFullYear() + '-' + String(Number(assign_date.getMonth() + 1)).padStart(2, '0') + '-' + String(assign_date.getDate()).padStart(2, '0');
                    // Date 년월일 Formatting
                    const end_date = new Date(empLedger.end_date);
                    empLedger.end_date = end_date.getFullYear() + '-' + String(Number(end_date.getMonth() + 1)).padStart(2, '0') + '-' + String(end_date.getDate()).padStart(2, '0');
                    // Date 년월일 Formatting
                    const resume_submit_date = new Date(empLedger.resume_submit_date);
                    empLedger.resume_submit_date = resume_submit_date.getFullYear() + '-' + String(Number(resume_submit_date.getMonth() + 1)).padStart(2, '0') + '-' + String(resume_submit_date.getDate()).padStart(2, '0');
                    // Date 년월일 Formatting
                    const resign_date = new Date(empLedger.resign_date);
                    empLedger.resign_date = resign_date.getFullYear() + '-' + String(Number(resign_date.getMonth() + 1)).padStart(2, '0') + '-' + String(resign_date.getDate()).padStart(2, '0');
                    // Date 년월일 Formatting
                    const i_contract_date = new Date(empLedger.i_contract_date);
                    empLedger.i_contract_date = i_contract_date.getFullYear() + '-' + String(Number(i_contract_date.getMonth() + 1)).padStart(2, '0') + '-' + String(i_contract_date.getDate()).padStart(2, '0');
                    // Date 년월일 Formatting
                    const c_contract_date = new Date(empLedger.c_contract_date);
                    empLedger.c_contract_date = c_contract_date.getFullYear() + '-' + String(Number(c_contract_date.getMonth() + 1)).padStart(2, '0') + '-' + String(c_contract_date.getDate()).padStart(2, '0');

                    

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
                            const birthdate = new Date(empPool.birthdate);
                            empPool.birthdate = birthdate.getFullYear() + '-' + String(Number(birthdate.getMonth() + 1)).padStart(2, '0') + '-' + String(birthdate.getDate()).padStart(2, '0');

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
                            $('#hope_purchase_unit').val(empPool.hope_purchase_unit);
                            
                        }
                    })

                },
                error: function(xhr, status, error) {
                    
                }
            });


            $('#btnConfirm').click(function() {
                const emp_id = $('#emp_id').val();
                const progress = '투입'
               	const progress_reason = $('#progress_reason').val();

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
     	            	   $.ajax({
     	                       type: 'PATCH',
     	                       url: '${pageContext.request.contextPath}/empLedger.ajax/' + emp_id + '/progress/' + progress,
     	                       success: function() {
	     	                       	if (progress_reason) {
		     	                       	$.ajax({
		   	                               type: 'PATCH',
		   	                               url: '${pageContext.request.contextPath}/empLedger.ajax/' + emp_id + '/progress_reason/' + progress_reason,
		   	                               success: function() {
		   	                                   opener.parent.location.reload();
		   	                                   window.location.reload();
		   	                               },
		   	                               error: function() {
		   	                                   opener.parent.location.reload();
		   	                                   window.close();
		   	                               }
		   	                           });
									} else {
										opener.parent.location.reload();
	                                    window.close();
									}
     	                       	
     	                       },
     	                       error: function() {
     	                           
     	                       }
     	                   });
                        },
                        error: function() {
                            opener.parent.location.reload();
                            window.close();
                        }
                    });

                
            })

            $('#btnDrop').click(function() {
                const emp_id = $('#emp_id').val();
                const progress = '드랍';
                const progress_reason = $('#progress_reason').val();

                $.ajax({
                    type: 'PATCH',
                    url: '${pageContext.request.contextPath}/empLedger.ajax/' + emp_id + '/progress/' + progress,
                    success: function() {
	                    if (progress_reason) {
	                        $.ajax({
	                            type: 'PATCH',
	                            url: '${pageContext.request.contextPath}/empLedger.ajax/' + emp_id + '/progress_reason/' + progress_reason,
	                            success: function() {
	                                opener.parent.location.reload();
	                                window.location.reload();
	                            },
	                            error: function() {
	                                opener.parent.location.reload();
	                                window.close();
	                            }
	                        });
	                    } else {
	                        opener.parent.location.reload();
	                        window.close();
	                    }
                                
                    },
                    error: function() {
                        
                    }
                });

                

                
            });


            $('#btnUpdate').click(function(){
                
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
                if (confirm("강제삭제 시 인력기초원장 뿐만 아니라 연관된 매출원장의 데이터도 함께 삭제됩니다. 정말로 강제삭제하겠습니까?")) {
                	$.ajax({
    					type: 'PATCH',
    					url: '${pageContext.request.contextPath}/empLedger.ajax/' + emp_id + '/ForceDel/' + del,
    					success: function () {
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
            	const progress = '철수';
            	const progress_reason = $('#progress_reason').val();
            	
            	if (!$('input[name=resign_date]').val()) {
            		alert('철수 날짜를 입력해주세요');
					return;
				}
            	
            	if (!confirm('해당인력의 철수 날짜가 ' + $('input[name=resign_date]').val() + '이 맞습니까?')) {
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
	            	   $.ajax({
	                       type: 'PATCH',
	                       url: '${pageContext.request.contextPath}/empLedger.ajax/' + emp_id + '/progress/' + progress,
	                       success: function() {
	                    	   if (progress_reason) {
	     	                       	$.ajax({
	   	                               type: 'PATCH',
	   	                               url: '${pageContext.request.contextPath}/empLedger.ajax/' + emp_id + '/progress_reason/' + progress_reason,
	   	                               success: function() {
	   	                                   opener.parent.location.reload();
	   	                                   window.location.reload();
	   	                               },
	   	                               error: function() {
	   	                                   opener.parent.location.reload();
	   	                                   window.close();
	   	                               }
	   	                           });
								} else {
									opener.parent.location.reload();
                                    window.close();
								}
	                       },
	                       error: function() {
	                           
	                       }
	                   });
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