<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
   <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YOGIYUK</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
    
    <!-- sweetalert2 -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
	tbody tr:hover {
	   	background-color:#e4e8ff;
	}
	</style>
</head>
<body>
<jsp:include page="../inc/sidebar.jsp" />
    


<div class="main-content container-fluid" width="1392px" height="1000px">
    <div class="page-title">
        <h3><a href="${pageContext.request.contextPath}/ordercontract/order">발주관리</a></h3>
    </div>
    <div class="card">
        <div class="card-header" style="display: flex; justify-content: space-between; align-items: center;">
            <div>
                <form action="${pageContext.request.contextPath}/ordercontract/order" method="get" style="display: flex;">
                    <div class="col-lg-2 col-3" style="display: flex; align-items: center; white-space: nowrap; margin-bottom: 4px;">
				<div style="flex: 0 1 auto; margin-right: 10px;"><b>발주코드</b></div>
                       <input type="text" id="first-name" class="form-control" name="search1" style="width: auto;" placeholder="발주코드를 입력해주세요.">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>거래처명</b>&nbsp;&nbsp;
                     <input type="text" id="first-name" class="form-control" name="search2" style="width: auto;" placeholder="거래처명을 입력해주세요.">
                    
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <b>품명</b>&nbsp;&nbsp;
                       <input type="text" id="first-name" class="form-control" name="search3" style="width: auto;" placeholder="품명을 입력해주세요.">
                    &nbsp;&nbsp;
                    <button class="btn btn-primary btn-sm" type="submit"  >조회</button>
                    </div>
                </form>
            </div>
            <div>
           <sec:authorize access="hasAnyRole('ROLE_OC', 'ROLE_ADMIN')">
                <button class="btn btn-primary btn-sm" type="submit" onclick="addpopup();" >등록</button>
</sec:authorize>
<sec:authorize access="hasAnyRole('ROLE_PRODUCT', 'ROLE_BOUND', 'ROLE_PRODUCTION', 'ROLE_NONE')">
                <button class="btn btn-primary btn-sm" type="submit" onclick="accessError();" >등록</button>
</sec:authorize>
<!--                 <button class="btn btn-primary btn-sm" type="submit" style="margin-top:22px !important;">저장</button> -->
            </div>
        </div>
          <div class="card-body">
                <table class="table table-bordered mb-0" id="table1" style="text-align: center;">
                    <thead>
                        <tr>
                            <th>발주코드</th>
                            <th>거래처명</th>
                            <th>품목이름</th>
                            <th>발주량</th>
                            <th>재고수량</th>
                            <th>총금액</th>
                            <th>발주일자</th>
                            <th>납품예정일</th>
                            <th>담당자</th> 
                            <th>상태</th>
                            <th>상세</th>
                        </tr>
                    </thead>
                    <tbody>
                     <c:forEach var="OrdercontractDTO" items="${OrderList}"> 

<tr onclick="formpopup('${OrdercontractDTO.ord_cd}')">
     	<td >${OrdercontractDTO.ord_cd}</td> 
     	<td >${OrdercontractDTO.cli_name}</td> 
     	<td >${OrdercontractDTO.pro_name}</td> 
     	<td >${OrdercontractDTO.ord_vol}</td> 
     	<td >${OrdercontractDTO.pro_vol}</td> 
     	<td ><fmt:formatNumber value="${OrdercontractDTO.pro_price * OrdercontractDTO.ord_vol}" groupingUsed="true" maxFractionDigits="0"/></td> 
     	<td ><fmt:formatDate value="${OrdercontractDTO.ord_date}" pattern="yyyy.MM.dd"/></td> 
     	<td ><fmt:formatDate value="${OrdercontractDTO.ord_due_date}" pattern="yyyy.MM.dd"/></td> 
    	<td >${OrdercontractDTO.user_name}</td>
    	<c:if test="${OrdercontractDTO.ord_info_status  == 0 }">
            <td><button class="btn icon icon-left  btn-outline-danger" disabled>발주진행</button></td>
		</c:if>
		<c:if test="${OrdercontractDTO.ord_info_status  == 2 }">
            <td><button class="btn icon icon-left  btn-outline-success " disabled>입고완료</button></td>
		</c:if>
		<td ><input type="button" class="btn btn-info" value="상세"  onclick="popup(event,'${OrdercontractDTO.ord_cd}')" /></td>
	</tr> 									 		

    </c:forEach> 
   	  </tbody>
                </table>
<!-- 페이징 시작 -->

<nav aria-label="Page navigation example" style="padding: 10px 0px;">
    <ul class="pagination pagination-primary justify-content-end">
        <c:if test="${pageDTO.startPage > 1}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/ordercontract/order?pageNum=${pageDTO.startPage - 1}&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search3=${pageDTO.search3}"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></span></a>
            </li>
        </c:if>
        <c:if test="${pageDTO.startPage <= 1}">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></span></a>
            </li>
        </c:if>
        <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
            <li class="page-item ${pageDTO.currentPage == i ? 'active' : ''}">
                <a class="page-link" href="${pageContext.request.contextPath}/ordercontract/order?pageNum=${i}&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search3=${pageDTO.search3}">${i}</a>
            </li>
        </c:forEach>
        <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/ordercontract/order?pageNum=${pageDTO.endPage + 1}&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search3=${pageDTO.search3}"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></span></a>
            </li>
        </c:if>
        <c:if test="${pageDTO.endPage >= pageDTO.pageCount}">
            <li class="page-item disabled">
                <a class="page-link" href="#"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></span></a>
            </li>
        </c:if>
    </ul>
</nav>
<!-- 			페이징 끝 -->
            </div>
         </div>


<!--             <footer> -->
<!--                 <div class="footer clearfix mb-0 text-muted"> -->
<!--                     <div class="float-left"> -->
<!--                         <p>2020 &copy; Voler</p> -->
<!--                     </div> -->
<!--                     <div class="float-right"> -->
<!--                         <p>Crafted with <span class='text-danger'><i data-feather="heart"></i></span> by <a href="http://ahmadsaugi.com">Ahmad Saugi</a></p> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </footer> -->
     
    
     <script>
	  // 인풋 창을 클릭하면 팝업을 엽니다.
	  function popup(event, ord_cd) {
		    event.stopPropagation();
        var popup = window.open("${pageContext.request.contextPath}/ordercontract/orderdeletepopup?ord_cd="+ord_cd, "popup", "width=1600,height=400");
        
	    if (popup === null || typeof(popup) === 'undefined') {
	      alert('팝업이 차단되었습니다. 팝업 차단을 해제하고 다시 시도해주세요.');
	    } else {
	      // 팝업에서 선택한 값을 가져와서 인풋 필드에 설정합니다.
	      $(popup.document).on('click', '.popup-option', function() {
	        var selectedValue = $(this).text();
	        $('#ord_cd').val(selectedValue);
	        popup.close();
	      });
	    }
	  }
	</script>
	
	<script>
	  // 인풋 창을 클릭하면 팝업을 엽니다.
	  function addpopup() {
	    var popup = window.open("${pageContext.request.contextPath}/popup/orderaddpopup", "addpopup", "width=1600,height=400");
	    
	    if (popup === null || typeof(popup) === 'undefined') {
	      alert('팝업이 차단되었습니다. 팝업 차단을 해제하고 다시 시도해주세요.');
	    } else {
	      // 팝업에서 선택한 값을 가져와서 인풋 필드에 설정합니다.
	      $(popup.document).on('click', '.popup-option', function() {
	        var selectedValue = $(this).text();
	        $('#ord_cd').val(selectedValue);
	        popup.close();
	      });
	    }
	  }
	</script>
	<script>
	  // 인풋 창을 클릭하면 팝업을 엽니다.
	  function formpopup(ord_cd) {
		  var popup = window.open("${pageContext.request.contextPath}/popup/orderform?ord_cd="+ord_cd, "formpopup", "width=1200,height=600");
		  if (popup === null || typeof(popup) === 'undefined') {
		      }
		    }   
	   
	</script>
	<script>
function accessError() {
 Swal.fire({
	  title: "권한이 없습니다.",
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
</script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/apexcharts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/pages/dashboard.js"></script>

    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>