<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <div id="sidebar" class='active'>
            <div class="sidebar-wrapper active">
    <div class="sidebar-header">
        <img src="${pageContext.request.contextPath}/resources/assets/images/logo.svg">
    </div>
    
<!--    	관리자 아이콘	 -->
                                
                            <div style="margin-left:80px; margin-top:15px;">
                            <img src="${pageContext.request.contextPath}/resources/assets/images/user.png" style="width:60px; height:60px;">
                            </div> 
                          <div style="margin-left:75px; margin-top:15px;">  
                          <h4><b>관리자</b></h4>
                          </div>
                                <a class="dropdown-item" href="#"><i data-feather="log-out"></i> <b>로그아웃</b></a>
                          
    <div class="sidebar-menu">
        <ul class="menu">
                <li class="sidebar-item">
                    <a href="${pageContext.request.contextPath}/member/main" class='sidebar-link'>
                        <i data-feather="home"></i> 
                        <span>메인페이지</span>
                    </a>
                    
                </li>

            
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="triangle"></i> 
                        <span>기준정보 관리</span>
                    </a>
                    
                    <ul class="submenu">
                        
                        <li>
                            <a href="">거래처 관리</a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/product/productMain">품목 관리</a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/required/requiredMain">소요량 관리</a>
                        </li>
                        
                    </ul>
                    
                </li>
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="trending-up"></i> 
                        <span>생산 관리</span>
                    </a>
                    
                    <ul class="submenu">
                        
                        <li>
                            <a href="">라인 관리</a>
                        </li>
                        
                        <li>
                            <a href="">작업 지시 관리</a>
                        </li>
                        
                        <li>
                            <a href="">생산 실적 관리</a>
                        </li>
                        
                    </ul>
                    
                </li>
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                    <i data-feather="briefcase"></i> 
                        <span>자재 관리</span>
                    </a>
                    
                    <ul class="submenu">
                        
                        <li>
                            <a href="">재고 관리</a>
                        </li>
                        
                        <li>
                            <a href="">입고 관리</a>
                        </li>
                        
                        <li>
                            <a href="">출고 관리</a>
                        </li>
                        
                        <li>
                            <a href="">창고 관리</a>
                        </li>
                    </ul>
                    
                </li>
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="file-text"></i> 
                        <span>영업 관리</span>
                    </a>
                    
                    <ul class="submenu">
                        
                        <li>
                            <a href="">수주 관리</a>
                        </li>
                        
                        <li>
                            <a href="">발주 관리</a>
                        </li>
                        
                    </ul>
                    
                </li>

             <li>
                    <a href="${pageContext.request.contextPath}/member/memberList" class='sidebar-link'>
                     <i data-feather="user"></i> 
                        <span>사용자 리스트</span>
                        </a>
            </li>
        </ul>
       
 
    </div>
    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
</div>
        </div>
        <div id="main">
<!--         	토글 아이콘 -->
            <nav class="navbar navbar-header navbar-expand navbar-light">
                <a class="sidebar-toggler" href="#"><span class="navbar-toggler-icon"></span></a>
            </nav>
     
    
    
    
    
