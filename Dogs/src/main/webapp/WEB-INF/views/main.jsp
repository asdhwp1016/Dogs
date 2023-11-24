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

<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>
<p>아 진짜 스트레스 너무 받는다</p>



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