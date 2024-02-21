<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <main id="main" class="main">
<!--         <section> -->
<!--             <div class="container"> -->
				<div id="title" class="d-flex justify-content-center" style="width: 80vw;">
			  		<span style="font-size: 20px; font-weight: 550; color: #012970c7; font-family: 'Nunito', sans-serif;">${company} ${department_kr} <span id="year"></span>년 <span id="month"></span>월 매출 원가 현황</span>
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
                        <div class="row row-cols-4">
                            <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="소속"
	                                    checked>
	                                <span class="form-check-label">소속</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="사업부서"
	                                    checked>
	                                <span class="form-check-label">사업부서</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="사이트"
	                                    checked>
	                                <span class="form-check-label">사이트</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="진행업체"
	                                    checked>
	                                <span class="form-check-label">진행업체</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="프로젝트명"
	                                    checked>
	                                <span class="form-check-label">프로젝트명</span>
	                            </label>
	                        </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input emp-pool" data-table="emp-pool" type="checkbox"
                                        name="column" value="소싱담당자" checked>
                                    <span class="form-check-label">소싱담당자</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input emp-pool" data-table="emp-pool" type="checkbox"
                                        name="column" value="인원" checked>
                                    <span class="form-check-label">인원</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input emp-pool" data-table="emp-pool" type="checkbox"
                                        name="column" value="자동계산mm" checked>
                                    <span class="form-check-label">자동계산MM</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column"
                                        value="이름" checked>
                                    <span class="form-check-label">이름</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" data-table="emp-pool" type="checkbox" name="column"
                                        value="경력" checked>
                                    <span class="form-check-label">경력</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" data-table="emp-pool" type="checkbox" name="column"
                                        value="분야" checked>
                                    <span class="form-check-label">분야</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" data-table="emp-pool" type="checkbox" name="column"
                                        value="등급" checked>
                                    <span class="form-check-label">등급</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" data-table="emp-ledger" type="checkbox"
                                        name="column" value="투입일" checked>
                                    <span class="form-check-label">투입일</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" data-table="emp-ledger" type="checkbox"
                                        name="column" value="종료일" checked>
                                    <span class="form-check-label">종료일</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" data-table="emp-ledger" type="checkbox"
                                        name="column" value="철수일" checked>
                                    <span class="form-check-label">철수일</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" data-table="emp-ledger" type="checkbox"
                                        name="column" value="매출단가" checked>
                                    <span class="form-check-label">매출단가</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" data-table="emp-ledger" type="checkbox"
                                        name="column" value="청구율" checked>
                                    <span class="form-check-label">청구율(%)</span>
                                </label>
                            </div>
                             <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" data-table="sales-ledger" type="checkbox"
                                        name="column" value="청구금액" checked>
                                    <span class="form-check-label">청구금액</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" data-table="sales-ledger" type="checkbox"
                                        name="column" value="원가단가" checked>
                                    <span class="form-check-label">원가단가</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" data-table="sales-ledger" type="checkbox"
                                        name="column" value="mm원가" checked>
                                    <span class="form-check-label">M/M원가</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" data-table="sales-ledger" type="checkbox"
                                        name="column" value="이익" checked>
                                    <span class="form-check-label">이익</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" data-table="sales-ledger" type="checkbox"
                                        name="column" value="이익율" checked>
                                    <span class="form-check-label">이익율(%)</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" data-table="sales-ledger" type="checkbox"
                                        name="column" value="비율" checked>
                                    <span class="form-check-label">비율</span>
                                </label>
                            </div>
                            <div class="col">
                                <label class="form-check">
                                    <input class="form-check-input" data-table="emp-ledger" type="checkbox"
                                        name="column" value="특이사항" checked>
                                    <span class="form-check-label">특이사항</span>
                                </label>
                            </div>

                        </div>
                    </div>
                    <!-- End 그리드에서 보여줄 필드 체크리스트-->
                </div>
				
                <div class="d-flex mt-5">
                    <button type="button" class="btn btn-primary ms-2" id="btnManualBatch">MM 자동계산</button>
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
                    minWidth: 125,
                },
                columns: [
                    {
                        header: '소속',
                        name: '소속',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '사업부서',
                        name: '사업부서',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '사이트',
                        name: '사이트',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '진행업체',
                        name: '진행업체',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '프로젝트명',
                        name: '프로젝트명',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '소싱담당자',
                        name: '소싱담당자',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '인원',
                        name: '인원',
                        width: 'auto',
                        align: 'center',
                        filter: 'number',
                        formatter({value}) {
                        	return value.toLocaleString('ko-KR');
                        },
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '자동계산MM',
                        name: '자동계산mm',
                        width: 'auto',
                        align: 'center',
                        filter: 'number',
                        formatter({value}) {
                        	return value.toLocaleString('ko-KR');
                        },
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '이름',
                        name: '이름',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '경력',
                        name: '경력',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '분야',
                        name: '분야',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '등급',
                        name: '등급',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '투입일',
                        name: '투입일',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '종료일',
                        name: '종료일',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '철수일',
                        name: '철수일',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '매출단가',
                        name: '매출단가',
                        width: 'auto',
                        align: 'right',
                        filter: 'number',
                        formatter({value}) {
                        	return value.toLocaleString('ko-KR');
                        },
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '청구율(%)',
                        name: '청구율',
                        width: 'auto',
                        align: 'center',
                        filter: 'number',
                        formatter({value}) {
                        	return value + '%';
                        },
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '청구금액',
                        name: '청구금액',
                        width: 'auto',
                        align: 'center',
                        filter: 'number',
                        formatter({value}) {
                        	return value.toLocaleString('ko-KR');
                        },
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '원가단가',
                        name: '원가단가',
                        width: 'auto',
                        align: 'center',
                        filter: 'number',
                        formatter({value}) {
                        	return value.toLocaleString('ko-KR');
                        },
                        sortable: true,
                        sortingType: 'desc'
                    },
                  
                    {
                        header: 'M/M원가',
                        name: 'mm원가',
                        width: 'auto',
                        align: 'right',
                        filter: 'number',
                        formatter({value}) {
                        	return value.toLocaleString('ko-KR');
                        },
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '이익',
                        name: '이익',
                        width: 'auto',
                        align: 'right',
                        filter: 'number',
                        formatter({value}) {
                        	return value.toLocaleString('ko-KR');
                        },
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '이익율(%)',
                        name: '이익율',
                        width: 'auto',
                        align: 'right',
                        filter: 'number',
                        formatter({value}) {
                        	if (!value) {
                        		return '-'
                        	} else {
	                        	return value + '%';
                        	}
                        },
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '비율',
                        name: '비율',
                        width: 'auto',
                        align: 'right',
                        filter: 'number',
                        formatter({value}) {
                        	if (!value) {
                        		return '-'
                        	} else {
	                        	return value;
                        	}
                        },
                        sortable: true,
                        sortingType: 'desc'
                    },
                    {
                        header: '특이사항',
                        name: '특이사항',
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


            // 그리드 데이터 ajax로 가져오기
            $.ajax({
                url: "${pageContext.request.contextPath}/salesCostStatus.ajax/company/${company}/department/${department}/batch_month/" + yyyymm,
                method: "GET",
                success: function (selesCostStatusList) {
                	selesCostStatusList.forEach(item => {
                        
                     	// Formatting (한글 가독성 배려)
                        if (item.department === '${department}') {
                        	item.department = '${department_kr}';
                        }
                    });
                	
                    grid.resetData(selesCostStatusList);
                    
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
            
         	// 그리드 Row 더블 클릭시 이벤트: 상세정보페이지 팝업
            grid.on('dblclick', function (ev) {
                const empLedger = grid.getRow(ev.rowKey)
                
                if (!empLedger.emp_history_id) {
                	// To do:: 해당년월이 이번달이면 emp_id로 상세팝업페이지불러와서 t_emp_ledger테이블 update(동시에 t_emp_ledger_history테이블 insert) 기능구현
                	
                } else {
                	
	                // To do:: 해당년월이 과거면 emp_history_id로 상세팝업페이지 불러와서 t_emp_ledger_history 테이블 update 기능구현
                }
                
                	// 하다가 안되시면 목요일 저녁에 구현하겠습니다
//                 const popupUrl = '${pageContext.request.contextPath}/${company_lower}/${department_lower}/salesLedgerDetail?sales_id=' + salesLedger.sales_id;
//                 const popupName = 'salesLedgerDetail-popup';
//                 const popupWidth = 800;
//                 const popupHeight = 600;
//                 const left = (screen.width - popupWidth) / 2;
//                 const top = (screen.height - popupHeight) / 2;

//                 window.open(popupUrl, popupName, 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + left + ', top=' + top);
            });

            
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
                        url: "${pageContext.request.contextPath}/salesCostStatus.ajax/company/${company}/department/${department}/batch_month/" + $('#keyword').val(),
                        method: "GET",
                        success: function (salesEstimation) {
                            salesEstimation.forEach(item => {
                                
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
       			
       			if (!confirm(company + ' ' + department + ' 매출 원가 현황의 ' + $('#year').text() + '년 ' + $('#month').text() + '월' + ' MM 자동계산을 실행하시겠습니까?')) {
       				return;	
       			}
       			
       			$.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/salesCostStatus.ajax/company/${company}/department/${department}/batch_month/" + $('#keyword').val(),
                    success: function() {
                    	alert('MM 자동계산이 정상적으로 수행되었습니다');
                    	$('#keyword').val(batch_month);
                    	$('#btnKeywordSearch').trigger('click');
                    },
                    error: function() {
                        alert('MM 자동계산이 실패하였습니다');
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
       		$('ul#${company_lower}-${department_lower}-nav li:eq(4) a').attr('class', 'active');


        });



    </script>    