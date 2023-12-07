<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/mypage/myPageHeadSide.css?v=1">

</head>
<body>
<div id="headSide">
	<div id="title">
		<h1><a href="/mypage/myPageMain">마이페이지</a></h1>
	</div>
	<div id="side_wrap">
		<ul>
			<li id="side_span"><span>개인정보</span>
				<ul>
					<li><a href="/mypage/myPageUserUpdate">개인정보수정</a></li>
					<li><a href="/mypage/myPagePwdUpdate">비밀번호변경</a></li>
					<li><a href="/mypage/myPageUserDelete">회원탈퇴</a></li>
				</ul>
				</li>
				<li id="side_span"><span>방문예약</span>
				<ul>
					<li><a href="#">예약확인</a></li>
				</ul>
				</li>
		</ul>
	</div>
	<div id="content">
		<div id="member_info">
			<div id="member_name">
				${mvo.name}님은 <span id="member_lev">온라인 회원</span>입니다.
			</div>
			<div id="member_goods">
				<h1>PUPPY를 이용해주시는 고객님께 감사드립니다.</h1>
			</div>
		</div>
	</div>
	</div>
</body>
</html>