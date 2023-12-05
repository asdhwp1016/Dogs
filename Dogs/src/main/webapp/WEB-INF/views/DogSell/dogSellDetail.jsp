<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상세 정보 페이지</title>
    <style>
    .detail-container {
        max-width: 800px;
        margin: 160px auto 5px;
        padding: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center; /* Center vertically */
        text-align: center; /* Center the button horizontally */
    }
    .image-container {
        margin-top: 20px;
    }
    

    .detail-image {
        width: calc(100% + 40px);
        height: calc(100% + 40px);
        border: 1px solid #ddd;
        border-radius: 5px;
        object-fit: cover;
        margin-bottom: 20px;
        margin-right: -20px;
        margin-left: -20px;
    }
    .dett-image {
        width: calc(100% + 80px);
        height: calc(100% + 80px);
        border-radius: 5px;
        object-fit: cover;
        margin-bottom: 40px;
        margin-right: -40px;
        margin-left: -40px;
    }

    .back-button {
        background-color: pink;
        color: white;
        padding: 20px 40px;
        font-size: 18px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s; /* Add smooth transition effect */
    }

    .back-button:hover {
        background-color: white;
        color: pink;
    }
  
</style>

    <link rel="stylesheet" href="../resources/css/DogSell/dogSellDetail.css?after">
    <!-- Add any additional CSS or scripts here -->
</head>
<body>
    <!-- Header -->
    <%@ include file="../includes/mainhf/header.jsp" %>

    <!-- Detail Content -->
    <div class="detail-container">
        <h2>강아지 상세 정보</h2>

        <div class="image-container">
            <img src="../resources/img/웰시코기_꼬까_sub1.jpg" class="detail-image"/>
            <img src="../resources/img/퍼피상세정보왜.png" class="dett-image"/>
            <img src="../resources/img/웰시코기_꼬까_sub2.jpg" class="detail-image"/>
            <img src="../resources/img/웰시코기_꼬까_sub3.jpg" class="detail-image"/>
            <img src="../resources/img/퍼피상세정보약속서비스.png" class="dett-image"/>
            
        </div>

       <!-- Back Button -->
<button class=back-button onclick="location.href='/DogSell/dogSellList'" style="cursor: pointer;">목록으로</button>
       
    </div>

    <!-- Footer -->
    <%@ include file="../includes/mainhf/footer.jsp" %>
</body>
</html>