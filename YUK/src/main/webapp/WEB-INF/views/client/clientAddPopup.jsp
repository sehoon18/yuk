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
    
    <style>
    #btn{
    	display:block;
    	margin : 0 auto;
    }
    
    </style>
    
    
    
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
                      <form class="form">
                        <div class="card-body">
                                <div class="row">
                                
                                <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-column">거래처유형&nbsp;&nbsp;</label>

                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                            <label class="form-check-label" for="flexRadioDefault1">납품처</label>

                        
                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                            <label class="form-check-label" for="flexRadioDefault1">납입처</label>
                       		 
                       		 </div>
                       		 </div>
                                
                                
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-column">거래처명</label>
                                            <input type="text" id="instructionCode" class="form-control" placeholder="" name="instructionCode">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="last-name-column">사업자번호</label>
                                            <input type="text" id="contractCode" class="form-control" placeholder="" name="lname-column">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="city-column">대표자명</label>
                                            <input type="text" id="productCode" class="form-control" placeholder="" name="productCode">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="country-floating">거래처 전화번호</label>
                                            <input type="text" id="insVol" class="form-control" name="" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="company-column">팩스번호</label>
                                            <input type="text" id="productName" class="form-control" name="productName" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">업태</label>
                                            <input type="text" id="lineCode" class="form-control" name="email-id-column" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">종목</label>
                                            <input type="text" id="lineCode" class="form-control" name="email-id-column"  placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">주소</label>
                                            <input type="text" id="lineCode" class="form-control" name="email-id-column" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">이메일</label>
                                            <input type="text" id="lineCode" class="form-control" name="email-id-column" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">비고</label>
                                            <input type="text" id="lineCode" class="form-control" name="email-id-column" placeholder=""
                                            style="height:30px">
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
	        $('#contractCode').val(selectedValue);
	        popup.close();
	      });
	    }
	  }
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
</body>
</html>