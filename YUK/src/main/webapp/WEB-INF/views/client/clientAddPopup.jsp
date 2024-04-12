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
<title>요기육</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <style>
    #btn{
    	display:block;
    	margin : 0 auto;
    }
    
    </style>
    
 <script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/jquery-3.7.1.min.js"></script>   
    
</head>
<body>
<section id="multiple-column-form" >
        <div class="row match-height" >
            <div class="col-12" >
                <div class="card" style="box-shadow: none;">
		  			<div class="card-header" style="margin-top: 30&nbsp;px;">
                        <h3 class="card-title">거래처 등록</h3>
                    <hr>
                    </div>
                    <div class="card-content">
                      <form class="form" id="clientPopupForm" action="${pageContext.request.contextPath}/client/insertClientPro" method="post">
                        <div class="card-body">
                                <div class="row">
                                
                                <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-column">거래처유형*&nbsp;&nbsp;</label>

                            <input class="form-check-input" type="radio" name="clientType" id="clientType1" checked>
                            <label class="form-check-label" for="flexRadioDefault1">납품처</label>

                        
                            <input class="form-check-input" type="radio" name="clientType" id="clientType2" checked>
                            <label class="form-check-label" for="flexRadioDefault1">납입처</label>
                       		 
                       		 </div>
                       		 </div>
                       		 
                       		 		<div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-column">거래처코드*</label>
                                            <input type="text" id="clientCode" class="form-control" name="clientCode" value="${clientDTO.clientCode }" readonly="readonly">
                                        </div>
                                    </div>
                       		 
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-column">거래처명*</label>
                                            <input type="text" id="clientName" class="form-control" placeholder="" name="clientName">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="last-name-column">사업자번호*</label>
                                            <input type="text" id="businessNumber" class="form-control" placeholder="" name="businessNumber">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="city-column">대표자명*</label>
                                            <input type="text" id="clientCEO" class="form-control" placeholder="" name="clientCEO">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="country-floating">거래처 전화번호*</label>
                                            <input type="text" id="clientTelNumber" class="form-control" name="clientTelNumber" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="company-column">팩스번호</label>
                                            <input type="text" id="clientFaxNumber" class="form-control" name="clientFaxNumber" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">업태*</label>
                                            <input type="text" id="clientBusinessType" class="form-control" name="clientBusinessType" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">종목*</label>
                                            <input type="text" id="clientCategory" class="form-control" name="clientCategory"  placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">주소</label>
                                            <input type="text" id="clientBasicAddress" class="form-control" name="clientBasicAddress" placeholder="" onclick="sample5_execDaumPostcode()">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">이메일*</label>
                                            <input type="text" id="clientEmail" class="form-control" name="clientEmail" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">비고</label>
                                            <input type="text" id="clientNote" class="form-control" name="clientNote" placeholder=""
                                            style="height:30px">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
                                        </div>
                                    </div>
                          

                                </div>
                                </div>
                            
							<div class="col-12 d-flex justify-content-center" id="btn">
							    <button type="submit" class="btn btn-primary mr-1 mb-1" >등록</button>
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

	
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function sample5_execDaumPostcode() {
 new daum.Postcode({
     oncomplete: function(data) {
         var addr = data.address; // 최종 주소 변수

         // 주소 정보를 해당 필드에 넣는다.
         document.getElementById("clientBasicAddress").value = addr;
     }
 }).open();
}

//주소 입력 여부 확인 함수
function checkAddressInput(address) {
 // 예시: 주소가 비어있는지 확인
 if (address.trim() === "") {
     // 주소가 비어있으면 에러 메시지 표시 및 가입 불가능하도록 설정
     $('#addressError').css('color', 'red');
     $('#addressError').text('주소를 입력해주세요.');
     $('#signUpButton').prop('disabled', true);
 } else {
     // 주소가 입력되었으면 에러 메시지 초기화 및 가입 가능하도록 설정
     $('#addressError').text('');
     $('#signUpButton').prop('disabled', false);
 }
}
</script>

<script>
function clientPopupForm(){
	//각 필수 입력 필드 값
	var clientCode = document.getElementById("clientCode").value;
	var clientType = document.getElementById("clientType").value;
	var clientName = document.getElementById("clientName").value;
	var businessNumber = document.getElementById("businessNumber").value;
	var clientCEO = document.getElementById("clientCEO").value;
	var clientTelNumber = document.getElementById("clientTelNumber").value;
	var clientFaxNumber = document.getElementById("clientFaxNumber").value;
	var clientBusinessType = document.getElementById("clientBusinessType").value;
	var clientCategory = document.getElementById("clientCategory").value;
	var clientBasicAddress = document.getElementById("clientBasicAddress").value;
	var clientEmail = document.getElementById("clientEmail").value;
	var clientNote = document.getElementById("clientNote").value;
	var name = document.getElementById("name").value;
	
	 $.ajax({
	        url: "${pageContext.request.contextPath}/client/clientAddPopup", // 클라이언트 처리하는 URL로 변경해야 함
	        data:  { 
	            {'clientCode': clientCode},
	            {'clientType': clientType},
	            {'clientName': clientName},
	            {'businessNumber': businessNumber},
	            {'clientCEO': clientCEO},
	            {'clientTelNumber': clientTelNumber},
	            {'clientFaxNumber': clientFaxNumber},
	            {'clientBusinessType': clientBusinessType},
	            {'clientCategory': clientCategory},
	            {'clientBasicAddress': clientBasicAddress},
	            {'clientEmail': clientEmail},
	            {'clientNote': clientNote},
	            {'name': name}
	        }, // 서버로 전송할 데이터
	        success: function(response) {
	        	alert("등록 성공!");
	        	window.opener.location.reload();
                window.close();
	        }
	    });
	}

</script>


</body>
</html>