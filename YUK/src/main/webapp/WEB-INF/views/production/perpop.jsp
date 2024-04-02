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
   	<style>
		tbody tr:hover {
		    background-color:#e4e8ff;
		}
	</style>
</head>
<body>
<section id="multiple-column-form" >
        <div class="row match-height" >
            <div class="col-12" >
                <div class="card" style="box-shadow: none;">
		  			<div class="card-header" style="margin-top: 30px;">
                <h2>생산실적 등록</h2><br><br>
                        <h3 class="card-title">작업지시 목록</h3>
                    <hr>

	          <!-- Table with outer spacing -->
	          <div class="table-responsive">
	            <table class="table" id="table1">
	              <thead>
	                <tr>
	                  <th>작업지시 코드</th>
	                  <th>품목코드</th>
	                  <th>품목명</th>
	                  <th>지시수량</th>
	                  <th>지시날짜</th>
	                </tr>
	              </thead>
	              <tbody>
					<c:forEach var="productionDTO" items="${compInsList }">
					<tr>
						<td>${productionDTO.instructionCode }</td>
						<td>${productionDTO.productCode }</td>
						<td>${productionDTO.productName }</td>
						<td>${productionDTO.insVol }</td>
						<td>${productionDTO.instructionDate }</td>
					</tr>
					</c:forEach>
	              </tbody>
	            </table>
	          </div>

                    </div>
                    <div class="card-content">
	          <form action="${pageContext.request.contextPath}/production/insertPer" method="post">

<!-- 품목 소요량 테이블 -->
		  <div class="card-header" style="margin-top: 20px;">
	        <h3 class="card-title" style="text-align: left;">실적입력</h3>
	      <hr>
<!-- 	      실적입력창 테이블 -->
	          <!-- Table with outer spacing -->
	          <div class="table-responsive">
	            <table class="table" id="table2">
	              <thead>
	                <tr>
	                  <th>작업지시 코드</th>
	                  <th>품목코드</th>
	                  <th>품명</th>
	                  <th style="width: 130px;">지시수량</th>
	                  <th style="width: 130px;">실적수량</th>
	                  <th>양불구분</th>
	                  <th>비고</th>
	                </tr>
	              </thead>
	              <tbody>
	              <tr>
					<td><input type="text" name="instructionCode" class="form-control" id="instructionCode" value="" readonly></td>
					<td><input type="text" name="productCode" class="form-control" id="productCode" value="" readonly></td>
					<td><input type="text" name="productName" class="form-control" id="productName" value="" readonly></td>
					<td><input type="text" name="insVol" class="form-control" id="insVol" value="" readonly></td>
					<td><input type="text" name="perACA" class="form-control"  placeholder=""></td>
					<td><select name="perGood" class="form-select" id="basicSelect" >
							<option value="0">양</option>
							<option value="1">불량</option>
						</select></td>
					<td><input type="text" name="perNote" class="form-control" placeholder="불량사유, 기타 정보"></td>
	              </tr>
	              </tbody>
	            </table>
	          </div>
	      </div>
	      
<!--	품목 소요량 테이블 끝 -->


							<div class="col-12 d-flex justify-content-end">
							    <button type="submit" class="btn btn-primary mr-1 mb-1">Submit</button>
							    <button type="reset" class="btn btn-light-secondary mr-1 mb-1">Reset</button>
							</div>
							</form>
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
	document.addEventListener('DOMContentLoaded', function() {
	    const table = document.getElementById('table1');
	    const tbody = table.querySelector('tbody');
	    
	    tbody.addEventListener('click', function(e) {
	        // 클릭된 요소가 TR인지 확인
	        if (e.target && e.target.nodeName === "TD") {
	            let currentRow = e.target.parentNode;
	            let cells = currentRow.getElementsByTagName("td");
	            
	            // 입력 필드에 값을 설정
	            document.getElementById('instructionCode').value = cells[0].textContent; // 첫 번째 셀의 값
	            document.getElementById('productCode').value = cells[1].textContent; // 두 번째 셀의 값
	            document.getElementById('productName').value = cells[2].textContent; // 세 번째 셀의 값
	            document.getElementById('insVol').value = cells[3].textContent; // 네 번째 셀의 값
	        }
	    });
	});
	</script>
	
	<script>
	$(document).ready(function(){
	  $("#table1 tbody tr").click(function(){
	    var tdArr = $(this).children();
	    var data = {
	      instructionCode: tdArr.eq(0).text()
	    };
	    
	    $.ajax({
	      type: "POST",
	      url: "${pageContext.request.contextPath}/production/getPerList",
	      data: JSON.stringify(data),
	      contentType: "application/json",
	      cache: false,  // 캐싱 방지
	      success: function(response) {
	        console.log(response); // 응답 데이터 로깅
	        $("#table2 tbody").empty(); // 기존 테이블 내용 초기화
	
	        // 서버로부터 받은 데이터로 테이블 바디를 채웁니다.
	        $.each(response, function(i, item) {
	          var newRow = "<tr>" +
	            "<td>" + item.instructionCode + "</td>" +
	            "<td>" + item.productCode + "</td>" +
	            "<td>" + item.productName + "</td>" +
	            "<td>" + item.insVol + "</td>" +
	            "<td>" + item.perACA + "</td>" +
	            "<td>" + item.perGood + "</td>" +
	            "<td>" + item.perNote + "</td>" +
	            "</tr>";
	
	          $("#table2 tbody").append(newRow);
	        });
	      },
	      error: function(xhr, status, error) {
	        // 에러 처리 로직
	        alert("An error occurred: " + status + " Error: " + error);
	      }
	    });
	  });
	});
	</script>


</body>
</html>