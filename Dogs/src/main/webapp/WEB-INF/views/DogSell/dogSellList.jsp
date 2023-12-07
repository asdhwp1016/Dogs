<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강아지 판매 리스트</title>
    <link rel="stylesheet" href="../resources/css/DogSell/dogSellList.css?after">
     <style>
       .top-bar {
    background-color: lightgrey;
    padding: 5px;
    margin: 160px auto 5px; /* Updated margin property with 140px top margin */
    width: 90%;
    max-width: 1200px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: white;
}

      .top-bar a {
    text-decoration: none;
    color: white;
    padding: 8px 15px; /* Adjust padding for better spacing */
    margin: 0 5px;
    border-radius: 5px; /* Add border-radius for rounded corners */
    transition: background-color 0.3s;
    display: flex; /* Use flexbox */
    align-items: center; /* Center items vertically */
}

.top-bar a:hover {
    background-color: #FF95BE;
}

        .text {
            display: none;
            position: absolute;
            top: 50%;
            transform: translate(13%, -50%);
            text-align: center;
            color: white;
            white-space: nowrap;
            line-height: 1.5;
        }

        .content {
            position: relative;
            margin-top: 50px;
        }

        .content:hover .text {
            display: block;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <%@ include file="../includes/mainhf/header.jsp" %>
    
    
    <!-- Top Bar -->
    <div class="top-bar">
        <a href="#">포메라니안</a>
        <a href="#">비숑</a>
        <a href="#">불독</a>
        <a href="#">웰시코기</a>
        <a href="#">말티푸</a>
    </div>
   <!-- Main Content -->
<div class="review">
    <section id="review">
        <div class="list">
            <!-- Your existing content loop -->
            <c:set var="i" value="1"/>
            <c:set var="j" value="40"/>
           <c:forEach begin="${i}" end="${j}" step="1" varStatus="loop">
    <a href="/DogSell/dogSellDetail">
    <div class="content">
        <c:choose>
            <c:when test="${loop.index == 1}">
                <!-- 첫 번째 이미지에 링크 추가 -->
                    <img src="../resources/img/adbanner1.png" class="image"/>
            </c:when>
            <c:otherwise>
                <a href="#"> <!-- 다른 이미지에 대한 링크 추가 (원하는 URL로 변경) -->
                    <img src="http://cfile24.uf.tistory.com/image/19741B4B50194022057DF6" class="image"/>
                </a>
            </c:otherwise>
        </c:choose>
        <div class="cover"></div>
        <span class="text">
            <c:if test="${loop.index == 1}">
                밍글<br>활발함<br>은근낯가림
            </c:if>
        </span>
    </div>
    </a>
    
</c:forEach>
                
            </div>
        </div>
    </section>
</div> 
   

    <!-- Footer -->
    <%@ include file="../includes/mainhf/footer.jsp" %>
</body>

<script>
    // Your additional JavaScript can go here
</script>

</html>
