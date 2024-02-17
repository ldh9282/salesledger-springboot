<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/icon/favicon.ico">
    <title>인력 등록 페이지: IYF 영업관리시스템</title>

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
                <h3>인력 등록 페이지</h3>
                <hr>
                <div class="form-group mb-3">
                    <label for="sourcingManager">소싱담당자:</label>
                    <input type="text" class="form-control" id="sourcing_manager" name="sourcing_manager">
                </div>
                <div class="form-group mb-3">
                    <label for="name">이름 <span class="text-danger">*</span> :</label>
                    <input type="text" class="form-control" id="name" name="name">
                </div>
                <div class="form-group mb-3">
                    <label for="phoneNumber">전화번호 <span class="text-danger">*</span> :</label>
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
                <div class="form-group mb-3">
                    <label for="hope_purchase_unit">희망단가:</label>
                    <input type="text" class="form-control" id="hope_purchase_unit" name="hope_purchase_unit" data-type="money">
                </div>
    			<div class="row mt-5 mb-5">
				    <div class="col-12 d-flex align-items-center" >
				        <!-- 이력서 등록 인풋 -->
				        <div class="input-group">
				            <label for="file" class="btn btn-secondary" id="selectFile" >이력서 선택</label>
				            <input type="file" class="form-control" id="file" name="file" style="display: none;">
				            <span class="input-group-text flex-grow-1 bg-white text-dark" id="selectedFileName">파일을 선택해주세요</span>
				        </div>
				    </div>
				</div>
				
                <button type="submit" class="btn btn-primary" id="btnRegister">인력 등록</button>
            </div>
        </section>

    </main><!-- End #main -->

    <script>
        $(document).ready(function () {

			$("#file").change(function() {
				$('#selectedFileName').text($('#file')[0].files[0].name);
			})
        	
            // 인력 등록 버튼 클릭 이벤트
            $('#btnRegister').click(function () {
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
                let empPool = {
               		emp_pool_id: '-1',
                    sourcing_manager: $('#sourcing_manager').val(),
                    name: $('#name').val(),
                    phonenumber: $('#phonenumber').val().replaceAll('-', ''),
                    birthdate: new Date($('#birthdate').val()),
                    email: $('#email').val(),
                    address: $('#address').val(),
                    education: $('#education').val(),
                    school_name: $('#school_name').val(),
                    major: $('#major').val(),
                    career_years: $('#career_years').val(),
                    career_field: $('#career_field').val(),
                    career_level: $('#career_level').val(),
                    hope_purchase_unit: $('input[name=hope_purchase_unit]').val().replaceAll(',', '') ? $('input[name=hope_purchase_unit]').val().replaceAll(',', '') : 0,
                };

                // 1. 인력풀 중복 검증
                $.ajax({
                    type: 'GET',
                    url: '${pageContext.request.contextPath}/empPool.ajax/name/' + empPool.name + '/phonenumber/' + empPool.phonenumber,
                    success: function(theEmpPool) {
                        if (!theEmpPool) {
                        	let isError = false;
                        	let empPoolId;
			                // 2. 인력풀 시퀀스 조회
			                $.ajax({
	         			        url: "${pageContext.request.contextPath}/empPool.ajax/emp_pool_id/new", 
	         			        type: "GET",
	         			        async: false,
	         			        success: function (theEmpPoolId) {
	         			        	empPool.emp_pool_id = theEmpPoolId;
	         			        },
	         			        error: function (error) {
	         			            isError = true;
	         			            alert("내부 서버 오류입니다. 잠시 후 시도해주세요. (인력풀 시퀀스 조회 실패)");
	         			        }
	         				})
	         				
	         				// 3. 해당 인력의 이력서 파일 업로드
	         				let empResume;
                           	if (!isError && $('#file')[0].files[0]) {
                                const formData = new FormData();
                                   
                   				formData.append("file", $('#file')[0].files[0]);
                   				
                   				$.ajax({
                   			        url: "${pageContext.request.contextPath}/upload/emp_resume", 
                   			        type: "POST",
                   			        data: formData,
                   			        async: false,
                   			        contentType: false,
                   			        processData: false,
                   			        success: function (response) {
                   			        	empResume = {
                  			        		emp_pool_id: String(empPool.emp_pool_id),
                  			        		file_name: response.file_name,
                  			        		file_path: response.file_path,
                  			        		
                   			        	}
                   			        },
                   			        error: function (error) {
                   			            // 파일 업로드 실패 시
                   			            isError = true;
                   						
                			            if (error.responseJSON.message) {
                				            alert(error.responseJSON.message); // 서버에서 반환한 메시지 표시
                			            } else {
                			            	alert("내부 서버 오류입니다. 잠시 후 시도해주세요.");
                			            }
                   			        }
                   				});
                   				
              					// 4. 해당 인력의 이력서 위치정보 등록
                   				if (!isError) {
                   					
	               				    $.ajax({
	               				        type: "POST",
	               				        url: "${pageContext.request.contextPath}/empResume.ajax",
	               				     	async: false,
		                                data: JSON.stringify(empResume),
		                                contentType: 'application/json',
	               				        success: function (response) {
	               							
	               				            
	               				        },
	               				        error: function (error) {
	                   			            // 인력 이력서 정보 등록 실패시
	                   			            isError = true;
	                   			            alert("내부 서버 오류입니다. 잠시 후 시도해주세요. (이력서 파일 위치정보 등록 실패)");
	               				        }
	               				    });
                   				}
                   				
                           	}
			                
			             	// 5. 인력풀 등록
             				if (!isError) {
            					
	                            $.ajax({
	                                url: '${pageContext.request.contextPath}/empPool.ajax',
	                                type: 'POST',
	                                async: false,
	                                data: JSON.stringify(empPool),
	                                contentType: 'application/json',
	                                success: function () {
	                                	alert('인력이 등록되었습니다')
			                            opener.parent.location.reload();
			                            window.close();
	                                },
	                                error: function () {
	                                	// 인력풀 등록 실패시
	                                	isError = true;
	                                	alert("내부 서버 오류입니다. 잠시 후 시도해주세요. (인력풀 등록 실패)");
	                                }
	                            });
	                            
             				}
             				
	         				
	         				
                        } else {
                            $('#phonenumber').focus();
                            alert('성명과 전화번호가 같은 인력이 있습니다.');
                        }
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