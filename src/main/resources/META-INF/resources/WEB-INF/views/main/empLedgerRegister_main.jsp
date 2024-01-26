<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <main id="main" class="main">

        <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-7">
                        <h3>${company} ${department_kr} 인력 투입예정 페이지</h3>
                        <hr>
                        <form id="empLedgerForm">
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
                                <label for="site">사이트명 <span class="text-danger">*</span> :</label>
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
                                <label for="brief">적요란:</label>
                                <input type="text" class="form-control" id="brief" name="brief">
                            </div>
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

                            <button type="button" class="btn btn-primary" id="btnExpectedInsert" disabled>인력 투입예정</button>
                        </form>
                    </div>
                    <div class="col-md-5">
                        <h3 class="mb-3">인력 검색</h3>
                        <form id="searchForm">
                            <input type="hidden" id="emp_pool_id" name="emp_pool_id">
                            <div class="form-group mb-3">
                                <label for="name">이름:</label>
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                            <div class="form-group mb-3">
                                <label for="phoneNumber">전화번호:</label>
                                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
                            </div>
                            <div id="search-error" class="alert alert-danger d-none">조회 결과 없는 인력입니다.</div>
                            <button type="button" class="btn btn-primary mb-3" id="btnSearch" title="인력풀에 있는 인력의 이름과 전화번호를 모두 기입해주세요. 검색 후 인력투입예정을 할 수 있습니다.">검색</button>
                        </form>
                        <hr>
                        <form id="empDetailForm">
                            <div class="form-group mb-3">
                                <label for="sourcing_manager">소싱담당자:</label>
                                <input type="text" class="form-control" id="sourcing_manager" name="sourcing_manager" readonly>
                            </div>
                            <div class="form-group mb-3">
                                <label for="name">이름:</label>
                                <input type="text" class="form-control" id="name" name="name" readonly>
                            </div>
                            <div class="form-group mb-3">
                                <label for="phonenumber">전화번호:</label>
                                <input type="text" class="form-control" id="display-phonenumber" name="display-phonenumber" readonly>
                                <input type="hidden" class="form-control" id="phonenumber" name="phonenumber">
                            </div>
                            <div class="form-group mb-3">
                                <label for="birthdate">생년월일:</label>
                                <input type="date" class="form-control" id="birthdate" name="birthdate" readonly>
                            </div>
                            <div class="form-group mb-3">
                                <label for="email">이메일:</label>
                                <input type="email" class="form-control" id="email" name="email" readonly>
                            </div>
                            <div class="form-group mb-3">
                                <label for="address">주소:</label>
                                <input type="text" class="form-control" id="address" name="address" readonly>
                            </div>
                            <div class="form-group mb-3">
                                <label for="education">학력:</label>
                                <input type="text" class="form-control" id="education" name="education" readonly>
                            </div>
                            <div class="form-group mb-3">
                                <label for="school_name">학교명:</label>
                                <input type="text" class="form-control" id="school_name" name="school_name" readonly>
                            </div>
                            <div class="form-group mb-3">
                                <label for="major">학과:</label>
                                <input type="text" class="form-control" id="major" name="major" readonly>
                            </div>
                            <div class="form-group mb-3">
                                <label for="career_years">경력:</label>
                                <input type="text" class="form-control" id="career_years" name="career_years" readonly>
                            </div>
                            <div class="form-group mb-3">
                                <label for="career_field">분야:</label>
                                <input type="text" class="form-control" id="career_field" name="career_field" readonly>
                            </div>
                            <div class="form-group mb-3">
                                <label for="career_level">등급:</label>
                                <input type="text" class="form-control" id="career_level" name="career_level" readonly>
                            </div>
			                <div class="form-group mb-3">
			                    <label for="hope_purchase_unit">희망단가:</label>
			                    <input type="text" class="form-control" id="hope_purchase_unit" name="hope_purchase_unit" data-type="money" readonly>
			                </div>
                        </form>
                    </div>
                </div>

            </div>
        </section>

    </main><!-- End #main -->

    <script>
        $(document).ready(function () {
            // 인력 투입예정 버튼 클릭 이벤트
            $('#btnExpectedInsert').click(function () {
            	// 필수값 체크
            	if (!$('#company').val()) {
            		$('#company').focus();
            		alert('투입예정하려는 인력의 소속을 입력해주셔야합니다');
            		return;
            	} else if (!$('#department').val()) {
            		$('#department').focus();
            		alert('투입예정하려는 인력의 사업부서를 입력해주셔야합니다');
            		return;
            	} else if (!$('#site').val()) {
            		$('#site').focus();
            		alert('투입예정하려는 인력의 사이트명을 입력해주셔야합니다');
            		return;
            	} else if (!$('#client').val()) {
            		$('#client').focus();
            		alert('투입예정하려는 인력의 진행업체(고객사)를 입력해주셔야합니다');
            		return;
            	} else if (!$('#project_name').val()) {
            		$('#project_name').focus();
            		alert('투입예정하려는 인력의 프로젝트명을 입력해주셔야합니다');
            		return;
            	} else if (!$('#assign_date').val()) {
            		$('#assign_date').focus();
            		alert('투입예정하려는 인력의 투입일을 입력해주셔야합니다');
            		return;
            	} else if (!$('#end_date').val()) {
            		$('#end_date').focus();
            		alert('투입예정하려는 인력의 종료일을 입력해주셔야합니다');
            		return;
            	} else if (!$('#resign_date').val()) {
            		$('#resign_date').focus();
            		alert('투입예정하려는 인력의 철수날짜를 입력해주셔야합니다');
            		return;
            	} else if (!$('#sales_mm').val()) {
            		$('#sales_mm').focus();
            		alert('투입예정하려는 인력의 매출MM을 입력해주셔야합니다');
            		return;
            	} else if (!$('#purchase_mm').val()) {
            		$('#purchase_mm').focus();
            		alert('투입예정하려는 인력의 매입MM을 입력해주셔야합니다');
            		return;
            	} else if (!$('#sales_unit').val()) {
            		$('#sales_unit').focus();
            		alert('투입예정하려는 인력의 매출단가 입력해주셔야합니다');
            		return;
            	} else if (!$('#purchase_unit').val()) {
            		$('#purchase_unit').focus();
            		alert('투입예정하려는 인력의 매입단가을 입력해주셔야합니다');
            		return;
            	}
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/empLedger.ajax",
                    contentType: "application/json",
                    data: JSON.stringify({
                        "empLedger": {
                            "emp_pool_id": $('input[name=emp_pool_id]').val(),
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
                            "site": $('input[name=site]').val(),
                            "client": $('input[name=client]').val(),
                            "project_name": $('input[name=project_name]').val(),
                            "brief": $('input[name=brief]').val(),
                        }
                    }),
                    success: function() {
                    	alert('해당 인력의 투입예정되었습니다. 투입을 확정시키면 매출원장에 등록이 됩니다')
                        opener.parent.location.reload();
                        window.close();
                    },
                    error: function(error) {
                    	if (error.responseText) {
				            alert(error.responseText); // 서버에서 반환한 메시지 표시
			            } else {
			            	alert("내부 서버 오류입니다. 잠시 후 시도해주세요.");
			            }
                        opener.parent.location.reload();
                    }
                });

            });

            $('#btnSearch').click(function() {
                const name = $('input[name=name]').val();
                const phonenumber = $('input[name=phoneNumber]').val().replaceAll('-', '');

                if (name && phonenumber) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/empPool.ajax/name/" + name + "/phonenumber/" + phonenumber,
                        type: "GET",
                        success: function (empPool) {
                            if (!empPool) {
                                // ajax로 인력 조회값이 undefiend면 search-error 메시지 display
                                $('div#search-error').removeClass('d-none');
                                // 인력 정보값 초기화
                                $('input[name=emp_pool_id]').val('');
                                $('input[name=sourcing_manager]').val('');
                                $('input[name=name]').val('');
                                $('input[name=phoneNumber]').val('');
                                $('input[name=display-phonenumber]').val('');
                                $('input[name=phonenumber]').val('');
                                $('input[name=birthdate]').val('');
                                $('input[name=email]').val('');
                                $('input[name=address]').val('');
                                $('input[name=education]').val('');
                                $('input[name=school_name]').val('');
                                $('input[name=major]').val('');
                                $('input[name=career_years]').val('');
                                $('input[name=career_field]').val('');
                                $('input[name=career_level]').val('');
                                $('input[name=hope_purchase_unit]').val('');
                                // 인력 투입예정 버튼 비활성화
                                $('#btnExpectedInsert').attr('disabled', true);
                                return;
                            }
                            // ajax로 인력 조회를 하면 search-error 메시지 no display
                            $('div#search-error').addClass('d-none');

                            // formatting 생년월일
                            if (empPool.birthdate) {
                                const birthdate = new Date(empPool.birthdate);
                                empPool.birthdate = birthdate.getFullYear() + '-' + String(Number(birthdate.getMonth() + 1)).padStart(2, '0') + '-' + String(birthdate.getDate()).padStart(2, '0');
                            }

                            // 조회한 인력정보기입
                            $('input[name=emp_pool_id]').val(empPool.emp_pool_id);
                            $('input[name=sourcing_manager]').val(empPool.sourcing_manager);
                            $('input[name=name]').val(empPool.name);
                            $('input[name=phoneNumber]').val(phoneUtils.formatPhoneNumber(empPool.phonenumber));
                            $('input[name=display-phonenumber]').val(phoneUtils.formatPhoneNumber(empPool.phonenumber));
                            $('input[name=phonenumber]').val(empPool.phonenumber);
                            $('input[name=birthdate]').val(empPool.birthdate);
                            $('input[name=email]').val(empPool.email);
                            $('input[name=address]').val(empPool.address);
                            $('input[name=education]').val(empPool.education);
                            $('input[name=school_name]').val(empPool.school_name);
                            $('input[name=major]').val(empPool.major);
                            $('input[name=career_years]').val(empPool.career_years);
                            $('input[name=career_field]').val(empPool.career_field);
                            $('input[name=career_level]').val(empPool.career_level);
                            $('input[name=hope_purchase_unit]').val(empPool.hope_purchase_unit.toLocaleString('ko-KR'));
                            // 인력 투입예정 버튼 활성화
                            $('#btnExpectedInsert').attr('disabled', false);;
                        },
                    });
                }

                


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
            $('#phoneNumber').keyup(function(e) {
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
            
            $('#btnSearch').tooltip();



        });
    </script>    