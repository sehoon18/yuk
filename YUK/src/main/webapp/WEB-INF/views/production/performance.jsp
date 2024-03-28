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
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
            <div class="card-header">
			    <button type="button" onclick="addTableRow()" class='btn btn-primary' id="addrow">추가</button>
			    <button type="submit" class='btn btn-success' id="submitrow" disabled>저장</button>            
			</div>
            <div class="card-body">
                <table class='table .table-bordered' id="table1">
                    <thead>
                        <tr>
                            <th>생산실적코드</th>
                            <th>작업지시코드</th>
                            <th>라인코드</th>
                            <th>품목코드</th>
                            <th>품명</th>
                            <th>지시수량</th>
                            <th>실적수량</th>
                            <th>불량사유</th>
                            <th>등록일</th>
                            <th>담당자</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="productionDTO" items="${performanceList }">
							<tr>
	                            <td>${productionDTO.perCode }</td>
	                            <td>${productionDTO.instructionCode }</td>
	                            <td>${productionDTO.lineCode }</td>
	                            <td>${productionDTO.productCode }</td>
	                            <td>${productionDTO.productName }</td>
	                            <td>${productionDTO.insVol }</td>
	                            <td>${productionDTO.perACA }</td>
	                            <td>${productionDTO.perNote }</td>
	                            <td>${productionDTO.perDate }</td>
	                            <td>${productionDTO.name }</td>
	                        </tr>
                        </c:forEach>
	                    </tbody>
                </table>
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
    
<script src="${pageContext.request.contextPath}/resources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/vendors.js"></script>

    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    
	<script> // 행 추가 기능
    function addTableRow() {
        const table = document.getElementById("table1").getElementsByTagName('tbody')[0];
        const newRow = table.insertRow(0);
        const rowId = table.rows.length; // 행 ID로 사용될 값
        
        // 각 열에 대한 셀과 입력 필드 생성
        const fields = ['perCode', 'instructionCode', 'lineCode', 'productCode', 'productName', 'insVol', 'perACA', 'perNote', 'perDate', 'name'];
        const exampleData = ['', '', '', '', '','','','','',''];

        fields.forEach((field, index) => {
            const cell = newRow.insertCell(index);
            let input;

            // 인풋 타입 변경
            if(field === 'perDate'){
                input = document.createElement("input");
                input.type = "date";
                input.className = "form-control";
            }   else {
                input = document.createElement("input");
                input.type = "text";
                input.className = "form-control";
            }

            input.name = field;
            input.value = exampleData[index];
            cell.appendChild(input);
        });

        // '추가' 버튼을 '취소' 버튼으로 변경하면서 id값도 변경
        const addButton = document.querySelector('.btn-primary');
        addButton.textContent = '취소';
        addButton.id = 'cancelrow';
        addButton.onclick = function() { cancelAddition(newRow); };

        // 저장 버튼 활성화
        document.getElementById('submitrow').disabled = false;
    }

    function cancelAddition(row) {
        // 추가된 행 삭제
        row.remove();

        // 버튼을 다시 '추가'로 변경하면서 id값도 원래대로 변경
        const addButton = document.querySelector('#cancelrow');
        addButton.textContent = '추가';
        addButton.id = 'addrow';
        addButton.onclick = addTableRow;

        // 저장 버튼 비활성화
        document.getElementById('submitrow').disabled = true;
    }
	</script>
</body>
</html>