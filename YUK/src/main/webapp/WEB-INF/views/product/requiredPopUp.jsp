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
    background-color: lightgray;
    }
    </style>
</head>
<body>
     <div style="margin-left: 20px; margin-top: 50px;">
    <h1><b>소요량 관리</b></h1>
  	<hr>
  <form action="${pageContext.request.contextPath}/product/requiredPopUp">
  <div class="col-lg-2 col-3" style="display: flex; align-items: center; white-space: nowrap;">
<!--   	flex: 0 1 auto; 속성은 사원번호 텍스트가 필요한 만큼의 공간만 차지 -->
  <div style="flex: 0 1 auto; margin-right: 10px;"><b>소요량코드</b></div>
  <input type="text" id="requiredCode" class="form-control" name="requiredCode" style="flex: 1 1 auto; width: auto;" placeholder="소요량코드를 입력하세요">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>품명</b> &nbsp;&nbsp;
  <input type="text" id="productName" class="form-control" name="productName" style="flex: 1 1 auto; width: auto;" placeholder="품명을 입력하세요">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <button class="btn btn-primary btn-sm" type="submit">조회</button>
</div>
</form>
<hr>
<div class="row" id="table-bordered" style="margin-right: 20px;">
  <div class="col-12">
    <div class="card">
      <div class="card-header">
        <h4 class="card-title">소요량 목록 <b>총 ${requiredList.size()}건</b></h4>
      </div>
      <div class="card-content">
        <div class="table-responsive">
          <table class="table table-bordered mb-0">
            <thead>
              <tr>
                <th>소요량코드</th>
                <th>완제품 품목코드</th>
                <th>완제품명</th>
                <th>자재 품목코드</th>
                <th>자재품명</th>
                <th>자재구분</th>
                <th>소요량</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="productDTO" items="${requiredList}">
              <tr class="color" onclick="sendReq('${productDTO.requiredCode}' ,'${productDTO.productName}')">
                <td>${productDTO.requiredCode}</td> 
                <td>${productDTO.productCode}</td>
                <td>${productDTO.productName}</td>
                <td>${productDTO.materialProductCode}</td> 
                <td>${productDTO.productPName}</td>
                <c:if test="${productDTO.productType == 0}">
                <td>완제품</td>
                </c:if>
                <c:if test="${productDTO.productType == 1}">
                <td>식자재</td>
                </c:if>
                <c:if test="${productDTO.productType == 2}">
                <td>포장자재</td>
                </c:if>
                <td>${productDTO.requiredVol}</td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

</div>
<script>
	function sendReq(requiredCode,productName){
		
		window.opener.document.getElementById("requiredCode").value = requiredCode;
		window.opener.document.getElementById("productName").value = productName;
		window.close();
	}
</script>



</body>
</html>