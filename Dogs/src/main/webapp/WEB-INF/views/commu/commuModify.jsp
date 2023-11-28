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
<form id="modifyForm" action="/commu/commuModify" method="post">
<div class="board_wrap">
        <div class="board_title">
            <span>커뮤니티 페이지</span>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                	<input name="title" value='<c:out value="${pageInfo.title}"/>'>
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd><input name="bno" readonly="readonly" value='<c:out value="${pageInfo.bno}"/>' ></dd>
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
                  <textarea rows="3" name="comContent"><c:out value="${pageInfo.comContent}"/></textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <a class="btn on" id="list_btn">목록</a> 
				<a class="btn" id="modify_btn">수정 하기</a>
				<a class="btn del" id="delete_btn">삭제</a>
				<a class="btn" id="cancel_btn">수정 취소</a>
            </div>
            
        </div>
    </div>
  </form>
    <form id="infoForm" action="/commu/commuModify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="type" value="${cri.type}"/>
		<input type="hidden" name="keyword" value="${cri.keyword}"> 
	</form>
    
<%-- <h1>조회 페이지</h1>
	<form id="modifyForm" action="/commu/commuModify" method="post">
		<div class="input_wrap">
			<label>게시판 번호</label>
			<input name="bno" readonly="readonly" value='<c:out value="${pageInfo.bno}"/>' >
		</div>
		<div class="input_wrap">
			<label>게시판 제목</label>
			<input name="title" value='<c:out value="${pageInfo.title}"/>' >
		</div>
		<div class="input_wrap">
			<label>게시판 내용</label>
			<textarea rows="3" name="comContent"><c:out value="${pageInfo.comContent}"/></textarea>
		</div>
		<div class="input_wrap">
			<label>게시판 작성자</label>
			<input name="writer" readonly="readonly" value='<c:out value="${pageInfo.writer}"/>' >
		</div>
		<div class="input_wrap">
			<label>게시판 등록일</label>
			<input name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regDate}"/>' >
		</div>
		<div class="input_wrap">
			<label>게시판 수정일</label>
			<input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>' >
		</div>		
		<div class="btn_wrap">
			<a class="btn" id="list_btn">목록 페이지</a> 
			<a class="btn" id="modify_btn">수정 완료</a>
			<a class="btn" id="delete_btn">삭제</a>
			<a class="btn" id="cancel_btn">수정 취소</a>
		</div>
	</form>
	<form id="infoForm" action="/commu/commuModify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="type" value="${cri.type}"/>
		<input type="hidden" name="keyword" value="${cri.keyword}">
	</form> --%>
	
<script>
	let form = $("#infoForm");
	let mForm = $("#modifyForm");
	
	//목록 페이지 이동 버튼
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/commu/commuList");
		form.submit();
	});
	
	// 수정하기 버튼
	$("#modify_btn").on("click", function(e){
		mForm.submit();
	});	
	
	// 취소 버튼
	$("#cancel_btn").on("click", function(e){
		form.attr("action", "/commu/commuContent");
		form.submit();
	});	
	
	// 삭제 버튼
	$("#delete_btn").on("click", function(e){
		form.attr("action", "/commu/commuDelete");
		form.attr("method", "post");
		form.submit();
	});	
</script>	
</body>
</html>