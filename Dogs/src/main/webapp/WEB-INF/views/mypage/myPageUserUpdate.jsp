<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link href="css/myMain.css" rel="stylesheet"> -->
<link rel="stylesheet" href="../resources/css/mypage/myPageUserUpdate.css?v=1">
<meta charset="UTF-8">
<title>개인정보수정</title>
</head>
<body>
	<%@ include file="../includes/mainhf/header.jsp" %>
	<form action="ShoesServlet?command=update_member" method="post"
		name="myfrm">
		<div id="wrap">
			<%@include file="myPageHeadSide.jsp"%>
			<div id="member_update_wrap">
				<h2>개인정보 수정</h2>
				<div id="member_update">
					<table>
						<colgroup>
							<col style="width: 130;">
							<col>
						</colgroup>
						<tr>
							<th>이름<span id="required">*</span></th>
							<td><input style="border: none; font-weight: bold; font-size:14px" type="text" name="name" value="${mvo.name}" readonly></td>
						</tr>
						<tr>
							<th>아이디<span id="required">*</span></th>
							<td><input style="border: none; font-weight: bold; font-size:14px" type="text" name="id" value="${mvo.id}" readonly> </td>
						</tr>
						<tr>
							<th>이메일<span id="required">*</span></th>
							<td><input type="text" name="email"
								placeholder="${mvo.email}"></td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td><input type="text" name="phone"
								placeholder="${mvo.phone}"></td>
						</tr>
						<tr>
							<th>비밀번호 확인<span id="required">*</span></th>
							<td><input type="password" name="pwd"></td>
						</tr>
					</table>
					<input type="hidden" id="pwdValue" value="${mvo.pwd}" />
				</div>
				<div id="button">
					<input type="submit" value="변경" id="submit"
						onclick="return updateCheck()">
				</div>
			</div>
		</div>
		</div>
	</form>
	<%@ include file="../includes/mainhf/footer.jsp" %>
</body>
</html>