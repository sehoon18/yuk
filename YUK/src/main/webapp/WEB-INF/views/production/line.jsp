<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YOGIYUK</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/simple-datatables/style.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
            
            
            
                <li class="sidebar-item  ">
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

            
            
            
                <li class="sidebar-item active ">
                    <a href="table-datatable.html" class='sidebar-link'>
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
                        <li class="dropdown nav-icon">
                            <a href="#" data-toggle="dropdown" class="nav-link  dropdown-toggle nav-link-lg nav-link-user">
                                <div class="d-lg-inline-block">
                                    <i data-feather="bell"></i>
                                </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-large">
                                <h6 class='py-2 px-4'>Notifications</h6>
                                <ul class="list-group rounded-none">
                                    <li class="list-group-item border-0 align-items-start">
                                        <div class="avatar bg-success mr-3">
                                            <span class="avatar-content"><i data-feather="shopping-cart"></i></span>
                                        </div>
                                        <div>
                                            <h6 class='text-bold'>New Order</h6>
                                            <p class='text-xs'>
                                                An order made by Ahmad Saugi for product Samsung Galaxy S69
                                            </p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="dropdown nav-icon mr-2">
                            <a href="#" data-toggle="dropdown" class="nav-link  dropdown-toggle nav-link-lg nav-link-user">
                                <div class="d-lg-inline-block">
                                    <i data-feather="mail"></i>
                                </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="#"><i data-feather="user"></i> Account</a>
                                <a class="dropdown-item active" href="#"><i data-feather="mail"></i> Messages</a>
                                <a class="dropdown-item" href="#"><i data-feather="settings"></i> Settings</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#"><i data-feather="log-out"></i> Logout</a>
                            </div>
                        </li>
                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                                <div class="avatar mr-1">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/avatar/avatar-s-1.png" alt="" srcset="">
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
            
<div class="main-content container-fluid">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>라인 관리</h3>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Datatable</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <section class="section">
        <div class="card">
            <div class="card-header">
            </div>
            <div class="card-body">
			<form id="dataForm" class="insertLine" action="${pageContext.request.contextPath}/production/linePro" method="post">
			    <button type="button" onclick="addTableRow()" class='btn btn-primary' id="addrow">추가</button>
			    <button type="submit" class='btn btn-success' id="submitrow" disabled>저장</button>
			    <table class='table .table-bordered' id="table1">
			        <thead>
			            <tr>
			                <th>라인코드</th>
			                <th>라인명</th>
			                <th>등록일자</th>
			                <th>등록자</th>
			                <th>라인상태</th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:forEach var="productionDTO" items="${lineList }">
						<tr>
                            <td>${productionDTO.lineCode }</td>
                            <td>${productionDTO.lineName }</td>
                            <td>${productionDTO.update }</td>
                            <td>${productionDTO.name }</td>
                            <td>
                            <c:if test="${productionDTO.lineStatus == 0 }">
                                <span class="badge bg-success">Waiting</span>                            
                            </c:if>
                            <c:if test="${productionDTO.lineStatus == 1 }">
                            	<span class="badge bg-danger">active</span>
                            </c:if>
                            <c:if test="${productionDTO.lineStatus == 2 }">
                            	<span class="badge bg-light">Maintenance</span>
                            </c:if>
                            </td>
                        </tr>
                        </c:forEach>
			        </tbody>
			    </table>
			</form>
            </div>
        </div>

    </section>
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
    <script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
    
<script src="${pageContext.request.contextPath}/resources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/vendors.js"></script>

    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    
    <script type="text/javascript">
    function addTableRow() {
        const table = document.getElementById("table1").getElementsByTagName('tbody')[0];
        const newRow = table.insertRow(0);
        const rowId = table.rows.length; // 행 ID로 사용될 값
        
        // 각 열에 대한 셀과 입력 필드 생성
        const fields = ['lineCode', 'lineName', 'update', 'name', 'lineStatus'];
        const exampleData = ['L', '', '', '', '0'];

        fields.forEach((field, index) => {
            const cell = newRow.insertCell(index);
            let input;

            // 인풋 타입 변경
            if (field === 'lineStatus') {
                input = document.createElement("select");
                input.className = "form-select";
                const options = ["Waiting", "Active", "Maintenance"];
                options.forEach((option, index) => {
                    const optionElement = document.createElement("option");
                    optionElement.value = index;
                    optionElement.textContent = option;
                    input.appendChild(optionElement);
                });
            } else if(field === 'update'){
                input = document.createElement("input");
                input.type = "date";
                input.className = "form-control";
            }   else {
                input = document.createElement("input");
                input.type = "text";
                input.className = "form-control";
            }

            input.name = field;
            input.value = exampleData[index];
            cell.appendChild(input);
        });

        // '추가' 버튼을 '취소' 버튼으로 변경하면서 id값도 변경
        const addButton = document.querySelector('.btn-primary');
        addButton.textContent = '취소';
        addButton.id = 'cancelrow';
        addButton.onclick = function() { cancelAddition(newRow); };

        // 저장 버튼 활성화
        document.getElementById('submitrow').disabled = false;
    }

    function cancelAddition(row) {
        // 추가된 행 삭제
        row.remove();

        // 버튼을 다시 '추가'로 변경하면서 id값도 원래대로 변경
        const addButton = document.querySelector('#cancelrow');
        addButton.textContent = '추가';
        addButton.id = 'addrow';
        addButton.onclick = addTableRow;

        // 저장 버튼 비활성화
        document.getElementById('submitrow').disabled = true;
    }
    </script>
	<script>
// 	    $(function() {
// 	        $('.insertLine').submit(function(e){
//     			// 기본 submit 이벤트를 방지
//     			e.preventDefault();
// 	            $.ajax({
// 	                type: 'GET',
// 	                url: '${pageContext.request.contextPath}/production/lineNameCheck',
// 	                data: {'lineCode' : $('.lineCode').val()},
// 	                dataType: 'html',
// 	                success: function(result) {
// 	                    if(result == "lcdup") {
// 	                        result = "라인코드 중복";
// 	                        $('.card-header').html(result);
// 	                    } else if (result == "lcok") {
// 	                    	alert("추가 완료");
// 	                    } else{
// 	                    	alert("에러발생");
// 	                    }
// 	                }
// 	            });
// 	        });
// 	    });
	</script>
</body>
</html>