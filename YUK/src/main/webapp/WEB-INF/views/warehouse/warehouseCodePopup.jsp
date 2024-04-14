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
    
    <div style="margin-left: 20px; margin-right: 20px; margin-top: 30px;">
    <h1><b>창고 관리</b></h1>
  	<hr>
  	
  	<form action="${pageContext.request.contextPath}/warehouse/warehouseCodePopup">
  <div class="col-lg-2 col-3" style="display: flex; align-items: center; white-space: nowrap;">
<!--   	flex: 0 1 auto; 속성은 사원번호 텍스트가 필요한 만큼의 공간만 차지 -->
  <div style="flex: 0 1 auto; margin-right: 10px;"><b>창고코드</b></div>
  <input type="text" id="warehouseCode" class="form-control" name="warehouseCode" style="flex: 1 1 auto; width: auto;">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>창고명</b> &nbsp;&nbsp;
  <input type="text" id="warehouseName" class="form-control" name="warehouseName" style="flex: 1 1 auto; width: auto;">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>지역</b> &nbsp;&nbsp;
  <input type="text" id="warehouseLocal" class="form-control" name="warehouseLocal" style="flex: 1 1 auto; width: auto;">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <button class="btn btn-primary btn-sm" type="submit">조회</button>
</div>
</form>
<hr>


    
<!--     Bordered table start -->
<div class="row" id="table-bordered" style="margin-right: 20px;">
  <div class="col-12">
    <div class="card">
    <br>
      <div class="card-content">
        <!-- table bordered -->
        <div class="table-responsive">
          <table class="table table-bordered mb-0">
            <thead>
              <tr>
                <th>창고코드</th>
                <th>창고명</th>
                <th>현재 보유량</th>
                <th>최대 보유량</th>
                <th>구역(섹터)</th>
                <th>지역</th>
                <th>전화번호</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="warehouseDTO" items="${warehouseList }">
              <tr class="color" onclick="send('${warehouseDTO.warehouseCode}','${warehouseDTO.warehouseName}','${warehouseDTO.warehouseLocal}')">
                <td>${warehouseDTO.warehouseCode }</td>
                <td>${warehouseDTO.warehouseName }</td>
                <td>${warehouseDTO.productVol }</td>
                <td>${warehouseDTO.warehouseMvol }</td>
                <td>${warehouseDTO.warehouseArea }</td>
                <td>${warehouseDTO.warehouseLocal }</td>
                <td>${warehouseDTO.warehouseTelNumber }</td>
              </tr>
  			</c:forEach>
            </tbody>
          </table>
          
          <!-- 			페이징 시작 -->
<nav aria-label="Page navigation example" style="padding: 10px 0px;">
    <ul class="pagination pagination-primary justify-content-end">
        <c:if test="${pageDTO.startPage > 1}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/warehouse/warehouseCodePopup?pageNum=${pageDTO.startPage - 1}&warehouseCode=${pageDTO.warehouseCode}&warehouseName=${pageDTO.warehouseName}&warehouseLocal=${pageDTO.warehouseLocal}"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></span></a>
            </li>
        </c:if>
        <c:if test="${pageDTO.startPage <= 1}">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></span></a>
            </li>
        </c:if>
        <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
            <li class="page-item ${pageDTO.currentPage == i ? 'active' : ''}">
                <a class="page-link" href="${pageContext.request.contextPath}/warehouse/warehouseCodePopup?pageNum=${i}&warehouseCode=${pageDTO.warehouseCode}&warehouseName=${pageDTO.warehouseName}&warehouseLocal=${pageDTO.warehouseLocal}">${i}</a>
            </li>
        </c:forEach>
        <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/warehouse/warehouseCodePopup?pageNum=${pageDTO.endPage + 1}&warehouseCode=${pageDTO.warehouseCode}&warehouseName=${pageDTO.warehouseName}&warehouseLocal=${pageDTO.warehouseLocal}"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></span></a>
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
 	function send(warehouseCode, warehouseName, warehouseLocal){
 		window.opener.document.getElementById("warehouseCode").value=warehouseCode;
 		window.opener.document.getElementById("warehouseName").value=warehouseName;
 		window.opener.document.getElementById("warehouseLocal").value=warehouseLocal;
 		window.close();
 	}
 </script>   
    
</body>
</html>