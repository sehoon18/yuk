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
    
    </style>
    
</head>

<body>
<jsp:include page="../inc/sidebar.jsp" />

<div class="main-content container-fluid">
<h1 class="card-title"><b>출고 관리</b></h1>
<br>
    <section class="section">
        <div class="card">
            <div class="card-body">
            	<div class="row" style="margin-left: 1px; margin-right: 1px;">
            <div class="searchArea">
            	<form action="${pageContext.request.contextPath}/bound/outBound" method="get">
            	<b>진행구분</b>
            	<select name="select1" class="form-select" id="basicSelect">
            		<option value="all">전체</option>
            		<option value="ing">미출고</option>
            		<option value="com">출고완료</option>
            	</select>
            	<b>출고 코드</b>
            	<input type="text" class="form-control" name="search1" placeholder="출고코드를 입력하세요">
            	<b>품명</b>
            	<input type="text" class="form-control" name="search2" placeholder="품명을 입력하세요">
            	<b>제품출고 일자</b>
            	<input type="text" id="startDate" class="form-control" name="search3" placeholder="기간을 선택하세요">
            	<b>~</b>&nbsp;&nbsp;&nbsp;
            	<input type="text" id="endDate" class="form-control" name="search4" placeholder="기간을 선택하세요">
            	<input type="submit" value="조회" class="btn btn-primary">
            	</form>
            </div>
                <table class='table table-bordered mb-0' id="obTable" style="text-align: center;">
                    <thead>
                        <tr>
                            <th>출고 코드</th>
                            <th>수주 코드</th>
                            <th>품명</th>
                            <th>수량</th>
                            <th>보관창고명</th>
                            <th>진행상황</th>
                            <th>제품출고 일자</th>
                            <th>담당자</th>
                            <th>출고처리</th>
                        </tr>
                    </thead>
                    <tbody>
        <c:forEach var="boundDTO" items="${outBoundBoardList}">
    	<tr>
   			<td>${boundDTO.ob_cd}</td>
    		<td>${boundDTO.con_cd}</td>
    		<%-- con_cd에 링크 경로 수주서 onClick="location.href='${pageContext.request.contextPath}/폴더/파일?con_cd=${DTO파일.con_cd }'" --%>
    		<td>${boundDTO.pro_name}</td>
    		<td>${boundDTO.con_vol}</td>
    		<td>${boundDTO.wh_name}</td>
			<td>
			<c:if test="${boundDTO.ob_info_status == 0}">미출고</c:if>
			<c:if test="${boundDTO.ob_info_status == 1}">출고완료</c:if>
			</td>
    		<td>
    		<c:if test="${empty boundDTO.ob_date}">대기</c:if>
    		<c:if test="${!empty boundDTO.ob_date}">
    		<fmt:formatDate value="${boundDTO.ob_date}" pattern="yyyy-MM-dd"/></c:if>
    		</td>
    		<td>${boundDTO.user_name}</td>
    		<td>
    		<c:choose>
    		<c:when test="${boundDTO.ob_info_status == 0 }">
    		<sec:authorize access="hasAnyRole('ROLE_BOUND', 'ROLE_ADMIN')">
			<button type=button class="btn icon icon-left btn-danger" onclick="statusSwitch(event, '${boundDTO.ob_cd}')">출고처리</button>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_PRODUCT', 'ROLE_PRODUCTION', 'ROLE_OC', 'ROLE_NONE')">
			<button type=button class="btn icon icon-left btn-danger" onclick="accessError()">출고처리</button>
			</sec:authorize>
            </c:when>
    		<c:when test="${boundDTO.ob_info_status == 1 }">
            <button type=button class="btn icon icon-left btn-success">출고완료</button>
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
			<a class="page-link" href="${pageContext.request.contextPath}/bound/outBound?pageNum=${pageDTO.startPage - 1}
			&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}
			&select1=${pageDTO.select1}">
			<span aria-hidden="true">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></span></a>
		</li>
	</c:if>
	
	<c:if test="${pageDTO.startPage <= 1}">
		<li class="page-item disabled">
			<a class="page-link" href="#" tabindex="-1" aria-disabled="true"><span aria-hidden="true">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></span></a>
        </li>
    </c:if>

	<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
		<li class="page-item ${pageDTO.currentPage == i ? 'active' : ''}">
			<a class="page-link" href="${pageContext.request.contextPath}/bound/outBound?pageNum=${i}
			&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}
			&select1=${pageDTO.select1}">${i}</a>
		</li>
	</c:forEach>

	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
		<li class="page-item">
			<a class="page-link" href="${pageContext.request.contextPath}/bound/outBound?pageNum=${pageDTO.endPage + 1}
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
        </div>
        </div>
    </section>
    </div>
    
    <script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    
    <script type="text/javascript">
    
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
    
	//제품 출고 처리 버튼
  	function statusSwitch(event, ob_cd) {
	Swal.fire({
			title: "<style='color:#000000'>출고처리",
			background: "#fff",
			text: "출고 처리하시겠습니까? 처리 후 복구 불가합니다.",
			icon: "warning",
			showCancelButton: true,
			confirmButtonColor: "#3085d6",
			cancelButtonColor: "#d33",
			confirmButtonText: "출고처리",
			cancelButtonText: "취소"
	}).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
    	url: '${pageContext.request.contextPath}/bound/outBoundPro',
        method: 'POST',
        data: {ob_cd : ob_cd},
        beforeSend: function(xhr) {
            // CSRF 토큰과 헤더 이름 읽기
            var token = $('meta[name="_csrf"]').attr('content');
            var header = $('meta[name="_csrf_header"]').attr('content');
            
            // 요청 헤더에 CSRF 토큰 추가
            xhr.setRequestHeader(header, token);
        },
        success: function(response) {
        	Swal.fire({
					title: "출고처리 완료!",
					icon: "success" 
			}).then(() => {
                location.reload(); // 페이지 새로고침
            });
        },
        error: function(xhr, status, error) {
        	Swal.fire({
   				title: "출고처리 불가!",
   				text: "　제품 재고 보유량 부족",
   				icon: "error"
   			})
        }
      });
    }
  });
};


    //검색 달력
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
    	
    </script>
    
</body>
</html>