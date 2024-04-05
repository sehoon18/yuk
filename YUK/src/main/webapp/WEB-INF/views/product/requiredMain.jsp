<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YOGIYUK</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
        <style>
		tbody tr:hover {
		    background-color:#e4e8ff;
		}
	</style>
    	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>   
</head>
<body>
    
    <jsp:include page="../inc/sidebar.jsp" />
    
    <div style="margin-left: 20px;">
    <h1><b>소요량 관리</b></h1>
  	<br>
  <form action="${pageContext.request.contextPath}/product/requiredMain">
  <div class="col-lg-2 col-3" style="display: flex; align-items: center; white-space: nowrap;">
<!--   	flex: 0 1 auto; 속성은 사원번호 텍스트가 필요한 만큼의 공간만 차지 -->
  <div style="flex: 0 1 auto; margin-right: 10px;"><b>소요량코드</b></div>
  <input type="text" id="requiredCode" class="form-control" name="requiredCode" style="flex: 1 1 auto; width: auto; background-color: white;" placeholder="소요량코드를 선택하세요" onclick="requiredPopUp();" readonly>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>완제품명</b> &nbsp;&nbsp;
  <input type="text" id="productName" class="form-control" name="productName" style="flex: 1 1 auto; width: auto;" placeholder="완제품명을 입력하세요">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <b>품목구분</b>
   &nbsp;&nbsp;
  <select class="form-select" id="basicSelect" name="productType" style="width: 100px;" >
	<option value="100">전체</option>
	<option value="1">식자재</option>
	<option value="2">포장자재</option>
   </select>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <button class="btn btn-primary btn-sm" type="submit">조회</button>
</div>
</form>
<br>
    

    
<div class="row" id="table-bordered" style="margin-right: 20px;">
  <div class="col-12">
    <div class="card">
     <form id="dataForm" class="insertRequired" action="${pageContext.request.contextPath}/product/requiredInsert" method="post">
      <div class="card-header" style="text-align:right;">
        <h4 class="card-title" style="text-align:left;">소요량 목록 <b>총 ${requiredList.size()}건</b></h4>
     		    <button type="button" onclick="addTableRow()" class='btn btn-primary' id="addrow">➕ 추가</button>
			    <button type="button" onclick="modTableRow()" class='btn btn-primary' id="modify">↪️ 수정</button>
			    <button type="button" onclick="delTableRow()" class='btn btn-primary' id="delete">⚠️ 삭제</button>
			    <button type="submit" class='btn btn-primary' id="submitrow" disabled>💾 저장</button>
      </div>
      <div class="card-content">
        <div class="table-responsive">
          <table class="table table-bordered mb-0" id="table1">
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
              <tr>
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
      </form>
    </div>
  </div>
</div>
    
</div>    

<nav aria-label="Page navigation example">
	<ul class="pagination pagination-primary" style="justify-content:center;">
		<li class="page-item">
			<a class="page-link" href="#">
		<span aria-hidden="true"><i data-feather="chevron-left"></i></span>
			</a>
		</li>
			<li class="page-item"><a class="page-link" href="">1</a></li>
			<li class="page-item active"><a class="page-link" href="">2</a></li>
			<li class="page-item"><a class="page-link" href="">3</a></li>
			<li class="page-item"><a class="page-link" href="">
		<span aria-hidden="true"><i data-feather="chevron-right"></i></span>
			</a>
		</li>
	</ul>
</nav>



    <script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/apexcharts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/pages/dashboard.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    
    <script>
	function requiredPopUp(){
		window.open("${pageContext.request.contextPath}/product/requiredPopUp" , "이름" , "width=1300px, height=700px , left=100px; , top=100px;");
	}
	function receiveReq(requiredCode,productName){
		document.getElementById("requiredCode").value = requiredCode;
		document.getElementById("productName").value = productName;
	}
	</script>
	
	 <script>
    function addTableRow() {
        const table = document.getElementById("table1").getElementsByTagName('tbody')[0];
        const newRow = table.insertRow(0);
        const rowId = table.rows.length; // 행 ID로 사용될 값

        
        // 각 열에 대한 셀과 입력 필드 생성
       		const fields = ['requiredCode', 'productCode', 'productName', 'materialProductCode', 'productPName','productType','requiredVol'];
       		const exampleData = ['${productionDTO.requiredCode}','', '', '', '','',''];

        	fields.forEach((field, index) => {
            const cell = newRow.insertCell(index);
            let input;

            // 인풋 타입 변경
            if (field === 'requiredCode') {
            	input = document.createElement("input");
                input.type = "text";
                input.className = "form-control";
                input.readOnly = true; // 입력 필드를 읽기 전용으로 설정
            } else if(field === 'productName'){
                input = document.createElement("input");
                input.type = "text";
                input.className = "form-control";
                input.readOnly = true; // 입력 필드를 읽기 전용으로 설정
            } else if(field === 'productCode'){
                input = document.createElement("input");
                input.type = "text";
                input.className = "form-control";
	        } else if(field === 'materialProductCode'){
	            input = document.createElement("input");
	            input.type = "text";
	            input.className = "form-control";
	        } else if(field === 'productPName'){
	            input = document.createElement("input");
	            input.type = "text";
	            input.className = "form-control";
	            input.readOnly = true; // 입력 필드를 읽기 전용으로 설정
	        } else if(field === 'productType'){
	            input = document.createElement("input");
	            input.type = "text";
	            input.className = "form-control";
	            input.readOnly = true; // 입력 필드를 읽기 전용으로 설정
	        }else if(field === 'requiredVol'){
	            input = document.createElement("input");
	            input.type = "text";
	            input.className = "form-control";
	        }
            else {
                input = document.createElement("input");
                input.type = "text";
                input.className = "form-control";
            }

            input.name = field;
            input.value = exampleData[index];
            cell.appendChild(input);
        });

        // '추가' 버튼을 '취소' 버튼으로 변경하면서 id값도 변경
        const addButton = document.querySelector('#addrow');
        addButton.textContent = '✖️ 취소';
        addButton.id = 'cancelrow';
        addButton.onclick = function() { cancelAddition(newRow); };

        document.getElementById('submitrow').disabled = false; // 저장 버튼 활성화
        document.getElementById('modify').disabled = true; // 수정 버튼 비활성화
        document.getElementById('delete').disabled = true; // 삭제 버튼 비활성화
    }

    function cancelAddition(row) {
        // 추가된 행 삭제
        row.remove();

        // 버튼을 다시 '추가'로 변경하면서 id값도 원래대로 변경
        const addButton = document.querySelector('#cancelrow');
        addButton.textContent = '➕ 추가';
        addButton.id = 'addrow';
        addButton.onclick = addTableRow;

        document.getElementById('submitrow').disabled = true; // 저장 버튼 비활성화
        document.getElementById('modify').disabled = false; // 수정 버튼 활성화
        document.getElementById('delete').disabled = false; // 삭제 버튼 활성화
    }
    </script>
    
<script>
    let isEditMode = false;
    let selectedRow = null;
    let originalHTML = {}; // 원래 셀의 HTML을 저장할 객체

    document.addEventListener('DOMContentLoaded', function() {
        const table = document.getElementById('table1');
        const tbody = table.querySelector('tbody'); // 찾은 테이블 내의 tbody 요소를 찾음
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

        document.getElementById('addrow').disabled = true; // 추가 버튼 비활성화
        document.getElementById('delete').disabled = true;// 추가 버튼 비활성화
        
        // 저장 버튼 활성화 및 이벤트 리스너 추가
        const submitButton = document.getElementById('submitrow');
        submitButton.disabled = false; // 저장 버튼 활성화
        submitButton.onclick = function(event) {
            event.preventDefault(); // 기본 폼 전송 취소

            // 폼 객체를 가져옵니다.
            var form = document.getElementById('dataForm'); // 폼의 ID

            // 폼의 action 속성을 새로운 주소로 변경합니다.
            form.action = '${pageContext.request.contextPath}/product/requiredUpdate'; // 새로운 주소로 변경

            // 폼을 수동으로 전송합니다.
            form.submit();
        };
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
        
        
        document.getElementById('addrow').disabled = false; // 추가 버튼을 다시 활성화
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
        const cellIndex = [6]; // 수정할 열 인덱스 (2열과 5열)
        cellIndex.forEach((index) => {
            const cell = row.cells[index];
            originalHTML[index] = cell.innerHTML; // 수정 전 원본 HTML을 저장
            const originalText = cell.textContent.trim();
            
            // 1열(인덱스 0)의 경우, 텍스트 입력 필드를 생성
	       if (index === 0) {
	            const input = document.createElement('input');
	            input.type = 'hidden'; // 입력 필드 타입을 hidden으로 설정
	            input.name = 'requiredCode'; // 요구사항에 맞게 이름 설정
	            input.value = originalText; // 예를 들어, 행의 고유 ID 값
	            cell.appendChild(input); // 숨겨진 입력 필드 추가
	       }
			else if (index === 6) {
                const input = document.createElement('input');
                input.type = 'text';
                input.name = 'requiredVol';
                input.className = 'form-control';
                input.value = originalText;
                cell.innerHTML = '';
                cell.appendChild(input);
            }
           
        });
    }
</script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const table = document.getElementById('table1');
    const tbody = table.querySelector('tbody');
    tbody.addEventListener('click', function(e) {
        if (isDelMode) {
            let target = e.target;
            Swal.fire({
            	title: "정말 삭제하시겠습니까?",
                icon: "주의",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "삭제"
            }).then((result) => {
                if (result.isConfirmed) {
                    // 삭제 승인 후 행의 첫 번째 열 값 가져오기
                    while (target != table && target.tagName !== 'TR') {
                        target = target.parentNode;
                    }
                    if (target.tagName === 'TR') {
                        const firstColumnValue = target.cells[0].textContent || target.cells[0].innerText; // 첫 번째 열 값
                        
                        // 서버로 첫 번째 열 값을 POST 요청으로 전송
                        fetch('${pageContext.request.contextPath}/product/productDelete', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify({ productCode: firstColumnValue }) // 서버에 전송할 데이터
                        })
                        .then(response => {
                            if(response.ok) {
                                tbody.removeChild(target); // 서버에서 성공적으로 처리되면 행 삭제
                                Swal.fire(
                                    "삭제완료!",
                                );
                                isDelMode = true; // 삭제 모드 비활성화
                            } else {
                                // 서버 처리 실패 시
                                Swal.fire(
                                    "에러 발생!",
                                    "삭제할 수 없습니다."
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
    
    document.getElementById('addrow').disabled = true; // 추가 버튼을 다시 활성화
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
    
    document.getElementById('addrow').disabled = false; // 추가 버튼을 다시 활성화
    document.getElementById('modify').disabled = false; // 삭제 버튼 다시 활성화
}
</script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var form = document.getElementById('dataForm');

    if (form) { // 폼이 존재하는지 확인
        form.addEventListener('submit', function(e) {
            // 폼 제출 시 빈칸을 채워야 하는 입력 필드를 확인
            if (isEditMode || isDelMode) {
                // 수정 모드나 삭제 모드일 때는 폼 제출을 막지 않음
                return;
            }

            // 모든 'form-control' 클래스를 가진 입력 필드 검사
            var inputFields = document.querySelectorAll('.form-control');
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