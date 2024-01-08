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
    <script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
</head>
<body>
    <!-- Header -->
    <%@ include file="../includes/mainhf/header.jsp" %>
    
    
    <!-- Top Bar -->
    <div class="top-bar">
        <a class="001" href="#">포메라니안</a>
        <a class="002" href="#">비숑</a>
        <a class="003" href="#">불독</a>
        <a class="004" href="#">웰시코기</a>
        <a class="005" href="#">말티푸</a>
    </div>
   <!-- Main Content -->
<div class="review">
    <section id="review">
        <div class="list">
            <!-- Your existing content loop -->
           	<c:forEach items="${dogsImageList}" var="dogsImageList"> 
			    <a href="/DogSell/dogSellDetail?dogId=${dogsImageList.dogId}">
			    <div class="content">
			            <img src="../resources/img/dog/${dogsImageList.fileMain}" class="image"/>
			        <div class="cover"></div>
			        <span class="text">
			        </span>
			    </div>
			    </a>
			</c:forEach>
            </div>   
    </section>
</div> 
   

    <!-- Footer -->
    <%@ include file="../includes/mainhf/footer.jsp" %>
</body>

<script>

$(".001").on("click", function(e) {
		e.preventDefault();
		let list = $(".list");
		list.empty(); // 이전에 있던 내용을 지움
   		let str = "";
   		str += '<c:forEach items="${dogsImageList}" var="dogsImageList">';
   		str += '<c:if test="${dogsImageList.dogCateCode == \'001\'}">';
   		str += '<a href="/DogSell/dogSellDetail?dogId=${dogsImageList.dogId}">';
   		str += '<div class="content">';
   		str += '<img src="../resources/img/dog/${dogsImageList.fileMain}" class="image"/>';
   		str += '</div>';
   		str += '</a>';
   		str += '</c:if>';
   		str += '</c:forEach>';
   		
   		list.append(str);
   });
   
$(".002").on("click", function(e) {
	e.preventDefault();
	let list = $(".list");
	list.empty(); // 이전에 있던 내용을 지움
		let str = "";
		str += '<c:forEach items="${dogsImageList}" var="dogsImageList">';
		str += '<c:if test="${dogsImageList.dogCateCode == \'002\'}">';
		str += '<a href="/DogSell/dogSellDetail?dogId=${dogsImageList.dogId}">';
		str += '<div class="content">';
		str += '<img src="../resources/img/dog/${dogsImageList.fileMain}" class="image"/>';
		str += '</div>';
		str += '</a>';
		str += '</c:if>';
		str += '</c:forEach>';
		
		list.append(str);
});

$(".003").on("click", function(e) {
	e.preventDefault();
	let list = $(".list");
	list.empty(); // 이전에 있던 내용을 지움
		let str = "";
		str += '<c:forEach items="${dogsImageList}" var="dogsImageList">';
		str += '<c:if test="${dogsImageList.dogCateCode == \'003\'}">';
		str += '<a href="/DogSell/dogSellDetail?dogId=${dogsImageList.dogId}">';
		str += '<div class="content">';
		str += '<img src="../resources/img/dog/${dogsImageList.fileMain}" class="image"/>';
		str += '</div>';
		str += '</a>';
		str += '</c:if>';
		str += '</c:forEach>';
		
		list.append(str);
});

$(".004").on("click", function(e) {
	e.preventDefault();
	let list = $(".list");
	list.empty(); // 이전에 있던 내용을 지움
		let str = "";
		str += '<c:forEach items="${dogsImageList}" var="dogsImageList">';
		str += '<c:if test="${dogsImageList.dogCateCode == \'004\'}">';
		str += '<a href="/DogSell/dogSellDetail?dogId=${dogsImageList.dogId}">';
		str += '<div class="content">';
		str += '<img src="../resources/img/dog/${dogsImageList.fileMain}" class="image"/>';
		str += '</div>';
		str += '</a>';
		str += '</c:if>';
		str += '</c:forEach>';
		
		list.append(str);
});

$(".005").on("click", function(e) {
	e.preventDefault();
	let list = $(".list");
	list.empty(); // 이전에 있던 내용을 지움
		let str = "";
		str += '<c:forEach items="${dogsImageList}" var="dogsImageList">';
		str += '<c:if test="${dogsImageList.dogCateCode == \'005\'}">';
		str += '<a href="/DogSell/dogSellDetail?dogId=${dogsImageList.dogId}">';
		str += '<div class="content">';
		str += '<img src="../resources/img/dog/${dogsImageList.fileMain}" class="image"/>';
		str += '</div>';
		str += '</a>';
		str += '</c:if>';
		str += '</c:forEach>';
		
		list.append(str);
});

</script>

</html>
