<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <style>
        .grid-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-template-rows: repeat(2, 1fr);
            gap: 10px;
            height: 90vh; 
            padding: 10px;
        }
        .chart {
            width: 400px;
            height: 400px;
        }
    </style>
</head>
<body>
<!-- 사이드바 -->
<jsp:include page="../inc/sidebar.jsp" />
<!-- 사이드바 -->


<div class="grid-container" style="margin-left:200px;">
    <div id="pieChart1" class="chart"><h3><b>가공 실적</b></h3></div>
    <div id="pieChart2" class="chart"><h3><b>생산량</b></h3></div>
    <div id="pieChart3" class="chart"><h3><b>출고량</b></h3></div>
    <div id="pieChart4" class="chart"><h3><b>재고량</b></h3></div>
</div>

<script>
    function renderChart(elementId) {
        var options = {
            series: [20,20,20,20,20],
            chart: {
                type: 'pie',
            },
            labels: ['A', 'B' ,'C	' ,'D' ,'E'],
            responsive: [{
                breakpoint: 480,
                options: {
                    chart: {
                        width: 200
                    },
                    legend: {
                        position: 'bottom'
                    }
                }
            }]
        };

        var chart = new ApexCharts(document.querySelector("#" + elementId), options);
        chart.render();
    }

    renderChart("pieChart1");
    renderChart("pieChart2");
    renderChart("pieChart3");
    renderChart("pieChart4");
</script>
  
<script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendors/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/pages/dashboard.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    
</body>
</html>
