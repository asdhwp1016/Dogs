<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/mainhf/header.css?after">

<script src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

</head>
<body>

<div class="headerwrapper">
	<div class="header">
		<!-- 로고 영역 -->
		<div class="logo_area">
			<a href="#"><img src="resources/img/doglogo.png"></a>
		</div>
		
		<div class="top_gnb_area">
			<!-- 로그인 하지 않은 상태 -->
			<c:if test = "${user == null}">
			<ul class="userList">
				<li>
					<a href="/user/login">로그인</a>
				</li>
				<li>
					<a href="/user/join">회원가입</a>
				</li>
			</ul>
			</c:if>
			
			<!-- 로그인 한 상태 -->
			<c:if test = "${user != null}">
				<ul class="userList">
					<c:if test="${user.adminCk == 1 }">  <!-- 관리자 계정 -->
	                    <li><a href="/admin/main">관리자 페이지</a></li>
	                </c:if>
					<li>
						<span>${user.userName}</span>님 안녕하세요
					</li>
					<li>
						<a href="/user/logout.do">로그아웃</a>
					</li>
					<li>
						<a href="#">마이페이지</a>
					</li>
				</ul>
			</c:if>
		</div>
		
		<div class="header_menu">
			<ul class="menuList">
				<li>
					<a href="#">PUPPY</a>
					<div class="subMenu">
						<ul>
                            <li><a href="#">소개</a></li>
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">오시는 길</a></li>
                            <li><a href="#">설문 테스트</a></li>
                        </ul>
					</div>
				</li>
				<li>
					<a href="#">신규분양</a>
					<div class="subMenu">
						<ul>
                            <li><a href="#">강아지 분양</a></li>
                            <li><a href="#">영상보기</a></li>
                        </ul>
					</div>
				</li>
				<li>
					<a href="#">강아지 코디</a>
					<div class="subMenu">
						<ul>
                            <li><a href="#">후드 코디</a></li>
                            <li><a href="#">패딩 코디</a></li>
                            <li><a href="#">일반 코디</a></li>
                        </ul>
					</div>
				</li>
				<li>
					<a href="#">방문예약</a>
				</li>
				<li>
					<a href="#">분양후기</a>
				</li>
				<li>
					<a href="#">커뮤니티</a>
				</li>
			</ul>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
    var header = $(".headerwrapper");
    var newHeader = $("<div class='headerwrapper newHeader'></div>");

    // 스크롤 이벤트
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();

        if (scroll > 120) {
            // 스크롤이 120 이상이면 새로운 헤더로 변경
            if (!header.hasClass("newHeader")) {
                header.replaceWith(newHeader);
            }
        } else {
            // 스크롤이 120 이하이면 원래 헤더로 변경
            if (header.hasClass("newHeader")) {
                newHeader.replaceWith(header);
            }
        }
    });

    // 추가된 부분: 페이지 맨 위로 스크롤 할 때 기존 헤더로 복원
    $("html, body").on("scroll mousedown wheel DOMMouseScroll mousewheel keyup touchmove", function(){
        $('html, body').stop();	
    });

    // 페이지 상단을 클릭하면 맨 위로 스크롤
    $('.headerwrapper.newHeader').click(function(){
        $("html, body").animate({ scrollTop: 0 }, 600);
        return false;
    });
});
</script>

</body>
</html>