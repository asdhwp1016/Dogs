<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상세 정보 페이지</title>
    <link rel="stylesheet" href="../resources/css/DogSell/dogSellDetail.css?after">
    <!-- Add any additional CSS or scripts here -->
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
        margin-top:60px;
        margin-bottom: 70px;
        margin-right: -20px;
        margin-left: -20px;
    }
    .dett-image {
        width: calc(100% + 80px);
        height: calc(100% + 80px);
        border-radius: 5px;
        object-fit: cover;
        margin-bottom: 50px;
        margin-right: -40px;
        margin-left: -40px;
    }
    .findett-image {
        width: calc(100% + 80px);
        height: calc(100% + 80px);
        border-radius: 5px;
        object-fit: cover;
        margin-top: 150px;
        margin-bottom: 150px;
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
</head>
<body>
    <!-- Header -->
    <%@ include file="../includes/mainhf/header.jsp" %>

    <!-- Detail Content -->
    <div class="detail-container">
        <div class="image-container">
        	<c:forEach items="${dogsImageList}" var="dogImage">
                <!-- dogId가 현재 강아지의 ID와 일치하는 경우에만 이미지를 출력 -->
                <c:if test="${dogImage.dogId eq param.dogId}">
                    <img src="../resources/img/dog/${dogImage.fileSub1}" class="detail-image"/>
                    <img src="../resources/img/dog/${dogImage.fileSub2}" class="detail-image"/>
                    <img src="../resources/img/퍼피상세정보왜.png" class="dett-image"/>
                    <img src="../resources/img/카톡연중무휴.jpg" class="dett-image"/>
                    <img src="../resources/img/dog/${dogImage.fileSub3}" class="detail-image"/>      
                    <img src="../resources/img/퍼피상세정보약속서비스.png" class="findett-image"/>
                </c:if>
            </c:forEach>
        </div>

       <!-- Back Button -->
		<button class=back-button onclick="location.href='/DogSell/dogSellList'" style="cursor: pointer;">목록으로</button> 
    </div>

    <!-- Footer -->
    <%@ include file="../includes/mainhf/footer.jsp" %>
</body>
</html>