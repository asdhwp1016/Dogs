<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양후기</title>
<link rel="stylesheet" href="../resources/css/review/review_list.css?v=1">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
<body>
<%@ include file="../includes/mainhf/header.jsp" %>

<section id="review">
	<div class="review">
		
		<div class="list" id="list">
			<div class="page_text"><h1>♥PUPPY의 새 가족이 되어주신 소중한 고객님들♥</h1></div>
			
				<c:forEach items="${review}" var="r" varStatus="status">
					<div class="content">
						<img src="../resources/img/review_img/${r.review_img}" class="image"/>
						<div class="cover"></div>
						<div id="text" class="text">
							<h4><span>${r.dog_type}</span> 분양 후기입니다</h4>
						</div>
					</div>
				</c:forEach>
				
		</div>	<!-- .list 종료 -->
	
		<div class="clear"></div>
	
		<!-- 하단 메뉴들 묶음 -->
		<div class="menu">
			<!-- 더보기 버튼 -->
			<div class="more">
				<button id="moreView" onclick="load();">더보기 +</button>
			</div>
			
			<hr size="1px" color="lightgray">
			
		</div>	<!-- .menu 종료 -->
	</div>	
</section>

<%@ include file="../includes/mainhf/footer.jsp" %>
</body>

<script>

// 더보기 기능
$(function() {
	$(".content").slice(0, 16).show();	// 처음에 보여질 갯수
	
	$("#moreView").click(function(e) {	// 클릭 시 이벤트 발생
		e.preventDefault();
		$(".content:hidden").slice(0, 16).show();	// 더 보이게 할 갯수
		
		 // 더 보여질 콘텐츠가 없다면, 
		if($(".content:hidden").length == 0) {
			$(".more").hide();
			// alert("마지막 페이지입니다.");
		}
		
	});
	
});

/*	클래스명으로 요소 아이디 알아내기
function load() {
	$("#con${i}").hide();
	
	var class_id = $('.content').attr('id');
	window.alert(class_id); 
}
*/
</script>

</html>