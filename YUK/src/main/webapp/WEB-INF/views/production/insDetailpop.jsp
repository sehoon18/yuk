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
                      <form class="form" id="insForm" action="${pageContext.request.contextPath}/production/updateInstruction" method="post">
                      <input type="hidden" name="instructionCode" value="${productionDTO.instructionCode }">
		  			<div class="card-header" style="margin-top: 30px;">
<div style="display: flex; justify-content: space-between; align-items: center;">
    <h3 class="card-title">${productionDTO.instructionCode }</h3>
    <div>
        <button type="submit" id="updateIns" class="btn btn-primary mr-1 mb-1" onclick="updateIns()" disabled>💾 저장</button>
        <button type="button" id="modifyIns" class="btn btn-primary mr-1 mb-1" onclick="modifyIns()">↪️ 수정</button>
        <button type="button" id="deleteIns" class="btn btn-primary mr-1 mb-1" onclick="deleteIns('${productionDTO.instructionCode}')">⚠️ 삭제</button>
    </div>
</div>
                    <hr>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="city-column">품목코드</label>
                                            <input type="text" id="productCode" class="form-control" name="productCode" value="${productionDTO.productCode }" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="city-column">품목명</label>
                                            <input type="text" id="productCode" class="form-control" name="productName" value="${productionDTO.productName }" disabled>
                                        </div>
                                    </div>
						</div></div>
                        <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="country-floating">지시수량</label>
                                            <input type="text" id="insVol" class="form-control" name="insVol" value="${productionDTO.insVol }" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">지시일자</label>
                                            <input type="DATE" id="instructionDate" class="form-control" name="instructionDate" value="${productionDTO.instructionDate }"disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">라인코드</label>
                                            <input type="text" id="lineCode" class="form-control" name="lineCode" value="${productionDTO.lineCode }" disabled>
                                        </div>
                                    </div>
						</div></div>

<!--                             ------------------------------------------- -->
<!-- 품목 소요량 테이블 -->
		  <div class="card-header" style="margin-top: 30px;">
	        <h3 class="card-title" style="text-align: left;">소요량</h3>
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
	                  <th>품목코드</th>
	                  <th>품명</th>
	                  <th>수량</th>
	                  <th>재고량</th>
	                </tr>
	              </thead>
					<tr>
						<td>PRO0001</td>
						<td>양념소스</td>
						<td>2</td>
						<td>30</td>
					</tr>
					<tr>
						<td>PRO0001</td>
						<td>가공육</td>
						<td>1</td>
						<td>25</td>
					</tr>
	              <tbody>
<%-- 					<c:forEach var="productionDTO" items="${lineList }"> --%>
<!-- 					<tr> -->
<%-- 						<td>${productionDTO.lineCode }</td> --%>
<%-- 						<td>${productionDTO.lineName }</td> --%>
<%-- 						<td>${productionDTO.update }</td> --%>
<%-- 						<td>${productionDTO.name }</td> --%>
<!-- 					</tr> -->
<%-- 					</c:forEach> --%>
	              </tbody>
	            </table>
	          </div>
	        </div>
	      </div>
	      </div>
	      
<!--	품목 소요량 테이블 끝 -->

							<div class="col-12 d-flex justify-content-end">
							</div>
                        </div>
						</form>
                    </div>
                </div>
            </div>
    </section>
    <script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    
	<script>
	    document.addEventListener("DOMContentLoaded", function() {
	        document.getElementById('modifyIns').addEventListener('click', function() {
	            modifyIns();
	        });
	    });
	
	    function modifyIns() {
	        const submitButton = document.getElementById('updateIns');
	        submitButton.disabled = false; // 저장 버튼 활성화
	        document.getElementById('deleteIns').disabled = true;// 삭제 버튼 활성화
	        document.getElementById("productCode").disabled = false;
	        document.getElementById("insVol").disabled = false;
	        document.getElementById("lineCode").disabled = false;
	
	        // 수정버튼을 취소버튼으로 변경
	        const modifyButton = document.getElementById('modifyIns');
	        modifyButton.textContent = '↩️ 취소';
	        modifyButton.removeEventListener('click', modifyIns);
	        modifyButton.addEventListener('click', canMod);
	    }
	
	    function canMod() {
	        const submitButton = document.getElementById('updateIns');
	        submitButton.disabled = true; // 저장 버튼 비활성화
	        document.getElementById('deleteIns').disabled = false;// 삭제 버튼 비활성화
	        document.getElementById("productCode").disabled = true;
	        document.getElementById("insVol").disabled = true;
	        document.getElementById("lineCode").disabled = true;
	
	        // 취소버튼을 수정버튼으로 변경
	        const modifyButton = document.getElementById('modifyIns');
	        modifyButton.textContent = '↪️ 수정';
	        modifyButton.removeEventListener('click', canMod);
	        modifyButton.addEventListener('click', modifyIns);
	    }
	</script>

	<script>
// 	function deleteIns(instructionCode) {
// 		$.ajax({
// 	        url: "${pageContext.request.contextPath}/production/deleteInstruction", // 실제 요청 URL로 변경해야 함
// 	        type: "post", // 메소드 타입
// 	        data:  { instructionCode: instructionCode }, // 서버로 전송할 데이터
// 	        success: function(response) {
// 	            // 데이터베이스 저장 성공 후
// 	            alert("삭제 성공!");
// 	            window.opener.location.reload(); // 부모 창 새로고침
// 	            window.close(); // 팝업 창 닫기
// 	        },
// 	        error: function(xhr, status, error) {
// 	            alert("삭제 실패: " + error);
// 	        }
// 	    });
// 	}
	</script>
</body>
</html>