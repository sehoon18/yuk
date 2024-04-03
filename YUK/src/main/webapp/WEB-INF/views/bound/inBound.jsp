<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>입고 관리</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
    
<!--    처리 버튼 Swal css  -->
	<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    
<!--    DatePicker를 위한 css -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
    <style>
    
    .card-header{
    font-weight: bold;
    font-size: 20px;
    }
    
    .searchArea{
    text-align: center;
    }
    
    .search1{
    margin-left: 5px;
    margin-right: 20px;
    }
    
    .search2{
    margin-left: 5px;
    margin-right: 20px;
    }
    
    .search3{
    margin-left: 5px;
    }
    
    .search4{
    margin-right: 20px;
    }
    
    #page_control{
    text-align: center;
    }
    
    h2{
    font-weight: bold !important;
    }
    
    th{
    font-size: 15px !important;
    }
    
    li{
    a:hover {background: #efefef;border-color: #efefef;}
    }
    
    </style>
    
</head>

<body>
<jsp:include page="../inc/sidebar.jsp" />

<div class="main-content container-fluid">
    <section class="section">
        <div class="card">
            <div class="card-body">
                <div class="row">
                        <h2 class="card-title">입고 관리</h2>
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" id="mib-tab" data-toggle="tab" href="#mibtab" role="tab" aria-controls="mibtab"
                                    aria-selected="true">자재 입고관리</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="pib-tab" data-toggle="tab" href="#pibtab" role="tab" aria-controls="pibtab"
                                    aria-selected="false">제품 입고관리</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="mibtab" role="tabpanel" aria-labelledby="mibtab">
                                <p class='my-2'>
                <div class="searchArea">
            		<form action="${pageContext.request.contextPath}/bound/inBound" method="get">
            		자재입고 코드
            		<input type="text" class="search1" name="search1">
            		품명
            		<input type="text" class="search2" name="search2">
            		자재입고 일자
            		<input type="text" id="startDate" class="search3" name="search3" placeholder="기간을 선택하세요">
            		&nbsp; ~ &nbsp;
            		<input type="text" id="endDate" class="search4" name="search4" placeholder="기간을 선택하세요">
            		<input type="submit" value="조회" class="btn btn-primary">
            		</form>
            	</div>
                    <table class='table table-striped' id="table1">
                    <thead>
                        <tr>
                            <th>자재입고 코드</th>
                            <th>발주 코드</th>
                            <th>품목구분</th>
                            <th>자재품명</th>
                            <th>수량</th>
                            <th>보관창고명</th>
                            <th>진행상황</th>
                            <th>입고일자</th>
                            <th>담당자</th>
                            <th>입고처리</th>
                        </tr>
                    </thead>
                    <tbody>
        <c:forEach var="boundDTO" items="${inBoundBoardList}">
    	<tr>
   			<td id="ib">${boundDTO.mib_cd}</td>
    		<td>${boundDTO.ord_cd}</td>
<%--     		ord_cd에 링크 경로 발주서 onClick="location.href='${pageContext.request.contextPath}/폴더/파일?ord_cd=${DTO파일.ord_cd }'" --%>
    	    <td>
    	    <c:if test="${boundDTO.pro_type == 1}">식자재</c:if>
    	    <c:if test="${boundDTO.pro_type == 2}">포장자재</c:if>
    	    </td>
    		<td>${boundDTO.pro_name}</td>
    		<td>
<%--     		<c:choose> --%>
<%--     		<c:when test="${boundDTO.ord_cd eq null && boundDTO.per_good eq 0 }">${boundDTO.actual_completion_amount}</c:when> --%>
<%--     		<c:when test="${boundDTO.per_cd eq null}">${boundDTO.ord_vol}</c:when> --%>
<%--     		</c:choose> --%>
			${boundDTO.ord_vol}
    		</td>
    		<td>${boundDTO.wh_name}</td>
			<td>
			<c:if test="${boundDTO.mib_info_status == 0}">미입고</c:if>
			<c:if test="${boundDTO.mib_info_status == 1}">입고완료</c:if>
			</td>
    		<td>
    		<c:if test="${empty boundDTO.mib_date}">대기</c:if>
    		<c:if test="${!empty boundDTO.mib_date}">
    		<fmt:formatDate value="${boundDTO.mib_date}" pattern="yyyy-MM-dd"/></c:if>
    		</td>
    		<td>${boundDTO.user_id}</td>
    		<td>
    		<c:choose>
    		<c:when test="${boundDTO.mib_info_status == 0 }">
			<button type=button class="btn icon icon-left btn-danger" onclick="statusSwitch1(event, '${boundDTO.mib_cd}')">입고처리</button>
            </c:when>
    		<c:when test="${boundDTO.mib_info_status == 1 }">
            <button type=button class="btn icon icon-left btn-success">입고완료</button>
    		</c:when>
            </c:choose>
    		</td>
    	</tr>
    	</c:forEach>
                    </tbody>
                </table>
<!-- 페이징 시작 -->
	<div id="page_control">
	<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
		<a href="${pageContext.request.contextPath}/bound/inBound?pageNum=${pageDTO.startPage - pageDTO.pageBlock}
		&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}">[이전]</a>
	</c:if>

	<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
		<a href="${pageContext.request.contextPath}/bound/inBound?pageNum=${i}
		&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}">${i}</a>
	</c:forEach>

	<c:if test="${pageDTO.pageCount > pageDTO.endPage}">
		<a href="${pageContext.request.contextPath}/bound/inBound?pageNum=${pageDTO.startPage + pageDTO.pageBlock}
		&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}">[다음]</a>
	</c:if>
	</div>
<!-- 페이징 끝 -->
                            </div>
                            <div class="tab-pane fade" id="pibtab" role="tabpanel" aria-labelledby="pibtab">
                                <p class='my-2'>
                <div class="searchArea">
            		<form action="${pageContext.request.contextPath}/bound/inBound2" method="get">
            		제품입고 코드
            		<input type="text" class="search5" name="search5">
            		품명
            		<input type="text" class="search6" name="search6">
            		제품입고 일자
            		<input type="text" id="startDate2" class="search7" name="search7" placeholder="기간을 선택하세요">
            		&nbsp; ~ &nbsp;
            		<input type="text" id="endDate2" class="search8" name="search8" placeholder="기간을 선택하세요">
            		<input type="submit" value="조회" class="btn btn-primary">
            		</form>
            	</div>
                    <table class='table table-striped' id="table1">
                    <thead>
                        <tr>
                            <th>제품입고 코드</th>
                            <th>생산실적 코드</th>
                            <th>제품명</th>
                            <th>수량</th>
                            <th>보관창고명</th>
                            <th>진행상황</th>
                            <th>입고일자</th>
                            <th>담당자</th>
                            <th>입고처리</th>
                        </tr>
                    </thead>
                    <tbody>
        <c:forEach var="boundDTO" items="${inBoundBoardList2}">
    	<tr>
   			<td>${boundDTO.pib_cd}</td>
    		<td>${boundDTO.per_cd}</td>
    		<td>${boundDTO.pro_name}</td>
    		<td>${boundDTO.actual_completion_amount}</td>
    		<td>${boundDTO.wh_name}</td>
			<td>
			<c:if test="${boundDTO.pib_info_status == 0}">미입고</c:if>
			<c:if test="${boundDTO.pib_info_status == 1}">입고완료</c:if>
			</td>
    		<td>
    		<c:if test="${empty boundDTO.pib_date}">대기</c:if>
    		<c:if test="${!empty boundDTO.pib_date}">
    		<fmt:formatDate value="${boundDTO.pib_date}" pattern="yyyy-MM-dd"/></c:if>
    		</td>
    		<td>${boundDTO.user_id}</td>
    		<td>
    		<c:choose>
    		<c:when test="${boundDTO.pib_info_status == 0 }">
			<button type=button class="btn icon icon-left btn-danger" onclick="statusSwitch2(event, '${boundDTO.pib_cd}')">입고처리</button>
            </c:when>
    		<c:when test="${boundDTO.pib_info_status == 1 }">
            <button type=button class="btn icon icon-left btn-success">입고완료</button>
    		</c:when>
            </c:choose>
    		</td>
    	</tr>
    	</c:forEach>
                    </tbody>
                </table>
<!-- 페이징 시작 -->
	<div id="page_control">
	<c:if test="${pageDTO.startPage2 > pageDTO.pageBlock}">
		<a href="${pageContext.request.contextPath}/bound/inBound?pageNum2=${pageDTO.startPage2 - pageDTO.pageBlock}
		&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}&search8=${pageDTO.search8}">[이전]</a>
	</c:if>

	<c:forEach var="i" begin="${pageDTO.startPage2}" end="${pageDTO.endPage2}" step="1">
		<a href="${pageContext.request.contextPath}/bound/inBound?pageNum2=${i}
		&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}&search8=${pageDTO.search8}">${i}</a>
	</c:forEach>

	<c:if test="${pageDTO.pageCount2 > pageDTO.endPage2}">
		<a href="${pageContext.request.contextPath}/bound/inBound?pageNum2=${pageDTO.startPage2 + pageDTO.pageBlock}
		&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}&search8=${pageDTO.search8}">[다음]</a>
	</c:if>
	</div>
<!-- 페이징 끝 -->
                            </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </section>
</div>


    <script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    
    <script type="text/javascript">
    
	//자재 입고 처리 버튼
  	function statusSwitch1(event, mib_cd) {
	Swal.fire({
			title: "입고처리",
			text: "입고 처리하시겠습니까? 처리 후 복구 불가합니다.",
			icon: "warning",
			showCancelButton: true,
			confirmButtonColor: "#3085d6",
			cancelButtonColor: "#d33",
			confirmButtonText: "입고처리",
			cancelButtonText: "취소"
	}).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
    	url: '${pageContext.request.contextPath}/bound/inBoundPro1',
        method: 'POST',
        data: {mib_cd : mib_cd},
        success: function(response) {
        	Swal.fire({
					title: "입고처리 완료!",
					icon: "success" 
			}).then(() => {
                location.reload(); // 페이지 새로고침
            });
        },
        error: function(xhr, status, error) {
        	Swal.fire({
   				title: "입고처리 에러!",
   				icon: "error"
   			})
        }
      });
    }
  });
};

	//제품 입고 처리 버튼
	function statusSwitch2(event, pib_cd) {
	Swal.fire({
		title: "입고처리",
		text: "입고 처리하시겠습니까? 처리 후 복구 불가합니다.",
		icon: "warning",
		showCancelButton: true,
		confirmButtonColor: "#3085d6",
		cancelButtonColor: "#d33",
		confirmButtonText: "입고처리",
		cancelButtonText: "취소"
	}).then((result) => {
	if (result.isConfirmed) {
  	$.ajax({
	url: '${pageContext.request.contextPath}/bound/inBoundPro2',
    method: 'POST',
    data: {pib_cd : pib_cd},
    success: function(response) {
    	Swal.fire({
				title: "입고처리 완료!",
				icon: "success" 
		}).then(() => {
            location.reload(); // 페이지 새로고침
        });
    },
    error: function(xhr, status, error) {
    	Swal.fire({
				title: "입고처리 에러!",
				icon: "error"
			})
    }
  });
}
});
};

	
	//입고관리 현재 탭 유지
    $(document).ready(function(){
       // 탭이 변경될 때 sessionStorage에 현재 탭 ID 저장
       $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
           var tabId = $(e.target).attr('id');
           sessionStorage.setItem('currentTab', tabId);
       });
        // 페이지 로드 시 sessionStorage에서 현재 탭 ID 불러와서 해당 탭으로 전환
       var currentTab = sessionStorage.getItem('currentTab');
       if (currentTab) {
           $('#' + currentTab).tab('show');
       }
    });
	
    
    //검색 달력(자재입고)
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
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
    
  	//검색 달력(제품입고)
  	$(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $("#startDate2").datepicker({
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
                     $("#endDate2").datepicker( "option", "minDate", selectedDate );
                 }
            });
            
            $("#endDate2").datepicker({
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
                     $("#startDate2").datepicker( "option", "maxDate", selectedDate );
                 }
            });
    });
    
    </script>
    
</body>
</html>