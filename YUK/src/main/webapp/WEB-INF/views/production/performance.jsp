<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>요기육</title>
    
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
	
	<!--     DatePicker를 위한 css -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
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
<!--             <div class="col-12 col-md-6 order-md-2 order-first"> -->
<!--                 <nav aria-label="breadcrumb" class='breadcrumb-header'> -->
<!--                     <ol class="breadcrumb"> -->
<!--                         <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                         <li class="breadcrumb-item active" aria-current="page">Datatable</li> -->
<!--                     </ol> -->
<!--                 </nav> -->
<!--             </div> -->
        </div>
    </div>
    <section class="section">
        <div class="card">
            <div class="card-body">
            <div class="card-header" style="text-align: right;">
			<form action="${pageContext.request.contextPath}/production/performance" method="get">
				<div class="col-lg-2 col-3" style="display: flex; align-items: center; white-space: nowrap;">
				<div style="flex: 0 1 auto; margin-right: 10px;"><b>작업지시코드</b></div> &nbsp;&nbsp;
					<input type="text" class="form-control" name="search1" style="flex: 1 1 auto; width: auto;" placeholder="지시코드를 입력하세요">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b>제품코드</b>&nbsp;&nbsp;
					<input type="text" class="form-control" name="search2" style="flex: 1 1 auto; width: auto; background-color: white;" placeholder="제품코드를 입력하세요">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b>일자</b>&nbsp;&nbsp;
					<input type="text" id="startDate" class="form-control" name="search3" placeholder="기간을 선택하세요" style="width: 140px;">
            		&nbsp; ~ &nbsp;
					<input type="text" id="endDate" class="form-control" name="search4" placeholder="기간을 선택하세요" style="width: 140px;">
					&nbsp;&nbsp;
					<button class="btn btn-primary btn-sm" type="submit">조회</button>
				</div>
			</form>
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
<!-- 			페이징 시작 -->
<nav aria-label="Page navigation example">
    <ul class="pagination pagination-primary justify-content-end">
        <c:if test="${pageDTO.startPage > 1}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/production/performance?pageNum=${pageDTO.startPage - 1}">Previous</a>
            </li>
        </c:if>
        
        <c:if test="${pageDTO.startPage <= 1}">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
            </li>
        </c:if>
        
        <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
            <li class="page-item ${pageDTO.currentPage == i ? 'active' : ''}">
                <a class="page-link" href="${pageContext.request.contextPath}/production/performance?pageNum=${i}">${i}</a>
            </li>
        </c:forEach>
        
        <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/production/performance?pageNum=${pageDTO.endPage + 1}">Next</a>
            </li>
        </c:if>
        
        <c:if test="${pageDTO.endPage >= pageDTO.pageCount}">
            <li class="page-item disabled">
                <a class="page-link" href="#">Next</a>
            </li>
        </c:if>
    </ul>
</nav>
<!-- 			페이징 끝 -->
			</div>
<!-- 	          --- -->
	          <div class="card-content">
	          
	          
	          
	          
		<div style="display: flex; justify-content: space-between; align-items: center; padding: 10px 27.2px 0px 27.2px;">
		    <h3 class="card-title" style="text-align: left;">실적입력</h3>
		    <form id="dataForm1" class="insertLine" action="${pageContext.request.contextPath}/production/updatePer" method="post">
		        <div style="display: flex;">
		            <button type="button" onclick="addTableRow()" class='btn btn-primary' id="addrow" style="margin-left: 10px;">➕ 추가</button>
		            <button type="button" onclick="modTableRow()" class='btn btn-primary' id="modify" style="margin-left: 10px;">↪️ 수정</button>
		            <button type="button" onclick="delTableRow()" class='btn btn-primary' id="delete" style="margin-left: 10px;">⚠️ 삭제</button>
		            <button type="submit" class='btn btn-primary' id="submitrow" disabled style="margin-left: 10px;">💾 저장</button>
		        </div>
		    </form>
		</div>
		<form id="addForm" action="${pageContext.request.contextPath}/production/insertPer" method="post">
<!-- 실적 입력/조회 테이블 -->
		  <div class="card-header" style="padding-top: 0px;">
	          <!-- Table with outer spacing -->
	          <div class="table-responsive">
	            <table class="table" id="table2">
	              <thead>
	                <tr>
	                  <th style="width: 180px;">실적 코드</th>
	                  <th style="width: 180px;">작업지시 코드</th>
	                  <th style="width: 180px;">품목코드</th>
	                  <th style="width: 200px;">품명</th>
	                  <th style="width: 150px;">지시수량</th>
	                  <th style="width: 130px;">실적수량</th>
	                  <th style="width: 150px;">양불구분</th>
	                  <th>비고</th>
<!-- 	                  <th style="width: 0px;"></th> -->
	                </tr>
	              </thead>
	              <tbody>
	              <tr>
					<td><input type="text" name="perCode" class="form-control" id="perCode" value="${productionDTO.perCode }" readonly></td>
					<td><input type="text" name="instructionCode" class="form-control" id="instructionCode" value="" readonly></td>
					<td><input type="text" name="productCode" class="form-control" id="productCode" value="" readonly></td>
					<td><input type="text" name="productName" class="form-control" id="productName" value="" readonly></td>
					<td><input type="text" name="insVol" class="form-control" id="insVol" value="" readonly></td>
					<td><input type="text" name="perACA" class="form-control"  placeholder=""></td>
					<td><select name="perGood" class="form-select">
							<option value="0">양품</option>
							<option value="1">불량품</option>
						</select></td>
					<td><input type="text" name="perNote" class="form-control" placeholder="불량사유, 기타 정보"></td>
<%-- 					<td><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" ></td> --%>
	              </tr>
	              </tbody>
	              <tfoot>
	              </tfoot>
	            </table>
	          </div>
	      </div>
	      
<!--	실적 입력/조회 테이블 끝 -->

							<div class="col-12 d-flex justify-content-end">
<!-- 							    <button type="submit" class="btn btn-primary mr-1 mb-1">Submit</button> -->
							</div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
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
	  function addTableRow() {
	    var perACAField = document.querySelector('[name="perACA"]');
	    var perGoodField = document.querySelector('[name="perGood"]');
	    
	    var isPerACAFilled = perACAField && perACAField.value.trim() !== '';
	    var isPerGoodSelected = perGoodField && perGoodField.value.trim() !== '';

	    if (!isPerACAFilled || !isPerGoodSelected) {
	      Swal.fire({
	        title: "빈칸을 채워주세요.",
	        // 나머지는 동일하게 유지
	      });
	    } else {
	      // 모든 검증을 통과한 경우에만 폼 제출
	      document.getElementById('addForm').submit();
	    }
	  }
	</script>
		
	<script>
	$(document).ready(function(){
	  $("#table1 tbody tr").click(function(){
	    var tdArr = $(this).children();
	    var data = {
	      instructionCode: tdArr.eq(0).text()
	    };
	    
	    // 선택한 행의 식별 정보를 localStorage에 저장
	    localStorage.setItem('selectedInstructionCode', instructionCode);
	    
	    $.ajax({
	      type: "POST",
	      url: "${pageContext.request.contextPath}/production/getPerList",
	      data: JSON.stringify(data),
	      contentType: "application/json",
          beforeSend: function(xhr) {
              // CSRF 토큰과 헤더 이름 읽기
              var token = $('meta[name="_csrf"]').attr('content');
              var header = $('meta[name="_csrf_header"]').attr('content');
              
              // 요청 헤더에 CSRF 토큰 추가
              xhr.setRequestHeader(header, token);
          },
	      cache: false,  // 캐싱 방지
	      success: function(response) {
// 	        console.log(response); // 응답 데이터 로깅
	        $("#table2 tfoot").empty(); // 기존 테이블 내용 초기화
	
	        // 서버로부터 받은 데이터로 테이블 바디를 채웁니다.
	        $.each(response, function(i, item) {
// 	        	console.log(item); // 각 item 객체를 콘솔에 출력
// 	        	console.log(item.perGood); // 각 item 객체의 perGood 속성 값을 콘솔에 출력
	        	var perGoodStatus = item.perGood === 0 ? "양품" : "불량품";
				var newRow = "<tr>" +
				  "<td>" + item.perCode + "</td>" +
				  "<td>" + item.instructionCode + "</td>" +
				  "<td>" + item.productCode + "</td>" +
				  "<td>" + item.productName + "</td>" +
				  "<td>" + item.insVol + "</td>" +
				  "<td>" + item.perACA + "</td>" +
				  "<td>" + perGoodStatus + "</td>" +
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
	//검색 달력
	$(document).ready(function () {
	        $.datepicker.setDefaults($.datepicker.regional['ko']);
	        $("#startDate").attr("placeholder", "기간을 선택하세요");
	        $("#startDate").datepicker({
	             changeMonth: true, 
	             changeYear: true,
	             nextText: '다음 달',
	             prevText: '이전 달', 
	             dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	             dateFormat: "yy-mm-dd",
	             maxDate: 0,  // 선택할 수 있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
	             onClose: function( selectedDate ) {    
	                  //시작일(startDate) datepicker가 닫힐 때
	                  //종료일(endDate)의 선택할 수 있는 최소 날짜(minDate)를 선택한 시작일로 지정
	                 $("#endDate").datepicker( "option", "minDate", selectedDate );
	             }
	        });
	        
	        $("#endDate").attr("placeholder", "기간을 선택하세요");
	        $("#endDate").datepicker({
	             changeMonth: true, 
	             changeYear: true,
	             nextText: '다음 달',
	             prevText: '이전 달', 
	             dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	             dateFormat: "yy-mm-dd",
	             maxDate: 0, // 선택할 수 있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
	             onClose: function( selectedDate ) {    
	                 // 종료일(endDate) datepicker가 닫힐 때
	                 // 시작일(startDate)의 선택할 수 있는 최대 날짜(maxDate)를 선택한 시작일로 지정
	                 $("#startDate").datepicker( "option", "maxDate", selectedDate );
	             }
	        });
	});
	</script>
	
	<script>
	    let isEditMode = false;
	    let selectedRow = null;
	    let originalHTML = {}; // 원래 셀의 HTML을 저장할 객체
	
	    document.addEventListener('DOMContentLoaded', function() {
	        const table = document.getElementById('table2');
	        const tbody = table.querySelector('tfoot'); // 찾은 테이블 내의 tfoot 요소를 찾음
	        tbody.addEventListener('click', function(e) {
	            if (isEditMode) {
	                let target = e.target;
	                while (target != table && target.tagName !== 'TR') {
	                    target = target.parentNode;
	                }
	                if (target.tagName === 'TR') {
	                    // 현재 행이 이미 선택되어 수정 모드인 경우, 아무런 동작도 수행하지 않음
	                    if (selectedRow === target) {
	                        return; // 함수 실행을 여기서 중단
	                    }
	
	                    // 다른 행이 선택되어 있는 경우, 이전 행을 원래 상태로 되돌림
	                    if (selectedRow && selectedRow !== target) {
	                        revertRow(selectedRow); // 이전에 선택된 행을 원래 상태로 되돌림
	                    }
	                    selectedRow = target; // 새로 선택된 행을 현재 선택된 행으로 설정
	                    makeRowEditable(selectedRow); // 선택된 행을 수정 가능한 상태로 만듦
	                }
	            }
	        });
	    });
	
	    function modTableRow() {
	        isEditMode = true;
	        // 수정 버튼을 취소 버튼으로 변경
	        const modifyButton = document.getElementById('modify');
	        modifyButton.textContent = '↩️ 취소';
	        modifyButton.onclick = canMod; // 클릭 이벤트를 canMod 함수로 변경
	
	        Swal.fire({
	        	  title: "수정할 행을 선택해주세요.",
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
	
	        document.getElementById('delete').disabled = true;// 삭제 버튼 비활성화
	        
	        // 저장 버튼 활성화 및 이벤트 리스너 추가
	        const submitButton = document.getElementById('submitrow');
	        submitButton.disabled = false; // 저장 버튼 활성화
	    }
	
	    function canMod() {
	        isEditMode = false;
	        if (selectedRow) {
	            revertRow(selectedRow); // 선택된 행을 원래 상태로 되돌림
	        }
	        selectedRow = null;
	        
	        // 취소 버튼을 다시 수정 버튼으로 변경
	        const modifyButton = document.getElementById('modify');
	        modifyButton.textContent = '↪️ 수정';
	        modifyButton.onclick = modTableRow; // 클릭 이벤트를 다시 modTableRow 함수로 변경
	        
	        
	        document.getElementById('delete').disabled = false; // 삭제 버튼 다시 활성화
	        document.getElementById('submitrow').disabled = true; // 저장 버튼 비활성화
	    }
	
	    function revertRow(row) {
	        Object.keys(originalHTML).forEach((index) => {
	            const cell = row.cells[index];
	            cell.innerHTML = originalHTML[index]; // 원본 HTML로 복원
	        });
	        originalHTML = {}; // 사용 후 객체 초기화
	    }
	
	    function makeRowEditable(row) {
	        isDelMode = false;
	        originalHTML = {}; // 현재 행에 대한 원본 HTML 저장을 위해 객체 초기화
	        const cellIndex = [0, 2, 5, 6, 7]; // 수정할 열 인덱스 (2열과 5열)
	        cellIndex.forEach((index) => {
	            const cell = row.cells[index];
	            originalHTML[index] = cell.innerHTML; // 수정 전 원본 HTML을 저장
	            const originalText = cell.textContent.trim();
	            
	            // 1열(인덱스 0)의 경우, 텍스트 입력 필드를 생성
		       if (index === 0) {
		            const input = document.createElement('input');
		            input.type = 'hidden'; // 입력 필드 타입을 hidden으로 설정
		            input.name = 'perCode'; // 요구사항에 맞게 이름 설정
		            input.id = 'perCode1'; 
		            input.value = originalText; // 예를 들어, 행의 고유 ID 값
		            cell.appendChild(input); // 숨겨진 입력 필드 추가
		       }
	            // 1열(인덱스 0)의 경우, 텍스트 입력 필드를 생성
	            else if (index === 2) {
		            const input = document.createElement('input');
		            input.type = 'hidden'; // 입력 필드 타입을 hidden으로 설정
		            input.name = 'productCode'; // 요구사항에 맞게 이름 설정
		            input.id = 'productCode1'; 
		            input.value = originalText; // 예를 들어, 행의 고유 ID 값
		            cell.appendChild(input); // 숨겨진 입력 필드 추가
		       }
	            // 5열(인덱스 4)의 경우, 텍스트 입력 필드를 생성
				else if (index === 5) {
	                const input = document.createElement('input');
	                input.type = 'text';
	                input.name = 'perACA';
	                input.id = 'perACA1';
	                input.className = 'form-control';
	                input.value = originalText;
	                cell.innerHTML = '';
	                cell.appendChild(input);
	            }
	            // 6열(인덱스 5)의 경우, 선택 목록을 생성
				else if (index === 6) {
	                const select = document.createElement('select');
	                select.name = 'perGood';
	                select.id = 'perGood1';
	                select.className = 'form-select';
	                
	                // 예시로 추가하는 선택지. 실제 요구사항에 맞게 수정해야 함
	                const options = ["양품", "불량품"];
	                options.forEach((optionText, optionIndex) => { // optionIndex를 추가하여 인덱스 값을 사용
	                    const option = document.createElement('option');
	                    option.value = optionIndex; // optionIndex를 value로 사용
	                    option.textContent = optionText;
	                    if (optionText === originalText) {
	                        option.selected = true;
	                    }
	                    select.appendChild(option);
	                });
	                
	                cell.innerHTML = '';
	                cell.appendChild(select);
	            }
				else if (index === 7) {
	                const input = document.createElement('input');
	                input.type = 'text';
	                input.name = 'perNote';
	                input.id = 'perNote1';
	                input.className = 'form-control';
	                input.value = originalText;
	                cell.innerHTML = '';
	                cell.appendChild(input);
	            }
	        });
	    }
	</script>
	<script>
	$(document).ready(function() {
	    // 저장 버튼 클릭 이벤트 리스너
	    $("#submitrow").click(function(e) {
	        e.preventDefault(); // 폼의 기본 제출 동작을 중지
	        modifyIns(); // 수정 함수 호출
	    });
	});
	
	function collectFormData() {
	    // 입력된 데이터 수집
	    const perCode = document.getElementById('perCode1').value;
	    const productCode = document.getElementById('productCode1').value;
	    const perACA = document.getElementById('perACA1').value;
	    const perGood = document.getElementById('perGood1').value;
	    const perNote = document.getElementById('perNote1').value;
	
	    return {
	    	perCode: perCode,
	    	productCode: productCode,
	        perACA: perACA,
	        perGood: perGood,
	        perNote: perNote
	    };
	}
	
	function sendDataToServer(data) {
	    $.ajax({
	        type: "POST",
	        url: "${pageContext.request.contextPath}/production/updatePer",
	        data: JSON.stringify(data),
	        contentType: "application/json",
	        dataType: "json",
            beforeSend: function(xhr) {
                // CSRF 토큰과 헤더 이름 읽기
                var token = $('meta[name="_csrf"]').attr('content');
                var header = $('meta[name="_csrf_header"]').attr('content');
                
                // 요청 헤더에 CSRF 토큰 추가
                xhr.setRequestHeader(header, token);
            },
	        success: function(response) {
	            // AJAX 호출 성공 시 로직...
	            Swal.fire({
	                title: '성공!',
	                text: '수정이 완료되었습니다.',
	                icon: 'success',
	                confirmButtonText: '확인'
	            }).then((result) => {
	                if (result.value) {
		                window.location.reload(); // 새로고침
	                }
	            });
	        },


	        error: function(xhr, status, error) {
	            // 서버 요청이 실패했을 때의 처리
	        }
	    });
	}
	
	function modifyIns() {
	    // 입력된 데이터 수집 및 서버로 전송
	    const formData = collectFormData();
	    sendDataToServer(formData);
	    
	}
	</script>
	<script>
	document.addEventListener('DOMContentLoaded', function() {
	    const table = document.getElementById('table2');
	    const tbody = table.querySelector('tfoot');
	    tbody.addEventListener('click', function(e) {
	        if (isDelMode) {
	            let target = e.target;
	            Swal.fire({
	                title: "Are you sure?",
	                text: "You won't be able to revert this!",
	                icon: "warning",
	                showCancelButton: true,
	                confirmButtonColor: "#3085d6",
	                cancelButtonColor: "#d33",
	                confirmButtonText: "Yes, delete it!"
	            }).then((result) => {
	                if (result.isConfirmed) {
	                    // 삭제 승인 후 행의 첫 번째 열 값 가져오기
	                    while (target != table && target.tagName !== 'TR') {
	                        target = target.parentNode;
	                    }
	                    if (target.tagName === 'TR') {
	                        const firstColumnValue = target.cells[0].textContent || target.cells[0].innerText; // 첫 번째 열 값
	                        
	                        var token = document.querySelector('meta[name="_csrf"]').getAttribute('content');
	                        var header = document.querySelector('meta[name="_csrf_header"]').getAttribute('content');

	                        // 서버로 첫 번째 열 값을 POST 요청으로 전송
	                        fetch('${pageContext.request.contextPath}/production/perDeletePro', {
	                            method: 'POST',
	                            headers: {
	                                'Content-Type': 'application/json',
	                                [header]: token // CSRF 토큰 추가
	                            },
	                            body: JSON.stringify({ perCode: firstColumnValue }) // 서버에 전송할 데이터
	                        })
	                        .then(response => {
	                            if(response.ok) {
	                                tbody.removeChild(target); // 서버에서 성공적으로 처리되면 행 삭제
	                                Swal.fire(
	                                    "Deleted!",
	                                    "Your file has been deleted.",
	                                    "success"
	                                );
	                                isDelMode = true; // 삭제 모드 비활성화
	                            } else {
	                                // 서버 처리 실패 시
	                                Swal.fire(
	                                    "Error!",
	                                    "There was an issue deleting your file.",
	                                    "error"
	                                );
	                            }
	                        })
	                        .catch((error) => {
	                            console.error('Error:', error);
	                        });
	                    }
	                }
	            });
	        }
	    });
	});
	
	function delTableRow() {
	    isEditMode = false;
	    isDelMode = true;
	    
	    Swal.fire({
	  	  title: "삭제할 행을 선택해주세요.",
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
	    
	    document.getElementById('modify').disabled = true; // 삭제 버튼 다시 활성화
	    
	 	// 수정 버튼을 취소 버튼으로 변경
	    const modifyButton = document.getElementById('delete');
	    modifyButton.textContent = '✖️ 취소';
	    modifyButton.onclick = canMod2; // 클릭 이벤트를 canMod 함수로 변경
	    
	}
	function canMod2() {
	    isDelMode = false;
	    
	    // 취소 버튼을 다시 수정 버튼으로 변경
	    const modifyButton = document.getElementById('delete');
	    modifyButton.textContent = '⚠️ 삭제';
	    modifyButton.onclick = delTableRow; // 클릭 이벤트를 canMod 함수로 변경
	    
	    document.getElementById('modify').disabled = false; // 삭제 버튼 다시 활성화
	}
	</script>
</body>
</html>