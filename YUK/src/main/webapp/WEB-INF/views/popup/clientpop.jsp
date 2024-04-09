<%@page import="com.itwillbs.domain.OrdercontractDTO"%>
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
		  <div class="card-header" style="margin-top: 30px;">
	        <h3 class="card-title" style="text-align: left;">발주품목리스트</h3>
	      <hr>
	      <div class="card-header" style="display: flex; justify-content: space-between; align-items: center;">
            <div>
                <form action="${pageContext.request.contextPath}/ordercontract/order" method="get" style="display: flex;">
                    <div style="margin-right: 10px;">
                        <b>품목코드</b>
                        <input type="text" id="first-name" class="form-control" name="ord_cd" style="width: auto;">
                    </div>
                    <div style="margin-right: 10px;">
                        <b>품명</b>
                        <input type="text" id="first-name" class="form-control" name="cli_name" style="width: auto;">
                    </div>
                    <div style="margin-right: 10px;">
                        <b>단가</b>
                        <input type="text" id="first-name" class="form-control" name="pro_name" style="width: auto;">
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit" style="height:36px !important; margin-top:22px !important;" >조회</button>
                </form>
            </div>
            
        </div>
	      </div>
		<div class="card-body">
	      <div class="card-content">
	        <div class="card-body" style="padding: 5px;">
	          <!-- Table with outer spacing -->
	          <div class="table-responsive">
	            <table class="table">
	              <thead>
	                <tr>
	                  <th>품목이름</th>
	                  <th>품목코드</th>
	                  <th>거래처코드</th>
	                  <th>거래처명</th>
	                  <th>단가</th>
	                </tr>
	              </thead>
	              <tbody>
					<c:forEach var="OrdercontractDTO" items="${OrderList }">
					<tr>
						<td>${OrdercontractDTO.pro_name }</td>
						<td>${OrdercontractDTO.pro_cd }</td>
						<td>${OrdercontractDTO.cli_cd }</td>
						<td>${OrdercontractDTO.cli_name }</td>
						<td>${OrdercontractDTO.pro_price }</td>
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
		  var selectedValue3 = selectedRow.find('td:eq(4)').text();
		  var selectedValue4 = selectedRow.find('td:eq(3)').text();// 5 번째 열의 값을 가져오는 경우
		  window.opener.document.getElementById('pro_name').value = selectedValue;
		  window.opener.document.getElementById('pro_cd').value = selectedValue1;
		  window.opener.document.getElementById('cli_cd').value = selectedValue2;
		  window.opener.document.getElementById('pro_price').value = selectedValue3;
		  window.opener.document.getElementById('cli_name').value = selectedValue4;
		  window.close();
		});
	</script>
	<script>
// $(document).ready(function(){
//     // 서버에서 받은 OrderList를 자바스크립트 객체 배열로 변환
// 	var orders = [
<%--         <% for(OrdercontractDTO order : orderList) { %> --%>
//         {
<%--             pro_name: '<%= order.getPro_name() %>', --%>
<%--             pro_cd: '<%= order.getPro_cd() %>', --%>
<%--             cli_cd: '<%= order.getCli_cd() %>', --%>
<%--             cli_name: '<%= order.getCli_name() %>', --%>
<%--             pro_price: '<%= order.getPro_price() %>' --%>
//         },
<%--         <% } %> --%>
//     ];

   
//     // 중복 제거 (pro_cd를 기준으로)
//     var uniqueOrders = [];
//     var map = new Map();
//     for (var order of orders) {
//         if(!map.has(order.pro_cd)){
//             map.set(order.pro_cd, true);    // 중복되지 않는 항목에 대해 맵에 추가
//             uniqueOrders.push(order);
//         }
//     }

//     // 중복이 제거된 배열을 사용하여 테이블에 행 추가
//     uniqueOrders.forEach(function(order) {
//         var row = `<tr>
//             <td>${order.pro_name}</td>
//             <td>${order.pro_cd}</td>
//             <td>${order.cli_cd}</td>
//             <td>${order.cli_name}</td>
//             <td>${order.pro_price}</td>
//         </tr>`;
//         $('.table tbody').append(row);
//     });
// });
</script>

</body>
</html>