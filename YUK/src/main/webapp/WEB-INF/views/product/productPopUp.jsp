<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
</head>
<body>
   <div style="margin-left: 20px; margin-top: 50px;">
    <h1><b>품목 관리</b></h1>
    <hr>
  <div class="col-lg-2 col-3" style="display: flex; align-items: center; white-space: nowrap;">
<!--   	flex: 0 1 auto; 속성은 사원번호 텍스트가 필요한 만큼의 공간만 차지 -->
  <div style="flex: 0 1 auto; margin-right: 10px;"><b>품목코드</b></div>
  <input type="text" id="first-name" class="form-control" name="fname" style="flex: 1 1 auto; width: auto;" placeholder="품목코드를 입력하세요">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>품명</b> &nbsp;&nbsp;
  <input type="text" id="first-name" class="form-control" name="fname" style="flex: 1 1 auto; width: auto;" placeholder="품명을 입력하세요">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <button class="btn btn-primary btn-sm" type="submit">조회</button>
  </div>
<hr>
<!--     Bordered table start -->
<div class="row" id="table-bordered" style="margin-right: 20px;">
  <div class="col-12">
    <div class="card">
      <div class="card-header">
        <h4 class="card-title">품목 목록</h4>
      </div>
      <div class="card-content">
        <!-- table bordered -->
        <div class="table-responsive">
          <table class="table table-bordered mb-0">
            <thead>
              <tr>
                <th>품목코드</th>
                <th>품명</th>
                <th>품목구분</th>
                <th>원산지</th>
                <th>비고</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="text-bold-500">Michael Right</td>
                <td>$15/hr</td>
                <td class="text-bold-500">UI/UX</td>
                <td>Remote</td>
                <td>Austin,Taxes</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Bordered table end -->
</div>

</body>
</html>