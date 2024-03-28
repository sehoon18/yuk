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
    <h1><b>품목 관리</b></h1>
    <hr>
    <form id ="productForm" action="${pageContext.request.contextPath}/product/productPopUp">
  <div class="col-lg-2 col-3" style="display: flex; align-items: center; white-space: nowrap;">
<!--   	flex: 0 1 auto; 속성은 사원번호 텍스트가 필요한 만큼의 공간만 차지 -->
  <div style="flex: 0 1 auto; margin-right: 10px;"><b>품목코드</b></div>
  <input type="text" id="productCode" class="form-control" name="productCode" style="flex: 1 1 auto; width: auto;" placeholder="품목코드를 입력하세요">
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
        <h4 class="card-title">품목 목록 <b>총 ${productList.size()}건</b></h4>
      </div>
      <div class="card-content">
        <div class="table-responsive">
          <table class="table table-bordered mb-0">
            <thead>
              <tr>
                <th>품목코드</th>
                <th>품명</th>
                <th>품목구분</th>
                <th>원산지</th>
                <th>단가</th>
                <th>비고</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach var="productDTO" items="${productList}">
            <tr class="color" onclick="sendpro('${productDTO.productCode}' , '${productDTO.productName}');">
                <td>${productDTO.productCode}</td>
                <td>${productDTO.productName}</td>
                <c:if test="${productDTO.productType == 0 }">
                <td>포장자재</td>
                </c:if>
                <c:if test="${productDTO.productType == 1 }">
                <td>식자재</td>
                </c:if>
                <c:if test="${productDTO.productType == 2 }">
                <td>완제품</td>
                </c:if>
                <td>${productDTO.productOrigin}</td>
                <td>${productDTO.productPrice}</td>
                <c:if test="${productDTO.note == null}">
                <td></td>
                </c:if>
                <c:if test="${productDTO.note != null}">
                <td>${productDTO.Note}</td>
                </c:if>
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


<script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendors/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/pages/dashboard.js"></script>



<script>
    function sendpro(productCode,productName) {
        
        //1. 현재 창을 열기 위해 window.open() 함수를 사용한 부모 창에 대한 참조 -> window.opener
        //2. DOM에 접근
        //3. ID가 "productCode/productName"인 HTML 요소를 찾음, 대부분의 경우 이 요소는 입력 필드(input) -> getElementById("productCode / productName")
        //4. 최종적으로 "productCode /productName" ID를 가진 요소의 값으로 설정 -> value = productCode / productName
        window.opener.document.getElementById("productCode").value = productCode;
        window.opener.document.getElementById("productName").value = productName;
        // 팝업창 닫기
        window.close();
    }
</script>

</body>
</html>