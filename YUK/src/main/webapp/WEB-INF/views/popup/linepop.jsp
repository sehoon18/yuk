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
    
</head>
<body>
<section id="multiple-column-form" >
        <div class="row match-height" >
            <div class="col-12" >
                <div class="card" style="box-shadow: none;">
                    <div class="card-content">
                            
<!-- 품목 소요량 테이블 -->
		  <div class="card-header" style="margin-top: 30px;">
	        <h2 class="card-title" style="text-align: left;">라인목록</h2>
	        <hr>
			<form action="${pageContext.request.contextPath}/popup/linepop" method="get">
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
	      <hr>
	      </div>
		<div class="card-body">
	      <div class="card-content">
	        <div class="card-body" style="padding: 5px;">
	          <!-- Table with outer spacing -->
	          <div class="table-responsive">
			    <table class='table' id="table1">
			        <thead>
			            <tr>
			                <th>라인코드</th>
			                <th>라인명</th>
			                <th>등록일자</th>
			                <th>등록자</th>
			                <th>라인상태</th>
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
                                <span class="badge bg-success">Waiting</span>                            
                            </c:if>
                            <c:if test="${productionDTO.lineStatus == 1 }">
                            	<span class="badge bg-danger">Active</span>
                            </c:if>
                            <c:if test="${productionDTO.lineStatus == 2 }">
                            	<span class="badge bg-light">Maintenance</span>
                            </c:if>
                            </td>
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
                <a class="page-link" href="${pageContext.request.contextPath}/popup/linepop?pageNum=${pageDTO.startPage - 1}">Previous</a>
            </li>
        </c:if>
        
        <c:if test="${pageDTO.startPage <= 1}">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
            </li>
        </c:if>
        
        <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
            <li class="page-item ${pageDTO.currentPage == i ? 'active' : ''}">
                <a class="page-link" href="${pageContext.request.contextPath}/popup/linepop?pageNum=${i}">${i}</a>
            </li>
        </c:forEach>
        
        <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/popup/linepop?pageNum=${pageDTO.endPage + 1}">Next</a>
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
	    // 테이블 행을 클릭한 값을 가져와 부모 창으로 전달
	    $(document).on('click', '.table tbody tr', function() {
	      var selectedRow = $(this);
	      var selectedValue = selectedRow.find('td:eq(0)').text(); // 첫 번째 열의 값을 가져오는 경우
	      var selectedStatus = selectedRow.find('td:eq(4)').text(); // 다섯 번째 열의 값을 가져오는 경우
	      
	      if(selectedStatus.trim() === 'Active'){
	    	    Swal.fire({
	    	        icon: 'warning',
	    	        title: '가동중',
	    	        text: '현재 이 라인은 가동 중입니다.',
	    	        confirmButtonText: '확인'
	    	    });
	    	} else if(selectedStatus.trim() === 'Maintenance'){
	    	    Swal.fire({
	    	        icon: 'info',
	    	        title: '정비중',
	    	        text: '현재 이 라인은 정비 중입니다.',
	    	        confirmButtonText: '확인'
	    	    });
	    	} else{
	          window.opener.document.getElementById('lineCode').value = selectedValue; 
	          window.close();
	      }
	    });
	</script>
</body>
</html>