<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- <link href="css/myMain.css" rel="stylesheet"> -->
<link rel="stylesheet" href="../resources/css/mypage/myPagePwdUpdate.css?v=1">
<meta charset="UTF-8">
<title>비밀번호변경</title>
</head>
<body>
   <%@ include file="../includes/mainhf/header.jsp" %>
   <form action="ShoesServlet?command=update_pwd" name="myfrm" method="post">
      <div id="wrap">
      	<%@include file="myPageHeadSide.jsp" %>
            <div id="pwd_change_wrap">
               <h2>비밀번호 변경</h2>
               <div id="pwd_change">
                  <table>
                     <colgroup>
                        <col style="width: 130;">
                        <col>
                     </colgroup>
                     <tr>
                        <th>아이디</th>
                        <td><input type="text" name="id" value="${mvo.id}" readonly></td>
                     </tr>
                     <tr>
                        <th>새 비밀번호<span id="required">*</span></th>
                        <td><input type="password" name="pwd"></td>
                     </tr>
                     <tr>
                        <th>비밀번호 확인<span id="required">*</span></th>
                        <td><input type="password" name="pwd_check"></td>
                     </tr>
                  </table>
               </div>
               <div id="button">
                  <input type="submit" value="변경" id="change" onclick="return pwdCheck()">
               </div>
            </div>
         </div>
         </div>
   </form>
   <%@ include file="../includes/mainhf/footer.jsp" %>
</body>
</html>