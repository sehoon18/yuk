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
<section id="multiple-column-form" >
        <div class="row match-height" >
            <div class="col-12" >
                <div class="card" style="box-shadow: none;">
                    <div class="card-content">
                            
<!-- 품목 소요량 테이블 -->
		  <div class="card-header" style="margin-top: 30px;">
	        <h2 class="card-title" style="text-align: left;">창고목록</h2>
	        <hr>
			<form action="${pageContext.request.contextPath}/popup/whpop" method="get">
				<div class="col-lg-2 col-3" style="display: flex; align-items: center; white-space: nowrap;">
				<div style="flex: 0 1 auto; margin-right: 10px;"><b>창고코드</b></div>
					<input type="text" id="whCode" class="form-control" name="search1" style="flex: 1 1 auto; width: auto; background-color: white;" placeholder="창고코드를 입력하세요">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>창고명</b> &nbsp;&nbsp;
					<input type="text" id="whName" class="form-control" name="search2" style="flex: 1 1 auto; width: auto;" placeholder="창고명을 입력하세요">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn btn-primary btn-sm" type="submit">조회</button>
				</div>
			</form>
	      <hr>
	      </div>
		<div class="card-body">
	      <div class="card-content">
	        <div class="card-body" style="padding: 5px;">
	          <!-- Table with outer spacing -->
	          <div class="table-responsive">
			    <table class='table table-bordered mb-0' id="table1">
			        <thead>
			            <tr>
			                <th>창고코드</th>
			                <th>창고명</th>
			                <th>구역</th>
			                <th>최대적재량</th>
			                <th>창고위치</th>
			                <th>전화번호</th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:forEach var="warehouseDTO" items="${whList }">
						<tr>
                            <td>${warehouseDTO.warehouseCode }</td>
                            <td>${warehouseDTO.warehouseName }</td>
                            <td>${warehouseDTO.warehouseArea }</td>
                            <td>${warehouseDTO.warehouseMvol }</td>
                            <td>${warehouseDTO.warehouseLocal }</td>
                            <td>${warehouseDTO.warehouseTelNumber }</td>
                        </tr>
                        </c:forEach>
			        </tbody>
			    </table>
	          </div>
	        </div>
	      </div>
	      
<!-- 			페이징 시작 -->
<nav aria-label="Page navigation example">
    <ul class="pagination pagination-primary justify-content-end">
        <c:if test="${pageDTO.startPage > 1}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/popup/whpop?pageNum=${pageDTO.startPage - 1}&search1=${pageDTO.search1}&search2=${pageDTO.search2}"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></span></a>
            </li>
        </c:if>
        
        <c:if test="${pageDTO.startPage <= 1}">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></span></a>
            </li>
        </c:if>
        
        <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
            <li class="page-item ${pageDTO.currentPage == i ? 'active' : ''}">
                <a class="page-link" href="${pageContext.request.contextPath}/popup/whpop?pageNum=${i}&search1=${pageDTO.search1}&search2=${pageDTO.search2}">${i}</a>
            </li>
        </c:forEach>
        
        <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/popup/whpop?pageNum=${pageDTO.endPage + 1}&search1=${pageDTO.search1}&search2=${pageDTO.search2}"><span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></span></a>
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
	      
<!--	품목 소요량 테이블 끝 -->

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
    $(document).on('click', '.table tbody tr', function() {
      var selectedRow = $(this);
      var selectedCode = selectedRow.find('td:eq(0)').text(); // 첫 번째 열의 값을 가져오는 경우
      var selectedName = selectedRow.find('td:eq(1)').text(); // 두 번째 열의 값을 가져오는 경우
      
      window.opener.receiveValueFromPopup(selectedCode, selectedName); // 부모 창의 함수 호출
      window.close();
    });
</script>
<script>
    $(document).on('click', '.table tbody tr', function() {
      var selectedRow = $(this);
      var selectedCode = selectedRow.find('td:eq(0)').text(); // 첫 번째 열의 값을 가져오는 경우
      var selectedName = selectedRow.find('td:eq(1)').text(); // 두 번째 열의 값을 가져오는 경우
      
      window.opener.receiveValueFromPopup(selectedCode, selectedName); // 부모 창의 함수 호출
      window.close();
    });
</script>

</body>
</html>