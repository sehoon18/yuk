<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
    <style>
    .color:hover {
    background-color: #e4e8ff;
    }
    </style>
</head>
<body>
     <div style="margin-left: 20px; margin-top: 50px;">
    <h1><b>완제품 목록</b></h1>
  	<hr>
 
<div class="row" id="table-bordered" style="margin-right: 20px;">
  <div class="col-12">
    <div class="card">
      </div>
      <div class="card-content">
        <div class="table-responsive">
          <table class="table table-bordered mb-0">
            <thead>
              <tr>
                <th>완제품 품목코드</th>
                <th>완제품명</th>
              </tr>
            </thead>
            <tbody>
			  <c:forEach var="productDTO" items="${productList}">
			    <c:if test="${productDTO.productType == 0}">
			      <tr class="color" onclick="sendInsReq1('${productDTO.productCode}' ,'${productDTO.productName}')">
			        <td>${productDTO.productCode}</td>
			        <td>${productDTO.productName}</td>
			      </tr>
			    </c:if>
			  </c:forEach>
			</tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
	function sendInsReq1(productCode, productName){

		// 메인 페이지의 해당 행의 입력 필드에 값을 설정
		window.opener.document.getElementById("productCode").value = productCode;
		window.opener.document.getElementById("productName1").value = productName;
		
		window.close(); // 팝업 창 닫기
	}
</script>



</body>
</html>