<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요기육</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>
<body>
<section id="multiple-column-form" >
        <div class="row match-height" >
            <div class="col-12" >
                <div class="card" style="box-shadow: none;">
                    <div class="card-content">
                            
<!-- 품목 소요량 테이블 -->
		  <div class="card-header" style="margin-top: 30px;">
	        <h3 class="card-title" style="text-align: left;">수주목록</h3>
	      <hr>
	      </div>
		<div class="card-body">
	      <div class="card-content">
	        <div class="card-body" style="padding: 5px;">
	          <!-- Table with outer spacing -->
	          <div class="table-responsive">
	            <table class="table">
	              <thead>
	                <tr>
	                  <th>수주코드</th>
	                  <th>품목코드</th>
	                  <th>품명</th>
	                  <th>수주량</th>
	                  <th>수주일자</th>
	                </tr>
	              </thead>
	              <tbody>
					<c:forEach var="productionDTO" items="${getConProList }">
					<tr>
						<td>${productionDTO.contractCode }</td>
						<td>${productionDTO.productCode }</td>
						<td>${productionDTO.productName }</td>
						<td>${productionDTO.contractVol }</td>
						<td>${productionDTO.contractDueDate }</td>
					</tr>
					</c:forEach>
	              </tbody>
	            </table>
	          </div>
	        </div>
	      </div>
	      </div>
	      
<!--	품목 소요량 테이블 끝 -->

                        </div>
                    </div>
                </div>
            </div>
    </section>
    <script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	<script>
		// 테이블 행을 클릭한 값을 가져와 부모 창으로 전달
		$(document).on('click', '.table tbody tr', function() {
		  var selectedRow = $(this);
		  var selectedValue = selectedRow.find('td:eq(0)').text(); // 첫 번째 열의 값을 가져오는 경우
		  var selectedValue1 = selectedRow.find('td:eq(1)').text(); // 두 번째 열의 값을 가져오는 경우
		  var selectedValue2 = selectedRow.find('td:eq(2)').text(); // 세 번째 열의 값을 가져오는 경우
		  var selectedValue3 = selectedRow.find('td:eq(4)').text(); // 네 번째 열의 값을 가져오는 경우
		  window.opener.document.getElementById('contractCode').value = selectedValue;
		  window.opener.document.getElementById('productCode').value = selectedValue1;
		  window.opener.document.getElementById('productName').value = selectedValue2;
		  window.opener.document.getElementById('contractDate').value = selectedValue3;
		  window.close();
		});
	</script>
</body>
</html>