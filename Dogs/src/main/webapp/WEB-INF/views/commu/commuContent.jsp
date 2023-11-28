<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/commu/commuContent.css?after">
</head>
<body>
	<div class="board_wrap">
        <div class="board_title">
            <span>커뮤니티 페이지</span>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                    <c:out value="${pageInfo.title}"/>
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd><c:out value="${pageInfo.bno}"/></dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><c:out value="${pageInfo.writer}" /></dd>
                    </dl>
                    <dl>
                        <dt>글 작성일</dt>
                        <dd><fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regDate}"/></dd>
                    </dl>
                    <dl>
                        <dt>글 수정일</dt>
                        <dd><fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/></dd>
                    </dl>
                </div>
                <div class="cont">
                  <c:out value="${pageInfo.comContent}"/>
                </div>
            </div>
            <div class="bt_wrap">
                <a class="btn on" id="list_btn">목록</a> 
				<a class="btn" id="modify_btn">수정 하기</a>
            </div>
            <form id="infoForm" action="/commu/commuModify" method="get">
				<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name="type" value="${cri.type}"/>
				<input type="hidden" name="keyword" value="${cri.keyword}"> 
			</form>
        </div>
    </div>
    
<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/commu/commuList");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/commu/commuModify");
		form.submit();
	});	
</script>	
</body>
</html>