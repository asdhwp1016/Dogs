<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/commu/commuList.css?after">
</head>
<body>
<%@ include file="../includes/mainhf/header.jsp" %>
	<div class="wrap">
	<div class="table_wrap">
		<div class="commTop">
			<div class="commTitle">커뮤니티 페이지</div>
			<a href="/commu/commuEnroll" class="top_btn">게시판 등록</a>
		</div>
		<table class="commTable">
			<thead>
				<tr>
					<th class="bno_width">번호</th>
					<th class="title_width">제목</th>
					<th class="writer_width">작성자</th>
					<th class="regdate_width">작성일</th>
					<th class="updatedate_width">수정일</th>
				</tr>
			</thead>
			<c:forEach items="${commuList}" var="list">
				<tr>
					<td><c:out value="${list.bno}" /></td>
					<td><a class="move" href='<c:out value="${list.bno}"/>'>
			                [<c:forEach items="${cateList}" var="cate">
				                <c:if test="${cate.comCateCode eq list.comCateCode}">
				                    <c:out value="${cate.comCateName}" />
				                </c:if>
			                </c:forEach>]
            			<c:out value="${list.title}" />
						</a>
					</td>
					<td><c:out value="${list.writer}" /></td>
					<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regDate}" /></td>
					<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updateDate}" /></td>
				</tr>
			</c:forEach>
		</table>

		<div class="search_wrap">
			<div class="search_area">
				<select name="type">
					<option value=""
						<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
					<option value="T"
						<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
					<option value="C"
						<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
					<option value="W"
						<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
					<option value="TC"
						<c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목
						+ 내용</option>
					<option value="TW"
						<c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목
						+ 작성자</option>
					<option value="TCW"
						<c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목
						+ 내용 + 작성자</option>
				</select> <input type="text" name="keyword" value="${pageMaker.cri.keyword}">
				<button>Search</button>
			</div>
		</div>

		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
					<!-- 이전페이지 버튼 -->
					<c:if test="${pageMaker.prev}">
						<li class="pageInfo_btn previous"><a
							href="${pageMaker.startPage-1}">Previous</a></li>
					</c:if>
					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":""}"><a
							href="${num}">${num}</a></li>
					</c:forEach>
					<!-- 다음페이지 버튼 -->
					<c:if test="${pageMaker.next}">
						<li class="pageInfo_btn next"><a
							href="${pageMaker.endPage + 1 }">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>

		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
			<input type="hidden" name="type" value="${pageMaker.cri.type }">
		</form>
	</div>
	</div>
	<%@ include file="../includes/mainhf/footer.jsp" %>
	<script>
		$(document).ready(function() {
			let result = '<c:out value="${result}"/>';

			checkAlert(result);

			function checkAlert(result) {

				if (result === '') {
					return;
				}

				if (result === "enroll Success") {
					alert("등록이 완료되었습니다.");
				}

				if (result === "modify Success") {
					alert("수정이 완료되었습니다.");
				}

				if (result === "delete Success") {
					alert("삭제가 완료되었습니다.");
				}

			}

		});

		let moveForm = $("#moveForm");

		$(".move").on("click",function(e) {
			e.preventDefault();

			moveForm.append("<input type='hidden' name='bno' value='"
					+ $(this).attr("href") + "'>");
			moveForm.attr("action", "/commu/commuContent");
			moveForm.submit();
		});

		$(".pageInfo a").on("click", function(e) {

			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/commu/commuList");
			moveForm.submit();

		});

		$(".search_area button").on("click", function(e) {
			e.preventDefault();

			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();

			if (!type) {
				alert("검색 종류를 선택하세요.");
				return false;
			}

			if (!keyword) {
				alert("키워드를 입력하세요.");
				return false;
			}

			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
			
		});
	</script>
</body>
</html>