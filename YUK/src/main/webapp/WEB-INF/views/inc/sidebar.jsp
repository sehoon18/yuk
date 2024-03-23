<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <div id="sidebar" class='active'>
            <div class="sidebar-wrapper active">
    <div class="sidebar-header">
        <img src="${pageContext.request.contextPath}/resources/assets/images/logo.svg">
    </div>
    
<!--    	관리자 아이콘	 -->
    <div style="margin-left:100px; margin-top:50px">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/avatar/avatar-s-1.png" alt="">
                                </div>
                                <div>관리자</div>
            					</div>
    <div class="sidebar-menu">
        <ul class="menu">
                <li class="sidebar-item active ">
                    <a href="${pageContext.request.contextPath}/member/main" class='sidebar-link'>
                        <i data-feather="home"></i> 
                        <span>메인페이지</span>
                    </a>
                    
                </li>

            
                <li class="sidebar-item  has-sub">
                    <a class='sidebar-link'>
                        <i data-feather="user"></i> 
                        <span>기준정보 관리</span>
                    </a>
                    
                    <ul class="submenu">
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/client/client">거래처 관리</a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/member/memberProduct">품목 관리</a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/member/memberRequired">소요량 관리</a>
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
                        <i data-feather="user"></i> 
                        <span>자재 관리</span>
                    </a>
                    
                    <ul class="submenu">
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/warehouse/stock">재고 관리</a>
                        </li>
                        
                        <li>
                            <a href="">입고 관리</a>
                        </li>
                        
                        <li>
                            <a href="">출고 관리</a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/warehouse/warehouse">창고 관리</a>
                        </li>
                    </ul>
                    
                </li>
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i data-feather="alert-circle"></i> 
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
                <a class="sidebar-toggler"><span class="navbar-toggler-icon"></span></a>
            </nav>


    
    
    
    
