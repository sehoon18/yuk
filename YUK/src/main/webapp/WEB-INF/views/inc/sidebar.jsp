<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
        <div id="sidebar" class='active'>
            <div class="sidebar-wrapper active">
    <div class="sidebar-header">
        <img src="${pageContext.request.contextPath}/resources/assets/images/logo.svg">
    </div>
    
<!--    	관리자 아이콘	 -->
     <div style="text-align: center; margin-top:20px;">
        <img src="${pageContext.request.contextPath}/resources/assets/images/user.png" style="width:60px; height:60px;">
     </div> 
     <div style="text-align: center; margin-top:20px;">  
     <h4><b><sec:authentication property="principal.username"/>  </b></h4>
     </div>
     <div style="text-align: center;">
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	    <b>관리자</b>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_BOUND')">
	    <b>입고/출고/재고/창고</b>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_PRODUCT')">
	    <b>품목/거래처/소요량</b>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_OC')">
	    <b>수주/발주</b>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_PRODUCTION')">
	    <b>지시/실적/라인</b>
	</sec:authorize>
<%--      <c:if test="${sessionScope.permission == 0}"> --%>
<!--      <b>권한 : 관리자 </b> -->
<%--      </c:if> --%>
<%--      <c:if test="${sessionScope.permission == 1}"> --%>
<!--      <b>권한 : 품목/거래처/소요량 </b> -->
<%--      </c:if> --%>
<%--      <c:if test="${sessionScope.permission == 2}"> --%>
<!--      <b>권한 : 입고/출고/재고/창고 </b> -->
<%--      </c:if> --%>
<%--      <c:if test="${sessionScope.permission == 3}"> --%>
<!--      <b>권한 : 수주/발주 </b> -->
<%--      </c:if> --%>
<%--      <c:if test="${sessionScope.permission == 4}"> --%>
<!--      <b>권한 : 작업/실적/라인 </b> -->
<%--      </c:if> --%>
     
     </div>
<!-- 로그아웃 -->
  	 <form action="${pageContext.request.contextPath}/member/logout" method="post">
     <div class="dropdown-item">
     <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
     <button type="submit" style="border: none; outline:none; background: none; padding: 0; margin: 0; cursor: pointer; width: 100%;">
     <i data-feather="log-out"></i> <b>로그아웃</b>
     </button>
     </div>
     </form>
<!-- 로그아웃 -->
                          
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
                            <a href="${pageContext.request.contextPath}/client/client">거래처 관리</a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/product/productMain">품목 관리</a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/product/requiredMain">소요량 관리</a>
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
                            <a href="${pageContext.request.contextPath}/production/line">라인 관리</a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/production/instruction">작업 지시 관리</a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/production/performance">생산 실적 관리</a>
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
                            <a href="${pageContext.request.contextPath}/warehouse/stock">재고 관리</a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/bound/inBound">입고 관리</a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/bound/outBound">출고 관리</a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/warehouse/warehouse">창고 관리</a>
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
                            <a href="${pageContext.request.contextPath}/ordercontract/contract">수주 관리</a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/ordercontract/order">발주 관리</a>
                        </li>
                        
                    </ul>
                    
                </li>
<%-- 			<c:if test="${sessionScope.permission == 0}"> --%>
<sec:authorize access="hasRole('ROLE_ADMIN')">
             <li>
                    <a href="${pageContext.request.contextPath}/member/memberList" class='sidebar-link'>
                     <i data-feather="user"></i> 
                        <span>사용자 리스트</span>
                        </a>
            </li>
                      </sec:authorize>
                        
<%--             </c:if> --%>
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
     
    
    
    
