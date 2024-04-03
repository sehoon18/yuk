<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>출고 관리</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
    
<!--     처리 버튼 Swal css  -->
	<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    
<!--     DatePicker를 위한 css -->
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
    
    </style>
    
</head>

<body>
<jsp:include page="../inc/sidebar.jsp" />

<div class="main-content container-fluid">
    <section class="section">
        <div class="card">
            <div class="card-body">
            	<div class="row">
            		<h2 class="card-title">출고 관리</h2>
            		
            <div class="searchArea">
            	<form action="${pageContext.request.contextPath}/bound/outBound" method="get">
            	출고 코드
            	<input type="text" class="search1" name="search1">
            	품명
            	<input type="text" class="search2" name="search2">
            	출고 일자
            	<input type="text" id="startDate" class="search3" name="search3" placeholder="기간을 선택하세요">
            	&nbsp; ~ &nbsp;
            	<input type="text" id="endDate" class="search4" name="search4" placeholder="기간을 선택하세요">
            	<input type="submit" value="조회" class="btn btn-primary">
            	</form>
            </div>
                <table class='table table-striped' id="obTable">
                    <thead>
                        <tr>
                            <th>출고 코드</th>
                            <th>수주 코드</th>
                            <th>품명</th>
                            <th>수량</th>
                            <th>보관창고명</th>
                            <th>진행상황</th>
                            <th>출고일자</th>
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
    		<td>${boundDTO.user_id}</td>
    		<td>
    		<c:choose>
    		<c:when test="${boundDTO.ob_info_status == 0 }">
			<button type=button class="btn icon icon-left btn-danger" onclick="statusSwitch(event, '${boundDTO.ob_cd}')">출고처리</button>
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
	<div id="page_control">
	<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
		<a href="${pageContext.request.contextPath}/bound/outBound?pageNum=${pageDTO.startPage - pageDTO.pageBlock}
		&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}">[이전]</a>
	</c:if>

	<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
		<a href="${pageContext.request.contextPath}/bound/outBound?pageNum=${i}
		&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}">${i}</a>
	</c:forEach>

	<c:if test="${pageDTO.pageCount > pageDTO.endPage}">
		<a href="${pageContext.request.contextPath}/bound/outBound?pageNum=${pageDTO.startPage + pageDTO.pageBlock}
		&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}">[다음]</a>
	</c:if>
	</div>
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
    
	//출고처리 버튼
  	function statusSwitch(event, ob_cd) {
	Swal.fire({
			title: "출고처리",
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
   				title: "출고처리 에러!",
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