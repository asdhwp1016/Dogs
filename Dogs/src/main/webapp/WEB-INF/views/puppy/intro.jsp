<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
 .detail-container {
        max-width: 1150px;
        margin: 160px auto 5px;
        padding: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center; /* Center vertically */
        text-align: center; /* Center the button horizontally */
    }
    .image-container {
        margin-top: 40px;
    }
    

    .detail-image {
        width: calc(100% + 80px);
        height: calc(100% + 80px);
        border-radius: 5px;
        object-fit: cover;
        margin-top:60px;
        margin-bottom: 100px;
        margin-right: -40px;
        margin-left: -40px;
    }
    .dett-image {
        width: calc(100% + 100px);
        height: calc(100% + 100px);
        border-radius: 5px;
        object-fit: cover;
        margin-bottom: 100px;
        margin-right: -50px;
        margin-left: -50px;
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
    
    #intro-text {
     font-size: 36px;
     font-weight: bold;
     margin-top:60px;
     margin-bottom: 100px;
    }

    #puppy {
      color: pink;
      font-weight: bold;
    }

    #intro {
      color: black;
      font-weight: bold;
    }
</style>
<title>PUPPY 소개</title>
</head>
<body>
    <!-- Header -->
    <%@ include file="../includes/mainhf/header.jsp" %>
    <!-- Detail Content -->
    <div class="detail-container">
    <div id="intro-text">
    <span id="puppy">PUPPY</span> <span id="intro">를 소개합니다</span>
  </div>
        <div class="image-container">
            <img src="../resources/img/소개1.jpg" class="dett-image"/>
            <img src="../resources/img/소개2.jpg" class="dett-image"/>
            <img src="../resources/img/소개3.jpg" class="dett-image"/>
            <img src="../resources/img/소개4.jpg" class="dett-image"/>
            <img src="../resources/img/소개5.jpg" class="dett-image"/>
            <img src="../resources/img/소개6.jpg" class="dett-image"/>
            <img src="../resources/img/소개7.jpg" class="dett-image"/>
        </div>

       <!-- Back Button -->
<button class=back-button onclick="location.href='/main'" style="cursor: pointer;">홈으로</button>
       
    </div>

    <!-- Footer -->
    <%@ include file="../includes/mainhf/footer.jsp" %>
</body>
</html>