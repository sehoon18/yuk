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
    
    </style>
    
</head>

<body>

    <section class="section">
        <div class="card">
            <div class="card-header">
                입고 관리
            </div>
            <div class="searchArea">
<!-- 검색 기능 미구현 -->
<!-- 입고 코드 선택 팝업 미구현 -->
<!-- 디비내용 안 담아와짐 수정할 거임 -->
            	<form action="${pageContext.request.contextPath}/bound/inBound" method="get">
            	입고 코드
            	<input type="text" class="search1" name="search1">
            	품명
            	<input type="text" class="search2" name="search2">
            	입고 일자
            	<input type="text" id="startDate" class="search3" name="search3" placeholder="기간을 선택하세요">
            	&nbsp; ~ &nbsp;
            	<input type="text" id="endDate" class="search4" name="search4" placeholder="기간을 선택하세요">
            	<input type="submit" value="조회" class="btn btn-primary">
            	</form>
            </div>
            
            <div class="card-body">
                <table class='table table-striped' id="table1">
                    <thead>
                        <tr>
                            <th>입고 코드</th>
                            <th>발주 코드</th>
                            <th>생산실적 코드</th>
                            <th>품명</th>
                            <th>수량</th>
                            <th>보관창고명</th>
                            <th>진행상황</th>
                            <th>입고일자</th>
                            <th>담당자</th>
                            <th>입고처리</th>
                        </tr>
                    </thead>
                    <tbody>
        <c:forEach var="boundDTO" items="${inBoundBoardList }">
    	<tr>
   			<td>${boundDTO.ib_cd}</td>
    		<td>${boundDTO.ord_cd}</td>
    		<%-- ord_cd에 링크 경로 발주서 onclick="location.href='${pageContext.request.contextPath}/폴더/파일?ord_cd=${DTO파일.ord_cd }'" --%>
    	    <td>${boundDTO.per_cd}</td>
    		<td>${boundDTO.pro_name}</td>
    		<td>
    		<c:choose>
    		<c:when test="${boundDTO.ord_cd eq null && boundDTO.per_good eq 0 }">${boundDTO.actual_completion_amount}</c:when>
    		<c:when test="${boundDTO.per_cd eq null }">${boundDTO.ord_vol}</c:when>
    		</c:choose>
    		</td>
    		<td>${boundDTO.wh_name}</td>
			<td>
			<c:choose>
			<c:when test="${boundDTO.ib_info_status eq 0}">미입고</c:when>
			<c:when test="${boundDTO.ib_info_status eq 1}">입고완료</c:when>
			</c:choose>
			</td>
    		<td><fmt:formatDate value="${boundDTO.ib_date}" pattern="yyyy-MM-dd"/></td>
    		<td>${boundDTO.user_id}</td>
    		<td>
    		<c:choose>
    		<c:when test="${boundDTO.ib_info_status eq 0 }">
    		<form action="${pageContext.request.contextPath}/bound/inBoundPro" method="post">
    		<input type="hidden" name="ib_cd" value="${boundDTO.ib_cd}">
			<input type=submit class="btn icon icon-left btn-danger" value="입고처리">
			</form>
            </c:when>
    		<c:when test="${boundDTO.ib_info_status eq 1 }">
            <input type=button class="btn icon icon-left btn-success" value="입고완료">
    		</c:when>
            </c:choose>
    		</td>
    	</tr>
    	</c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    
<div id="page_control">
<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath}/bound/inBound?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}">[이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
	<a href="${pageContext.request.contextPath}/bound/inBound?pageNum=${i}&search=${pageDTO.search}">${i}</a>
</c:forEach>

<c:if test="${pageDTO.pageCount > pageDTO.endPage}">
	<a href="${pageContext.request.contextPath}/bound/inBound?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}">[다음]</a>
</c:if>
</div>


    <script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    
    <script type="text/javascript">
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
    
    //입고처리 버튼 확인창(true / false)
//     var reply = confirm("입고 처리하시겠습니까?<br>처리 후 수정 불가합니다.");
//     $(function(){
//     	$('.btn icon icon-left btn-danger').submit(function(){
//     		document.write(reply);
// 			if(reply.val() == true){
				
// 			}
//     	});
// 	});
    	
    </script>
    
</body>
</html>