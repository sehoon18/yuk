<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
    <!-- sweetalert2 -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>    
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
</head>
<body>
<section id="multiple-column-form" >
        <div class="row match-height" >
            <div class="col-12" >
                <div class="card" style="box-shadow: none;">
		  			<div class="card-header" style="margin-top: 30px;">
                        <h3 class="card-title">수주 상세(수정/삭제/취소)</h3>
                    <hr>
                    </div>
                    <div class="card-content">
                      <form class="form" id="conForm" action="${pageContext.request.contextPath}/ordercontract/updateContract?con_cd=${ordercontractDTO.con_cd}" method="post" >
                        <div class="card-body">
                                <div class="row">
                                <div class="col-md-14 col-13">	
                                        <div class="form-group">
                                            <label for="first-name-column">수주코드</label>
                                            <input type="text" id="con_cd" class="form-control" name="con_cd" value="${ordercontractDTO.con_cd}">
                                        </div>
                                    </div>
                                    <div class="col-md-14 col-2">	
                                        <div class="form-group">
                                            <label for="first-name-column">품목코드</label>
                                            <input type="text" id="pro_cd" class="form-control" placeholder="PRO_CD"onclick="openPopup()" name="pro_cd" value="${ordercontractDTO.pro_cd}">
                                        </div>
                                    </div>
                                    <div class="col-md-14 col-2">
                                        <div class="form-group">
                                            <label for="last-name-column">품목이름</label>
                                            <input type="text" id="pro_name" class="form-control" onclick="openPopup()" placeholder="PRO_NAME" name="pro_name" value="${ordercontractDTO.pro_name}">
                                        </div>
                                    </div>
                                    <div class="col-md-14 col-2">
                                        <div class="form-group">
                                            <label for="city-column">거래처코드</label>
                                            <input type="text" id="cli_cd" class="form-control" placeholder="CLI_CD" onclick="openPopup2()" name="cli_cd" value="${ordercontractDTO.cli_cd}">
                                        </div>
                                    </div>
                                   <div class="col-md-14 col-2">
                                        <div class="form-group">
                                            <label for="country-floating">거래처명</label>
                                            <input type="text" id="cli_name" class="form-control" name="cli_name" onclick="openPopup2()" placeholder="CLI_NAME" value="${ordercontractDTO.cli_name}">
                                        </div>
                                    </div>
                                    <div class="col-md-14 col-2">
                                        <div class="form-group">
                                            <label for="company-column">수주량</label>
                                            <input type="text" id="con_vol" class="form-control" name="con_vol" placeholder="CON_VOL" value="${ordercontractDTO.con_vol}">
                                        </div>
                                    </div>
                                   <div class="col-md-14 col-2">
                                        <div class="form-group">
                                            <label for="email-id-column">단가</label>
                                            <input type="text" id="pro_price" class="form-control" name="pro_price"  placeholder="PRO_PRICE" value="${ordercontractDTO.pro_price}">
                                        </div>
                                    </div>
                                  
                                    
                                   <div class="col-md-14 col-2">
                                        <div class="form-group">
                                            <label for="email-id-column">납품일자</label>
                                            <input type="DATE" id="con_due_date" class="form-control" name="con_due_date" placeholder="2024-00-00" value="${dueDateString}">
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-14 col-2">
                                        <div class="form-group">
                                            <label for="email-id-column">결제일자</label>
                                            <input type="DATE" id="con_pay_date" class="form-control" name="con_pay_date" placeholder="2024-00-00" value="${payDateString}">
                                        </div>
                                    </div>
                                    
									
                                </div>
                                </div>
                            <div class="col-12 d-flex justify-content-end">
    <c:if test="${ordercontractDTO.con_info_status eq 0}">
    <sec:authorize access="hasAnyRole('ROLE_OC', 'ROLE_ADMIN')">
                 <button type="submit" class="btn btn-primary mr-1 mb-1">수정</button>
                 <button type="button" id="deleteCon" class="btn btn-primary mr-1 mb-1" value="${ordercontractDTO.con_cd}" data-con_cd="${ordercontractDTO.con_cd}">삭제</button>
            <button type="reset" class="btn btn-primary mr-1 mb-1">초기화</button>
</sec:authorize>
<sec:authorize access="hasAnyRole('ROLE_PRODUCT', 'ROLE_BOUND', 'ROLE_PRODUCTION', 'ROLE_NONE')">
                 <button type="button"  onclick="accessError()" class="btn btn-primary mr-1 mb-1">수정</button>
                 <button type="button"  onclick="accessError()"class="btn btn-primary mr-1 mb-1" >삭제</button>
            <button type="reset" class="btn btn-primary mr-1 mb-1">초기화</button>
</sec:authorize>
            
        </c:if>
      <input type="hidden" id="csrf" class="form-control" name="${_csrf.parameterName}" value="${_csrf.token}" >
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
	    var popup = window.open("${pageContext.request.contextPath}/popup/contractpop", "popup1", "width=800,height=600");
	    
	    if (popup === null || typeof(popup) === 'undefined') {
	      alert('팝업이 차단되었습니다. 팝업 차단을 해제하고 다시 시도해주세요.');
	    } else {
	    	
	      // 팝업에서 선택한 값을 가져와서 인풋 필드에 설정합니다.
	      $(popup.document).on('click', '.popup-option', function() {
	        var selectedValue = $(this).text();
	        $('#pro_name').val(selectedValue);
	        popup.close();
	      });
	    }
	  }
	</script>
	<script>
	  // 인풋 창을 클릭하면 팝업을 엽니다.
	  function openPopup2() {
	    var popup = window.open("${pageContext.request.contextPath}/popup/conclientpop", "popup2", "width=800,height=600");
	    
	    if (popup === null || typeof(popup) === 'undefined') {
	      alert('팝업이 차단되었습니다. 팝업 차단을 해제하고 다시 시도해주세요.');
	    } else {
	    	
	      // 팝업에서 선택한 값을 가져와서 인풋 필드에 설정합니다.
	      $(popup.document).on('click', '.popup-option', function() {
	        var selectedValue = $(this).text();
	        $('#cli_name').val(selectedValue);
	        popup.close();
	      });
	    }
	  }
	</script>
	
	<script>
	$(document).ready(function() {
	    $("#conForm").submit(function(event) {
	        event.preventDefault();

	        $.ajax({
	            url: "${pageContext.request.contextPath}/ordercontract/updateContract", // 실제 요청 URL로 변경해야 함
	            type: "post", // 메소드 타입
	            contentType: "application/json",// 요청 컨텐츠 타입 명시 (옵션) 
	            dataType: "json", // 응답 데이터 타입 명시 (옵션)
	            data: JSON.stringify({ // JSON 형식으로 데이터 객체 구성
	            	con_cd : $('#con_cd').val(),
	            	con_vol: $('#con_vol').val(),
	                pro_cd: $('#pro_cd').val(),
	                pro_name: $('#pro_name').val(),
	                cli_cd: $('#cli_cd').val(),
	                cli_name: $('#cli_name').val(),
	                pro_price: $('#pro_price').val(),
	                con_due_date: $('#con_due_date').val(),
	                con_pay_date: $('#con_pay_date').val()
	                
	            }),
	            beforeSend: function(xhr) {
	                // CSRF 토큰과 헤더 이름 읽기
	                var token = $('meta[name="_csrf"]').attr('content');
	                var header = $('meta[name="_csrf_header"]').attr('content');
	                
	                // 요청 헤더에 CSRF 토큰 추가
	                xhr.setRequestHeader(header, token);
	            },
	            success: function(response) {
	                Swal.fire({
	                    icon: 'success',
	                    title: '수정 성공!',
	                    text: '데이터가 성공적으로 수정되었습니다.',
	                    confirmButtonText: '확인'
	                }).then((result) => {
	                    if (result.value) {
	                        window.opener.location.reload(); // 부모 창 새로고침
	                        window.close(); // 팝업 창 닫기
	                    }
	                });
	            },
	            error: function(xhr, status, error) {
	                alert("등록 실패: " + error); // 에러 처리 부분
	            }
	        });
	    });
	});

	</script>
	
	<script>
	// 빈칸이 있을 때 알림
	document.addEventListener('DOMContentLoaded', function() {
	    var form = document.getElementById('conForm');
	
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
    $(document).ready(function() {
        // 클릭 이벤트 핸들러 내부에서 deleteIns 함수를 호출합니다.
        $('#deleteCon').click(function() {
            var con_cd= $('#deleteCon').val(); // instructionCode 값을 얻습니다.
            // SweetAlert로 삭제 확인 요청
            Swal.fire({
                title: "삭제 하시겠습니까?",
                text: "삭제하면 되돌릴 수 없습니다.",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "delete"
            }).then((result) => {
                if (result.isConfirmed) {
                    // 사용자가 확인을 눌렀을 경우, deleteIns 함수에 instructionCode 값을 전달하여 호출합니다.
                    deleteCon(con_cd);
                    
                    // SweetAlert로 삭제 성공 메시지 표시
                    Swal.fire({
                        title: "삭제완료!",
                        text: "삭제가 완료되었습니다.",
                        icon: "success"
                    });
                }
            });
        });
    });

    // deleteIns 함수를 클릭 이벤트 핸들러 외부에 정의합니다.
    function deleteCon(con_cd) {
        event.preventDefault();
        $.ajax({
            url: "${pageContext.request.contextPath}/ordercontract/deleteContract?con_cd="+con_cd, // 실제 요청 URL로 변경해야 함
            type: "post", // 메소드 타입
            contentType: "application/json", // 요청 컨텐츠 타입 명시 (옵션)
            dataType: "json", // 응답 데이터 타입 명시 (옵션)
            data:  JSON.stringify({ con_cd: con_cd }), // 서버로 전송할 데이터
            beforeSend: function(xhr) {
                // CSRF 토큰과 헤더 이름 읽기
                var token = $('meta[name="_csrf"]').attr('content');
                var header = $('meta[name="_csrf_header"]').attr('content');
                
                // 요청 헤더에 CSRF 토큰 추가
                xhr.setRequestHeader(header, token);
            },
            success: function(response) {
                // 데이터베이스 저장 성공 후
                console.log(response);
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
function accessError() {
 Swal.fire({
	  title: "권한이 없습니다.",
	  icon:"error",
	  width: 600,
	  padding: "3em",
	  color: "#FF0000",
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