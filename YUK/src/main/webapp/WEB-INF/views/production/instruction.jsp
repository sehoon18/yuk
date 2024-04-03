<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>요기육</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/simple-datatables/style.css"> --%>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
    
	<!-- Required meta tags -->
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

	<!-- sweetalert2 -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>    
	
	<!--     DatePicker를 위한 css -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<style>
	tbody tr:hover {
	   	background-color:#e4e8ff;
	}
	</style>
</head>
<body>
    <div id="app">
    
	<jsp:include page="../inc/sidebar.jsp" />
            
<div class="main-content container-fluid">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>작업지시</h3>
<!--                 <p class="text-subtitle text-muted">We use 'simple-datatables' made by @fiduswriter. You can check the full documentation <a href="https://github.com/fiduswriter/Simple-DataTables/wiki">here</a>.</p> -->
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Datatable</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <section class="section">
        <div class="card">
            <div class="card-body">
            <div class="card-header" style="text-align: right;">
            <form action="${pageContext.request.contextPath}/production/instruction" method="get">
				<div class="col-lg-2 col-3" style="display: flex; align-items: center; white-space: nowrap;">
				<div style="flex: 0 1 auto; margin-right: 10px;"><b>작업지시코드</b></div>
					<input type="text" id="instructionCode" class="form-control" name="instructionCode" style="flex: 1 1 auto; width: auto; background-color: white;" placeholder="지시코드를 입력하세요">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>품목코드</b> &nbsp;&nbsp;
					<input type="text" id="lineName" class="form-control" name="productCode" style="flex: 1 1 auto; width: auto;" placeholder="품목코드를 입력하세요">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 	<b>상태</b>
					&nbsp;&nbsp;
					<select class="form-select" id="basicSelect" name="instractionStatus" style="width: 100px;">
						<option value="4">전체</option>	
						<option value="0">대기</option>
						<option value="2">완료</option>
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b>일자</b>&nbsp;&nbsp;
					<input type="text" id="startDate" class="form-control" name="sDate" placeholder="기간을 선택하세요" style="width: 140px;">
            		&nbsp; ~ &nbsp;
					<input type="text" id="endDate" class="form-control" name="eDate" placeholder="기간을 선택하세요" style="width: 140px;">
					&nbsp;&nbsp;
					<button class="btn btn-primary btn-sm" type="submit">조회</button>
				</div>
			</form>
				<button onclick="openPopup()" class="btn btn-info" >
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg> 추가
				</button>
            </div>
                <table class='table .table-bordered' id="table1">
                    <thead>
                        <tr>
                            <th>작업지시코드</th>
                            <th>라인코드</th>
                            <th>품목코드</th>
                            <th>품목명</th>
                            <th>지시수량</th>
                            <th>지시일자</th>
                            <th>작업상태</th>
                            <th>상태변경</th>
                        </tr>
                    </thead>
                    <tbody>
			            <c:forEach var="productionDTO" items="${instructionList }">
						<tr onclick="openDetailpop('${productionDTO.instructionCode}')">
                            <td>${productionDTO.instructionCode }</td>
                            <td>${productionDTO.lineCode }</td>
                            <td>${productionDTO.productCode }</td>
                            <td>${productionDTO.productName }</td>
                            <td>${productionDTO.insVol }</td>
                            <td>${productionDTO.instructionDate }</td>
                            <td>
                            <c:if test="${productionDTO.instractionStatus == 0 }">
                                작업대기                            
                            </c:if>
                            <c:if test="${productionDTO.instractionStatus == 1 }">
                            	작업중
                            </c:if>
                            <c:if test="${productionDTO.instractionStatus == 2 }">
                            	작업완료
                            </c:if>
                            </td>
							<c:if test="${productionDTO.instractionStatus == 0 }">
                            <td><button class="btn icon icon-left btn-success" onclick="statusSwitch(event, '${productionDTO.instructionCode}')"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>완료</button></td>
                            </c:if>
							<c:if test="${productionDTO.instractionStatus == 1 }">
                            <td><button class="btn icon icon-left btn-success" onclick="statusSwitch(event, '${productionDTO.instructionCode}')"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>완료</button></td>
                            </c:if>
							<c:if test="${productionDTO.instractionStatus == 2 }">
                            <td><button class="btn icon icon-left btn-success" onclick="statusSwitch(event, '${productionDTO.instructionCode}')" disabled><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>완료</button></td>
							</c:if>
                        </tr>
                        </c:forEach>
	                    </tbody>
                </table>
            </div>
        </div>

    </section>
</div>

            <footer>
                <div class="footer clearfix mb-0 text-muted">
                    <div class="float-left">
                        <p>2020 &copy; Voler</p>
                    </div>
                    <div class="float-right">
                        <p>Crafted with <span class='text-danger'><i data-feather="heart"></i></span> by <a href="http://ahmadsaugi.com">Ahmad Saugi</a></p>
                    </div>
                </div>
            </footer>
        </div>
    <script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
    
<%-- <script src="${pageContext.request.contextPath}/resources/assets/vendors/simple-datatables/simple-datatables.js"></script> --%>
<script src="${pageContext.request.contextPath}/resources/assets/js/vendors.js"></script>

    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    <script>
	    var popupWidth = 900;
	    var popupHeight = 600;
	
	    var popupX = (window.screen.width / 2) - (popupWidth / 2);
	    var popupY= (window.screen.height / 2) - (popupHeight / 2) - 100;
	    
	    function openPopup() {
	      var popup = window.open("${pageContext.request.contextPath}/production/inspop", "팝업", 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	      
	      if (popup === null || typeof(popup) === 'undefined') {
	      }
	    }
    </script>
    
    <script>
	    var popupWidth = 900;
	    var popupHeight = 600;
	
	    var popupX = (window.screen.width / 2) - (popupWidth / 2);
	    var popupY= (window.screen.height / 2) - (popupHeight / 2) - 100;
	    
	    function openDetailpop(instructionCode) {
	      var popup = window.open("${pageContext.request.contextPath}/production/insDetailpop?instructionCode="+ instructionCode, "팝업", 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	      
	      if (popup === null || typeof(popup) === 'undefined') {
	      }
	    }
    </script>
    
	<script>
	function statusSwitch(event, instructionCode) {
	    // 이벤트 버블링을 막음
	    event.stopPropagation();
	    
	    Swal.fire({
	        title: "Are you sure?",
	        text: "You won't be able to revert this!",
	        icon: "warning",
	        showCancelButton: true,
	        confirmButtonColor: "#3085d6",
	        cancelButtonColor: "#d33",
	        confirmButtonText: "Yes, delete it!"
	    }).then((result) => {
	        if (result.isConfirmed) {
	            // AJAX 호출
	            $.ajax({
	                url: "${pageContext.request.contextPath}/production/updateInsStatus",
	                type: "post",
	                data: { instructionCode: instructionCode },
	                success: function(response) {
	                    // 성공 시, 변경 완료 메시지 알림 후 페이지 새로고침
	                    Swal.fire("변경완료", "Your file has been deleted.", "success")
	                    .then(() => {
	                        location.reload(); // 페이지 새로고침
	                    });
	                },
	                error: function(xhr, status, error) {
	                    alert("변경 실패: " + error);
	                }
	            });
	        }
	    });
	}
	</script>

	<script>
	//검색 달력
	$(document).ready(function () {
	        $.datepicker.setDefaults($.datepicker.regional['ko']);
	        $("#startDate").attr("placeholder", "기간을 선택하세요");
	        $("#startDate").datepicker({
	             changeMonth: true, 
	             changeYear: true,
	             nextText: '다음 달',
	             prevText: '이전 달', 
	             dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	             dateFormat: "yy-mm-dd",
	             maxDate: 0,  // 선택할 수 있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
	             onClose: function( selectedDate ) {    
	                  //시작일(startDate) datepicker가 닫힐 때
	                  //종료일(endDate)의 선택할 수 있는 최소 날짜(minDate)를 선택한 시작일로 지정
	                 $("#endDate").datepicker( "option", "minDate", selectedDate );
	             }
	        });
	        
	        $("#endDate").attr("placeholder", "기간을 선택하세요");
	        $("#endDate").datepicker({
	             changeMonth: true, 
	             changeYear: true,
	             nextText: '다음 달',
	             prevText: '이전 달', 
	             dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	             dateFormat: "yy-mm-dd",
	             maxDate: 0, // 선택할 수 있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
	             onClose: function( selectedDate ) {    
	                 // 종료일(endDate) datepicker가 닫힐 때
	                 // 시작일(startDate)의 선택할 수 있는 최대 날짜(maxDate)를 선택한 시작일로 지정
	                 $("#startDate").datepicker( "option", "maxDate", selectedDate );
	             }
	        });
	});
	</script>
</body>
</html>