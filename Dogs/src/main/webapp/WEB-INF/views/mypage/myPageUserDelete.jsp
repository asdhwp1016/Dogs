<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link href="user/mypage/css/myMemberDelete.css" rel="stylesheet">
<script type="text/javascript" src="user/mypage/script/mypage.js"></script>
</head>
<body>
	<%@ include file="../includes/mainhf/header.jsp" %>
	<form method="post" name="myfrm"
		action="ShoesServlet?command=member_delete">
		<div id="wrap">
			<%@include file="myPageHeadSide.jsp"%>
			<div id="delete_wrap">
				<h2>회원탈퇴</h2>
				<div id="member_delete">
					<table>
						<colgroup>
							<col style="width: 130;">
							<col>
						</colgroup>
						<tr>
							<th>비밀번호 확인<span id="required">*</span></th>
							<td><input type="password" name="pwd"></td>
						</tr>
					</table>
					<input type="hidden" id="pwdValue" value="${mvo.pwd}" />
				</div>
				<div id="button">
					<input type="submit" value="탈퇴" id="delete"
						onclick="return deleteMember()">
				</div>
			</div>
		</div>
	</form>
	</div>
	<%@ include file="../includes/mainhf/footer.jsp" %>
</body>
</html>