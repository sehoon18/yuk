<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>요기육</title>
    
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
		<!-- 	엑셀파일저장 -->
	<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
	
    <style>
    
    .card-header{
    font-weight: bold;
    font-size: 20px;
    }
    
    .searchArea{
    margin: 30px auto;
    }
    
    .form-control{
    width: 170px;
    display:inline-block;
    margin-left: 5px;
    margin-right: 20px;
    }
    
    #basicSelect{
    width: 90px;
    display:inline-block;
    padding: 2px;
    padding-left: 10px;
    margin-left: 5px;
    margin-right: 20px;
    }
    
    th{
    font-size: 15px !important;
    }
    
    tbody tr:hover {
	background-color:#e4e8ff;
	}
    
    #myTab > li{
    a:hover {background: #e4e8ff;
    		 border-color: #e4e8ff;}
    }
    
    </style>
    
</head>

<body>
<jsp:include page="../inc/sidebar.jsp" />

<div class="main-content container-fluid">
<h1 class="card-title"><b>입고 관리</b></h1>
<br>
    <section class="section">
        <div class="card">
            <div class="card-body">
                <div class="row">
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
            		<b>진행구분</b>
            		<select name="select1" class="form-select" id="basicSelect">
            			<option value="all">전체</option>
            			<option value="ing">미입고</option>
            			<option value="com">입고완료</option>
            		</select>
            		<b>자재입고 코드</b>
            		<input type="text" class="form-control" name="search1" placeholder="입고코드를 입력하세요">
            		<b>자재품명</b>
            		<input type="text" class="form-control" name="search2" placeholder="품명을 입력하세요">
            		<b>자재입고 일자</b>
            		<input type="text" id="startDate" class="form-control" name="search3" placeholder="기간을 선택하세요">
            		<b>~</b>&nbsp;&nbsp;&nbsp;
            		<input type="text" id="endDate" class="form-control" name="search4" placeholder="기간을 선택하세요">
            		<input type="submit" value="조회" class="btn btn-primary">
            		</form>
            		<br>
            		<button onclick="saveExcel1()" class="btn btn-info" style="float: right;">💿엑셀저장</button>
            		<br>
            	</div>
                    <table class='table table-bordered mb-0' id="mibTable" style="text-align: center;">
                    <thead>
                        <tr>
                            <th>자재입고 코드</th>
                            <th>발주 코드</th>
                            <th>품목구분</th>
                            <th>자재품명</th>
                            <th>수량</th>
                            <th>보관창고명</th>
                            <th>진행상황</th>
                            <th>자재입고 일자</th>
                            <th>담당자</th>
                            <th>입고처리</th>
                        </tr>
                    </thead>
                    <tbody>
        <c:forEach var="boundDTO" items="${inBoundBoardList}">
    	<tr>
   			<td>${boundDTO.mib_cd}</td>
    		<td>${boundDTO.ord_cd}</td>
<%--     		ord_cd에 링크 경로 발주서 onClick="location.href='${pageContext.request.contextPath}/폴더/파일?ord_cd=${DTO파일.ord_cd }'" --%>
    	    <td>
    	    <c:if test="${boundDTO.pro_type == 1}">식자재</c:if>
    	    <c:if test="${boundDTO.pro_type == 2}">포장자재</c:if>
    	    </td>
    		<td>${boundDTO.pro_name}</td>
    		<td>${boundDTO.ord_vol}</td>
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
    		<td>${boundDTO.user_name}</td>
    		<td>
    		<c:choose>
    		<c:when test="${boundDTO.mib_info_status == 0 }">
    		<sec:authorize access="hasAnyRole('ROLE_BOUND', 'ROLE_ADMIN')">
			<button type=button class="btn icon icon-left btn-danger" onclick="statusSwitch1(event, '${boundDTO.mib_cd}')">입고처리</button>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_PRODUCT', 'ROLE_PRODUCTION', 'ROLE_OC', 'ROLE_NONE')">
			<button type=button class="btn icon icon-left btn-danger" onclick="accessError()">입고처리</button>
			</sec:authorize>
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
<nav aria-label="Page navigation example" style="padding: 10px 0px;">
	
    <ul class="pagination pagination-primary justify-content-end">
		
	<c:if test="${pageDTO.startPage > 1}">
		<li class="page-item">
			<a class="page-link" href="${pageContext.request.contextPath}/bound/inBound?pageNum=${pageDTO.startPage - 1}
			&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}
			&select1=${pageDTO.select1}">
			<span aria-hidden="true">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></span></a>
		</li>
	</c:if>
	
	<c:if test="${pageDTO.startPage <= 1}">
		<li class="page-item disabled">
			<a class="page-link" href="#" tabindex="-1" aria-disabled="true">
			<span aria-hidden="true">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></span></a>
        </li>
    </c:if>

	<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
		<li class="page-item ${pageDTO.currentPage == i ? 'active' : ''}">
			<a class="page-link" href="${pageContext.request.contextPath}/bound/inBound?pageNum=${i}
			&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}
			&select1=${pageDTO.select1}">${i}</a>
		</li>
	</c:forEach>

	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
		<li class="page-item">
			<a class="page-link" href="${pageContext.request.contextPath}/bound/inBound?pageNum=${pageDTO.endPage + 1}
			&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}
			&select1=${pageDTO.select1}">
			<span aria-hidden="true">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></span></a>
		</li>
	</c:if>
	
    <c:if test="${pageDTO.endPage >= pageDTO.pageCount}">
		<li class="page-item disabled">
			<a class="page-link" href="#">
			<span aria-hidden="true">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></span></a>
		</li>
    </c:if>
    
	</ul>
	
</nav>
<!-- 페이징 끝 -->
                            </div>
                            <div class="tab-pane fade" id="pibtab" role="tabpanel" aria-labelledby="pibtab">
                                <p class='my-2'>
                <div class="searchArea">
            		<form action="${pageContext.request.contextPath}/bound/inBound2" method="get">
            		<b>진행구분</b>
            		<select name="select2" class="form-select" id="basicSelect">
            			<option value="pib_all">전체</option>
            			<option value="pib_ing">미입고</option>
            			<option value="pib_com">입고완료</option>
            		</select>
            		<b>제품입고 코드</b>
            		<input type="text" class="form-control" name="search5" placeholder="입고코드를 입력하세요">
            		<b>제품명</b>
            		<input type="text" class="form-control" name="search6" placeholder="품명을 입력하세요">
            		<b>제품입고 일자</b>
            		<input type="text" id="startDate2" class="form-control" name="search7" placeholder="기간을 선택하세요">
            		<b>~</b>&nbsp;&nbsp;&nbsp;
            		<input type="text" id="endDate2" class="form-control" name="search8" placeholder="기간을 선택하세요">
            		<input type="submit" value="조회" class="btn btn-primary">
            		</form>
            		<br>
            		<button onclick="saveExcel2()" class="btn btn-info" style="float: right;">💿엑셀저장</button>
            		<br>
            	</div>
                    <table class='table table-bordered mb-0' id="pibTable" style="text-align: center;">
                    <thead>
                        <tr>
                            <th>제품입고 코드</th>
                            <th>생산실적 코드</th>
                            <th>제품명</th>
                            <th>수량</th>
                            <th>보관창고명</th>
                            <th>진행상황</th>
                            <th>제품입고 일자</th>
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
    		<td>${boundDTO.user_name}</td>
    		<td>
    		<c:choose>
    		<c:when test="${boundDTO.pib_info_status == 0 }">
    		<sec:authorize access="hasAnyRole('ROLE_BOUND', 'ROLE_ADMIN')">
			<button type=button class="btn icon icon-left btn-danger" onclick="statusSwitch2(event, '${boundDTO.pib_cd}')">입고처리</button>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_PRODUCT', 'ROLE_PRODUCTION', 'ROLE_OC', 'ROLE_NONE')">
			<button type=button class="btn icon icon-left btn-danger" onclick="accessError()">입고처리</button>
			</sec:authorize>
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
<nav aria-label="Page navigation example" style="padding: 10px 0px;">
	
    <ul class="pagination pagination-primary justify-content-end">
		
	<c:if test="${pageDTO.startPage2 > 1}">
		<li class="page-item">
			<a class="page-link" href="${pageContext.request.contextPath}/bound/inBound2?pageNum2=${pageDTO.startPage2 - 1}
			&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}&search8=${pageDTO.search8}
			&select2=${pageDTO.select2}">
			<span aria-hidden="true">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></span></a>
		</li>
	</c:if>
	
	<c:if test="${pageDTO.startPage2 <= 1}">
		<li class="page-item disabled">
			<a class="page-link" href="#" tabindex="-1" aria-disabled="true">
			<span aria-hidden="true">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></span></a>
        </li>
    </c:if>

	<c:forEach var="i" begin="${pageDTO.startPage2}" end="${pageDTO.endPage2}" step="1">
		<li class="page-item ${pageDTO.currentPage2 == i ? 'active' : ''}">
			<a class="page-link" href="${pageContext.request.contextPath}/bound/inBound2?pageNum2=${i}
			&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}&search8=${pageDTO.search8}
			&select2=${pageDTO.select2}">${i}</a>
		</li>
	</c:forEach>

	<c:if test="${pageDTO.endPage2 < pageDTO.pageCount2}">
		<li class="page-item">
			<a class="page-link" href="${pageContext.request.contextPath}/bound/inBound2?pageNum2=${pageDTO.endPage2 + 1}
			&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}&search8=${pageDTO.search8}
			&select2=${pageDTO.select2}">
			<span aria-hidden="true">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></span></a>
		</li>
	</c:if>
	
    <c:if test="${pageDTO.endPage2 >= pageDTO.pageCount2}">
		<li class="page-item disabled">
			<a class="page-link" href="#">
			<span aria-hidden="true">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></span></a>
		</li>
    </c:if>
    
	</ul>
	
</nav>
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
    <script src="${pageContext.request.contextPath}/resources/assets/js/vendors.js"></script>
    
    <script type="text/javascript">
    
	function saveExcel1() {
		  var wb = XLSX.utils.table_to_book(document.getElementById('mibTable'), {sheet:"Sheet1", raw:true});
		  XLSX.writeFile(wb, '자재입고.xlsx');
		}
	
	function saveExcel2() {
		  var wb = XLSX.utils.table_to_book(document.getElementById('pibTable'), {sheet:"Sheet1", raw:true});
		  XLSX.writeFile(wb, '제품입고.xlsx');
		}
    
	//권한 없을 시
	function accessError() {
 		Swal.fire({
		  title: "<style='color:#000000'>권한이 없습니다.",
		  icon:"error",
		  width: 600,
		  padding: "3em",
		  color: "#FF0000",
		  background: "#fff",
		  backdrop: `
		    rgba(ff,ff,ff,0)
		    left top
		    no-repeat
		  `
		});
	}
    
	//자재 입고 처리 버튼
  	function statusSwitch1(event, mib_cd) {
	Swal.fire({
			title: "<style='color:#000000'>입고처리",
			text: "입고 처리하시겠습니까? 처리 후 복구 불가합니다.",
			background: "#fff",
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
        beforeSend: function(xhr) {
            // CSRF 토큰과 헤더 이름 읽기
            var token = $('meta[name="_csrf"]').attr('content');
            var header = $('meta[name="_csrf_header"]').attr('content');
            
            // 요청 헤더에 CSRF 토큰 추가
            xhr.setRequestHeader(header, token);
        },
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
   				title: "입고처리 불가!",
   				text: "　창고 최대 보유량 초과",
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
		title: "<style='color:#000000'>입고처리",
		text: "입고 처리하시겠습니까? 처리 후 복구 불가합니다.",
		background: "#fff",
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
    beforeSend: function(xhr) {
        // CSRF 토큰과 헤더 이름 읽기
        var token = $('meta[name="_csrf"]').attr('content');
        var header = $('meta[name="_csrf_header"]').attr('content');
        
        // 요청 헤더에 CSRF 토큰 추가
        xhr.setRequestHeader(header, token);
    },
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
				title: "입고처리 불가!",
   				text: "　창고 최대 보유량 초과",
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