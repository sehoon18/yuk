<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>발주서(거래명세서)</title>
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
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>발주서</h1>
        </div>
        <div class="order-info" data-items="${ContractList }">
            <table>
                <tr>
                    <th>업체명</th>
                    <td></td>
                    <th>거래처대표</th>
                    <td></td>
                </tr>
                <tr>
                    <th>업태</th>
                    <td></td>
                    <th>종목</th>
                    <td></td>
                </tr>
                <tr> 
                    <th>주소</th>
                    <td colspan="3"> </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td></td>
                    <th>FAX번호</th>
                    <td></td>
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
                    <td>${OrdercontractDTO.pro_cd }</td>
                    <td>${OrdercontractDTO.pro_name }</td>
                    <td>${OrdercontractDTO.ord_vol }</td>
                    <td>${OrdercontractDTO.pro_price }</td>
                    <td>${OrdercontractDTO.pro_price*OrdercontractDTO.ord_vol }</td>
                </tr>
                <!-- 다른 주문 항목들도 추가 -->
            </tbody>
        </table>
        <p class="total">총금액: ${OrdercontractDTO.pro_price*OrdercontractDTO.ord_vol }</p>
    </div>
</body>
</html>