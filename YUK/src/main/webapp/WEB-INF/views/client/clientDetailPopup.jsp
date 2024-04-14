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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>요기육</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!--    처리 버튼 Swal css  -->
	<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    
</head>
<body>

<section id="multiple-column-form" >
        <div class="row match-height" >
            <div class="col-12" >
                <div class="card" style="box-shadow: none;">
		  			<div class="card-header" style="margin-top: 30&nbsp;px;">
                        <h3 class="card-title">거래처 상세페이지</h3>
                    <hr>
                    </div>
                    <div class="card-content">
                      <form class="form" id="clientDetailForm" action="${pageContext.request.contextPath}/client/clientDetailUpdate" method="post">
                        <div class="card-body">
                                <div class="row">
                                
                                <div class="col-md-6 col-12">
    <div class="form-group">
        <label>거래처유형*</label>
        <input type="radio" id="clientType1" name="clientType" value="납품처" ${clientDList[0].clientType == '납품처' ? 'checked' : ''} onclick="toggleInputs()">
        <label for="clientType1">납품처</label>
        <input type="radio" id="clientType2" name="clientType" value="납입처" ${clientDList[0].clientType == '납입처' ? 'checked' : ''} onclick="toggleInputs()">
        <label for="clientType2">납입처</label>
    </div>
</div>
                       		 
                       		 		<div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-column">거래처코드*</label>
                                            <input type="text" id="clientCode" class="form-control" name="clientCode" value="${clientDList[0].clientCode }" disabled>
                                            
                                        </div>
                                    </div>
                       		    
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-column">거래처명*</label>
                                            <input type="text" id="clientName" class="form-control" name="clientName" value="${clientDList[0].clientName }" disabled>
                                        </div>
                                    </div>
                                     <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="last-name-column">사업자번호*</label>
                                            <input type="text" id="businessNumber" class="form-control" name="businessNumber" value="${clientDList[0].businessNumber }" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="city-column">대표자명*</label>
                                            <input type="text" id="clientCEO" class="form-control" name="clientCEO" value="${clientDList[0].clientCEO }" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="country-floating">거래처 전화번호*</label>
                                            <input type="text" id="clientTelNumber" class="form-control" name="clientTelNumber" value="${clientDList[0].clientTelNumber }" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="company-column">팩스번호</label>
                                            <input type="text" id="clientFaxNumber" class="form-control" name="clientFaxNumber" value="${clientDList[0].clientFaxNumber }" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">업태*</label>
                                            <input type="text" id="clientBusinessType" class="form-control" name="clientBusinessType" value="${clientDList[0].clientBusinessType }" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">종목*</label>
                                            <input type="text" id="clientCategory" class="form-control" name="clientCategory" value="${clientDList[0].clientCategory }" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">주소*</label>
                                            <input type="text" id="clientBasicAddress" class="form-control" name="clientBasicAddress" value="${clientDList[0].clientBasicAddress }" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">이메일*</label>
                                            <input type="text" id="clientEmail" class="form-control" name="clientEmail" value="${clientDList[0].clientEmail }" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">비고</label>
                                            <input type="text" id="clientNote" class="form-control" name="clientNote" value="${clientDList[0].clientNote }" disabled
                                            style="height:30px">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
                                        </div>
                                    </div> 
                          

                                </div>
                                </div>
                            
                             
							<div class="col-12 d-flex justify-content-center">
							    <sec:authorize access="hasAnyRole('ROLE_BOUND', 'ROLE_ADMIN')">
							    <button type="button"class="btn btn-primary mr-1 mb-1" onclick="enableInputs()">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;
							    </sec:authorize>
							    <sec:authorize access="hasAnyRole('ROLE_PRODUCT', 'ROLE_PRODUCTION', 'ROLE_OC', 'ROLE_NONE')">
								<button type="button"class="btn btn-primary mr-1 mb-1" onclick="accessError()">수정</button>
								</sec:authorize>
							    &nbsp;&nbsp;&nbsp;&nbsp;
							    
							    <sec:authorize access="hasAnyRole('ROLE_BOUND', 'ROLE_ADMIN')">
							    <button type="button"class="btn btn-primary mr-1 mb-1" onclick="deleteClient()">삭제</button>        
								</sec:authorize>
								<sec:authorize access="hasAnyRole('ROLE_PRODUCT', 'ROLE_PRODUCTION', 'ROLE_OC', 'ROLE_NONE')">
								<button type="button"class="btn btn-primary mr-1 mb-1" onclick="accessError()">삭제</button>
								</sec:authorize>
							    &nbsp;&nbsp;&nbsp;&nbsp;
							    
<!-- 							    <button type="reset" class="btn btn-light-secondary mr-1 mb-1">초기화</button> -->
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
    //권한 없을 시
    function accessError() {
        Swal.fire({
         title: "<style='color:#000000'>권한이 없습니다.",
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
	
	
	<script>
	/* function receive(clientCode){
		document.getElementById("clientCode").value=clientCode;
		document.getElementById("clientType").value=clientType;
		document.getElementById("clientName").value=clientName;
		document.getElementById("businessNumber").value=businessNumber;
		document.getElementById("clientCEO").value=clientCEO;
		document.getElementById("clientBasicAddress").value=clientBasicAddress;
		document.getElementById("clientTelNumber").value=clientTelNumber;
		document.getElementById("clientEmail").value=clientEmail;
	} */
	</script>
	<script>
	/*
	function enableInputs(){
		document.getElementById("clientCode").disabled = false;
		document.getElementById("clientName").disabled = false;
		document.getElementById("businessNumber").disabled = false;
		document.getElementById("clientCEO").disabled = false;
		document.getElementById("clientTelNumber").disabled = false;
		document.getElementById("clientFaxNumber").disabled = false;
		document.getElementById("clientBusinessType").disabled = false;
		document.getElementById("clientCategory").disabled = false;
		document.getElementById("clientBasicAddress").disabled = false;
		document.getElementById("clientEmail").disabled = false;
		document.getElementById("clientNote").disabled = false;
		*/
	</script>
	
	<script>
function enableInputs() {
	
	
    var inputs = document.querySelectorAll("input[type='text']");
    for (var i = 0; i < inputs.length; i++) {
        inputs[i].disabled = false;
    }

    var radios = document.querySelectorAll("input[type='radio']");
    for (var i = 0; i < radios.length; i++) {
        radios[i].disabled = false;
    }

    var submitButton = document.createElement("button");
    submitButton.setAttribute("type", "submit");
    submitButton.setAttribute("class", "btn btn-primary mr-1 mb-1");
    submitButton.setAttribute("id", "submitBtn"); // 버튼에 고유한 id 추가

    if (!document.getElementById("submitBtn")) { // id가 submitBtn인 요소가 없을 때만 버튼을 추가
        submitButton.innerHTML = "수정완료";

        var form = document.getElementById("clientDetailForm");

        var buttonContainer = document.createElement("div");
        buttonContainer.setAttribute("class", "col-12 d-flex justify-content-center");
        buttonContainer.appendChild(submitButton);

        form.appendChild(buttonContainer);
    }
}
</script>

<script>
function updateClient(clientCode) {
    event.preventDefault();
    // 수정할 클라이언트 정보를 가져오는 코드 (예: 폼 데이터 가져오기)
    
    var clientType = document.querySelector("input[name='clientType']:checked").value; // 클라이언트 유형 값을 가져오는 부분 수정
    var clientCode = $("#clientCode").val();
    var clientName = $("#clientName").val();
    var businessNumber = $("#businessNumber").val();
    var clientCEO = $("#clientCEO").val();
    var clientTelNumber = $("#clientTelNumber").val();
    var clientFaxNumber = $("#clientFaxNumber").val();
    var clientBusinessType = $("#clientBusinessType").val();
    var clientCategory = $("#clientCategory").val();
    var clientBasicAddress = $("#clientBasicAddress").val();
    var clientEmail = $("#clientEmail").val();
    var clientNote = $("#clientNote").val();
    var name = $("name").val();

    $.ajax({
        url: "${pageContext.request.contextPath}/client/clientDetailUpdate", // 클라이언트 수정을 처리하는 URL로 변경해야 함
        method: "POST", // HTTP 요청 메서드 (POST 사용)
        data: {
            'clientCode': clientCode,
            'clientType': clientType, // 클라이언트 유형 정보를 포함하여 서버로 전송
            'clientName': clientName,
            'businessNumber': businessNumber,
            'clientCEO': clientCEO,
            'clientTelNumber': clientTelNumber,
            'clientFaxNumber': clientFaxNumber,
            'clientBusinessType': clientBusinessType,
            'clientCategory': clientCategory,
            'clientBasicAddress': clientBasicAddress,
            'clientEmail': clientEmail,
            'clientNote': clientNote,
            'name': name
        }, // 서버로 전송할 데이터
        beforeSend: function(xhr) {
            // CSRF 토큰과 헤더 이름 읽기
            var token = $('meta[name="_csrf"]').attr('content');
            var header = $('meta[name="_csrf_header"]').attr('content');
            
            // 요청 헤더에 CSRF 토큰 추가
            xhr.setRequestHeader(header, token);
        },
        success: function(response) {
            // 클라이언트 정보 수정이 성공한 경우
            window.close(); // 팝업 창 닫기
        },
        error: function(xhr, status, error) {
            // 오류 발생 시 처리
            console.error(xhr, status, error);
        }
    });
}
</script>

<script>
function deleteClient() {
    var confirmDelete = confirm("정말 삭제하시겠습니까?");
    if (confirmDelete) {
        var clientCode = $("#clientCode").val(); // 삭제할 클라이언트 코드 가져오기
        
        // Ajax를 사용하여 서버에 삭제 요청 보내기
        $.ajax({
            url: "${pageContext.request.contextPath}/client/clientDeletePro", // 삭제를 처리하는 서버 URL
            method: "POST", // HTTP 요청 메서드 (POST 사용)
            data: { 'clientCode': clientCode }, // 서버에 전송할 데이터 (여기서는 삭제할 클라이언트 코드)
            beforeSend: function(xhr) {
                // CSRF 토큰과 헤더 이름 읽기
                var token = $('meta[name="_csrf"]').attr('content');
                var header = $('meta[name="_csrf_header"]').attr('content');
                
                // 요청 헤더에 CSRF 토큰 추가
                xhr.setRequestHeader(header, token);
            },
            success: function(response) {
                // 삭제 성공 시 알림창 띄우기
                alert("클라이언트가 성공적으로 삭제되었습니다.");
                // 페이지 리로드 및 팝업 창 닫기
                window.opener.location.reload(); // 부모 창 새로고침
                window.close(); // 팝업 창 닫기
            },
            error: function(xhr, status, error) {
                // 오류 발생 시 알림창 띄우기
                alert("클라이언트 삭제 중 오류가 발생했습니다.");
                console.error(xhr, status, error);
            }
        });
    }
}
</script>


<script>
<script>
function toggleInputs() {
    var selectedClientType = document.querySelector('input[name="clientType"]:checked').value;

    // 모든 입력 폼 비활성화
    var inputs = document.querySelectorAll('input[type="text"], input[type="radio"]');
    for (var i = 0; i < inputs.length; i++) {
        inputs[i].disabled = true;
    }

    // 선택한 거래처 유형에 따라 해당하는 입력 폼 활성화
    var clientTypeInputs = document.querySelectorAll('input[name="clientType"][value="' + selectedClientType + '"]');
    for (var j = 0; j < clientTypeInputs.length; j++) {
        clientTypeInputs[j].disabled = false;
    }
}
// 페이지 로딩 시 호출하여 초기 상태 설정
toggleInputs();
</script>
</script>		
</body>
</html>