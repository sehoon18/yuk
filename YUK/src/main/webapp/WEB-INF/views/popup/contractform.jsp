<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
   <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수주서(거래명세서)</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 2px solid #000;
            border-radius: 10px;
            background-color: #f5f5f5;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .order-info {
            margin-bottom: 20px;
            font-size: 18px;
            line-height: 1.5;
        }

        .order-info table {
            width: 100%;
            border-collapse: collapse;
        }

        .order-info th, .order-info td {
            border: 1px solid #000;
            padding: 10px;
            text-align: center;
        }

        .order-info th {
            background-color: #f2f2f2;
        }

        .order-details {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .order-details th, .order-details td {
            border: 1px solid #000;
            padding: 10px;
            text-align: center;
        }

        .order-details th {
            background-color: #f2f2f2;
        }

        .total {
            font-weight: bold;
            font-size: 20px;
        }
        
@media print {
    body * {
        visibility: hidden; /* 기본적으로 모든 요소를 인쇄하지 않음 */
    }
    .container, .container * {
        visibility: visible; /* container 클래스를 가진 요소와 그 자식 요소만 인쇄 */
    }
    .container {
        position: absolute;
        left: 0;
        top: 0;
    }
}
</style>
   
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>수주서</h1>
        </div>
        <div class="order-info">
            <table>
                <tr>
                    <th>업체명</th>
                    <td>${ordercontractDTO.cli_name}</td>
                    <th>거래처대표</th>
                    <td>${ordercontractDTO.cli_ceo}</td>
                </tr>
                <tr>
                    <th>업태</th>
                    <td>${ordercontractDTO.cli_business_type}</td>
                    <th>종목</th>
                    <td>${ordercontractDTO.cli_category}</td>
                </tr>
                <tr> 
                    <th>주소</th>
                    <td colspan="3">${ordercontractDTO.cli_basic_address} </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>${ordercontractDTO.cli_tel_number}</td>
                    <th>FAX번호</th>
                    <td>${ordercontractDTO.cli_fax_number}</td>
                </tr>
                <tr>
                    <th>수주일자</th>
                    <td><fmt:formatDate value="${ordercontractDTO.con_date}" pattern="yyyy.MM.dd"/></td>
                    <th>결제일자</th>
                    <td><fmt:formatDate value="${ordercontractDTO.con_pay_date}" pattern="yyyy.MM.dd"/></td>
                </tr>
            </table>
        </div>
        <table class="order-details">
            <thead>
                <tr>
                    <th>No</th>
                    <th>품명</th>
                    <th>수량</th>
                    <th>단가</th>
                    <th>총금액</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${ordercontractDTO.con_cd }</td>
                    <td>${ordercontractDTO.pro_name }</td>
                    <td>${ordercontractDTO.con_vol }</td>
                    <td>${ordercontractDTO.pro_price }</td>
                    <td><fmt:formatNumber value="${ordercontractDTO.pro_price * ordercontractDTO.con_vol}" groupingUsed="true" maxFractionDigits="0"/></td>
                </tr>
                <!-- 다른 주문 항목들도 추가 -->
            </tbody>
        </table>
        <div>
        <p class="total">총금액:<fmt:formatNumber value="${ordercontractDTO.pro_price * ordercontractDTO.con_vol}" groupingUsed="true" maxFractionDigits="0"/></p>
      
        </div>
    </div>
     <div style="text-align:center; margin: 10px 0;">
        <button onclick="printPage()" class="btn btn-dark" style="margin-right: 10px;">페이지 인쇄</button>
        
    </div>
</body>
<script>
function printPage() {
    window.print();
}
</script>

</html>