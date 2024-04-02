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
            <div   class="col-12">
                <div class="card" style="box-shadow: none;">
		  			<div class="card-header" style="margin-top: 30px;">
                        <h3 class="card-title">수주 등록</h3>
                    <hr>
                    </div>
                    <div class="card-content">
                       <form action="${pageContext.request.contextPath}/ordercontract/contract" method="get" >
                        <div class="card-body">
                                <div class="row">
                                    <div class="col-md-15 col-1">	
                                        <div class="form-group">
                                            <label for="first-name-column">품목코드</label>
                                            <input type="text" id="pro_cd" class="form-control" placeholder="PRO_CD" name="pro_cd">
                                        </div>
                                    </div>
                                    <div class="col-md-15 col-1">
                                        <div class="form-group">
                                            <label for="last-name-column">품목이름</label>
                                            <input type="text" id="pro_name" class="form-control" onclick="openPopup()" placeholder="PRO_NAME" name="pro_name">
                                        </div>
                                    </div>
                                    <div class="col-md-15 col-1">
                                        <div class="form-group">
                                            <label for="city-column">거래처코드</label>
                                            <input type="text" id="cli_cd" class="form-control" placeholder="CLI_CD" name="cli_cd">
                                        </div>
                                    </div>
                                   <div class="col-md-15 col-1">
                                        <div class="form-group">
                                            <label for="country-floating">거래처명</label>
                                            <input type="text" id="cli_name" class="form-control" name="insVol" placeholder="CLI_NAME">
                                        </div>
                                    </div>
                                    <div class="col-md-15 col-1">
                                        <div class="form-group">
                                            <label for="company-column">수주량</label>
                                            <input type="text" id="productName" class="form-control" name="productName" placeholder="CON_VOL">
                                        </div>
                                    </div>
                                   <div class="col-md-15 col-1">
                                        <div class="form-group">
                                            <label for="email-id-column">단가</label>
                                            <input type="text" id="pro_price" class="form-control" name="email-id-column" onclick="openLinePopup()" placeholder="PRO_PRICE">
                                        </div>
                                    </div>
                                   <div class="col-md-15 col-1">
                                        <div class="form-group">
                                            <label for="email-id-column">납입일자</label>
                                            <input type="DATE" id="contractDate" class="form-control" name="contractDate" placeholder="2024-00-00">
                                        </div>
                                    </div>
                                    <div class="col-md-15 col-1">
                                        <div class="form-group">
                                            <label for="email-id-column">결제일자</label>
                                            <input type="DATE" id="instructionDate" class="form-control" name="instructionDate" placeholder="2024-00-00">
                                        </div>
                                    </div>

                                </div>
                                </div>
                            


							<div class="col-12 d-flex justify-content-end">
							    <button type="submit" class="btn btn-primary mr-1 mb-1">Submit</button>
							    <button type="reset" class="btn btn-light-secondary mr-1 mb-1">Reset</button>
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
	    var popup = window.open("${pageContext.request.contextPath}/popup/contractpop", "popup", "width=800,height=600");
	    
	    if (popup === null || typeof(popup) === 'undefined') {
	      alert('팝업이 차단되었습니다. 팝업 차단을 해제하고 다시 시도해주세요.');
	    } else {
	    	
	      // 팝업에서 선택한 값을 가져와서 인풋 필드에 설정합니다.
	      $(popup.document).on('click', '.popup-option', function() {
	        var selectedValue = $(this).text();
	        $('#contractName').val(selectedValue);
	        popup.close();
	      });
	    }
	  }
	</script>
	<script>
// 	  // 인풋 창을 클릭하면 팝업을 엽니다.
// 	  function openLinePopup() {
// 	    var popup = window.open("${pageContext.request.contextPath}/popup/linepop", "popup", "width=800,height=600");
	    
// 	    if (popup === null || typeof(popup) === 'undefined') {
// 	      alert('팝업이 차단되었습니다. 팝업 차단을 해제하고 다시 시도해주세요.');
// 	    } else {
// 	      // 팝업에서 선택한 값을 가져와서 인풋 필드에 설정합니다.
// 	      $(popup.document).on('click', '.popup-option', function() {
// 	        var selectedValue = $(this).text();
// 	        $('#lineCode').val(selectedValue);
// 	        popup.close();
// 	      });
// 	    }
// 	  }
	</script>
</body>
</html>