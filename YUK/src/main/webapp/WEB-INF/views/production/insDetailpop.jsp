<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
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

	<!-- jquery -->
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
		<sec:authorize access="hasAnyRole('ROLE_PRODUCTION', 'ROLE_ADMIN')">
        <button type="submit" id="updateIns" class="btn btn-primary mr-1 mb-1" onclick="updateIns()" disabled>💾 저장</button>
        <c:if test="${productionDTO.instractionStatus == 0 }">
        <button type="button" id="modifyIns" class="btn btn-primary mr-1 mb-1" onclick="modifyIns()">↪️ 수정</button>
        <button type="button" id="deleteIns" class="btn btn-primary mr-1 mb-1" data-instruction-code="${productionDTO.instructionCode}">⚠️ 삭제</button>
        </c:if>
        <c:if test="${productionDTO.instractionStatus == 2 }">
        <button type="button" id="" class="btn btn-primary mr-1 mb-1" disabled>↪️ 수정</button>
        <button type="button" id="" class="btn btn-primary mr-1 mb-1" disabled>⚠️ 삭제</button>
        </c:if>
		</sec:authorize>
		
		<sec:authorize access="hasAnyRole('ROLE_PRODUCT', 'ROLE_BOUND', 'ROLE_OC', 'ROLE_NONE')">
        <button type="submit" class="btn btn-primary mr-1 mb-1" onclick="accessError()" disabled>💾 저장</button>
        <c:if test="${productionDTO.instractionStatus == 0 }">
        <button type="button" class="btn btn-primary mr-1 mb-1" onclick="accessError()">↪️ 수정</button>
        <button type="button" class="btn btn-primary mr-1 mb-1" onclick="accessError()">⚠️ 삭제</button>
        </c:if>
        <c:if test="${productionDTO.instractionStatus == 2 }">
        <button type="button" class="btn btn-primary mr-1 mb-1" disabled>↪️ 수정</button>
        <button type="button" class="btn btn-primary mr-1 mb-1" disabled>⚠️ 삭제</button>
        </c:if>
		</sec:authorize>
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
                                            <input type="text" id="productCode" class="form-control" name="productCode" onclick="openProductPopup()" value="${productionDTO.productCode }" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="city-column">품목명</label>
                                            <input type="text" id="productCode" class="form-control" name="productName" value="${productionDTO.productName }" disabled>
                                        </div>
                                    </div>
											<input type="hidden" id="csrf" class="form-control" name="${_csrf.parameterName}" value="${_csrf.token}" >
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
                                            <input type="text" id="lineCode" class="form-control" name="lineCode" onclick="openLinePopup()" value="${productionDTO.lineCode }" disabled>
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
	            <table class="table table-bordered mb-0">
	              <thead>
	                <tr>
	                  <th>소요량코드</th>
	                  <th>제품명</th>
	                  <th>원자재명</th>
	                  <th>소요량</th>
	                  <th>원자재 소비량</th>
	                </tr>
	              </thead>
	              <tbody>
					<c:forEach var="reqDTO" items="${reqList }">
					<tr>
						<td>${reqDTO.reqCode }</td>
						<td>${reqDTO.proName1}(${reqDTO.pProCode })</td>
						<td>${reqDTO.proName2}(${reqDTO.mProCode })</td>
						<td>${reqDTO.reqVol }</td>
						<td>${reqDTO.reqVol*productionDTO.insVol }</td>
					</tr>
					</c:forEach>
	              </tbody>
	            </table>
	          </div>
	        </div>
	      </div>
	      </div>
	      
<!--	품목 소요량 테이블 끝 -->

                        </div>
						</form>
							<div style="text-align: center;">
							<button onclick="printPage()" class="btn icon icon-left btn-light"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>인쇄</button>
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
    $(document).ready(function() {
        // 클릭 이벤트 핸들러 내부에서 deleteIns 함수를 호출합니다.
        $('#deleteIns').click(function() {
            var instructionCode = $(this).data('instructionCode'); // instructionCode 값을 얻습니다.
            
            // SweetAlert로 삭제 확인 요청
            Swal.fire({
                title: "삭제 확인",
                text: "작업지시를 삭제하시겠습니까?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, delete it!"
            }).then((result) => {
                if (result.isConfirmed) {
                    // 사용자가 확인을 눌렀을 경우, deleteIns 함수에 instructionCode 값을 전달하여 호출합니다.
                    deleteIns(instructionCode);
                    
                    // SweetAlert로 삭제 성공 메시지 표시
//                     Swal.fire({
//                         title: "Deleted!",
//                         text: "Your file has been deleted.",
//                         icon: "success"
//                     });
                }
            });
        });
    });

    // deleteIns 함수를 클릭 이벤트 핸들러 외부에 정의합니다.
    function deleteIns(instructionCode) {
        event.preventDefault();
        $.ajax({
            url: "${pageContext.request.contextPath}/production/deleteInstruction", // 실제 요청 URL로 변경해야 함
            type: "post", // 메소드 타입
            data:  { instructionCode: instructionCode }, // 서버로 전송할 데이터
            beforeSend: function(xhr) {
                // CSRF 토큰과 헤더 이름 읽기
                var token = $('meta[name="_csrf"]').attr('content');
                var header = $('meta[name="_csrf_header"]').attr('content');
                
                // 요청 헤더에 CSRF 토큰 추가
                xhr.setRequestHeader(header, token);
            },
            success: function(response) {
                // 데이터베이스 저장 성공 후
                window.opener.location.reload(); // 부모 창 새로고침
                window.close(); // 팝업 창 닫기
            },
            error: function(xhr, status, error) {
                alert("삭제 실패: " + error);
            }
        });
    }
</script>

	<script>
	  // 인풋 창을 클릭하면 팝업을 엽니다.
	  function openProductPopup() {
	    var popup = window.open("${pageContext.request.contextPath}/popup/productpop", "popup", "width=800,height=600");
	    
	    if (popup === null || typeof(popup) === 'undefined') {
	      alert('팝업이 차단되었습니다. 팝업 차단을 해제하고 다시 시도해주세요.');
	    } else {
	      // 팝업에서 선택한 값을 가져와서 인풋 필드에 설정합니다.
	      $(popup.document).on('click', '.popup-option', function() {
	        var selectedValue = $(this).text();
	        $('#productCode').val(selectedValue);
	        popup.close();
	      });
	    }
	  }
	</script>
	
	<script>
	// 빈칸이 있을 때 알림
	document.addEventListener('DOMContentLoaded', function() {
	    var form = document.getElementById('insForm');
	
	    if (form) { // 폼이 존재하는지 확인
	        form.addEventListener('submit', function(e) {
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
	function printPage(){
	    window.print();
	}
	</script>
	
	<script>
	function accessError() {
	 Swal.fire({
		  title: "권한이 없습니다.",
		  icon:"error",
		  width: 600,
		  padding: "3em",
		  color: "#ff0000",
		  background: "#fff",
		  backdrop: `
		    rgba(ff,ff,ff,0)
		    left top
		    no-repeat
		  `
		});
	}
	</script>
</body>
</html>