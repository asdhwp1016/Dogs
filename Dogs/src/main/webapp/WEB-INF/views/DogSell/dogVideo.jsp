<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PUPPY 영상보기</title>
<link rel="stylesheet" href="../resources/css/DogSell/dogVideos.css?after">
<style>
#puppy {
    max-width: 1150px;
    margin: 160px auto 5px;
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center; /* Center vertically */
    text-align: center; /* Center the button horizontally */
    color: pink;
    font-size: 36px;
    font-weight: bold;
    margin-top: 210px; /* Adjust the top margin as needed */
    margin-bottom: 20px; /* Adjust the bottom margin as needed */
}

body {
    display: flex;
    flex-direction: column;
    align-items: center;
    min-height: 100vh; /* Set a minimum height to cover the entire viewport */
    margin: 0;
}

.video-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    width: 70%; /* 페이지 가운데에 두 개의 영상을 가지고 있는 컨테이너의 너비 설정 */
    margin-top: 115px; /* Adjust the top margin as needed */
}

.video-container iframe {
    width: 42%; /* 각 영상의 너비 설정 */
    height: 315px; /* 원하는 높이로 설정하세요 */
}

</style>
</head>
<body>
    <!-- Header -->
    <%@ include file="../includes/mainhf/header.jsp" %>
    
    <span id="puppy">♥ PUPPY TV ♥</span>
    
    <div class="video-container">
         <!-- Embed Code -->
    <iframe width="560" height="315" src="https://www.youtube.com/embed/i8B_ux_XhYY?si=FncWkpHN0zC_8uIH" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

        <!-- 두 번째 영상 -->
        <!-- Replace "ANOTHER_VIDEO_ID" with the actual video ID for the second video -->
        <iframe width="560" height="315" src="https://www.youtube.com/embed/OifKrj1IZMA?si=LILViEo46fIpZ3pt" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    </div>

    <div class="video-container">
        <!-- 세 번째 영상 추가 -->
        <!-- Replace "ANOTHER_VIDEO_ID_1" with the actual video ID for the third video -->
        <iframe width="560" height="315" src="https://www.youtube.com/embed/TA1LNBshO90?si=y8lbvGJcfTCnjX1I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

        <!-- 네 번째 영상 추가 -->
        <!-- Replace "ANOTHER_VIDEO_ID_2" with the actual video ID for the fourth video -->
        <iframe width="560" height="315" src="https://www.youtube.com/embed/6UjRoUqV0_I?si=1OVbm9HnJ_6efxkT" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    </div>
    
    <div class="video-container">
        <!-- 5 s번째 영상 추가 -->
        <!-- Replace "ANOTHER_VIDEO_ID_1" with the actual video ID for the third video -->
        <iframe width="560" height="315" src="https://www.youtube.com/embed/aIv9C20tIq4?si=80Xo-ERT4I1nQjaN" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

        <!-- 6 번째 영상 추가 -->
        <!-- Replace "ANOTHER_VIDEO_ID_2" with the actual video ID for the fourth video -->
        <iframe width="560" height="315" src="https://www.youtube.com/embed/2FZmU6Coh4w?si=E0Asn_XXKKTDAy7q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    </div>
    
    <div class="video-container">
        <!-- 7 번째 영상 추가 -->
        <!-- Replace "ANOTHER_VIDEO_ID_1" with the actual video ID for the third video -->
        <iframe width="560" height="315" src="https://www.youtube.com/embed/xPZhNrOeVug?si=59U3MjVJpByOXnDk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

        <!-- 8 번째 영상 추가 -->
        <!-- Replace "ANOTHER_VIDEO_ID_2" with the actual video ID for the fourth video -->
        <iframe width="560" height="315" src="https://www.youtube.com/embed/Z_kJ5trfhJU?si=fxp7oAHysSz3RavW" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    </div>
    
    <div class="video-container">
        <!-- 9 번째 영상 추가 -->
        <!-- Replace "ANOTHER_VIDEO_ID_1" with the actual video ID for the third video -->
        <iframe width="560" height="315" src="https://www.youtube.com/embed/c-tBaiCQEic?si=EYtVDJv_IwUyOVJZ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

        <!-- 10 번째 영상 추가 -->
        <!-- Replace "ANOTHER_VIDEO_ID_2" with the actual video ID for the fourth video -->
        <iframe width="560" height="315" src="https://www.youtube.com/embed/tWooWYpYGyo?si=ebty300dC2DDxdeW" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    </div>
    
    <!-- Footer -->
    <%@ include file="../includes/mainhf/footer.jsp" %>
</body>
</html>
