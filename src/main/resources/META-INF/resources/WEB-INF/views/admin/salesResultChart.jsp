<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/icon/favicon.ico">
    <title>통계: IYF 영업관리시스템</title>

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

    <!-- ======= Header ======= -->
    <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
    <!-- End Header -->

    <!-- ======= Sidebar ======= -->
    <jsp:include page="/WEB-INF/views/sidebar.jsp"></jsp:include>
    <!-- End Sidebar-->

    <main id="main" class="main">

        <section>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card" style="width: 80vw;">
                        <div class="card-body">
                            <h5 class="card-title">ITO 연간 매출실적</h5>

                            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill"
                                        data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                                        aria-selected="true">IYCNC</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill"
                                        data-bs-target="#pills-profile" type="button" role="tab"
                                        aria-controls="pills-profile" aria-selected="false" tabindex="-1">IBTS</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill"
                                        data-bs-target="#pills-contact" type="button" role="tab"
                                        aria-controls="pills-contact" aria-selected="false" tabindex="-1">IYS</button>
                                </li>
                            </ul>
                            <div class="tab-content pt-2" id="myTabContent">
                                <div class="tab-pane fade show active" id="pills-home" role="tabpanel"
                                    aria-labelledby="home-tab">
                                    <!-- Column Chart -->
                                    <div id="columnChart1"></div>
                                    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
                                    <script>
                                        $(document).ready(function () {
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/admin/salesThisYearResultByCompanyAndDepartment.ajax/company/IYCNC/department/ITO",
                                                method: "GET",
                                                dataType: "json",
                                                success: function (response) {
                                                	const labelList = [];
                                                	const totalSalesList = [];
   													const totalPurchaseList = [];
   													const totalMarginList = [];
                                                	response.forEach(item => {
                                                		labelList.push(item.해당년월);
                                                		totalSalesList.push(Number(item.총매출가));
                                                		totalPurchaseList.push(Number(item.총매입가));
                                                		totalMarginList.push(Number(item.총매출가) - Number(item.총매입가));
                                                		
                                                	});
                                                    new ApexCharts(document.querySelector("#columnChart1"), {
                                                        series: [{
                                                            name: '총 매출가',
                                                            data: totalSalesList
                                                        }, {
                                                            name: '총 매입가',
                                                            data: totalPurchaseList
                                                        }, {
                                                            name: '총 수익',
                                                            data: totalMarginList
                                                        }],
                                                        chart: {
                                                            type: 'bar',
                                                            height: 350,
                                                            toolbar: {
	                                                            export: {
		                                                            csv: {
		                                                        	   filename: 'IYCNC ITO 연간 매출실적',
		                                                            	headerCategory: '해당년월',
	                                                            }
                                                            },
                                                            }
                                                        },
                                                        plotOptions: {
                                                            bar: {
                                                                horizontal: false,
                                                                columnWidth: '55%',
                                                                endingShape: 'rounded'
                                                            },
                                                        },
                                                        dataLabels: {
                                                            enabled: false
                                                        },
                                                        stroke: {
                                                            show: true,
                                                            width: 2,
                                                            colors: ['transparent']
                                                        },
                                                        xaxis: {
                                                       		categories: labelList
                                                        },
                                                        yaxis: {
                                                            title: {
                                                                text: '(천 원)'
                                                            },
                                                            labels: {
	                                                            formatter: function(val) {
	                                                              	return (val / 1000);
	                                                            }
                                                            }
                                                        },
                                                        fill: {
                                                            opacity: 1
                                                        },
                                                        tooltip: {
                                                            y: {
                                                                formatter: function (val) {
                                                                    return Number(val)/1000 + "천 원"
                                                                }
                                                            }
                                                        },
                                                    }).render();
                                                }
                                            })
                                        });

                                    </script>
                                    <!-- End Column Chart -->
                                </div>

                                <div class="tab-pane fade" id="pills-profile" role="tabpanel"
                                    aria-labelledby="profile-tab">
                                    <!-- Column Chart -->
                                    <div id="columnChart2"></div>
                                    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
                                    <script>
//                                         $(document).ready(function () {
//                                             $.ajax({
//                                                 url: "${pageContext.request.contextPath}/admin/sales/salesByBranchLocationList/" + "신도림점",
//                                                 method: "GET",
//                                                 dataType: "json",
//                                                 success: function (response) {

//                                                     const tempList1 = []; // 셜록홈즈
//                                                     const tempList2 = []; // 지구탈출
//                                                     const tempList3 = []; // 황금열쇠

//                                                     for (let i = 0; i < 12 * 3; i++) {
//                                                         const element = response[i];

//                                                         if (element.questName === '셜록홈즈') {
//                                                             tempList1.push(element);
//                                                         } else if (element.questName === '지구탈출') {
//                                                             tempList2.push(element);
//                                                         } else if (element.questName === '황금열쇠') {
//                                                             tempList3.push(element);
//                                                         }
//                                                     }

//                                                     const list1 = tempList1.reverse(); // 셜록홈즈
//                                                     const salesList1 = [];
//                                                     const monthList = [];

//                                                     list1.forEach((element) => {
//                                                         salesList1.push(element.sales / 10000);
//                                                     });
//                                                     list1.forEach((element) => {
//                                                         monthList.push(element.month);
//                                                     });

//                                                     const list2 = tempList2.reverse(); // 지구탈출
//                                                     const salesList2 = [];

//                                                     list2.forEach((element) => {
//                                                         salesList2.push(element.sales / 10000);
//                                                     });

//                                                     const list3 = tempList3.reverse(); // 황금열쇠
//                                                     const salesList3 = [];

//                                                     list3.forEach((element) => {
//                                                         salesList3.push(element.sales / 10000);
//                                                     });

//                                                     new ApexCharts(document.querySelector("#columnChart2"), {
//                                                         series: [{
//                                                             name: list1[0].questName,
//                                                             data: salesList1
//                                                         }, {
//                                                             name: list2[0].questName,
//                                                             data: salesList2
//                                                         }, {
//                                                             name: list3[0].questName,
//                                                             data: salesList3
//                                                         }],
//                                                         chart: {
//                                                             type: 'bar',
//                                                             height: 350
//                                                         },
//                                                         plotOptions: {
//                                                             bar: {
//                                                                 horizontal: false,
//                                                                 columnWidth: '55%',
//                                                                 endingShape: 'rounded'
//                                                             },
//                                                         },
//                                                         dataLabels: {
//                                                             enabled: false
//                                                         },
//                                                         stroke: {
//                                                             show: true,
//                                                             width: 2,
//                                                             colors: ['transparent']
//                                                         },
//                                                         xaxis: {
//                                                             categories: monthList,
//                                                         },
//                                                         yaxis: {
//                                                             title: {
//                                                                 text: '(만원)'
//                                                             }
//                                                         },
//                                                         fill: {
//                                                             opacity: 1
//                                                         },
//                                                         tooltip: {
//                                                             y: {
//                                                                 formatter: function (val) {
//                                                                     return val + "만원"
//                                                                 }
//                                                             }
//                                                         }
//                                                     }).render();
//                                                 }
//                                             })
//                                         });

                                    </script>
                                    <!-- End Column Chart -->
                                </div>

                                <div class="tab-pane fade" id="pills-contact" role="tabpanel"
                                    aria-labelledby="contact-tab">
                                    <!-- Column Chart -->
                                    <div id="columnChart3"></div>
                                    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
                                    <script>
//                                         $(document).ready(function () {
//                                             $.ajax({
//                                                 url: "${pageContext.request.contextPath}/admin/sales/salesByBranchLocationList/" + "신촌점",
//                                                 method: "GET",
//                                                 dataType: "json",
//                                                 success: function (response) {

//                                                     const tempList1 = []; // 셜록홈즈
//                                                     const tempList2 = []; // 지구탈출
//                                                     const tempList3 = []; // 황금열쇠

//                                                     for (let i = 0; i < 12 * 3; i++) {
//                                                         const element = response[i];

//                                                         if (element.questName === '셜록홈즈') {
//                                                             tempList1.push(element);
//                                                         } else if (element.questName === '지구탈출') {
//                                                             tempList2.push(element);
//                                                         } else if (element.questName === '황금열쇠') {
//                                                             tempList3.push(element);
//                                                         }
//                                                     }

//                                                     const list1 = tempList1.reverse(); // 셜록홈즈
//                                                     const salesList1 = [];
//                                                     const monthList = [];

//                                                     list1.forEach((element) => {
//                                                         salesList1.push(element.sales / 10000);
//                                                     });
//                                                     list1.forEach((element) => {
//                                                         monthList.push(element.month);
//                                                     });

//                                                     const list2 = tempList2.reverse(); // 지구탈출
//                                                     const salesList2 = [];

//                                                     list2.forEach((element) => {
//                                                         salesList2.push(element.sales / 10000);
//                                                     });

//                                                     const list3 = tempList3.reverse(); // 황금열쇠
//                                                     const salesList3 = [];

//                                                     list3.forEach((element) => {
//                                                         salesList3.push(element.sales / 10000);
//                                                     });

//                                                     new ApexCharts(document.querySelector("#columnChart3"), {
//                                                         series: [{
//                                                             name: list1[0].questName,
//                                                             data: salesList1
//                                                         }, {
//                                                             name: list2[0].questName,
//                                                             data: salesList2
//                                                         }, {
//                                                             name: list3[0].questName,
//                                                             data: salesList3
//                                                         }],
//                                                         chart: {
//                                                             type: 'bar',
//                                                             height: 350
//                                                         },
//                                                         plotOptions: {
//                                                             bar: {
//                                                                 horizontal: false,
//                                                                 columnWidth: '55%',
//                                                                 endingShape: 'rounded'
//                                                             },
//                                                         },
//                                                         dataLabels: {
//                                                             enabled: false
//                                                         },
//                                                         stroke: {
//                                                             show: true,
//                                                             width: 2,
//                                                             colors: ['transparent']
//                                                         },
//                                                         xaxis: {
//                                                             categories: monthList,
//                                                         },
//                                                         yaxis: {
//                                                             title: {
//                                                                 text: '(만원)'
//                                                             }
//                                                         },
//                                                         fill: {
//                                                             opacity: 1
//                                                         },
//                                                         tooltip: {
//                                                             y: {
//                                                                 formatter: function (val) {
//                                                                     return val + "만원"
//                                                                 }
//                                                             }
//                                                         }
//                                                     }).render();
//                                                 }
//                                             })
//                                         });

                                    </script>
                                    <!-- End Column Chart -->
                                </div>

                            </div>

                        </div>
                    </div><!-- End Pills Tabs -->

                </div>

            </div>
        </section>

    </main><!-- End #main -->

    <!-- ======= Footer ======= -->
    <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
    <!-- END Footer -->
    
    <script>
    	$(document).ready(function() {
    		
       		// 사이드바 접을 때 그리드 리사이징
            $('i.toggle-sidebar-btn').click(function() {
            	if ($('body').attr('class') === 'toggle-sidebar') {
            		$('.card').attr('style', 'width: 93vw;');
            		$('#footer').attr('style', 'width: 93vw;');
            	} else {
            		$('.card').attr('style', 'width: 80vw;')
            		$('#footer').attr('style', 'width: 80vw;');
            	}
            	

            });
    	});
    </script>


    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

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