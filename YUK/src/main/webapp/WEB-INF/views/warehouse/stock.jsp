<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YOGIYUK</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">

<!--    처리 버튼 Swal css  -->
	<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>




	.color:hover {
		background-color: #e4e8ff;
	}
</style>    
</head>
<body>
    
    <jsp:include page="../inc/sidebar.jsp" />
    
    <div style="margin-left: 20px;">
    <h1><b>재고 관리</b></h1>
  	<br>
    
<!--     Bordered table start -->
<div class="row" id="table-bordered" style="margin-right: 20px;">
  <div class="col-12">
    <div class="card">
    <br>
    <form action="${pageContext.request.contextPath}/warehouse/stock">
  <div class="col-lg-2 col-3" style="display: flex; align-items: center; white-space: nowrap;">
<!--   	flex: 0 1 auto; 속성은 사원번호 텍스트가 필요한 만큼의 공간만 차지 -->
  <div style="flex: 0 1 auto; margin-right: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>품목코드</b></div>
  <input type="text" id="productCode" class="form-control" name="productCode" style="flex: 1 1 auto; width: auto; background-color: white;" onclick="stockCodePopup()" readonly placeholder="품목코드를 선택하세요.">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>품명</b> &nbsp;&nbsp;
  <input type="text" id="productName" class="form-control" name="productName" style="flex: 1 1 auto; width: auto;" placeholder="품명을 입력하세요.">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>창고명</b> &nbsp;&nbsp;
  <input type="text" id="warehouseName" class="form-control" name="warehouseName" style="flex: 1 1 auto; width: auto;" placeholder="창고명을 입력하세요.">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <b>품목구분</b>
   &nbsp;&nbsp;
  <select class="form-select" id="basicSelect" name="productType" style="width: 100px;">
	<option value="100">전체</option>
	<option value="0">완제품</option>
	<option value="1">식자재</option>
	<option value="2">포장자재</option>
   </select>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <button class="btn btn-primary btn-sm" type="submit">조회</button>
  </div>
</form>
      <div class="card-header">
        <h4 class="card-title"><b>총 ${stockList.size() }건</b></h4>
      </div>        
      <div class="card-content">
        <!-- table bordered -->
        <div class="table-responsive">
          <table class="table table-bordered mb-0">
            <thead>
              <tr>
                <th>품목코드</th>
                <th>품명</th>
                <th>품목구분</th>
                <th>보관창고(코드)</th>
                <th>창고명</th>
                <th>보관구역(섹터)</th>
                <th>재고량</th>
                <th>실사량</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="warehouseDTO" items="${stockList }" varStatus="status">
              <tr class="color">
                <td>${warehouseDTO.productCode } </td>
                <td>${warehouseDTO.productName } </td>
                <c:if test="${warehouseDTO.productType == 0 }">
                <td>완제품</td>
                </c:if>
                <c:if test="${warehouseDTO.productType == 1 }">
                <td>식자재</td>
                </c:if>
                <c:if test="${warehouseDTO.productType == 2 }">
                <td>포장자재</td>
                </c:if>
                <td>${warehouseDTO.warehouseCode } </td>
                <td>${warehouseDTO.warehouseName } </td>
                <td>${warehouseDTO.warehouseArea } </td>
                <td>${warehouseDTO.productVol} </td>
                <td><input type="text" id="realAmount" class="form-control" name="realAmount" style="flex: 1 1 auto; width: 70px; background-color: white;"></td>
                <td>
                <sec:authorize access="hasAnyRole('ROLE_BOUND', 'ROLE_ADMIN')">
                <button type=button class="btn btn-primary btn-sm" onclick="statusSwitch(event, '${warehouseDTO.productCode}')">수정</button>
                </sec:authorize>
                <sec:authorize access="hasAnyRole('ROLE_PRODUCT', 'ROLE_PRODUCTION', 'ROLE_OC', 'ROLE_NONE')">
                <button type=button class="btn btn-primary btn-sm" onclick="accessError()">수정</button>
                </sec:authorize>
                </td>
				
				
              </tr>
              </c:forEach>   
            </tbody>
          </table>
          
          
          
          <!-- 			페이징 시작 -->
<nav aria-label="Page navigation example" style="padding: 10px 0px;">
    <ul class="pagination pagination-primary justify-content-end">
        <c:if test="${pageDTO.startPage > 1}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/warehouse/stock?pageNum=${pageDTO.startPage - 1}&productCode=${pageDTO.productCode}&productName=${pageDTO.productName}&warehouseName=${pageDTO.warehouseName}&productType=${pageDTO.productType}"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></span></a>
            </li>
        </c:if>
        <c:if test="${pageDTO.startPage <= 1}">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></span></a>
            </li>
        </c:if>
        <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
            <li class="page-item ${pageDTO.currentPage == i ? 'active' : ''}">
                <a class="page-link" href="${pageContext.request.contextPath}/warehouse/stock?pageNum=${i}&productCode=${pageDTO.productCode}&productName=${pageDTO.productName}&warehouseName=${pageDTO.warehouseName}&productType=${pageDTO.productType}">${i}</a>
            </li>
        </c:forEach>
        <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/warehouse/stock?pageNum=${pageDTO.endPage + 1}&productCode=${pageDTO.productCode}&productName=${pageDTO.productName}&warehouseName=${pageDTO.warehouseName}&productType=${pageDTO.productType}"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></span></a>
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
          
          
          
          
      
<!--           			페이징 시작 -->
<!-- <nav aria-label="Page navigation example"> -->

<!-- 	<ul class="pagination pagination-primary justify-content-end"> -->
	
<%-- 	<c:if test="${pageDTO.startPage > 1}"> --%>
<!-- 		<li class="page-tiem"> -->
<%-- 			<a class="page-link" href="${pageContext.request.contextPath}/warehouse/warehouse?pageNum=${pageDTO.startPage - 1} --%>
<%-- 			&productCode=${pageDTO.productCode}&productName=${pageDTO.productName}&warehouseName=${pageDTO.warehouseName} --%>
<%-- 			&productType=${pageDTO.productType}"> --%>
<!-- 			<span aria-hidden="true"> -->
<!-- 				<i data-feather="chevron-left"></i></span></a> -->
<!-- 		</li> -->
<%-- 	</c:if> --%>
	
<%-- 	<c:if test="${pageDTO.startPage <= 1}"> --%>
<!-- 		<li class="page-item disabled"> -->
<!-- 			<a class="page-link" href="#" tabindex="-1" aria-disabled="true"> -->
<!-- 			<span aria-hidden="true"> -->
<!-- 				<i data-feather="chevron-left"></i></span></a> -->
<!--         </li> -->
<%--     </c:if> --%>

<%-- 	<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1"> --%>
<%-- 		<li class="page-item ${pageDTO.currentPage == i ? 'active' : ''}"> --%>
<%-- 			<a class="page-link" href="${pageContext.request.contextPath}/warehouse/warehouse?pageNum=${i} --%>
<%-- 			&warehouseCode=${pageDTO.warehouseCode}&warehouseName=${pageDTO.warehouseName}&warehouseLocal=${pageDTO.warehouseLocal} --%>
<%-- 			&productType=${pageDTO.productType}">${i}</a> --%>
<!-- 		</li> -->
<%-- 	</c:forEach> --%>

<%-- 	<c:if test="${pageDTO.endPage < pageDTO.pageCount}"> --%>
<!-- 		<li class="page-item"> -->
<%-- 			<a class="page-link" href="${pageContext.request.contextPath}/warehouse/warehouse?pageNum=${pageDTO.endPage + 1} --%>
<%-- 			&productCode=${pageDTO.productCode}&warehouseName=${pageDTO.warehouseName}&productName=${pageDTO.productName} --%>
<%-- 			&productType=${pageDTO.productType}"> --%>
<!-- 			<span aria-hidden="true"> -->
<!-- 				<i data-feather="chevron-right"></i></span></a> -->
<!-- 		</li> -->
<%-- 	</c:if> --%>
	
<%--     <c:if test="${pageDTO.endPage >= pageDTO.pageCount}"> --%>
<!-- 		<li class="page-item disabled"> -->
<!-- 			<a class="page-link" href="#"> -->
<!-- 			<span aria-hidden="true"> -->
<!-- 				<i data-feather="chevron-right"></i></span></a> -->
<!-- 		</li> -->
<%--     </c:if> --%>
	
<!-- 	</ul> -->

<!-- </nav> -->
<!-- <!-- 			페이징 끝 -->  
          
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Bordered table end -->
    
</div>    


<!-- <nav aria-label="Page navigation example" style="margin-bottom:50px;" > -->
<!--   <ul class="pagination justify-content-center"> -->
<%--   <c:if test="${pageDTO.startPage > pageDTO.pageBlock }"> --%>
<%--     <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/qna?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">Previous</a></li> --%>
<%--   </c:if> --%>
  
<%--   <c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1"> --%>
<%--     <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/qna?pageNum=${i}">${i }</a></li> --%>
<%--   </c:forEach> --%>
  
<%--   <c:if test="${pageDTO.endPage < pageDTO.pageCount }"> --%>
<%--     <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/qna?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">Next</a></li> --%>
<%--   </c:if>   --%>
<!--   </ul> -->
<!-- </nav> -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/apexcharts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/pages/dashboard.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    
    <script>
    function stockCodePopup(){window.open("${pageContext.request.contextPath}/warehouse/stockCodePopup","","width=1300, height=700, left=100, top=50");}
    </script>
    
    <script>
    function receive(productCode, productName, warehouseName, productType){
    	document.getElementById("productCode").value=productCode;
    	document.getElementById("productName").value=productName;
    	document.getElementById("warehouseName").value=warehouseName;
    	document.getElementById("productType").value=productType;
    }
    </script>

<script>
function statusSwitch(event, productCode) {
//  alert("호출");
  var currentRow = event.target.closest('tr'); // 클릭된 버튼이 속한 <tr> 요소를 가져옵니다.
  var realAmountInput = currentRow.querySelector('input[name="realAmount"]'); // 현재 행에서 name이 "realAmount"인 input 요소를 가져옵니다.
  var realAmountValue = realAmountInput.value; // realAmountInput 요소의 값을 가져옵니다.
    var csrfHeaderName = "${_csrf.headerName}"
    var csrfTokenValue = "${_csrf.token}"
  alert(productCode);
    alert(realAmountValue);
    //실사량 입력 값 유효성 검증
//     if (!validateRealAmount(realAmount)){
//      Swal.fire({
//        title:"오류!"
//        text: "유효하지 않는 실사량입니다. 양의 숫자를 입력해주세요.",
//        icon: "error"
//      });
//      return; //유효하지 않을 경우, 처리를 중단 함.
//     }
    Swal.fire({
        title: "실사량 변경",
        text: "실사량 변경처리 하시겠습니까?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085D6",
        cancelButtonColor: "#d33",
        confirmButtonText: "수정완료",
        cancelButtonText: "취소"
    }).then((result) => {
        if(result.isConfirmed){
            $.ajax({
                url: '${pageContext.request.contextPath}/warehouse/stockUpdatePro',
                method: 'POST',
                beforeSend: function(xhr){
                  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                },
                data: {
                    productCode: productCode,
                    realAmount: realAmountValue
                },
                success: function(response){
//                    alert("성공");
                    Swal.fire({
                        title: "수정 완료!",
                        icon: "success"
                    }).then(() =>{
                        location.reload(); // 수정이 성공적으로 완료되면 페이지를 새로고침합니다.
                    });
                },
                error: function(xhr, status, error){
//                    alert("에러");
                    Swal.fire({
                        title: "처리 불가!",
                        text: "창고 최대 보유량 초과 또는 잘못된 조작",
                        icon: "error"
                    })
                }
            });
        }
    });
};
//실사량 입력 값 유효성 검증 함수
function validateRealAmount(realAmount){
//  return realAmount && !isNaN(realAmount) && realAmount > 0;
  return !isNaN(realAmount) && realAmount > 0;
}
</script>
</body>
</html>