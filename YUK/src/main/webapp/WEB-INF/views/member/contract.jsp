<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YOGIYUK</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
</head>
<body>
    <div id="app">
        <div id="sidebar" class='active'>
            <div class="sidebar-wrapper active">
    <div class="sidebar-header">
        <img src="${pageContext.request.contextPath}/resources/assets/images/logo.svg" alt="" srcset="">
    </div>
    <div class="sidebar-menu">
        <ul class="menu">
            
            
                <li class='sidebar-title'>Main Menu</li>
            
            
            
                <li class="sidebar-item active ">
                    <a href="index.html" class='sidebar-link'>
                        <i data-feather="home" width="20"></i> 
                        <span>Dashboard</span>
                    </a>
                    
                </li>

            
            
            
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="triangle" width="20"></i> 
                        <span>Components</span>
                    </a>
                    
                    <ul class="submenu ">
                        
                        <li>
                            <a href="component-alert.html">Alert</a>
                        </li>
                        
                        <li>
                            <a href="component-badge.html">Badge</a>
                        </li>
                        
                        <li>
                            <a href="component-breadcrumb.html">Breadcrumb</a>
                        </li>
                        
                        <li>
                            <a href="component-buttons.html">Buttons</a>
                        </li>
                        
                        <li>
                            <a href="component-card.html">Card</a>
                        </li>
                        
                        <li>
                            <a href="component-carousel.html">Carousel</a>
                        </li>
                        
                        <li>
                            <a href="component-dropdowns.html">Dropdowns</a>
                        </li>
                        
                        <li>
                            <a href="component-list-group.html">List Group</a>
                        </li>
                        
                        <li>
                            <a href="component-modal.html">Modal</a>
                        </li>
                        
                        <li>
                            <a href="component-navs.html">Navs</a>
                        </li>
                        
                        <li>
                            <a href="component-pagination.html">Pagination</a>
                        </li>
                        
                        <li>
                            <a href="component-progress.html">Progress</a>
                        </li>
                        
                        <li>
                            <a href="component-spinners.html">Spinners</a>
                        </li>
                        
                        <li>
                            <a href="component-tooltips.html">Tooltips</a>
                        </li>
                        
                    </ul>
                    
                </li>

            
            
            
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="briefcase" width="20"></i> 
                        <span>Extra Components</span>
                    </a>
                    
                    <ul class="submenu ">
                        
                        <li>
                            <a href="component-extra-avatar.html">Avatar</a>
                        </li>
                        
                        <li>
                            <a href="component-extra-divider.html">Divider</a>
                        </li>
                        
                    </ul>
                    
                </li>

            
            
            
                <li class='sidebar-title'>Forms &amp; Tables</li>
            
            
            
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="file-text" width="20"></i> 
                        <span>Form Elements</span>
                    </a>
                    
                    <ul class="submenu ">
                        
                        <li>
                            <a href="form-element-input.html">Input</a>
                        </li>
                        
                        <li>
                            <a href="form-element-input-group.html">Input Group</a>
                        </li>
                        
                        <li>
                            <a href="form-element-select.html">Select</a>
                        </li>
                        
                        <li>
                            <a href="form-element-radio.html">Radio</a>
                        </li>
                        
                        <li>
                            <a href="form-element-checkbox.html">Checkbox</a>
                        </li>
                        
                        <li>
                            <a href="form-element-textarea.html">Textarea</a>
                        </li>
                        
                    </ul>
                    
                </li>

            
            
            
                <li class="sidebar-item  ">
                    <a href="form-layout.html" class='sidebar-link'>
                        <i data-feather="layout" width="20"></i> 
                        <span>Form Layout</span>
                    </a>
                    
                </li>

            
            
            
                <li class="sidebar-item  ">
                    <a href="form-editor.html" class='sidebar-link'>
                        <i data-feather="layers" width="20"></i> 
                        <span>Form Editor</span>
                    </a>
                    
                </li>

            
            
            
                <li class="sidebar-item  ">
                    <a href="table.html" class='sidebar-link'>
                        <i data-feather="grid" width="20"></i> 
                        <span>Table</span>
                    </a>
                    
                </li>

            
            
            
                <li class="sidebar-item  ">
                    <a href="datatable.jsp" class='sidebar-link'>
                        <i data-feather="file-plus" width="20"></i> 
                        <span>Datatable</span>
                    </a>
                    
                </li>

            
            
            
                <li class='sidebar-title'>Extra UI</li>
            
            
            
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="user" width="20"></i> 
                        <span>Widgets</span>
                    </a>
                    
                    <ul class="submenu ">
                        
                        <li>
                            <a href="ui-chatbox.html">Chatbox</a>
                        </li>
                        
                        <li>
                            <a href="ui-pricing.html">Pricing</a>
                        </li>
                        
                        <li>
                            <a href="ui-todolist.html">To-do List</a>
                        </li>
                        
                    </ul>
                    
                </li>

            
            
            
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="trending-up" width="20"></i> 
                        <span>Charts</span>
                    </a>
                    
                    <ul class="submenu ">
                        
                        <li>
                            <a href="ui-chart-chartjs.html">ChartJS</a>
                        </li>
                        
                        <li>
                            <a href="ui-chart-apexchart.html">Apexchart</a>
                        </li>
                        
                    </ul>
                    
                </li>

            
            
            
                <li class='sidebar-title'>Pages</li>
            
            
            
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="user" width="20"></i> 
                        <span>Authentication</span>
                    </a>
                    
                    <ul class="submenu ">
                        
                        <li>
                            <a href="auth-login.html">Login</a>
                        </li>
                        
                        <li>
                            <a href="auth-register.html">Register</a>
                        </li>
                        
                        <li>
                            <a href="auth-forgot-password.html">Forgot Password</a>
                        </li>
                        
                    </ul>
                    
                </li>

            
            
            
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="alert-circle" width="20"></i> 
                        <span>Errors</span>
                    </a>
                    
                    <ul class="submenu ">
                        
                        <li>
                            <a href="error-403.html">403</a>
                        </li>
                        
                        <li>
                            <a href="error-404.html">404</a>
                        </li>
                        
                        <li>
                            <a href="error-500.html">500</a>
                        </li>
                        
                    </ul>
                    
                </li>

            
            
         
        </ul>
    </div>
    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
</div>
        </div>
        <div id="main">
            <nav class="navbar navbar-header navbar-expand navbar-light">
                <a class="sidebar-toggler" href="#"><span class="navbar-toggler-icon"></span></a>
                <button class="btn navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav d-flex align-items-center navbar-light ml-auto">
<!--                         <li class="dropdown nav-icon"> -->
<!--                             <a href="#" data-toggle="dropdown" class="nav-link  dropdown-toggle nav-link-lg nav-link-user"> -->
<!--                                 <div class="d-lg-inline-block"> -->
<!--                                     <i data-feather="bell"></i> -->
<!--                                 </div> -->
<!--                             </a> -->
<!--                             <div class="dropdown-menu dropdown-menu-right dropdown-menu-large"> -->
<!--                                 <h6 class='py-2 px-4'>Notifications</h6> -->
<!--                                 <ul class="list-group rounded-none"> -->
<!--                                     <li class="list-group-item border-0 align-items-start"> -->
<!--                                         <div class="avatar bg-success mr-3"> -->
<!--                                             <span class="avatar-content"><i data-feather="shopping-cart"></i></span> -->
<!--                                         </div> -->
<!--                                         <div> -->
<!--                                             <h6 class='text-bold'>New Order</h6> -->
<!--                                             <p class='text-xs'> -->
<!--                                                 An order made by Ahmad Saugi for product Samsung Galaxy S69 -->
<!--                                             </p> -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                             </div> -->
<!--                         </li> -->
<!--                         <li class="dropdown nav-icon mr-2"> -->
<!--                             <a href="#" data-toggle="dropdown" class="nav-link  dropdown-toggle nav-link-lg nav-link-user"> -->
<!--                                 <div class="d-lg-inline-block"> -->
<!--                                     <i data-feather="mail"></i> -->
<!--                                 </div> -->
<!--                             </a> -->
<!--                             <div class="dropdown-menu dropdown-menu-right"> -->
<!--                                 <a class="dropdown-item" href="#"><i data-feather="user"></i> Account</a> -->
<!--                                 <a class="dropdown-item active" href="#"><i data-feather="mail"></i> Messages</a> -->
<!--                                 <a class="dropdown-item" href="#"><i data-feather="settings"></i> Settings</a> -->
<!--                                 <div class="dropdown-divider"></div> -->
<!--                                 <a class="dropdown-item" href="#"><i data-feather="log-out"></i> Logout</a> -->
<!--                             </div> -->
<!--                         </li> -->
                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                                <div class="avatar mr-1">
<%--                                     <img src="${pageContext.request.contextPath}/resources/assets/images/avatar/avatar-s-1.png" alt="" srcset=""> --%>
                                </div>
                                <div class="d-none d-md-block d-lg-inline-block">Hi, Saugi</div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="#"><i data-feather="user"></i> Account</a>
                                <a class="dropdown-item active" href="#"><i data-feather="mail"></i> Messages</a>
                                <a class="dropdown-item" href="#"><i data-feather="settings"></i> Settings</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#"><i data-feather="log-out"></i> Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            
<div class="main-content container-fluid" width="1392px"; height="1000px";>
    <div class="page-title">
        <h3><a href = "#" ></a>수주관리 <h5><a href = "#" ></a> - 조회페이지</h5> </h3>
        
    </div>
    <div class="card">
            <div class="card-header">
             			

<div class="col-lg-2 col-3" style="display: flex; align-items: center; white-space: nowrap;">
<!--   	flex: 0 1 auto; 속성은 사원번호 텍스트가 필요한 만큼의 공간만 차지 -->
  <div style="flex: 0 1 auto; margin-right: 10px;">
  <b>수주코드</b></div>
  <input type="text" id="first-name" class="form-control" name="fname" style="flex: 1 1 auto; width: auto;">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  <b>거래처명</b> &nbsp;&nbsp;
  <input type="text" id="first-name" class="form-control" name="fname" style="flex: 1 1 auto; width: auto;">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <b>품목</b> &nbsp;&nbsp;
   <input type="text" id="first-name" class="form-control" name="fname" style="flex: 1 1 auto; width: auto;">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   
<!--   <select class="form-select" id="basicSelect" style="width: 100px;"> -->
<!-- 	<option>포장자재</option> -->
<!-- 	<option>식자재</option> -->
<!-- 	<option>완제품</option> -->
<!--    </select> -->
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <button class="btn btn-primary btn-sm" type="submit">조회</button>
</div>
<div style="text-align: right; margin-right:30px;">
<button class="btn btn-primary btn-sm" type="submit" onclick="addpopup();">등록</button>
<!-- <button class="btn btn-primary btn-sm" type="submit">수정</button> -->
<!-- <button class="btn btn-primary btn-sm" type="submit">삭제</button> -->
<!-- <button class="btn btn-primary btn-sm" type="submit">취소</button> -->
<button class="btn btn-primary btn-sm" type="submit">저장</button>
</div>
            <div class="card-body">
                <table class='table table-striped' id="table1">
                    <thead>
                        <tr>
                            <th>수주코드</th>
                            <th>거래처명</th>
                            <th>품목이름</th>
                            <th>수주량</th>
                            <th>재고수량</th>
                            <th>총금액</th>
                            <th>수주일자</th>
                            <th>납품예정일</th>
                            <th>담당자</th> 
                            <th>상태</th>
                            <th>상세</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Graiden</td>
                            <td>하나로마트</td>
                            <td>장조림</td>
                            <td>10</td>
                            <td>20</td>
                            <td>300,000원</td>
                            <td>2024년 3월 20일</td>
                            <td>2024년 3월 21일</td>
                            <td>에루리</td>
                            <td><span class="badge bg-danger">Inactive</span></td>
                            <td>
                                <input type="button" value="상세" onclick="popup();" />
                            </td>
                        </tr>
                        <tr>
                           <td>Graiden</td>
                            <td>하나로마트</td>
                            <td>장조림</td>
                            <td>10</td>
                            <td>20</td>
                            <td>300,000원</td>
                            <td>2024년 3월 20일</td>
                            <td>2024년 3월 21일</td>
                            <td>에루리</td>
                             <td><span class="badge bg-danger">Inactive</span></td>
                            <td>
							 <input type="button" value="상세" onclick="popup();" />
							</td>
                       	 </tr>
                        
                        <tr>
                            <td>Graiden</td>
                            <td>하나로마트</td>
                            <td>장조림</td>
                            <td>10</td>
                            <td>20</td>
                            <td>300,000원</td>
                            <td>2024년 3월 20일</td>
                            <td>2024년 3월 21일</td>
                            <td>에루리</td>
                            <td><span class="badge bg-danger">Inactive</span></td>
                            <td>
							<input type="button" value="상세" onclick="popup();" />
                            </td>
                        </tr>
                        <tr>
                            <td>Graiden</td>
                            <td>하나로마트</td>
                            <td>장조림</td>
                            <td>10</td>
                            <td>20</td>
                            <td>300,000원</td>
                            <td>2024년 3월 20일</td>
                            <td>2024년 3월 21일</td>
                            <td>에루리</td>
                            <td><span class="badge bg-danger">Inactive</span></td>
                            <td>
                                <input type="button" value="상세" onclick="popup();" />
                            </td>
                        </tr>
                        <tr>
                            <td>Graiden</td>
                            <td>하나로마트</td>
                            <td>장조림</td>
                            <td>10</td>
                            <td>20</td>
                            <td>300,000원</td>
                            <td>2024년 3월 20일</td>
                            <td>2024년 3월 21일</td>
                            <td>에루리</td>
                            <td><span class="badge bg-danger">Inactive</span></td>
                            <td>
                                <input type="button" value="상세" onclick="popup();" />
                            </td>
                        </tr>
                        <tr>
                            <td>Graiden</td>
                            <td>하나로마트</td>
                            <td>장조림</td>
                            <td>10</td>
                            <td>20</td>
                            <td>300,000원</td>
                            <td>2024년 3월 20일</td>
                            <td>2024년 3월 21일</td>
                            <td>에루리</td>
                            <td><span class="badge bg-danger">Inactive</span></td>
                            <td>
                               <input type="button" value="상세" onclick="popup();" />
                            </td>
                        </tr>
                        <tr>
                            <td>Graiden</td>
                            <td>하나로마트</td>
                            <td>장조림</td>
                            <td>10</td>
                            <td>20</td>
                            <td>300,000원</td>
                            <td>2024년 3월 20일</td>
                            <td>2024년 3월 21일</td>
                            <td>에루리</td>
                            <td><span class="badge bg-danger">Inactive</span></td>
                            <td>
                                <input type="button" value="상세" onclick="popup();" />
                            </td>
                        </tr>
                        <tr>
                            <td>Graiden</td>
                            <td>하나로마트</td>
                            <td>장조림</td>
                            <td>10</td>
                            <td>20</td>
                            <td>300,000원</td>
                            <td>2024년 3월 20일</td>
                            <td>2024년 3월 21일</td>
                            <td>에루리</td>
                            <td><span class="badge bg-danger">Inactive</span></td>
                            <td>
                                <input type="button" value="상세" onclick="popup();" />
                            </td>
                        </tr>
                        <tr>
                            <td>Graiden</td>
                            <td>하나로마트</td>
                            <td>장조림</td>
                            <td>10</td>
                            <td>20</td>
                            <td>300,000원</td>
                            <td>2024년 3월 20일</td>
                            <td>2024년 3월 21일</td>
                            <td>에루리</td>
                            <td><span class="badge bg-danger">Inactive</span></td>
                            <td>
                                <input type="button" value="상세" onclick="popup();" />
                            </td>
                        </tr>
                        <tr>
                            <td>Graiden</td>
                            <td>하나로마트</td>
                            <td>장조림</td>
                            <td>10</td>
                            <td>20</td>
                            <td>300,000원</td>
                            <td>2024년 3월 20일</td>
                            <td>2024년 3월 21일</td>
                            <td>에루리</td>
                            <td><span class="badge bg-danger">Inactive</span></td>
                            <td>
                                <input type="button" value="상세" onclick="popup();" />
                            </td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>
        </div>
</div>

            <footer>
                <div class="footer clearfix mb-0 text-muted">
                    <div class="float-left">
                        <p>2020 &copy; Voler</p>
                    </div>
                    <div class="float-right">
                        <p>Crafted with <span class='text-danger'><i data-feather="heart"></i></span> by <a href="http://ahmadsaugi.com">Ahmad Saugi</a></p>
                    </div>
                </div>
            </footer>
        </div>
    </div>
     <script>
	  // 인풋 창을 클릭하면 팝업을 엽니다.
	  function popup() {
	    var popup = window.open("${pageContext.request.contextPath}/ordercontract/contractdeletepopup", "popup", "width=1600,height=300");
	    
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
	  function addpopup() {
	    var popup = window.open("${pageContext.request.contextPath}/ordercontract/contractaddpopup", "addpopup", "width=1600,height=300");
	    
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
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/apexcharts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/pages/dashboard.js"></script>

    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>