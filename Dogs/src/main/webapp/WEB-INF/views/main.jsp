<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Puppy</title>
<link rel="stylesheet" href="resources/css/main.css?v=1">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>

</head>
<body>

<%@include file="./includes/mainhf/header.jsp"%>

<div class="mainwapper">
	<div class="mainad">
		<div class="adbanner">
			<img src="resources/img/adbanner1.png">
		</div>
		<div class="adbanner">
			<img src="resources/img/adbanner2.png">
		</div>
		<div class="adbanner">
			<img src="resources/img/adbanner3.png">
		</div>
	</div>
	
	<div class="mainnav">
		<div class="dogintroduce">
			<div class="title">
				<h1>ALL PUPPY</h1>
				<a>♥PUPPY의 사랑스러운 가족을 소개합니다♥</a>
			</div>
			
			<div class="dogBoxes">
				<ul>
					<c:forEach items="${mainImage}" var="mainImage" begin="1" end="4" step="1"> 
						<li class="dogBox">
							<img src="resources/img/dog/${mainImage.fileMain}"/>
						</li>
					</c:forEach>
				</ul>
			</div>
			
			<div class="dogBoxes">
				<ul>
					<c:forEach items="${mainImage}" var="mainImage" begin="21" end="24" step="1"> 
						<li class="dogBox">
							<img src="resources/img/dog/${mainImage.fileMain}"/>
						</li>
					</c:forEach>
				</ul>
			</div>
			
			<div class="dogBoxes">
				<ul>
					<c:forEach items="${mainImage}" var="mainImage" begin="41" end="44" step="1"> 
						<li class="dogBox">
							<img src="resources/img/dog/${mainImage.fileMain}"/>
						</li>
					</c:forEach>
				</ul>
			</div>
			
			<div class="dogBoxes">
				<ul>
					<c:forEach items="${mainImage}" var="mainImage" begin="48" end="51" step="1"> 
						<li class="dogBox">
							<img src="resources/img/dog/${mainImage.fileMain}"/>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<div class="dogad">
			<div class="dogad1">
				<img src="resources/img/dogad1.jpg">
			</div>
		</div>
		
		
		<div class="dogmainreview">
			<div class="title">
				<h1>PUPPY REVIEW</h1>
				<a>♥사랑스러운 가족이 생긴 고객분들의 리뷰♥</a>
			</div>
			
			<div class="dogReviewBoxes">
				<ul>
					<c:forEach var="i" begin="1" end="4"> <!-- 5개의 박스를 생성하도록 설정 -->
						<li class="dogReviewBox">
							
						</li>
					</c:forEach>
				</ul>
			</div>
			
			<div class="dogReviewBoxes">
				<ul>
					<c:forEach var="i" begin="1" end="4"> <!-- 5개의 박스를 생성하도록 설정 -->
						<li class="dogReviewBox">
							
						</li>
					</c:forEach>
				</ul>
			</div>
			
			<div class="dogReviewBoxes">
				<ul>
					<c:forEach var="i" begin="1" end="4"> <!-- 5개의 박스를 생성하도록 설정 -->
						<li class="dogReviewBox">
							
						</li>
					</c:forEach>
				</ul>
			</div>
			
			<div class="dogReviewBoxes">
				<ul>
					<c:forEach var="i" begin="1" end="4"> <!-- 5개의 박스를 생성하도록 설정 -->
						<li class="dogReviewBox">
							
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<div class="dogad">
			<div class="dogad2">
				<img src="resources/img/dogad2.jpg">
			</div>
		</div>
		
		<div class="finalad">
			<div class="dogad3">
				<img src="resources/img/dogad3.png">
			</div>
		</div>
	</div>
</div>


<%@include file="./includes/mainhf/footer.jsp"%>











<script>

//광고배너 슬라이드쇼
let slideIndex = 0;
showSlides();

function showSlides() {
  let slides = document.querySelectorAll('.adbanner');
  for (let i = 0; i < slides.length; i++) {
    slides[i].style.display = 'none';
  }
  slideIndex++;
  if (slideIndex > slides.length) {
    slideIndex = 1;
  }
  slides[slideIndex - 1].style.display = 'block';
  setTimeout(showSlides, 3000); // 3초마다 이미지 변경 (자동 슬라이드)
}

function plusSlides(n) {
  showSlide(slideIndex += n);
}

function showSlide(n) {
  let slides = document.querySelectorAll('.adbanner');
  if (n > slides.length) {
    slideIndex = 1;
  }
  if (n < 1) {
    slideIndex = slides.length;
  }
  for (let i = 0; i < slides.length; i++) {
    slides[i].style.display = 'none';
  }
  slides[slideIndex - 1].style.display = 'block';
}

</script>

</body>
</html>