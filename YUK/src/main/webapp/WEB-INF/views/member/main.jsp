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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    	
</head>
<body>
<!-- 사이드바 -->
<jsp:include page="../inc/sidebar.jsp" />
<!-- 사이드바 -->


<div style="width: 800px; height: 800px;"  >
<canvas id="bar-chart-horizontal"></canvas>
</div>


  
<script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendors/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/pages/dashboard.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    
    <script>
$(document).ready(function() {
    $.ajax({
        url: "${pageContext.request.contextPath}/production/mainJson",
        method: "GET",
        success: function (result) {
            var sname=[];
            var ssales = [];
            for (var i in result) {
                sname.push(result[i].instructionCode);
                ssales.push(result[i].insVol);
            }
            var data = {
                labels: sname,
                datasets: [{
                    label: "실적량",
                    backgroundColor: ["#3E95CD", "#8E5EA2","#3CBA9F","#E8C3B9","#C45850"],
                    borderColor: ["#3E95CD", "#8E5EA2","#3CBA9F","#E8C3B9","#C45850"],
                    data: ssales
                }],
            };
        	var myJ = new Chart(document.getElementById("bar-chart-horizontal"), {
            	type: 'doughnut',
            	data: data,
            	options: {
//             		indexAxis: 'y' ,
              		legend: { display: true },
              		title: {
                		display: true,
                		text: '지점 실적'
              			}
            	}
        	
        	});
        }
    	
    });
});
</script>

<script>
// $(document).ready(function() {
//     $.ajax({
//         url: "${pageContext.request.contextPath}/production/mainJson",
//         method: "GET",
//         success: function (result) {
//             var iname=[];
//             var amount = [];
//             for (var i in result) {
//                 iname.push(result[i].instructionCode);
//                 amount.push(result[i].insVol);
//             }
//             console.log(amount);
//             var data = {
//                 labels: iname,
//                 datasets: [{
//                     label: "양",
//                     backgroundColor: [
//                         'rgba(255, 99, 132, 0.2)',
//                         'rgba(54, 162, 235, 0.2)',
//                         'rgba(255, 206, 86, 0.2)',
//                         'rgba(75, 192, 192, 0.2)',
//                         'rgba(153, 102, 255, 0.2)',
//                         'rgba(255, 159, 64, 0.2)'
//                     ],
//                     borderColor: [
//                         'rgba(255, 99, 132, 1)',
//                         'rgba(54, 162, 235, 1)',
//                         'rgba(255, 206, 86, 1)',
//                         'rgba(75, 192, 192, 1)',
//                         'rgba(153, 102, 255, 1)',
//                         'rgba(255, 159, 64, 1)'
//                     ],
//                     borderWidth: 0.4,
//                     data: amount
//                 }],
//             };
//             var myJ = new Chart(document.getElementById('myChart').getContext('2d'), {
//                 type: 'bar',
//                 data: data,
//                 options: {
//                     scales: {
//                         y: {
//                             beginAtZero: true
//                         }
//                     }
//                 }
//             });
//         }
//     });
// });
</script>






    
    
</body>
</html>
