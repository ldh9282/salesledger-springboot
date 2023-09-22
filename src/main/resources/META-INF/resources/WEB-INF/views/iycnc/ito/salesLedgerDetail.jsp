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
    <title>IYCNC ITO 매출원장 상세 페이지: IYF 영업관리시스템</title>

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
                <input type="hidden" id="sales_id" name="sales_id">
                <input type="hidden" id="emp_id" name="emp_id">
                <input type="hidden" id="emp_pool_id" name="emp_pool_id">
                <input type="hidden" id="project_assign" name="project_assign">
                <input type="hidden" id="del" name="del">
                
                <h1>IYCNC ITO 매출원장 상세 페이지</h1>
                <form id="salesLedgerForm">
                	<div class="form-group mb-3">
                        <label for="include">금월실적반영:</label>
                        <input type="text" class="form-control" id="include" name="include" readonly>
                    </div>
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
                        <input type="text" class="form-control" id="department" name="department" value="ITO" readonly>
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
                        <label for="sourcing_manager">소싱담당자:</label>
                        <input type="text" class="form-control" id="sourcing_manager" name="sourcing_manager">
                    </div>
                    <div class="form-group mb-3">
                        <label for="name">이름:</label>
                        <input type="text" class="form-control" id="name" name="name">
                    </div>
                    <div class="form-group mb-3">
                        <label for="phonenumber">전화번호:</label>
                        <input type="text" class="form-control" id="phonenumber" name="phonenumber">
                    </div>
                    <div class="form-group mb-3">
                        <label for="birthdate">생년월일:</label>
                        <input type="date" class="form-control" id="birthdate" name="birthdate">
                    </div>
                    <div class="form-group mb-3">
                        <label for="email">이메일:</label>
                        <input type="email" class="form-control" id="email" name="email">
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
                        <label for="resign_date">철수일:</label>
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
                        <label for="sales_unit">매출단가:</label>
                        <input type="text" class="form-control" id="sales_unit" name="sales_unit" data-type="money">
                    </div>
                    <div class="form-group mb-3">
                        <label for="purchase_unit">매입단가:</label>
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
					<hr>
                    <div class="form-group mb-3">
                        <label for="tech_support">기술지원여부:</label>
                        <select class="form-control" id="tech_support" name="tech_support">
                            <option value="예">예</option>
                            <option value="아니오">아니오</option>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label for="extra_expense">부대비용항목:</label>
                        <input type="text" class="form-control" id="extra_expense" name="extra_expense">
                    </div>
                     <div class="form-group mb-3">
                        <label for="extra_expense_amount">부대비용금액:</label>
                        <input type="text" class="form-control" id="extra_expense_amount" name="extra_expense_amount">
                    </div>
                    <div class="form-group mb-3">
                        <label for="emp_type">고용형태:</label>
                        <select type="text" class="form-control" id="emp_type" name="emp_type">
                        	<option value="정규">정규</option>
                        	<option value="프리">프리</option>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label for="individual_business">개인사업자:</label>
                        <input type="text" class="form-control" id="individual_business" name="individual_business">
                    </div>
                    <div class="form-group mb-3">
                        <label for="payday">급여지급날:</label>
                        <input type="text" class="form-control" id="payday" name="payday">
                    </div>
                    <div class="form-group mb-3">
                        <label for="modifier">수정자:</label>
                        <input type="text" class="form-control" id="modifier" name="modifier" readonly>
                    </div>
                </form>
                
                <button type="button" class="btn btn-primary" id="btnUpdate">수정</button>
                <button type="button" class="btn btn-success float-end" id="btnInclude" title="이번달 매출실적에 반영시킵니다">실적 반영</button>
            </div>
        </section>
    
    </main><!-- End #main -->

    <script>
        $(document).ready(function() {

        	const urlParmas = new URLSearchParams(window.location.search);
            const sales_id = urlParmas.get('sales_id'); 
            // ajax 1: salesLedger 상세정보 조회
            $.ajax({
            	url: '${pageContext.request.contextPath}/salesLedger.ajax/' + sales_id,
            	type: 'GET',
            	dataType: 'json',
            	success: function (salesLedger) {
            		
            		if (salesLedger.include !== 'Y') {
            			document.querySelector('#btnInclude').dataset.bsOriginalTitle = '이번달 매출실적에 반영하지 않습니다';
            			document.querySelector('#btnInclude').textContent = '실적 미반영';
            			document.querySelector('#btnInclude').classList.remove('btn-success');
            			document.querySelector('#btnInclude').classList.add('btn-danger');
					}
            		
            		$('#sales_id').val(salesLedger.sales_id);
            		$('#tech_support').val(salesLedger.tech_support);
            		$('#extra_expense').val(salesLedger.extra_expense);
            		$('#extra_expense_amount').val(salesLedger.extra_expense_amount);
            		$('#job_level').val(salesLedger.job_level);
            		$('#job_role').val(salesLedger.job_role);
            		$('#job_field').val(salesLedger.job_field);
            		$('#baby_leave_comments').val(salesLedger.baby_leave_comments);
            		$('#emp_type').val(salesLedger.emp_type);
            		$('#i_c_class').val(salesLedger.i_c_class);
            		$('#individual_business').val(salesLedger.individual_business);
            		$('#recent_amount_history').val(salesLedger.recent_amount_history);
            		$('#payday').val(salesLedger.payday);
            		$('#modifier').val(salesLedger.modifier);
            		$('#include').val(salesLedger.include);
            		
            		// ajax 2: empLedger 상세정보 조회
                    $.ajax({
                        url: '${pageContext.request.contextPath}/empLedger.ajax/' + salesLedger.emp_id,
                        type: 'GET',
                        dataType: 'json',
                        success: function(empLedger) {
                            
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
                            $('#sales_unit').val(empLedger.sales_unit);
                            $('#purchase_unit').val(empLedger.purchase_unit);
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

                            // ajax 3: empPool 상세정보 조회
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
                                    
                                }
                            })

                        },
                        error: function(xhr, status, error) {
                            
                        }
                    });
				},
				error: function(xhr, status, error) {
                    
                }
            });
            
        	// End: ajax 1
            $('#btnUpdate').click(function() {
            	const jsonObject = {
            		"salesLedger": {
            			"sales_id": $('input[name=sales_id]').val(),
            			"emp_id": $('input[name=emp_id]').val(),
            			"tech_support": $('select[name=tech_support]').val(),
            			"extra_expense": $('input[name=extra_expense]').val(),
            			"extra_expense_amount": $('input[name=extra_expense_amount]').val(),
            			"emp_type": $('select[name=emp_type]').val(),
            			"individual_business": $('input[name=individual_business]').val(),
            			"payday": $('input[name=payday]').val(),
            			"modifier": $('input[name=modifier]').val(),
            			"include": $('input[name=include]').val(),
            		},
	                "empLedger": {
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
	                }
	            }
	            $.ajax({
	                type: "PUT",
	                url: "${pageContext.request.contextPath}/salesLedger.ajax",
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
        	
            
            $('#btnInclude').click(function(e) {
            	if ($('#include').val() === 'Y') {
            		$('#include').val('N');
            		e.target.dataset.bsOriginalTitle = '이번달 매출실적에 반영하지 않습니다'
           			e.target.textContent = '실적 미반영';
            		e.target.classList.remove('btn-success')
            		e.target.classList.add('btn-danger')
            		$('#btnInclude').tooltip('hide');
    			} else {
    				$('#include').val('Y');
    				e.target.dataset.bsOriginalTitle = '이번달 매출실적에 반영시킵니다'
            		e.target.textContent = '실적 반영';
              		e.target.classList.remove('btn-danger')
              		e.target.classList.add('btn-success');
              		$('#btnInclude').tooltip('hide');
    			}
			});
            
            $('#btnInclude').tooltip();
            
            $.ajax({
    			type: 'GET',
    			url: '${pageContext.request.contextPath}/member.ajax/username/' + '${principal.username}',
    			success: function(member) {
    				$('#modifier').removeAttr('readonly');
    				$('#modifier').val(member.name);
    				$('#modifier').attr('readonly', "");
    				
    			}
    		});
            
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