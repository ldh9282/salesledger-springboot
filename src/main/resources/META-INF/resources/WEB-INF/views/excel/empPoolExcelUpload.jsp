<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/icon/favicon.ico">
    <title>인력풀 엑셀 업로드 페이지: IYF 영업관리시스템</title>


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
	<div class="container mt-5">
	    <div class="card">
	        <div class="card-header">
	            <h1 class="card-title">인력풀 엑셀 파일 업로드</h1>
	        </div>
	        <div class="card-body">
	            <form>
	                <div class="row m-3">
	                    <div class="col-12">
	                    	<label for="file" class="form-label">엑셀 파일을 선택하세요:</label>
	                    </div>
	                </div>
	                <div class="row m-3">
	                    <div class="col-8">
	                        <input type="file" name="file" id="file" class="form-control" required>
	                    </div>
	                    <div class="col-4">
	                        <button type="button" id="btnUpload" class="btn btn-primary btn-block">업로드</button>
	                        <button type="button" id="btnSampleDownload" class="btn btn-success">샘플 다운로드</button>
	                    </div>
	                </div>
	            </form>
	        </div>
	        <div class="card-footer">
	            <div class="row mt-3">
	                <p class="text-muted" style="font-style: italic;">1. 파일 업로드 확장자는 .xlsx 만 가능합니다.</p>
	                <p class="text-muted" style="font-style: italic;">2. 샘플 엑셀파일을 다운받아 정보를 기입하고 업로드 해주세요.</p>
	                <p class="text-muted" style="font-style: italic;">3. 정보 기입은 샘플 파일 내의 가이드를 참고해주세요.</p>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script>
		$(document).ready(function() {
			// 엑셀 파일 업로드
			let isBtnUploadClicked = false; // 중복 클릭 방지
			$("#file").change(function() {
				isBtnUploadClicked = false;
				$('#btnUpload').prop("disabled", false);
			})
			$('#btnUpload').click(function() {
			    if (isBtnUploadClicked) {
			        return; // 이미 클릭된 경우 아무 작업도 하지 않음
			    }
				 // 버튼 딤 처리 (클릭 중복 방지)
				isBtnUploadClicked = true;
				$('#btnUpload').prop("disabled", true);
				
				const formData = new FormData();
				if (!$('#file')[0].files[0]) {
					alert("업로드할 엑셀 파일을 선택해주세요.")
					return;
				} else if (!$('#file')[0].files[0].name.endsWith('.xlsx')) {
					alert("올바른 파일 확장자가 아닙니다.")
					return;
				}
				
				formData.append("file", $('#file')[0].files[0]);
				
				
				let isError = false;
				$.ajax({
			        url: "${pageContext.request.contextPath}/upload", 
			        type: "POST",
			        data: formData,
			        async: false,
			        contentType: false,
			        processData: false,
			        success: function (response) {
			            // 파일 업로드 성공 시
// 			            alert(response.message); // 서버에서 반환한 메시지 표시
			        },
			        error: function (error) {
			            // 파일 업로드 실패 시
			            isError = true;
						// 에러 발생 시 딤 처리 해제 (클릭 가능 상태로 복원)
						isBtnUploadClicked = false;
						$('#btnUpload').prop("disabled", false);
						
			            if (error.responseJSON.message) {
				            alert(error.responseJSON.message); // 서버에서 반환한 메시지 표시
			            } else {
			            	alert("내부 서버 오류입니다. 잠시 후 시도해주세요.");
			            }
			        }
				})
				if (isError) {
					return;
				} else {
				    $.ajax({
				        type: "POST",
				        url: "${pageContext.request.contextPath}/excel/empPoolExcelUpload.ajax",
				        data: formData,
				        async: false,
				        processData: false,
				        contentType: false,
				        success: function (response) {
				        	// 엑셀 데이터 추가 성공 시
							$('#file').val("")
				        	alert(response.message); // 서버에서 반환한 메시지 표시
				        	
							opener.parent.location.reload();
				            
				        },
				        error: function (error) {
				        	// 엑셀 데이터 추가 실패 시
				            isError = true;
							// 에러 발생 시 딤 처리 해제 (클릭 가능 상태로 복원)
							isBtnUploadClicked = false;
							$('#btnUpload').prop("disabled", false);
							
				            if (error.responseJSON.message) {
					            alert(error.responseJSON.message); // 서버에서 반환한 메시지 표시
				            } else {
				            	alert("내부 서버 오류입니다. 잠시 후 시도해주세요.");
				            }
				        }
				    });
				}
				
				
			})
			
			// 샘플 엑셀 파일 다운로드
			$('#btnSampleDownload').click(function() {
				const sampleFileName = '인력풀_샘플_업로드.xlsx'
				 $.ajax({
		            url: "${pageContext.request.contextPath}/download?fileName=" + sampleFileName,
		            method: "GET",
		            xhrFields: {
		                responseType: 'blob'
		            },
		            success: function(data, status, xhr) {
		                const fileName = '인력풀 샘플 업로드.xlsx';

		                // 브라우저에서 파일 다운로드
		                const blob = new Blob([data], { type: xhr.getResponseHeader('Content-Type') });
		                const link = document.createElement('a');
		                link.href = window.URL.createObjectURL(blob);
		                link.download = fileName;
		                link.click();
		            },
		            error: function(error) {
		                alert("파일 다운로드에 실패했습니다.");
		            }
		        })
		    })
			
		})
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
