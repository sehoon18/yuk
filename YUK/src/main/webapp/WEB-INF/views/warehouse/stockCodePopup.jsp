<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!--     <title>YOGIYUK</title> -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
 <style>
.color:hover {
	background-color: lightgray;
}
</style>   
</head>
<body>
    
    
    <div style="margin-left: 20px; margin-top: 30px;">
    <h1><b>재고 관리</b></h1>
  	<hr>
  	
  	<form action="${pageContext.request.contextPath}/warehouse/stockCodePopup">
  <div class="col-lg-2 col-3" style="display: flex; align-items: center; white-space: nowrap;">
<!--   	flex: 0 1 auto; 속성은 사원번호 텍스트가 필요한 만큼의 공간만 차지 -->
  <div style="flex: 0 1 auto; margin-right: 10px;"><b>품목코드</b></div>
  <input type="text" id="productCode" class="form-control" name="productCode" style="flex: 1 1 auto; width: auto; background-color: white;" onclick="stockCodePopup()" readonly placeholder="품목코드를 선택하세요.">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>품명</b> &nbsp;&nbsp;
  <input type="text" id="productName" class="form-control" name="productName" style="flex: 1 1 auto; width: auto;" placeholder="품명을 입력하세요.">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
<hr>
    

    
<!--     Bordered table start -->
<div class="row" id="table-bordered" style="margin-right: 20px;">
  <div class="col-12">
    <div class="card">
      <div class="card-header">
        <h4 class="card-title">총건</h4>
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
              </tr>
            </thead>
            <tbody>
              <c:forEach var="warehouseDTO" items="${stockList }">
              <tr class="color" onclick="send('${warehouseDTO.productCode}','${warehouseDTO.productName}','${warehouseDTO.warehouseName }','${warehouseDTO.productType} }')">
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
              </tr>
              </c:forEach>
              
            </tbody>
          </table>
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
    function productCodePopup(){window.open("${pageContext.request.contextPath}/member/productCodePopup","","width=400, height=300, left=100, top=50");}
    </script>
    
    <script>
    function send(productCode, productName, warehouseName, productType){
    	window.opener.document.getElementById("productCode").value=productCode;
    	window.opener.document.getElementById("productName").value=productName;
    	window.opener.document.getElementById("warehouseName").value=warehouseName;
    	window.close();
    }
    </script>
    
</body>
</html>