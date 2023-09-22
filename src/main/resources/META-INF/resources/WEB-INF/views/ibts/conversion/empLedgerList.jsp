<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/icon/favicon.ico">
    <title>IBTS 컨버전스 개발자 프로파일 진행 현황 [인력기초원장]: IYF 영업관리시스템</title>
    
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
			  		<span style="font-size: 20px; font-weight: 550; color: #012970c7; font-family: 'Nunito', sans-serif;">IBTS 컨버전스 개발자 프로파일 진행 현황 [인력기초원장]</span>
				</div>
				<i class="ri-arrow-down-s-fill" id="toggle-icon"><span>접기/내리기</span></i>
                <div class="toggle-content mt-3" id="toggle-item">
            	    <!-- ======= 그리드에서 보여줄 필드 체크리스트 ======= -->
	                <div class="checkbox-container mb-3">
	                    <div class="row row-cols-4 mb-3">
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" type="checkbox" name="all-check"
	                                    checked>
	                                <span class="form-check-label">ALL</span>
	                            </label>
	                        </div>
	                    </div>
	                    <div class="row row-cols-4 mb-3">
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" type="checkbox" name="check-emp-pool"
	                                    checked>
	                                <span class="form-check-label">인력풀정보</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" type="checkbox" name="check-emp-ledger"
	                                    checked>
	                                <span class="form-check-label">인력기초원장정보</span>
	                            </label>
	                        </div>
	                    </div>
	                    <div class="row row-cols-4">
	                        
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="progress"
	                                    checked>
	                                <span class="form-check-label">진행</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="progress_reason"
	                                    checked>
	                                <span class="form-check-label">진행사유</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="company"
	                                    checked>
	                                <span class="form-check-label">소속</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="department"
	                                    checked>
	                                <span class="form-check-label">사업부서</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="site"
	                                    checked>
	                                <span class="form-check-label">사이트명</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="client"
	                                    checked>
	                                <span class="form-check-label">진행업체</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="project_name"
	                                    checked>
	                                <span class="form-check-label">프로젝트명</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="brief"
	                                    checked>
	                                <span class="form-check-label">적요란</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input emp-pool" data-table="emp-pool" type="checkbox" name="column" value="sourcing_manager"
	                                    checked>
	                                <span class="form-check-label">소싱담당자</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="name" checked>
	                                <span class="form-check-label">이름</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="phonenumber"
	                                    checked>
	                                <span class="form-check-label">전화번호</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-pool" type="checkbox" name="column" value="birthdate" checked>
	                                <span class="form-check-label">생년월일</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-pool" type="checkbox" name="column" value="email" checked>
	                                <span class="form-check-label">이메일</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-pool" type="checkbox" name="column" value="address" checked>
	                                <span class="form-check-label">주소</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-pool" type="checkbox" name="column" value="education" checked>
	                                <span class="form-check-label">학력</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-pool" type="checkbox" name="column" value="school_name"
	                                    checked>
	                                <span class="form-check-label">학교명</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-pool" type="checkbox" name="column" value="major" checked>
	                                <span class="form-check-label">학과</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-pool" type="checkbox" name="column" value="career_years"
	                                    checked>
	                                <span class="form-check-label">경력</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-pool" type="checkbox" name="column" value="career_field"
	                                    checked>
	                                <span class="form-check-label">분야</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-pool" type="checkbox" name="column" value="career_level"
	                                    checked>
	                                <span class="form-check-label">등급</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="assign_date" checked>
	                                <span class="form-check-label">투입일</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="end_date" checked>
	                                <span class="form-check-label">종료일</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="resign_date"
	                                    checked>
	                                <span class="form-check-label">철수날짜</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="sales_mm" checked>
	                                <span class="form-check-label">매출MM</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="purchase_mm" checked>
	                                <span class="form-check-label">매입MM</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="sales_unit"
	                                    checked>
	                                <span class="form-check-label">매출단가</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="purchase_unit" checked>
	                                <span class="form-check-label">매입단가</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="resume_submit_date"
	                                    checked>
	                                <span class="form-check-label">이력서제출날짜</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="i_contract_date"
	                                    checked>
	                                <span class="form-check-label">개인계약일</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="c_contract_date"
	                                    checked>
	                                <span class="form-check-label">업체계약일</span>
	                            </label>
	                        </div>
	                        <div class="col">
	                            <label class="form-check">
	                                <input class="form-check-input" data-table="emp-ledger" type="checkbox" name="column" value="issues"
	                                    checked>
	                                <span class="form-check-label">특이사항</span>
	                            </label>
	                        </div>
	                    </div>
	                </div>
	                <!-- End 그리드에서 보여줄 필드 체크리스트-->
                </div>


                <div class="d-flex mt-5">
                    <button type="button" class="btn btn-primary ms-2" id="btnShowRegisterPage">인력투입예정페이지</button>
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
            // 그리드 출력
            const grid = new tui.Grid({
                el: document.querySelector('#grid'),
                scrollX: true,
                scrollY: true,
                columnOptions: {
                    minWidth: 120,
                },
                columns: [
                    {
                        header: '진행',
                        name: 'progress',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '진행사유',
                        name: 'progress_reason',
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
                        header: '사이트',
                        name: 'site',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '진행업체',
                        name: 'client',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '프로젝트명',
                        name: 'project_name',
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
                        header: '소싱담당자',
                        name: 'sourcing_manager',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '이름',
                        name: 'name',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '전화번호',
                        name: 'phonenumber',
                        width: 'auto',
                        align: 'center',
                        filter: 'select',
                    },
                    {
                        header: '생년월일',
                        name: 'birthdate',
                        width: 'auto',
                        align: 'center',
                        
                    },
                    {
                        header: '이메일',
                        name: 'email',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '주소',
                        name: 'address',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '학력',
                        name: 'education',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '학교명',
                        name: 'school_name',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '학과',
                        name: 'major',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '경력',
                        name: 'career_years',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '분야',
                        name: 'career_field',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '등급',
                        name: 'career_level',
                        width: 'auto',
                        align: 'center',
                        filter: 'select'
                    },
                    {
                        header: '투입일',
                        name: 'assign_date',
                        width: 'auto',
                        align: 'center',
                    },
                    {
                        header: '종료일',
                        name: 'end_date',
                        width: 'auto',
                        align: 'center',
                    },
                    {
                        header: '철수날짜',
                        name: 'resign_date',
                        width: 'auto',
                        align: 'center',
                    },
                    {
                        header: '매출MM',
                        name: 'sales_mm',
                        width: 'auto',
                        align: 'center',
                        filter: 'number'
                    },
                    {
                        header: '매입MM',
                        name: 'purchase_mm',
                        width: 'auto',
                        align: 'center',
                        filter: 'number'
                    },
                    {
                        header: '매출단가',
                        name: 'sales_unit',
                        width: 'auto',
                        align: 'right',
                        filter: 'number',
                        formatter({value}) {
                        	return value.toLocaleString('ko-KR');
                        }
                    },
                    {
                        header: '매입단가',
                        name: 'purchase_unit',
                        width: 'auto',
                        align: 'right',
                        filter: 'number',
                        formatter({value}) {
                        	return value.toLocaleString('ko-KR');
                        }
                    },
                    {
                        header: '이력서제출일자',
                        name: 'resume_submit_date',
                        width: 'auto',
                        align: 'center',
                    },
                    {
                        header: '개인계약일',
                        name: 'i_contract_date',
                        width: 'auto',
                        align: 'center',
                    },
                    {
                        header: '업체계약일',
                        name: 'c_contract_date',
                        width: 'auto',
                        align: 'center',
                    },
                    {
                        header: '특이사항',
                        name: 'issues',
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
            
            
            // 그리드 데이터 ajax로 가져오기
            $.ajax({
                url: "${pageContext.request.contextPath}/empLedger.ajax/company/IBTS/department/CONVERSION" ,
                method: "GET",
                success: function (empLedgerList) {
                    empLedgerList.forEach(empLedger => {
	                    // Date 년월일 Formatting
                        if (empLedger.birthdate) {
                            const birthdate = new Date(empLedger.birthdate);
                            empLedger.birthdate = birthdate.getFullYear() + '-' + String(Number(birthdate.getMonth() + 1)).padStart(2, '0') + '-' + String(birthdate.getDate()).padStart(2, '0');
                        }
                        if (empLedger.assign_date) {
                            const assign_date = new Date(empLedger.assign_date);
                            empLedger.assign_date = assign_date.getFullYear() + '-' + String(Number(assign_date.getMonth() + 1)).padStart(2, '0') + '-' + String(assign_date.getDate()).padStart(2, '0');
                        }
                        if (empLedger.end_date) {
                            const end_date = new Date(empLedger.end_date);
                            empLedger.end_date = end_date.getFullYear() + '-' + String(Number(end_date.getMonth() + 1)).padStart(2, '0') + '-' + String(end_date.getDate()).padStart(2, '0');
                        }
                        if (empLedger.resume_submit_date) {
                            const resume_submit_date = new Date(empLedger.resume_submit_date);
                            empLedger.resume_submit_date = resume_submit_date.getFullYear() + '-' + String(Number(resume_submit_date.getMonth() + 1)).padStart(2, '0') + '-' + String(resume_submit_date.getDate()).padStart(2, '0');
                        }
                        if (empLedger.resign_date) {
                            const resign_date = new Date(empLedger.resign_date);
                            empLedger.resign_date = resign_date.getFullYear() + '-' + String(Number(resign_date.getMonth() + 1)).padStart(2, '0') + '-' + String(resign_date.getDate()).padStart(2, '0');
                        }
                        if (empLedger.i_contract_date) {
                            const i_contract_date = new Date(empLedger.i_contract_date);
                            empLedger.i_contract_date = i_contract_date.getFullYear() + '-' + String(Number(i_contract_date.getMonth() + 1)).padStart(2, '0') + '-' + String(i_contract_date.getDate()).padStart(2, '0');
                        }
                        if (empLedger.c_contract_date) {
                            const c_contract_date = new Date(empLedger.c_contract_date);
                            empLedger.c_contract_date = c_contract_date.getFullYear() + '-' + String(Number(c_contract_date.getMonth() + 1)).padStart(2, '0') + '-' + String(c_contract_date.getDate()).padStart(2, '0');
                        }
                        
                     	// 휴대폰번호 Formatting
                        if (empLedger.phonenumber) {
                        	empLedger.phonenumber = empLedger.phonenumber.substr(0,3) + '-' + empLedger.phonenumber.substr(3, 4) + '-' + empLedger.phonenumber.substr(7,4);
                        }
                     	
                     	// 컨버전스 Formatting (한글 가독성 배려)
                        if (empLedger.department === 'CONVERSION') {
                        	empLedger.department = '컨버전스';
                        }
                    });
                    
                    
                    grid.resetData(empLedgerList);
                }
            });

            // 모든 정보 체크해제시 이벤트: 컬럼 show 및 hide
            $('input[name=all-check]').click(function(){
                if (this.checked){
                    $('input[name=check-emp-pool]').prop('checked', true);
                    $('input[name=check-emp-ledger]').prop('checked', true);
                    $('input[name=column]').prop('checked', true);
                } else{
                    $('input[name=check-emp-pool]').prop('checked', false);
                    $('input[name=check-emp-ledger]').prop('checked', false);
                    $('input[name=column]').prop('checked', false);
                }
                updateColumns();
            });

            // 인력풀 테이블 정보 체크해제시 이벤트: 컬럼 show 및 hide
            $('input[name=check-emp-pool]').click(function() {
                if (this.checked){
                    $('input[data-table=emp-pool]').prop('checked', true);
                } else{
                    $('input[data-table=emp-pool]').prop('checked', false);
                }
                updateColumns('emp-pool');
            })

            // 인력기초원장 테이블 정보 체크해제시 이벤트: 컬럼 show 및 hide
            $('input[name=check-emp-ledger]').click(function() {
                if (this.checked){
                    $('input[data-table=emp-ledger]').prop('checked', true);
                } else{
                    $('input[data-table=emp-ledger]').prop('checked', false);
                }
                updateColumns('emp-ledger');
            })

            // 개별 체크해제시 이벤트: 컬럼 show 및 hide
            $('input[name=column]').change(function(){
                updateColumns();
            });

            // 체크해제시 컬럼 show 및 hide
            function updateColumns(dataTable) {
                if (!dataTable) {
                    $('input[name=column]').each(function() {
                        if (this.checked) {
                            grid.showColumn(this.value);
                        } else {
                            grid.hideColumn(this.value);
                        }
                    });
                } else {
                    $('input[data-table=' + dataTable + ']').each(function() {
                        if (this.checked) {
                            grid.showColumn(this.value);
                        } else {
                            grid.hideColumn(this.value);
                        }
                    });
                }
            }
            
            // 인력투입예정페이지 버튼 클릭시 이벤트: 페이지팝업
            $('#btnShowRegisterPage').click(function() {
                const popupUrl = '${pageContext.request.contextPath}/ibts/conversion/empLedgerRegister';
                const popupName = 'empLedgerRegister-popup';
                const popupWidth = 800;
                const popupHeight = 600;
                const left = (screen.width - popupWidth) / 2;
                const top = (screen.height - popupHeight) / 2;
                
                window.open(popupUrl, popupName, 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + left + ', top=' + top);
            });

            // 그리드 Row 더블 클릭시 이벤트: 상세정보페이지 팝업
            grid.on('dblclick', function(ev) {
                const empLedger = grid.getRow(ev.rowKey)
                const popupUrl = '${pageContext.request.contextPath}/ibts/conversion/empLedgerDetail?emp_id='+ empLedger.emp_id;
                const popupName = 'empLedgerDetail-popup';
                const popupWidth = 800;
                const popupHeight = 600;
                const left = (screen.width - popupWidth) / 2;
                const top = (screen.height - popupHeight) / 2;
                
                window.open(popupUrl, popupName, 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + left + ', top=' + top);
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
            
       		// 사이드바 접을 때 그리드 리사이징
            $('i.toggle-sidebar-btn').click(function() {
            	if ($('body').attr('class') === 'toggle-sidebar') {
            		$('#title').attr('style', 'width: 93vw;');
            		$('#grid').attr('style', 'width: 93vw;');
            		$('#footer').attr('style', 'width: 93vw;');
            		grid.refreshLayout();
            	} else {
            		$('#title').attr('style', 'width: 80vw;');
            		$('#grid').attr('style', 'width: 80vw;')
            		$('#footer').attr('style', 'width: 80vw;');
            		grid.refreshLayout();
            	}
            	
            });
       		
       		// 사이드바에서 선택한 현재 페이지 고정
            $('a[data-bs-target="#ibts-conversion-nav"]').attr('aria-expanded', true);
            $('a[data-bs-target="#ibts-conversion-nav"]').attr('class', 'nav-link');
       		$('ul#ibts-conversion-nav').attr('class', 'nav-content collapse show');
       		$('ul#ibts-conversion-nav li:eq(0) a').attr('class', 'active');


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