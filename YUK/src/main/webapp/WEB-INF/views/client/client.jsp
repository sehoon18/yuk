<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!--     <title>YOGIYUK</title> -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
<style>
.color:hover {
	background-color: lightgray;
}
</style>    
</head>
<body>
    
    <jsp:include page="../inc/sidebar.jsp" />
    
    <div style="margin-left: 20px;">
    <h1><b>거래처 관리</b></h1>
  	<br>
  	
  	<form action="${pageContext.request.contextPath}/client/client" >
  <div class="col-lg-2 col-3" style="display: flex; align-items: center; white-space: nowrap;">
<!--   	flex: 0 1 auto; 속성은 사원번호 텍스트가 필요한 만큼의 공간만 차지 -->
  <div style="flex: 0 1 auto; margin-right: 10px;"><b>거래처코드</b></div>
  <input type="text" id="clientCode" class="form-control" name="clientCode" style="flex: 1 1 auto; width: auto; background-color: white;" onclick="clientCodePopup()" readonly placeholder="거래처코드를 선택하세요.">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>거래처명</b> &nbsp;&nbsp;
  <input type="text" id="clientName" class="form-control" name="clientName" style="flex: 1 1 auto; width: auto;" placeholder="거래처명을 입력하세요.">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <button class="btn btn-primary btn-sm" type="submit">조회</button>
</div>
</form>
<br>
    

    
<!--     Bordered table start -->
<div class="row" id="table-bordered" style="margin-right: 20px;">
  <div class="col-12">
    <div class="card">
      <div class="card-header" >
        <h4 class="card-title"><b>총 ${clientList.size() }건</b></h4>
      </div>
      <div class="card-content">
        <!-- table bordered -->
        <div class="table-responsive">
        <div style="text-align: right; margin-right:30px;">
<button class="btn btn-primary btn-sm" type="button" onclick="clientAddPopup()">등록</button>
</div>
<br>
          <table class="table table-bordered mb-0">
            <thead>
              <tr>
                <th>거래처코드</th>
                <th>거래처명</th>
                <th>거래처유형</th>
                <th>사업자번호</th>
                <th>대표자</th>
                <th>주소</th>
                <th>전화번호</th>
                <th>이메일</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="clientDTO" items="${clientList }">
              <tr class="color" onclick="clientDetailPopup('${clientDTO.clientCode}')">
                <td>${clientDTO.clientCode }</td>
                <td>${clientDTO.clientName }</td>
                <td>${clientDTO.clientType }</td>
                <td>${clientDTO.businessNumber }</td>
                <td>${clientDTO.clientCEO }</td>
                <td>${clientDTO.clientBasicAddress }</td>
                <td>${clientDTO.clientTelNumber }</td>
                <td>${clientDTO.clientEmail }</td>
              </tr>
              </c:forEach>
            </tbody>           
          </table>
          
         <!-- 			페이징 시작 -->
<nav aria-label="Page navigation example">
    <ul class="pagination pagination-primary justify-content-end">
        <c:if test="${pageDTO.startPage > 1}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/client/client?pageNum=${pageDTO.startPage - 1}">Previous</a>
            </li>
        </c:if>
        
        <c:if test="${pageDTO.startPage <= 1}">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
            </li>
        </c:if>
        
        <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
            <li class="page-item ${pageDTO.currentPage == i ? 'active' : ''}">
                <a class="page-link" href="${pageContext.request.contextPath}/client/client?pageNum=${i}">${i}</a>
            </li>
        </c:forEach>
        
        <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/client/client?pageNum=${pageDTO.endPage + 1}">Next</a>
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
</div>
<!-- Bordered table end -->
    
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


<!-- <nav aria-label="Page navigation example" style="margin-bottom:50px;" > -->
<!--   <ul class="pagination justify-content-center"> -->
<%--   <c:if test="${pageDTO.startPage > pageDTO.pageBlock }"> --%>
<%--     <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/qna?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">Previous</a></li> --%>
<%--   </c:if> --%>
  
<%--   <c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1"> --%>
<%--     <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/qna?pageNum=${i}">${i }</a></li> --%>
<%--   </c:forEach> --%>
  
<%--   <c:if test="${pageDTO.endPage < pageDTO.pageCount }"> --%>
<%--     <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/qna?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">Next</a></li> --%>
<%--   </c:if>   --%>
<!--   </ul> -->
<!-- </nav> -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/apexcharts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/pages/dashboard.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    
    <script>
    function clientDetailPopup(clientCode) {
        window.open("${pageContext.request.contextPath}/client/clientDetailPopup?clientCode=" + clientCode, "", "width=750, height=600, left=400, top=80");
        window.opener.document.getElementById("clientCode").value = clientCode;
        window.close();
      }
    </script>
    
    <script>
    function clientAddPopup(){window.open("${pageContext.request.contextPath}/client/clientAddPopup","","width=750, height=600, left=400, top=80");}
    </script>
    
    <script>
    function clientCodePopup(){window.open("${pageContext.request.contextPath}/client/clientCodePopup","","width=1300, height=700, left=100, top=50");}
    </script>
    
    <script>
    function receive(clientCode, clientName){
    	document.getElementById("clientCode").value=clientCode;
    	document.getElementById("clientName").value=clientName;
    		}   
    </script>
    
    <script>
    function send(clientCode){
    	window.opener.document.getElementById("clientCode").value=clientCode;
    	window.opener.document.getElementById("clientName").value=clientName;
    	window.opener.document.getElementById("clientType").value=clientType;
    	window.opener.document.getElementById("businessNumber").value=businessNumber;
    	window.opener.document.getElementById("clientCEO").value=clientCEO;
    	window.opener.document.getElementById("clientBasicAddress").value=clientBasicAddress;
    	window.opener.document.getElementById("clientTelNumber").value=clientTelNumber;
    	window.opener.document.getElementById("clientEmail").value=clientEmail;
    	window.close();
    	
    }
    </script>
    
</body>
</html>