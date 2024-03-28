<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YOGIYUK</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
</head>

<body>
    <div id="auth">
        
<div class="container">
    <div class="row">
        <div class="col-md-5 col-sm-12 mx-auto">
            <div class="card pt-4">
                <div class="card-body">
                    <div class="text-center mb-5">
                        <img src="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" height="48" class='mb-4'>
                        <h3>로그인</h3>
                    </div>
                    <form action="${pageContext.request.contextPath}/member/memberLoginPro" method="post">
                        <div class="form-group position-relative has-icon-left">
                            <label for="username">아이디</label>
                            <div class="position-relative">
                                <input type="text" class="form-control" id="username" name="id">
                                <div class="form-control-icon">
                                    <i data-feather="user"></i>
                                </div>
                            </div>
                        </div>
                        <div class="form-group position-relative has-icon-left">
                            <div class="clearfix">
                                <label for="password">비밀번호</label>
                            </div>
                            <div class="position-relative">
                                <input type="text" class="form-control" id="password" name="pass">
                                <div class="form-control-icon">
                                    <i data-feather="lock"></i>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix">
                            <button class="btn btn-primary" type="submit">로그인</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

    </div>
    <script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
 <script>
     var message = '${message}';
    
    if (message) {
        alert(message);
    }
</script>
    
</body>
</html>