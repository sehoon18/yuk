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
                        <h3 class="card-title">발주 상세 (수정/삭제)</h3>
                    <hr>
                    </div>
                    <div class="card-content">
                      <form class="form" id="ordForm" action="${pageContext.request.contextPath}/ordercontract/updateOrder?ord_cd=${ordercontractDTO.ord_cd}" method="post" >
<%--                       <input type="hidden" name="ord_cd" value="${ordercontractDTO.ord_cd}"> --%>
                        <div class="card-body">
                                <div class="row">
                                	<div class="col-md-14 col-13">	
                                        <div class="form-group">
                                            <label for="first-name-column">발주코드</label>
                                            <input type="text" id="ord_cd" class="form-control" name="ord_cd" value="${ordercontractDTO.ord_cd}">
                                        </div>
                                    </div>
    							
                                    <div class="col-md-14 col-13">	
                                        <div class="form-group">
                                            <label for="first-name-column">품목코드</label>
                                            <input type="text" id="pro_cd" class="form-control" placeholder="PRO_CD" name="pro_cd" value="${ordercontractDTO.pro_cd}">
                                        </div>
                                    </div>
                                    <div class="col-md-14 col-13">
                                        <div class="form-group">
                                            <label for="last-name-column">품목이름</label>
                                            <input type="text" id="pro_name" class="form-control" onclick="openPopup()" placeholder="PRO_NAME" name="pro_name" value="${ordercontractDTO.pro_name}">
                                        </div>
                                    </div>
                                    <div class="col-md-14 col-13">
                                        <div class="form-group">
                                            <label for="city-column">거래처코드</label>
                                            <input type="text" id="cli_cd" class="form-control" placeholder="CLI_CD" name="cli_cd" value="${ordercontractDTO.cli_cd}">
                                        </div>
                                    </div>
                                   <div class="col-md-14 col-13">
                                        <div class="form-group">
                                            <label for="country-floating">거래처명</label>
                                            <input type="text" id="cli_name" class="form-control" name="cli_name" placeholder="CLI_NAME" value="${ordercontractDTO.cli_name}">
                                        </div>
                                    </div>
                                    <div class="col-md-14 col-13">
                                        <div class="form-group">
                                            <label for="company-column">발주량</label>
                                            <input type="text" id="ord_vol" class="form-control" name="ord_vol" placeholder="ORD_VOL" value="${ordercontractDTO.ord_vol}">
                                        </div>
                                    </div>
                                   <div class="col-md-14 col-13">
                                        <div class="form-group">
                                            <label for="email-id-column">단가</label>
                                            <input type="text" id="pro_price" class="form-control" name="pro_price"  placeholder="PRO_PRICE" value="${ordercontractDTO.pro_price}">
                                        </div>
                                    </div>
                                 
                                   <div class="col-md-14 col-13">
                                        <div class="form-group">
                                            <label for="email-id-column">납품일자</label>
                                            <input type="DATE" id="ord_due_date" class="form-control" name="ord_due_date" placeholder="2024-00-00" value="${ordercontractDTO.ord_due_date}">
                                        </div>
                                    </div>
                                    <div class="col-md-14 col-13">
                                        <div class="form-group">
                                            <label for="email-id-column">결제일자</label>
                                            <input type="DATE" id="ord_pay_date" class="form-control" name="ord_pay_date" placeholder="2024-00-00" value="${ordercontractDTO.ord_pay_date}">
                                        </div>
                                    </div>

                                </div>
                                </div>
                            <div class="col-12 d-flex justify-content-end">
							    <button type="submit" class="btn btn-primary mr-1 mb-1">수정</button>
							    <button type="button" class="btn btn-primary mr-1 mb-1">삭제</button>
							    <button type="button" class="btn btn-primary mr-1 mb-1">reset</button>
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
	    var popup = window.open("${pageContext.request.contextPath}/popup/orderpop", "popup1", "width=800,height=600");
	    
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
	$(document).ready(function() {
	    $("#ordForm").submit(function(event) {
	        event.preventDefault();

	        $.ajax({
	            url: "${pageContext.request.contextPath}/ordercontract/updateOrder", // 실제 요청 URL로 변경해야 함
	            type: "post", // 메소드 타입
	            contentType: "application/json", // 요청 컨텐츠 타입 명시 (옵션)
	            dataType: "json", // 응답 데이터 타입 명시 (옵션)
	            data: JSON.stringify({ // JSON 형식으로 데이터 객체 구성
	            	ord_cd : $('#ord_cd').val(),
	            	ord_vol: $('#ord_vol').val(),
	                pro_cd: $('#pro_cd').val(),
	                pro_name: $('#pro_name').val(),
	                cli_cd: $('#cli_cd').val(),
	                cli_name: $('#cli_name').val(),
	                pro_price: $('#pro_price').val(),
	                ord_due_date: $('#ord_due_date').val(),
	                ord_pay_date: $('#ord_pay_date').val()
	            }),
	            success: function(response) {
	                alert("등록 성공!");
	                window.opener.location.reload();
	                window.close();
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
	    var form = document.getElementById('ordForm');
	
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
</body>
</html>