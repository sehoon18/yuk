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
		  			<div class="card-header" style="margin-top: 30px;">
                        <h3 class="card-title">작업지시서 등록</h3>
                    <hr>
                    </div>
                    <div class="card-content">
                      <form class="form" action="${pageContext.request.contextPath}/production/insertInstruction" method="get">
                      <!--                             ------------------------------------------- -->
                      
                        <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="first-name-column">작업지시코드</label>
                                            <input type="text" id="instructionCode" class="form-control" placeholder="INS" name="instructionCode">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">지시일자</label>
                                            <input type="DATE" id="instructionDate" class="form-control" name="instructionDate" placeholder="2024-00-00">
                                        </div>
                                    </div>
						</div></div>
						
                        <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="last-name-column">수주코드</label>
                                            <input type="text" id="contractCode" class="form-control" onclick="openPopup()" placeholder="CON" name="lname-column">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="country-floating">수량</label>
                                            <input type="text" id="insVol" class="form-control" name="insVol" placeholder="0">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">납기일자</label>
                                            <input type="DATE" id="contractDate" class="form-control" name="contractDate" placeholder="2024-00-00">
                                        </div>
                                    </div>
						</div></div>
						
                        <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="company-column">품명</label>
                                            <input type="text" id="productName" class="form-control" name="productName" placeholder="Name">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="city-column">품목코드</label>
                                            <input type="text" id="productCode" class="form-control" placeholder="PRO" name="productCode">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">라인코드</label>
                                            <input type="text" id="lineCode" class="form-control" name="email-id-column" onclick="openLinePopup()" placeholder="Line">
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
	  // 인풋 창을 클릭하면 팝업을 엽니다.
	  function openPopup() {
	    var popup = window.open("${pageContext.request.contextPath}/popup/contractpop", "popup", "width=800,height=600");
	    
	    if (popup === null || typeof(popup) === 'undefined') {
	      alert('팝업이 차단되었습니다. 팝업 차단을 해제하고 다시 시도해주세요.');
	    } else {
	      // 팝업에서 선택한 값을 가져와서 인풋 필드에 설정합니다.
	      $(popup.document).on('click', '.popup-option', function() {
	        var selectedValue = $(this).text();
	        var selectedValue1 = $(this).text();
	        var selectedValue2 = $(this).text();
	        var selectedValue3 = $(this).text();
	        
	        $('#contractCode').val(selectedValue);
	        $('#productCode').val(selectedValue1);
	        $('#productName').val(selectedValue2);
	        $('#contractDate').val(selectedValue3);
	        popup.close();
	      });
	    }
	  }
	</script>
	<script>
	  // 인풋 창을 클릭하면 팝업을 엽니다.
	  function openLinePopup() {
	    var popup = window.open("${pageContext.request.contextPath}/popup/linepop", "popup", "width=800,height=600");
	    
	    if (popup === null || typeof(popup) === 'undefined') {
	      alert('팝업이 차단되었습니다. 팝업 차단을 해제하고 다시 시도해주세요.');
	    } else {
	      // 팝업에서 선택한 값을 가져와서 인풋 필드에 설정합니다.
	      $(popup.document).on('click', '.popup-option', function() {
	        var selectedValue = $(this).text();
	        $('#lineCode').val(selectedValue);
	        popup.close();
	      });
	    }
	  }
	</script>
	
	<script>
		// 현재 날짜 생성/입력
		document.getElementById('instructionDate').valueAsDate = new Date();
	</script>
	
	
<script>
//   // 팝업 창의 폼 제출 이벤트 핸들러
//   document.getElementById('popupForm').addEventListener('submit', function(event) {
//     event.preventDefault(); // 기본 제출 동작 방지

//     // 팝업 창에서 입력한 데이터 가져오기
//     var inputData = document.getElementById('popupInput').value;

//     // 부모 창으로 데이터 전달
//     window.opener.postMessage(inputData, '*');

//     // 팝업 창 닫기
//     window.close();
//   });
</script>
	
	
</body>
</html>