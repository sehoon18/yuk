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
  <style>


  
  .chart-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 3열 구성 */
    grid-template-rows: repeat(2, 1fr); /* 2행 구성 */
    gap: 20px; 
    width: 100%; 
    padding: 20px; 
  }

  @media (max-width: 768px) {
    .chart-container {
      grid-template-columns: 1fr; /* 1열로 변경 */
    }
  }
@media (max-width: 1024px) {
  .chart-container {
    grid-template-columns: repeat(2, 1fr); /* 2열로 변경 */
  }
}
  .chart-box {
  	background: linear-gradient(to bottom, #cfd9df, #e2ebf0); 
    box-shadow: 0px 8px 10px rgba(0, 0, 0, 0.08); 
    border-radius: 12px; 
    border: 1px solid #b1c4d4; 
    width: 100%;
    height: 390px; 
    display: flex;
    justify-content: center;
    align-items: center;
  }

  canvas {
    display: block;
    margin: auto;
  }
</style>

<body>

<!-- 사이드바 -->
<jsp:include page="../inc/sidebar.jsp" />
<!-- 사이드바 -->



<div class="chart-container">
  <div class="chart-box"><canvas id="performanceAmount"></canvas></div>
  <div class="chart-box"><canvas id="contractVolChart"></canvas></div>
  <div class="chart-box"><canvas id="orderVolChart"></canvas></div>
  <div class="chart-box"><canvas id="productVolChart"></canvas></div>
  <div class="chart-box"><canvas id="productVolChart2"></canvas></div>
  <div class="chart-box"><canvas id="productVolChart3"></canvas></div>
</div>
    


  
<script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendors/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/pages/dashboard.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    
<!--   생산 실적   -->
    <script>
$(document).ready(function() {
    $.ajax({
        url: "${pageContext.request.contextPath}/production/performanceAmount",
        method: "GET",
        success: function (result) {
            var sname=[];
            var ssales = [];
            for (var i in result) {
                sname.push(result[i].productName);
                ssales.push(result[i].defectRate);
            }
            
            
            var data = {
                labels: sname,
                datasets: [{
                    label: "불량률",
                    backgroundColor: ["#3E95CD", "#8E5EA2","#3CBA9F","#E8C3B9","#C45850"],
                    borderColor: ["#3E95CD", "#8E5EA2","#3CBA9F","#E8C3B9","#C45850"],
                    data: ssales
                }],
            };
        	var myJ = new Chart(document.getElementById("performanceAmount"), {
            	type: 'doughnut',
            	data: data,
            	options: {
              		legend: { display: true },
              		title: {
                		display: true,
                		text: '불량률(%)'
              		}
              		
            	}
        	
        	});
        }
    	
    });
});
</script>








<!--  수주량 -->
<script>
$(document).ready(function() {
    $.ajax({
        url: "${pageContext.request.contextPath}/contract/contractVolChart",
        method: "GET",
        success: function (result) {
            var datasets = [];
            var colors = ["#3E95CD", "#8E5EA2","#3CBA9F","#E8C3B9","#C45850"]; // 색상 배열
            var proData = {}; // pro_name을 키로 하여 con_vol 값들을 저장할 객체
            var dateSet = new Set(); // 중복 없는 날짜를 저장하기 위한 Set

            // 데이터 분류 및 날짜 수집
            result.forEach(function(item) {
            	var conDate = new Date(item.con_date); // con_date를 Date 객체로 변환
             var formattedDate = conDate.getFullYear() + '-' + ('0' + (conDate.getMonth() + 1)).slice(-2) + '-' + ('0' + conDate.getDate()).slice(-2); // YYYY-MM-DD 형식으로 변환
                dateSet.add(formattedDate);
                
                if (!proData[item.pro_name]) {
                    proData[item.pro_name] = {};
                }
                // pro_name 별로 해당 날짜에 ord_vol 값을 저장
               proData[item.pro_name][formattedDate] = item.con_vol;
            });

            var dates = Array.from(dateSet).sort(); // 날짜 배열 생성 및 정렬

            // 데이터셋 생성
            var index = 0;
            for (var proName in proData) {
                var total = 0; // 누적값 계산을 위한 변수
                var cumulativeData = dates.map(function(date) {
                    var vol = proData[proName][date] || 0; // 해당 날짜의 ord_vol 값, 없으면 0
                    total += vol; // ord_vol 값을 누적
                    return total; // 누적된 값을 반환
                });

                datasets.push({
                    label: proName,
                    backgroundColor: colors[index % colors.length],
                    borderColor: colors[index % colors.length],
                    data: cumulativeData,
                    fill: false,
                });
                index++;
            }

            var data = {
                labels: dates, // 날짜를 X축 레이블로 사용
                datasets: datasets
            };

            var config = {
                type: 'line',
                data: data,
                options: {
                    plugins: {
                        legend: { display: true 
                        },
                        title: {
                            display: true,
                            text: '수주량'
                        }
                    },
                    scales: {
                        x: { // X축 설정
                            type: 'time', // X축을 시간 축으로 설정
                            time: {
                                unit: 'day', // 날짜 단위 설정
                                tooltipFormat: 'yyyy-MM-dd', // 툴팁에 표시될 날짜 형식
                                displayFormats: {
                                    day: 'yyyy-MM-dd' // 축에 표시될 날짜 형식
                                }
                            }
                        },
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            };

            var myChart = new Chart(document.getElementById("contractVolChart"), config);
        }
    });
});
</script>





<!-- 발주량 -->
<script>
$(document).ready(function() {
    $.ajax({
        url: "${pageContext.request.contextPath}/order/orderVolChart",
        method: "GET",
        success: function (result) {
            var datasets = [];
            var colors = ["#3E95CD", "#8E5EA2","#3CBA9F","#E8C3B9","#C45850"]; // 색상 배열
            var proData = {}; // pro_name을 키로 하여 con_vol 값들을 저장할 객체
            var dateSet = new Set(); // 중복 없는 날짜를 저장하기 위한 Set

            // 데이터 분류 및 날짜 수집
            result.forEach(function(item) {
            	var ordDate = new Date(item.ord_date); // ord_date를 Date 객체로 변환
             var formattedDate = ordDate.getFullYear() + '-' + ('0' + (ordDate.getMonth() + 1)).slice(-2) + '-' + ('0' + ordDate.getDate()).slice(-2); // YYYY-MM-DD 형식으로 변환
                dateSet.add(formattedDate);
                
                if (!proData[item.pro_name]) {
                    proData[item.pro_name] = {};
                }
                // pro_name 별로 해당 날짜에 con_vol 값을 저장
               proData[item.pro_name][formattedDate] = item.ord_vol;
            });

            var dates = Array.from(dateSet).sort(); // 날짜 배열 생성 및 정렬

            // 데이터셋 생성
            var index = 0;
            for (var proName in proData) {
                var total = 0; // 누적값 계산을 위한 변수
                var cumulativeData = dates.map(function(date) {
                    var vol = proData[proName][date] || 0; // 해당 날짜의 con_vol 값, 없으면 0
                    total += vol; // con_vol 값을 누적
                    return total; // 누적된 값을 반환
                });

                datasets.push({
                    label: proName,
                    backgroundColor: colors[index % colors.length],
                    borderColor: colors[index % colors.length],
                    data: cumulativeData,
                    fill: false,
                });
                index++;
            }

            var data = {
                labels: dates, // 날짜를 X축 레이블로 사용
                datasets: datasets
            };

            var config = {
                type: 'line',
                data: data,
                options: {
                    plugins: {
                        legend: { display: true },
                        title: {
                            display: true,
                            text: '수주량'
                        }
                    },
                    scales: {
                        x: { // X축 설정
                            type: 'time', // X축을 시간 축으로 설정
                            time: {
                                unit: 'day', // 날짜 단위 설정
                                tooltipFormat: 'yyyy-MM-dd', // 툴팁에 표시될 날짜 형식
                                displayFormats: {
                                    day: 'yyyy-MM-dd' // 축에 표시될 날짜 형식
                                }
                            }
                        },
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            };

            var myChart = new Chart(document.getElementById("orderVolChart"), config);
        }
    });
});
</script>


<!-- 완제품 재고량 -->
   <script>
$(document).ready(function() {
    $.ajax({
        url: "${pageContext.request.contextPath}/product/productVol",
        method: "GET",
        success: function (result) {
            var sname=[];
            var ssales = [];
            for (var i in result) {
            	sname.push(result[i].productName);
                ssales.push(result[i].prodcutVol);
            }
            var data = {
                labels: sname,
                datasets: [{
                    label: "재고량",
                    backgroundColor: ["#3E95CD", "#8E5EA2","#3CBA9F","#E8C3B9","#C45850"],
                    borderColor: ["#3E95CD", "#8E5EA2","#3CBA9F","#E8C3B9","#C45850"],
                    data: ssales
                }],
            };
        	var myJ = new Chart(document.getElementById("productVolChart"), {
            	type: 'bar',
            	data: data,
            	options: {
            		 scales: {
         		        yAxes: [{
         		            ticks: {
         		                min: 0, 
         		                max: 1000, 
         		                stepSize: 100 //간격 조절
         		            }
         		        }]
         		    },
              		legend: { display: true },
              		title: {
                		display: true,
                		text: '완제품 재고량'
              			}
            	}
        	
        	});
        }
    	
    });
});
</script>

<!-- 식자재 재고량 -->
   <script>
$(document).ready(function() {
    $.ajax({
        url: "${pageContext.request.contextPath}/product/productVol2",
        method: "GET",
        success: function (result) {
            var sname=[];
            var ssales = [];
            for (var i in result) {
            	sname.push(result[i].productName);
                ssales.push(result[i].prodcutVol);
            }
            var data = {
                labels: sname,
                datasets: [{
                    label: "재고량",
                    backgroundColor: ["#3E95CD", "#8E5EA2","#3CBA9F","#E8C3B9","#C45850"],
                    borderColor: ["#3E95CD", "#8E5EA2","#3CBA9F","#E8C3B9","#C45850"],
                    data: ssales
                }],
            };
        	var myJ = new Chart(document.getElementById("productVolChart2"), {
            	type: 'bar',
            	data: data,
            	options: {
            		 scales: {
         		        yAxes: [{
         		            ticks: {
         		                min: 0, 
         		                max: 1000, 
         		                stepSize: 100 //간격 조절
         		            }
         		        }]
         		    },
              		legend: { display: true },
              		title: {
                		display: true,
                		text: '식자재 재고량'
              			}
            	}
        	
        	});
        }
    	
    });
});
</script>

<!-- 포장자재 재고량 -->
   <script>
$(document).ready(function() {
    $.ajax({
        url: "${pageContext.request.contextPath}/product/productVol3",
        method: "GET",
        success: function (result) {
            var sname=[];
            var ssales = [];
            for (var i in result) {
            	sname.push(result[i].productName);
                ssales.push(result[i].prodcutVol);
            }
            var data = {
                labels: sname,
                datasets: [{
                    label: "재고량",
                    backgroundColor: ["#3E95CD", "#8E5EA2","#3CBA9F","#E8C3B9","#C45850"],
                    borderColor: ["#3E95CD", "#8E5EA2","#3CBA9F","#E8C3B9","#C45850"],
                    data: ssales
                }],
            };
        	var myJ = new Chart(document.getElementById("productVolChart3"), {
            	type: 'bar',
            	data: data,
            	options: {
            		 scales: {
            		        yAxes: [{
            		            ticks: {
            		                min: 0, 
            		                max: 1000, 
            		                stepSize: 100 //간격 조절
            		            }
            		        }]
            		    },
              		legend: { display: true },
              		title: {
                		display: true,
                		text: '포장자재 재고량'
              			}
            	}
        	
        	});
        }
    	
    });
});
</script>







</body>
</html>
