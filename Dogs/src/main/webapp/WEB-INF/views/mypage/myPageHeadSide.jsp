<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="user/mypage/css/myPageHeadSide.css" rel="stylesheet">
<script type="text/javascript" src="user/mypage/script/mypage.js"></script>
</head>
<body>
	<div id="title">
		<h1>마이페이지</h1>
	</div>
	<div id="side_wrap">
		<ul>
			<li id="side_span"><span>마이페이지</span>
				<ul>
					<li><a href="ShoesServlet?command=mypage">마이페이지</a></li>
				</ul></li>
			<li id="side_span"><span>쇼핑목록</span>
				<ul>
					<li><a href="ShoesServlet?command=cart_list">장바구니</a></li>
					<li><a href="ShoesServlet?command=mypage">주문목록</a></li>
				</ul></li>
			<li id="side_span"><span>개인정보</span>
				<ul>
					<li><a href="ShoesServlet?command=member_update_form">개인정보수정</a></li>
					<li><a href="ShoesServlet?command=pwd_update_form">비밀번호변경</a></li>
					<li><a href="ShoesServlet?command=member_delete_form">회원탈퇴</a></li>
				</ul>
				</li>
				<li id="side_span"><span>Q&A</span>
				<ul>
					<li><a href="ShoesServlet?command=qna_list">나의 질문</a></li>
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
				<div id="cart">
					<img src="user/mypage/myImages/cart.png" alt="장바구니">주문내역
					<a href="#">${orderList.size()}<span id="bucket_count">개</span></a>
				</div>
				<div id="heart">
					<img src="user/mypage/myImages/heart.png" alt="찜">찜한상품
					<a href="#">${zzim.size()}<span id="heart_count">개</span></a>
				</div>
			</div>
		</div>
</body>
</html>