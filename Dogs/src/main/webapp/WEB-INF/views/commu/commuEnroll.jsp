<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="../resources/css/commu/commuEnroll.css?after">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<form id="formEnroll" action="/commu/commuEnroll" method="post">
		<div class="board_wrap">
			<div class="board_title">
				<span>커뮤니티 페이지</span>
			</div>
			<div class="board_write_wrap">
				<div class="board_write">
					<div class="title">
						<dl>
							<dt>제목</dt>
							<dd>
								<input name="title" type="text" placeholder="제목 입력">
							</dd>
						</dl>
					</div>
					<div class="info">
						<dl>
							<dt>글쓴이</dt>
							<dd>
								<input name="writer" type="text" value='<c:out value="${user.userName}" />'>
							</dd>
						</dl>
						<dl>
							<dt>게시판 선택</dt>
							<dd>
								<select name="comCateCode" class="cate1">
									<option selected value="none">선택</option>
								</select>
							</dd>
						</dl>
					</div>
					<div class="cont">
						<textarea name="comContent" placeholder="내용 입력"></textarea>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="bt_wrap">
		<a class="btn on" id="enroll_btn">등록</a> 
		<a class="btn"id="cancel_btn">취소</a>
	</div>
	<script>
		let enrollForm = $("#formEnroll");

		// 등록 버튼
		$("#enroll_btn").on("click", function(e) {
			e.preventDefault();
			enrollForm.submit();
		});

		// 취소 버튼
		$("#cancel_btn").on("click", function(e) {
			enrollForm.attr("action", "/commu/commuContent");
			enrollForm.submit();
		});

		$(document).ready(function() {
			console.log('${cateList}');
		});

		// 카테고리
		let cateList = JSON.parse('${cateList}');

		let cate1Array = new Array();
		let cate1Obj = new Object();

		let cateSelect1 = $(".cate1");

		for (let i = 0; i < cateList.length; i++) {
			cate1Obj = new Object();

			cate1Obj.comCateCode = cateList[i].comCateCode;
			cate1Obj.comCateName = cateList[i].comCateName;

			cate1Array.push(cate1Obj);
		}

		$(document).ready(function(){
		 	console.log(cate1Array);
		 }); 

		for (let i = 0; i < cate1Array.length; i++) {
			cateSelect1.append("<option value='" + cate1Array[i].comCateCode + "'>"
							+ cate1Array[i].comCateName + "</option>");
		}
	</script>
</body>
</html>