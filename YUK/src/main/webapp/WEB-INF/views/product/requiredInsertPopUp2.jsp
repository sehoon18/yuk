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
    <h1><b>자재목록</b></h1>
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
                <th>자재 품목코드</th>
                <th>자재품명</th>
                <th>자재구분</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="productDTO" items="${productList}">
              <c:if test="${productDTO.productType == 1 || productDTO.productType == 2}">
              <tr class="color" onclick="sendInsReq2('${productDTO.productCode}','${productDTO.productName}','${productDTO.productType}')">
                <td>${productDTO.productCode}</td> 
                <td>${productDTO.productName}</td>
                <c:if test="${productDTO.productType == 1}">
                <td>식자재</td>
                </c:if>
                <c:if test="${productDTO.productType == 2}">
                <td>포장자재</td>
                </c:if>
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
	function sendInsReq2(productCode, productName, productType){
		// productType 값에 따라 다른 문자열 설정
		var productTypeName;
		if(productType == 1){
			productTypeName = "식자재";
		}else if(productType == 2){
			productTypeName = "포장자재";
		}else{
			// 기타 경우의 기본값 설정 (선택적)
			productTypeName = "기타";
		}
		
		// 설정된 문자열을 해당 필드에 할당
		window.opener.document.getElementById("productCode1").value = productCode;
		window.opener.document.getElementById("productName2").value = productName;
		window.opener.document.getElementById("productType").value = productTypeName;
		
		window.close();
	}
</script>




</body>
</html>