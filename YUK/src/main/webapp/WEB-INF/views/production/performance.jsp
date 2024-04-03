<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Datatable - Voler Admin Dashboard</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/simple-datatables/style.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
    
	<!-- Required meta tags -->
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

	<!-- sweetalert2 -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>    
	
	<!-- 	jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
		tbody tr:hover {
		    background-color:#e4e8ff;
		}
	</style>
</head>
<body>
    <div id="app">
        
	<jsp:include page="../inc/sidebar.jsp" />
	
<div class="main-content container-fluid">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>실적 관리</h3>
<!--                 <p class="text-subtitle text-muted">We use 'simple-datatables' made by @fiduswriter. You can check the full documentation <a href="https://github.com/fiduswriter/Simple-DataTables/wiki">here</a>.</p> -->
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Datatable</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <section class="section">
        <div class="card">
            <div class="card-body">
            <div class="card-header" style="text-align: right;">
<!-- 			    <button type="button" onclick="openPopup()" class='btn btn-primary' id="addrow">등록</button> -->
			</div>
	          <!-- Table with outer spacing -->
			<div class="card-header" style="">
			<h3 class="card-title">작업지시 목록</h3>
	          <div class="table-responsive">
	            <table class="table" id="table1">
	              <thead>
	                <tr>
	                  <th style="width: 180px;">작업지시 코드</th>
	                  <th style="width: 180px;">품목코드</th>
	                  <th >품목명</th>
	                  <th style="width: 150px;">지시수량</th>
	                  <th style="width: 180px;">지시날짜</th>
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
<!-- 	          --- -->
	          <div class="card-content">
	          <form id="dataForm" action="${pageContext.request.contextPath}/production/insertPer" method="post">

<!-- 품목 소요량 테이블 -->
		  <div class="card-header" style="margin-top: 20px;">
	        <h3 class="card-title" style="text-align: left;">실적입력</h3>
<!-- 	      실적입력창 테이블 -->
	          <!-- Table with outer spacing -->
	          <div class="table-responsive">
	            <table class="table" id="table2">
	              <thead>
	                <tr>
	                  <th style="width: 180px;">작업지시 코드</th>
	                  <th style="width: 180px;">품목코드</th>
	                  <th style="width: 200px;">품명</th>
	                  <th style="width: 150px;">지시수량</th>
	                  <th style="width: 130px;">실적수량</th>
	                  <th style="width: 130px;">양불구분</th>
	                  <th>비고</th>
	                </tr>
	              </thead>
	              <tbody>
	              <tr>
					<td><input type="text" name="instructionCode" class="form-control" id="instructionCode" value="" readonly></td>
					<td><input type="text" name="productCode" class="form-control" id="productCode" value="" readonly></td>
					<td><input type="text" name="productName" class="form-control" id="productName" value="" readonly></td>
					<td><input type="text" name="insVol" class="form-control" id="insVol" value="" readonly></td>
					<td><input type="text" name="perACA" class="form-control"  placeholder="" id="nullCheck"></td>
					<td><select name="perGood" class="form-select" id="nullCheck" >
							<option value="0">양</option>
							<option value="1">불량</option>
						</select></td>
					<td><input type="text" name="perNote" class="form-control" placeholder="불량사유, 기타 정보"></td>
	              </tr>
	              </tbody>
	              <tfoot>
	              </tfoot>
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
<!-- 	          --- -->
            </div>
        </div>

    </section>
</div>

            <footer>
                <div class="footer clearfix mb-0 text-muted">
                    <div class="float-left">
                        <p>2020 &copy; Voler</p>
                    </div>
                    <div class="float-right">
                        <p>Crafted with <span class='text-danger'><i data-feather="heart"></i></span> by <a href="http://ahmadsaugi.com">Ahmad Saugi</a></p>
                    </div>
                </div>
            </footer>
        </div>
    <script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
    
<%-- <script src="${pageContext.request.contextPath}/resources/assets/vendors/simple-datatables/simple-datatables.js"></script> --%>
<script src="${pageContext.request.contextPath}/resources/assets/js/vendors.js"></script>

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
// 	        console.log(response); // 응답 데이터 로깅
	        $("#table2 tfoot").empty(); // 기존 테이블 내용 초기화
	
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
	
	          $("#table2 tfoot").append(newRow);
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
	
	<script>
	// 빈칸이 있을 때 알림
	document.addEventListener('DOMContentLoaded', function() {
	    var form = document.getElementById('dataForm');
	
	    if (form) { // 폼이 존재하는지 확인
	        form.addEventListener('submit', function(e) {
	            // 모든 'form-control' 클래스를 가진 입력 필드 검사
	            var inputFields = document.querySelectorAll('#nullCheck');
	            var isEmptyFieldPresent = Array.from(inputFields).some(function(input) {
	                return input.value.trim() === ''; // 비어있는 입력 필드가 있는지 확인
	            });
	
	            if (isEmptyFieldPresent) { // 하나라도 비어있는 입력 필드가 있으면
	                Swal.fire({
	                	  title: "빈칸을 채워주세요.",
	                	  width: 600,
	                	  padding: "3em",
	                	  color: "#00ff0000",
	                	  background: "#fff",
	                	  backdrop: `
	                	    rgba(ff,ff,ff,0)
	                	    left top
	                	    no-repeat
	                	  `
	                	});
	                e.preventDefault(); // 폼 제출 중단
	            }
	        });
	    }
	});
	</script>
</body>
</html>