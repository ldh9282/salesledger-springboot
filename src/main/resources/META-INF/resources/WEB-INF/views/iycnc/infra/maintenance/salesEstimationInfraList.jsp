<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/icon/favicon.ico">
    <title>IYCNC 인프라 유지보수 매출 현황 [매출추정]: IYF 영업관리시스템</title>

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
    <!-- toast-grid-pagination -->
    <link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    
    
	
</head>

<body>

    <!-- ======= Header ======= -->
    <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
    <!-- End Header -->

    <!-- ======= Sidebar ======= -->
    <jsp:include page="/WEB-INF/views/sidebar.jsp"></jsp:include>
    <!-- End Sidebar-->

    <main id="main" class="main">
<!--         <section> -->
<!--             <div class="container"> -->
				<div id="title" class="d-flex justify-content-center" style="width: 80vw;">
			  		<span style="font-size: 20px; font-weight: 550; color: #012970c7; font-family: 'Nunito', sans-serif;">IYCNC 인프라 유지보수 <span id="year"></span>년 <span id="month"></span>월 매출 현황 [매출추정]</span>
				</div>
                <i class="ri-arrow-down-s-fill" id="toggle-icon"><span>접기/내리기</span></i>
                <div class="toggle-content mt-3" id="toggle-item">
                    <!-- ======= 그리드에서 보여줄 필드 체크리스트 ======= -->
                    <div class="checkbox-container mb-3">
                        <div class="row row-cols-4 mb-3">
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" name="all-check" checked>
                                    <span class="form-check-label">ALL</span>
                                </label>
                            </div>
                        </div>
                        <div class="row row-cols-4 mb-3">
                            <div class="col">
                               <label class="form-check">
                                   <input class="form-check-input" type="checkbox" data-table="sales-result-infra" name="column" value="batch_month" checked>
                                   <span class="form-check-label">해당년월</span>
                               </label>
                            </div>
                            <div class="col">
                               <label class="form-check">
                                   <input class="form-check-input" type="checkbox" data-table="sales-result-infra" name="column" value="date" checked>
                                   <span class="form-check-label">날짜</span>
                               </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result-infra" name="column" value="company" checked>
                                    <span class="form-check-label">소속</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result-infra" name="column" value="department" checked>
                                    <span class="form-check-label">사업부서</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result-infra" name="column" value="category" checked>
                                    <span class="form-check-label">카테고리</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result-infra" name="column" value="client" checked>
                                    <span class="form-check-label">진행업체</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result-infra" name="column" value="brief" checked>
                                    <span class="form-check-label">적요란</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result-infra" name="column" value="total_sales_amount" checked>
                                    <span class="form-check-label">매출가</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result-infra" name="column" value="total_purchase_amount" checked>
                                    <span class="form-check-label">매입가</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result-infra" name="column" value="total_margin_amount" checked>
                                    <span class="form-check-label">이익</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result-infra" name="column" value="note" checked>
                                    <span class="form-check-label">비고</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result-infra" name="column" value="business_reg_num" checked>
                                    <span class="form-check-label">사업자등록번호</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result-infra" name="column" value="email" checked>
                                    <span class="form-check-label">담당메일주소</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result-infra" name="column" value="handwrite" checked>
                                    <span class="form-check-label">수기작성여부</span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <!-- End 그리드에서 보여줄 필드 체크리스트-->
                </div>

          
                <div id="batchmonth-search" class="form-group mt-5" style="width: 80vw;">
                    <button type="button" id="btnShowRegisterPage" class="btn btn-primary">수기데이터 추가</button>
                    <div class="float-end">
                        <input type="text" name="keyword" id="keyword" placeholder="해당년월">
                        <button type="button" id="btnKeywordSearch">검색</button>
                    </div>
                </div>




                <div id="grid" class="mt-5" style="width: 80vw;"></div>
<!--             </div> -->
<!--         </section> -->

    </main><!-- End #main -->

    <!-- ======= Footer ======= -->
    <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<!-- END Footer -->

    <script>

        $(document).ready(function () {
        	
            
        	const currentDate = new Date();

        	// 년도와 월을 가져옵니다.
        	const year = currentDate.getFullYear();
        	const month = currentDate.getMonth() + 2;

        	// 월이 10월 이전인 경우, 숫자 앞에 0을 추가합니다.
        	const monthString = month < 10 ? "0" + month : month.toString();

        	// yyyymm 형식의 문자열을 만듭니다.
        	const yyyymm = year.toString() + monthString;
        	
            // 그리드 출력
            const grid = new tui.Grid({
                el: document.querySelector('#grid'),
                scrollX: true,
                scrollY: true,
                columnOptions: {
                    minWidth: 130,
                },
                columns: [
                    {
                        header: '해당년월',
                        name: 'batch_month',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '날짜',
                        name: 'date',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '소속',
                        name: 'company',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '사업부서',
                        name: 'department',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                    },
                    {
                        header: '카테고리',
                        name: 'category',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                    },
                    {
                        header: '진행업체',
                        name: 'client',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '적요란',
                        name: 'brief',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '매출가',
                        name: 'total_sales_amount',
                        width: 'auto',
                        align: 'center',
                        filter: 'number',
                        formatter({value}) {
                        	return value.toLocaleString('ko-KR');
                        }
                    },
                    {
                        header: '매입가',
                        name: 'total_purchase_amount',
                        width: 'auto',
                        align: 'center',
                        filter: 'number',
                        formatter({value}) {
                        	return value.toLocaleString('ko-KR');
                        }
                    },
                    {
                        header: '이익',
                        name: 'total_margin_amount',
                        width: 'auto',
                        align: 'center',
                        filter: 'number',
                        formatter({value}) {
                        	return value.toLocaleString('ko-KR');
                        }
                    },
                    {
                        header: '비고',
                        name: 'note',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '사업자등록번호',
                        name: 'business_reg_num',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '담당메일주소',
                        name: 'email',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '수기작성여부',
                        name: 'handwrite',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                ],
                rowHeaders: ['rowNum'],
                pageOptions: {
	                useClient: true,
	                perPage: 10
                },
                contextMenu: ({ rowKey, columnName }) => (
                    [
                        [
                            {
                                name: 'export',
                                label: 'Export',
                                subMenu: [
                                    // 기본 설정 옵션을 이용한 내보내기
                                    {
                                        name: 'default',
                                        label: '기본',
                                        subMenu: [
                                            {
                                                name: 'csvExport',
                                                label: 'CSV export',
                                                action: () => {
                                                    grid.export('csv', { fileName: $('#title').text().trim() });
                                                }
                                            },
                                            {
                                                name: 'excelExport',
                                                label: 'Excel export',
                                                action: () => {
                                                    grid.export('xlsx', { fileName: $('#title').text().trim() });
                                                }
                                            },
                                        ]
                                    },
                                    // 지정한 다른 옵션을 이용한 내보내기 추가
                                    {
                                        name: 'withoutHeader',
                                        label: '헤더 미포함',
                                        subMenu: [
                                            {
                                                name: 'csvExport',
                                                label: 'CSV export',
                                                action: () => {
                                                    grid.export('csv', { includeHeader: false, fileName: $('#title').text().trim() + '(헤더 미포함)' });
                                                }
                                            },
                                            {
                                                name: 'excelExport',
                                                label: 'Excel export',
                                                action: () => {
                                                    grid.export('xlsx', { includeHeader: false, fileName: $('#title').text().trim() + '(헤더 미포함)' });
                                                }
                                            },
                                        ]
                                    },
                                ],
                            }
                        ],
                    ]
                ),
            });
            // 그리드 테마
            tui.Grid.applyTheme('striped', {
                cell: {
                    header: {
                        background: '#eef'
                    },
                    evenRow: {
                        background: '#f4f4f4'
                    }
                }
            });
            const params = new URLSearchParams(location.search);
			if (!params.get('batch_month')) {
				// 그리드 데이터 ajax로 가져오기 (현재날짜의 해당년월)
	            $.ajax({
	                url: "${pageContext.request.contextPath}/salesEstimationInfra.ajax/company/IYCNC/department/INFRA/category/MAINTENANCE/batch_month/" + yyyymm,
	                method: "GET",
	                success: function (salesEstimationInfra) {
	                	salesEstimationInfra.forEach(item => {
                            item.total_margin_amount = Number(item.total_sales_amount) - Number(item.total_purchase_amount);
                            
	                     	// 인프라 Formatting (한글 가독성 배려)
	                        if (item.department === 'INFRA') {
	                        	item.department = '인프라';
	                        }
	                     	// 유지보수 Formatting (한글 가독성 배려)
	                        if (item.category === 'MAINTENANCE') {
	                        	item.category = '유지보수';
	                        }
                        });
                        grid.resetData(salesEstimationInfra);
	                    
	               		// 페이지 타이틀 세팅: yyyy 및 mm (현재날짜 기준)
	               		$('#year').text(year);
	               		$('#month').text(monthString);
	               		
	                 	// 해당년월 키워드 세팅:
                   		$('#keyword').val(yyyymm);
	                }
	            });
			} else {
				// 그리드 데이터 ajax로 가져오기 (수기데이터 등록팝업페이지에서 추가할 때 해당년월)
				$.ajax({
                    url: "${pageContext.request.contextPath}/salesEstimationInfra.ajax/company/IYCNC/department/INFRA/category/MAINTENANCE/batch_month/" + params.get('batch_month'),
                    method: "GET",
                    success: function (salesEstimationInfra) {
                    	salesEstimationInfra.forEach(item => {
                            item.total_margin_amount = Number(item.total_sales_amount) - Number(item.total_purchase_amount);
                            
	                     	// 인프라 Formatting (한글 가독성 배려)
	                        if (item.department === 'INFRA') {
	                        	item.department = '인프라';
	                        }
	                     	// 유지보수 Formatting (한글 가독성 배려)
	                        if (item.category === 'MAINTENANCE') {
	                        	item.category = '유지보수';
	                        }
                        });
                        grid.resetData(salesEstimationInfra);
                        
                     	// 페이지 타이틀 세팅: yyyy 및 mm (키워드 기준)
                        $('#year').text(params.get('batch_month').substring(0,4));
                   		$('#month').text(params.get('batch_month').substring(4,6));
                   		
                   		// 해당년월 키워드 세팅:
                   		$('#keyword').val(params.get('batch_month'));
                    }
                });
			}
            
            
            // 모든 정보 체크해제시 이벤트: 컬럼 show 및 hide
            $('input[name=all-check]').click(function () {
                if (this.checked) {
                    $('input[name=column]').prop('checked', true);
                } else {
                    $('input[name=column]').prop('checked', false);
                }
                updateColumns();
            });


            // 개별 체크해제시 이벤트: 컬럼 show 및 hide
            $('input[name=column]').change(function () {
                updateColumns();
            });

            // 체크해제시 컬럼 show 및 hide
            function updateColumns(dataTable) {
                if (!dataTable) {
                    $('input[name=column]').each(function () {
                        if (this.checked) {
                            grid.showColumn(this.value);
                        } else {
                            grid.hideColumn(this.value);
                        }
                    });
                } else {
                    $('input[data-table=' + dataTable + ']').each(function () {
                        if (this.checked) {
                            grid.showColumn(this.value);
                        } else {
                            grid.hideColumn(this.value);
                        }
                    });
                }
            }

            
       		// 체크리스트 접기/내리기 토글 이벤트
            $("#toggle-icon").click(function () {
                if (document.querySelector('#toggle-icon').classList.value === 'ri-arrow-up-s-fill') {
                    document.querySelector('#toggle-icon').classList.remove('ri-arrow-up-s-fill');
                    document.querySelector('#toggle-icon').classList.add('ri-arrow-down-s-fill');
                    $('#toggle-item').slideDown();

                } else {
                    document.querySelector('#toggle-icon').classList.remove('ri-arrow-down-s-fill');
                    document.querySelector('#toggle-icon').classList.add('ri-arrow-up-s-fill');
                    $('#toggle-item').slideUp();


                }
            });
       		
       		$('#btnKeywordSearch').click(function() {
                // 정규식 패턴: 네 자리 연도 + 두 자리 월
       		    const regex = /^(19|20)\d\d(0[1-9]|1[0-2])$/;

                if (regex.test($('#keyword').val())) {
                    // 그리드 데이터 ajax로 가져오기 (키워드에 의한 해당년월)
                    $.ajax({
                        url: "${pageContext.request.contextPath}/salesEstimationInfra.ajax/company/IYCNC/department/INFRA/category/MAINTENANCE/batch_month/" + $('#keyword').val(),
                        method: "GET",
                        success: function (salesEstimationInfra) {
                        	salesEstimationInfra.forEach(item => {
                                item.total_margin_amount = Number(item.total_sales_amount) - Number(item.total_purchase_amount);
                                
    	                     	// 인프라 Formatting (한글 가독성 배려)
    	                        if (item.department === 'INFRA') {
    	                        	item.department = '인프라';
    	                        }
    	                     	// 유지보수 Formatting (한글 가독성 배려)
    	                        if (item.category === 'MAINTENANCE') {
    	                        	item.category = '유지보수';
    	                        }
                            });
                            grid.resetData(salesEstimationInfra);
                            
                         	// 페이지 타이틀 세팅: yyyy 및 mm (키워드 기준)
                            $('#year').text($('#keyword').val().substring(0,4));
                       		$('#month').text($('#keyword').val().substring(4,6));
                        }
                    });
                    
                    
                } else {
                    alert('올바른 해당년월 키워드를 입력한 뒤 다시 검색해주세요');
                }
                
			});

            // 수기데이터 등록페이지 버튼 클릭 이벤트: 수기데이터 등록페이지 팝업
            $('#btnShowRegisterPage').click(function () {
                const popupUrl = '${pageContext.request.contextPath}/iycnc/infra/maintenance/salesEstimationInfraRegister';
                const popupName = 'salesEstimationInfraRegister-popup';
                const popupWidth = 800;
                const popupHeight = 600;
                const left = (screen.width - popupWidth) / 2;
                const top = (screen.height - popupHeight) / 2;

                window.open(popupUrl, popupName, 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + left + ', top=' + top);
            });
       		
            // 그리드 Row 더블 클릭시 이벤트: 상세정보페이지 팝업
            grid.on('dblclick', function(ev) {
                const salesEstimationInfra = grid.getRow(ev.rowKey);
                if (salesEstimationInfra.handwrite === 'N') {
                	alert('수기로 입력한 데이터만 수정 가능합니다')
                	return;
                }
                const popupUrl = '${pageContext.request.contextPath}/iycnc/infra/maintenance/salesEstimationInfraDetail?sales_estimation_infra_id='+ salesEstimationInfra.sales_estimation_infra_id;
                const popupName = 'salesEstimationInfraDetail-popup';
                const popupWidth = 800;
                const popupHeight = 600;
                const left = (screen.width - popupWidth) / 2;
                const top = (screen.height - popupHeight) / 2;
                
                window.open(popupUrl, popupName, 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + left + ', top=' + top);
            });
       		
       		// 사이드바 접을 때 그리드 리사이징
            $('i.toggle-sidebar-btn').click(function() {
            	if ($('body').attr('class') === 'toggle-sidebar') {
            		$('#title').attr('style', 'width: 93vw;');
            		$('#batchmonth-search').attr('style', 'width: 93vw;');
            		$('#grid').attr('style', 'width: 93vw;');
            		$('#footer').attr('style', 'width: 93vw;');
            		grid.refreshLayout();
            	} else {
            		$('#title').attr('style', 'width: 80vw;');
            		$('#batchmonth-search').attr('style', 'width: 80vw;');
            		$('#grid').attr('style', 'width: 80vw;')
            		$('#footer').attr('style', 'width: 80vw;');
            		grid.refreshLayout();
            	}
            	

            });
       		
       		// 사이드바에서 선택한 현재 페이지 고정
            $('a[data-bs-target="#iycnc-infra-nav"]').attr('aria-expanded', true);
            $('a[data-bs-target="#iycnc-infra-nav"]').attr('class', 'nav-link');
       		$('ul#iycnc-infra-nav').attr('class', 'nav-content collapse show');
       		
            $('a[data-bs-target="#iycnc-infra-maintenance-nav"]').attr('aria-expanded', true);
            $('a[data-bs-target="#iycnc-infra-maintenance-nav"]').attr('class', 'nav-link');
       		$('ul#iycnc-infra-maintenance-nav').attr('class', 'nav-content collapse show');
       		
       		$('ul#iycnc-infra-maintenance-nav li:eq(0) a').attr('class', 'active');
       		
       		
            $('th[data-column-name=total_sales_amount]').attr('title', '매출가는 매출원장의 매출MM 과 매출단가를 계산한 결과입니다.');
            $('th[data-column-name=total_sales_amount]').tooltip();
            
            $('th[data-column-name=total_purchase_amount]').attr('title', '매입가는 매출원장의 매입MM 과 매입단가를 계산한 결과입니다.');
            $('th[data-column-name=total_purchase_amount]').tooltip();
            
            $('th[data-column-name=handwrite]').attr('title', '수기데이터는 매출원장에 없는 데이터를 추가한 것으로 배치에 의해 추가/삭제 되지 않습니다.');
            $('th[data-column-name=handwrite]').tooltip();


        });



    </script>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <!-- Excel Export JS File-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>

    <!-- toast-grid-pagination -->
	<script src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
    <script src="https://uicdn.toast.com/tui.pagination/v3.3.0/tui-pagination.js"></script>
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