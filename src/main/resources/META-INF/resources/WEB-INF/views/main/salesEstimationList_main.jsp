<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <main id="main" class="main">
<!--         <section> -->
<!--             <div class="container"> -->
				<div id="title" class="d-flex justify-content-center" style="width: 80vw;">
			  		<span style="font-size: 20px; font-weight: 550; color: #012970c7; font-family: 'Nunito', sans-serif;">${company} ${department_kr} <span id="year"></span>년 <span id="month"></span>월 용역 매출 현황 [매출추정]</span>
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
                                   <input class="form-check-input" type="checkbox" data-table="sales-result" name="column" value="batch_month" checked>
                                   <span class="form-check-label">해당년월</span>
                               </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result" name="column" value="company" checked>
                                    <span class="form-check-label">소속</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result" name="column" value="department" checked>
                                    <span class="form-check-label">사업부서</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result" name="column" value="site" checked>
                                    <span class="form-check-label">사이트명</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result" name="column" value="client" checked>
                                    <span class="form-check-label">진행업체</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result" name="column" value="project_name" checked>
                                    <span class="form-check-label">프로젝트명</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result" name="column" value="brief" checked>
                                    <span class="form-check-label">적요란</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result" name="column" value="total_sales_amount" checked>
                                    <span class="form-check-label">매출가</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result" name="column" value="total_purchase_amount" checked>
                                    <span class="form-check-label">매입가</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result" name="column" value="total_margin_amount" checked>
                                    <span class="form-check-label">이익</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" type="checkbox" data-table="sales-result" name="column" value="handwrite" checked>
                                    <span class="form-check-label">수기작성여부</span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <!-- End 그리드에서 보여줄 필드 체크리스트-->
                </div>

                <div class="d-flex mt-5">
                    <button type="button" class="btn btn-primary ms-2" id="btnManualBatch">매출추정 수동배치</button>
                </div>
          
                <div id="batchmonth-search" class="form-group mt-5" style="width: 80vw;">
                    <div class="float-end mb-5">
                        <input type="text" name="keyword" id="keyword" placeholder="해당년월">
                        <button type="button" id="btnKeywordSearch">검색</button>
                    </div>
                </div>




                <div id="grid" class="mt-5" style="width: 80vw;"></div>
<!--             </div> -->
<!--         </section> -->

    </main><!-- End #main -->

    <script>

        $(document).ready(function () {
        	
        	const company = '${company}';
   			const department = '${department}';
            
        	const currentDate = new Date();
        	currentDate.setMonth(currentDate.getMonth() + 1);

        	// 년도와 월을 가져옵니다.
        	const year = currentDate.getFullYear();
        	const month = currentDate.getMonth() + 1;

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
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '소속',
                        name: 'company',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '사업부서',
                        name: 'department',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '사이트명',
                        name: 'site',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '진행업체',
                        name: 'client',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '프로젝트명',
                        name: 'project_name',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '적요란',
                        name: 'brief',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '매출가',
                        name: 'total_sales_amount',
                        width: 'auto',
                        align: 'center',
                        formatter({value}) {
                        	return value.toLocaleString('ko-KR');
                        },
                        filter: 'number',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '매입가',
                        name: 'total_purchase_amount',
                        width: 'auto',
                        align: 'center',
                        formatter({value}) {
                        	return value.toLocaleString('ko-KR');
                        },
                        filter: 'number',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '이익',
                        name: 'total_margin_amount',
                        width: 'auto',
                        align: 'center',
                        formatter({value}) {
                        	return value.toLocaleString('ko-KR');
                        },
                        filter: 'number',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '수기작성여부',
                        name: 'handwrite',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
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
            
            $.ajax({
                url: "${pageContext.request.contextPath}/salesEstimation.ajax/company/${company}/department/${department}/batch_month/" + yyyymm,
                method: "GET",
                success: function (salesEstimation) {
                	salesEstimation.forEach(item => {
                		item.total_margin_amount = Number(item.total_sales_amount) - Number(item.total_purchase_amount);
                	});
                    grid.resetData(salesEstimation);
                    
               		// 페이지 타이틀 세팅: yyyy 및 mm (현재날짜 기준)
               		$('#year').text(year);
               		$('#month').text(monthString);
               		
                 	// 해당년월 키워드 세팅:
                  		$('#keyword').val(yyyymm);
                }
            });
            
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
                        url: "${pageContext.request.contextPath}/salesEstimation.ajax/company/${company}/department/${department}/batch_month/" + $('#keyword').val(),
                        method: "GET",
                        success: function (salesEstimation) {
                            salesEstimation.forEach(item => {
                                item.total_margin_amount = Number(item.total_sales_amount) - Number(item.total_purchase_amount);
                                
                             	// Formatting (한글 가독성 배려)
                                if (item.department === '${department}') {
                                	item.department = '${department_kr}';
                                }
                            });
                            grid.resetData(salesEstimation);
                            
                         	// 페이지 타이틀 세팅: yyyy 및 mm (키워드 기준)
                            $('#year').text($('#keyword').val().substring(0,4));
                       		$('#month').text($('#keyword').val().substring(4,6));
                        }
                    });
                    
                    
                } else {
                    alert('올바른 해당년월 키워드를 입력한 뒤 다시 검색해주세요');
                }
                
			});

       		// 수동배치 클릭이벤트
       		$('#btnManualBatch').click(function() {
       			const batch_month = $('#year').text() + $('#month').text();
       			console.log("company ::: " + company + " ::: " + "department ::: " + department + " ::: " + "batch_month ::: " + batch_month);
       			
       			if (!confirm(company + ' ' + department + ' 매출추정의 ' + $('#year').text() + '년 ' + $('#month').text() + '월' + ' 수동배치를 실행하시겠습니까?')) {
       				return;	
       			}
       			
       			$.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/salesEstimation.ajax/company/" + company + "/department/" + department + "/batch_month/" + batch_month,
                    success: function() {
                    	alert('배치실행이 정상적으로 수행되었습니다');
                    	$('#keyword').val(batch_month);
                    	$('#btnKeywordSearch').trigger('click');
                    },
                    error: function() {
                        alert('배치실행이 실패하였습니다');
                        $('#keyword').val(batch_month);
                    	$('#btnKeywordSearch').trigger('click');
                    }
                });
       		})
       		
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
            $('a[data-bs-target="#${company_lower}-${department_lower}-nav"]').attr('aria-expanded', true);
            $('a[data-bs-target="#${company_lower}-${department_lower}-nav"]').attr('class', 'nav-link');
       		$('ul#${company_lower}-${department_lower}-nav').attr('class', 'nav-content collapse show');
       		$('ul#${company_lower}-${department_lower}-nav li:eq(2) a').attr('class', 'active');
       		
       		
            $('th[data-column-name=total_sales_amount]').attr('title', '매출가는 매출원장의 매출MM 과 매출단가를 계산한 결과입니다.');
            $('th[data-column-name=total_sales_amount]').tooltip();
            
            $('th[data-column-name=total_purchase_amount]').attr('title', '매입가는 매출원장의 매입MM 과 매입단가를 계산한 결과입니다.');
            $('th[data-column-name=total_purchase_amount]').tooltip();
            
            $('th[data-column-name=handwrite]').attr('title', '수기데이터는 매출원장에 없는 데이터를 추가한 것으로 배치에 의해 추가/삭제 되지 않습니다.');
            $('th[data-column-name=handwrite]').tooltip();


        });



    </script>    