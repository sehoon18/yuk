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
	        <h3 class="card-title" style="text-align: left;">수주품목리스트</h3>
	     <hr>
	      <div class="card-header" style="display: flex; justify-content: space-between; align-items: center;">
            <div>
                <form action="${pageContext.request.contextPath}/popup/contractpop" method="get" style="display: flex;">
                    <div style="margin-right: 10px;">
                        <b>품목코드</b>
                        <input type="text" id="first-name" class="form-control" name="search1" style="width: auto;">
                    </div>
                    <div style="margin-right: 10px;">
                        <b>품명</b>
                        <input type="text" id="first-name" class="form-control" name="search2" style="width: auto;">
                    </div>
                    <div style="margin-right: 10px;">
                        <b>자재구분</b>
                       <input type="text" id="first-name" class="form-control" name="완제품" value="완제품" readonly style="width: auto;">
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
	                  <th>단가</th>
	                  <th>구분</th>
	                </tr>
	              </thead>
	              <tbody>
					<c:forEach var="OrdercontractDTO" items="${contractList2 }">
					<tr>
						<td>${OrdercontractDTO.pro_name }</td>
						<td>${OrdercontractDTO.pro_cd }</td>
						<td>${OrdercontractDTO.pro_price }</td>
						<c:if test="${OrdercontractDTO.pro_type  == 0 }">
                            <td><button class="btn icon icon-left btn-success" disabled><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>완제품</button></td>
							</c:if>
					</tr>
					</c:forEach>
	              </tbody>
	            </table>
	            
	          </div>
	        </div>
	      </div>
	      </div>
	      
<!-- 			페이징 시작 -->
<nav aria-label="Page navigation example">
    <ul class="pagination pagination-primary justify-content-end">
        <c:if test="${pageDTO.startPage > 1}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/popup/contractpop?pageNum=${pageDTO.startPage - 1}">Previous</a>
            </li>
        </c:if>
        
        <c:if test="${pageDTO.startPage <= 1}">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
            </li>
        </c:if>
        
        <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
            <li class="page-item ${pageDTO.currentPage == i ? 'active' : ''}">
                <a class="page-link" href="${pageContext.request.contextPath}/popup/contractpop?pageNum=${i}">${i}</a>
            </li>
        </c:forEach>
        
        <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/popup/contractpop?pageNum=${pageDTO.endPage + 1}">Next</a>
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
		  var selectedValue2 = selectedRow.find('td:eq(2)').text(); // 두 번째 열의 값을 가져오는 경우
		  window.opener.document.getElementById('pro_name').value = selectedValue;
		  window.opener.document.getElementById('pro_cd').value = selectedValue1;
		  window.opener.document.getElementById('pro_price').value = selectedValue2;
		  window.close();
		});
	</script>
</body>
</html>