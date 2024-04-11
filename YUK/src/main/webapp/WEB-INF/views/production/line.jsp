<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YOGIYUK</title>
    
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
                <h3>라인 관리</h3>
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
            <div class="card-header" style="padding: 27.2px 22.4px 3px 22.4px;">
			<form action="${pageContext.request.contextPath}/production/line" method="get">
				<div class="col-lg-2 col-3" style="display: flex; align-items: center; white-space: nowrap;">
				<div style="flex: 0 1 auto; margin-right: 10px;"><b>라인코드</b></div>
					<input type="text" id="lineCode" class="form-control" name="search1" style="flex: 1 1 auto; width: auto; background-color: white;" placeholder="라인코드를 입력하세요">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>라인명</b> &nbsp;&nbsp;
					<input type="text" id="lineName" class="form-control" name="search2" style="flex: 1 1 auto; width: auto;" placeholder="라인명을 입력하세요">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 	<b>상태</b>
					&nbsp;&nbsp;
					<select class="form-select" id="basicSelect" name="search5" style="width: 100px;">
						<option value="4">전체</option>	
						<option value="0">대기</option>
						<option value="1">가동</option>
						<option value="2">정비</option>
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn btn-primary btn-sm" type="submit">조회</button>
				</div>
			</form>
			</div>
			<form id="dataForm" class="insertLine" action="${pageContext.request.contextPath}/production/linePro" method="post">
            <div class="card-header" style="text-align: right; padding: 3px 22.4px 22.4px 22.4px;">
			    <button type="button" onclick="addTableRow()" class='btn btn-primary' id="addrow">➕ 추가</button>
			    <button type="button" onclick="modTableRow()" class='btn btn-primary' id="modify">↪️ 수정</button>
			    <button type="button" onclick="delTableRow()" class='btn btn-primary' id="delete">⚠️ 삭제</button>
			    <button type="submit" class='btn btn-primary' id="submitrow" disabled>💾 저장</button>
            </div>
			    <table class='table table-bordered mb-0' id="table1">
			        <thead>
			            <tr>
			                <th style="width: 180px;">라인코드</th>
			                <th style="width: 400px;">라인명</th>
			                <th style="width: 180px;">등록일자</th>
			                <th style="width: 180px;">등록자</th>
			                <th style="width: 150px; text">라인상태</th>
			                <th style="width: 0px; text"></th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:forEach var="productionDTO" items="${lineList }">
						<tr>
                            <td>${productionDTO.lineCode }</td>
                            <td>${productionDTO.lineName }</td>
                            <td>${productionDTO.update }</td>
                            <td>${productionDTO.name }</td>
                            <td>
                            <c:if test="${productionDTO.lineStatus == 0 }">
							<font color="BLUE">대기</font>
                            </c:if>
                            <c:if test="${productionDTO.lineStatus == 1 }">
							<font color="red">가동</font>
                            </c:if>
                            <c:if test="${productionDTO.lineStatus == 2 }">
							<font color="gray">정비</font>
                            </c:if>
                            </td>
                            <td>
                            </td>
                        </tr>
                        </c:forEach>
			        </tbody>
			    </table>
			</form>
			
<!-- 			페이징 시작 -->
<nav aria-label="Page navigation example" style="padding: 10px 0px;">
    <ul class="pagination pagination-primary justify-content-end">
        <c:if test="${pageDTO.startPage > 1}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/production/line?pageNum=${pageDTO.startPage - 1}&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search5=${pageDTO.search0}"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></span></a>
            </li>
        </c:if>
        
        <c:if test="${pageDTO.startPage <= 1}">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></span></a>
            </li>
        </c:if>
        
        <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
            <li class="page-item ${pageDTO.currentPage == i ? 'active' : ''}">
                <a class="page-link" href="${pageContext.request.contextPath}/production/line?pageNum=${i}&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search5=${pageDTO.search0}">${i}</a>
            </li>
        </c:forEach>
        
        <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/production/line?pageNum=${pageDTO.endPage + 1}&search1=${pageDTO.search1}&search2=${pageDTO.search2}&search5=${pageDTO.search0}"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></span></a>
            </li>
        </c:if>
        
        <c:if test="${pageDTO.endPage >= pageDTO.pageCount}">
            <li class="page-item disabled">
                <a class="page-link" href="#"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></span></a>
            </li>
        </c:if>
    </ul>
</nav>
<!-- 			페이징 끝 -->

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
    function addTableRow() {
        const table = document.getElementById("table1").getElementsByTagName('tbody')[0];
        const newRow = table.insertRow(0);
        const rowId = table.rows.length; // 행 ID로 사용될 값
        var today = new Date();
		var dateStr = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2); // 'YYYY-MM-DD' 형식으로 변환

        
        // 각 열에 대한 셀과 입력 필드 생성
        const fields = ['lineCode', 'lineName', 'update', 'name', 'lineStatus', '${_csrf.parameterName}'];
        const exampleData = ['${productionDTO.lineCode}', '', dateStr, '', '0', '${_csrf.token}'];

        fields.forEach((field, index) => {
            const cell = newRow.insertCell(index);
            let input;

            // 인풋 타입 변경
            if (field === 'lineStatus') {
                input = document.createElement("select");
                input.className = "form-select";
                const options = ["대기", "가동", "정비"];
                options.forEach((option, index) => {
                    const optionElement = document.createElement("option");
                    optionElement.value = index;
                    optionElement.textContent = option;
                    input.appendChild(optionElement);
                });
            } else if(field === 'update'){
                input = document.createElement("input");
                input.type = "date";
                input.className = "form-control";
                
            } else if(field === 'lineCode'){
                input = document.createElement("input");
                input.type = "text";
                input.className = "form-control";
                input.readOnly = true; // 입력 필드를 읽기 전용으로 설정
            }
            else if(field === '${_csrf.parameterName}'){
                input = document.createElement("input");
                input.type = "hidden";
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
            form.action = '${pageContext.request.contextPath}/production/lineUpdatePro'; // 새로운 주소로 변경

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
        const cellIndex = [0, 1, 4, 5]; // 수정할 열 인덱스 (2열과 5열)
        cellIndex.forEach((index) => {
            const cell = row.cells[index];
            originalHTML[index] = cell.innerHTML; // 수정 전 원본 HTML을 저장
            const originalText = cell.textContent.trim();
            
            // 1열(인덱스 0)의 경우, 텍스트 입력 필드를 생성
	       if (index === 0) {
	            const input = document.createElement('input');
	            input.type = 'hidden'; // 입력 필드 타입을 hidden으로 설정
	            input.name = 'lineCode'; // 요구사항에 맞게 이름 설정
	            input.value = originalText; // 예를 들어, 행의 고유 ID 값
	            cell.appendChild(input); // 숨겨진 입력 필드 추가
	       }
            // 2열(인덱스 1)의 경우, 텍스트 입력 필드를 생성
			else if (index === 1) {
                const input = document.createElement('input');
                input.type = 'text';
                input.name = 'lineName';
                input.className = 'form-control';
                input.value = originalText;
                cell.innerHTML = '';
                cell.appendChild(input);
            }
            // 6열(인덱스 5)의 경우, 텍스트 입력 필드를 생성
			else if (index === 5) {
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = '${_csrf.parameterName}';
                input.className = 'form-control';
                input.value = '${_csrf.token}';
                cell.appendChild(input);
            }
            // 5열(인덱스 4)의 경우, 선택 목록을 생성
			else if (index === 4) {
                const select = document.createElement('select');
                select.name = 'lineStatus';
                select.className = 'form-select';
                
                // 예시로 추가하는 선택지. 실제 요구사항에 맞게 수정해야 함
                const options = ["대기", "가동", "정비"];
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
                        fetch('${pageContext.request.contextPath}/production/lineDeletePro', {
                            method: 'post',
                            headers: {
                                'Content-Type': 'application/json',
                                [header]: token // CSRF 토큰 추가
                            },
                            body: JSON.stringify({ lineCode: firstColumnValue}) // 서버에 전송할 데이터
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
                                    "가동중인 라인은 수정/삭제가 불가능합니다.",
                                    "error"
                                );
                            }
                        })
                        .catch((error) => {
//                             console.error('Error:', error);
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
document.addEventListener('DOMContentLoaded', function () {
    // 서버로부터 전달받은 에러 메시지 확인
    var errorMessage = "${errorMessage}";
    if (errorMessage) {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: errorMessage
        });
    }
});
</script>

<script>
// 추가 - 빈칸이 있을 때 알림
// document.addEventListener('DOMContentLoaded', function() {
//     var form = document.getElementById('dataForm');

//     if (form) { // 폼이 존재하는지 확인
//         form.addEventListener('submit', function(e) {
//             // 모든 'form-control' 클래스를 가진 입력 필드 검사
//             var inputFields = document.querySelectorAll('.form-control');
//             var isEmptyFieldPresent = Array.from(inputFields).some(function(input) {
//                 return input.value.trim() === ''; // 비어있는 입력 필드가 있는지 확인
//             });

//             if (isEmptyFieldPresent) { // 하나라도 비어있는 입력 필드가 있으면
//                 Swal.fire({
//                 	  title: "빈칸을 채워주세요.",
//                 	  width: 600,
//                 	  padding: "3em",
//                 	  color: "#00ff0000",
//                 	  background: "#fff",
//                 	  backdrop: `
//                 	    rgba(ff,ff,ff,0)
//                 	    left top
//                 	    no-repeat
//                 	  `
//                 	});
//                 e.preventDefault(); // 폼 제출 중단
//             }
//         });
//     }
// });
</script>
    
</body>
</html>