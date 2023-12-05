<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link href="css/myMain.css" rel="stylesheet"> -->
<link href="user/mypage/css/myMain.css" rel="stylesheet">
<script type="text/javascript" src="user/script/product.js"></script>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<%@ include file="../includes/mainhf/header.jsp" %>
	<div id="wrap">
		<%@include file="myPageHeadSide.jsp"%>
		<div id="order_wrap">
			<h2>주문 목록</h2>
			<div id="order_list_table">
				<table>
					<tr id="order_list">
						<th>주문일자</th>
						<th>주문번호</th>
						<th>상품명</th>
						<th>결제금액</th>
						<th>주문처리</th>
					</tr>
					<c:forEach items="${orderList}" var="orderVO">
						<tr>
							<td><fmt:formatDate value="${orderVO.indate}" type="date" /></td>
							<td>${orderVO.oseq}</td>
							<td>${orderVO.pname}</td>
							<td><fmt:formatNumber value="${orderVO.price}"
									pattern="###,###" />원</td>
							<td>진행중</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div id="heart_wrap">
			<h2>찜 목록</h2>
			<div id="heart_item">
				<ul id="heart_product">
					<form name="frm" method="post">
						<c:choose>
							<c:when test="${zzim.size() == 0}">
								<h1 style="text-align: center; margin-top: 50px;">찜 목록이
									비었습니다.</h1>
							</c:when>
							<c:otherwise>
								<c:forEach items="${zzim}" var="zzim">
									<li><a
										href="ShoesServlet?command=product_detail&shoescode=${zzim.shoescode}">
											<div id="heart_img">
												<img src="product_images/${zzim.infoimg}" />
											</div>
											<div id="heart_info">
												<div id="brand">${zzim.brand}</div>
												<div id="shoes_name">${zzim.pname}</div>
									</a>
										<div id="info_bottom">
											<span id="price"><fmt:formatNumber
													value="${zzim.price}" />원</span> <span id="zzim"> <img
												alt="찜" src="user/mypage/myImages/zzim.png" />
											</span>
										</div></li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</form>
				</ul>
			</div>
		</div>
	</div>
	</div>
<%@ include file="../includes/mainhf/footer.jsp" %>
</body>