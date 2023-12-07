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
<link rel="stylesheet" href="../resources/css/commu/commuContent.css?v=1">
<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
</style>
</head>
<body>
	<%@ include file="../includes/mainhf/header.jsp" %>
	<div class="wrap">
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
	                <div class="form_section">
	           			<div class="form_section_content">
							<div id="uploadResult">
													
							</div>
	           			</div>
	           		</div>
	           		<c:set var="user" value="${user}" />
	           		<c:if test="${not empty user.userId}">
	           		<button class="reviewBtn">댓글 쓰기</button>
	           			<div class="reply">
	           				
		           		</div>
		        	</c:if>
		        	<c:set var="pageInfo" value="${pageInfo}" />
	        		<c:forEach items="${reply}" var="reply">
	        			<c:if test="${pageInfo.bno == reply.bno}">
	        			<div class="replyContentWrap">
						    <div class="replyUserId">
						        <c:out value="${reply.userId}" />
						        <span class="replyDate"><fmt:formatDate pattern="yyyy-MM-dd" value="${reply.regDate}" /></span>
						        <c:if test="${user.userId == reply.userId}">
						    		<button class="replyDelete" id="${reply.replyId}">삭제</button>
						    	</c:if>
						    </div>
						    <div class="replyContent">
						        ${reply.content};
						    </div>
					   </div>
					   </c:if>
					</c:forEach>
	            </div>
	            <c:set var="user" value="${user}" />
	            <c:set var="pageInfo" value="${pageInfo}" />
	            <div class="bt_wrap">
	                <a class="btn on" id="list_btn">목록</a> 
	                <c:if test="${user.userName == pageInfo.writer}">
						<a class="btn" id="modify_btn">수정 하기</a>
					</c:if>
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
    </div>
    <%@ include file="../includes/mainhf/footer.jsp" %>
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
	
	$(document).ready(function() {
		/* 이미지 정보 호출 */
		let bno = '<c:out value="${pageInfo.bno}"/>';
		let uploadResult = $("#uploadResult");			
		
		$.getJSON("/commu/getComAttachList", {bno : bno}, function(arr){
			
			if(arr.length === 0){
				
				let str = "";
				str += "<div id='result_card'>";
				str += "<img src='/resources/img/comNoImage.png'>";
				str += "</div>";
				
				uploadResult.html(str);
				return;
			}
			
			let str = "";
			let obj = arr[0];	
			
			let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='/commu/commuDisplay?fileName=" + fileCallPath +"'>";
			str += "</div>";		
			
			uploadResult.html(str);						
			
		});	
	});
	
	let clickCount = 0;

	$(".reviewBtn").on("click", function(e) {
	    let reply = $(".reply");

	    clickCount++; 

	    if (clickCount % 2 !== 0) {
	        let str = "";
	        str += '<div class="replyTitle">댓글</div>';
	        str += '<div class="replyWrap">';
	        str += '<textarea name="reply" placeholder="댓글 입력"></textarea>';
	        str += '<div class="replyEnrollWrap">';
	        str += '<button class="replyEnroll">등록</button>';
	        str += '</div>';
	        str += '</div>';
	        reply.append(str);
	        $(this).text('댓글 취소'); // 버튼 텍스트 변경
	    } else {
	        // 짝수 번째 클릭일 때 댓글 닫기
	        $(".replyTitle, .replyWrap").remove();
	        $(this).text('댓글 쓰기'); // 버튼 텍스트 변경
	    }
	});
	
	/* 등록 버튼 */
	$(document).on("click", ".replyEnroll", function(e) {
    const bno = '${pageInfo.bno}';
    const userId = '${user.userId}';
    const content = $("textarea").val();

    const data = {
        bno: bno,
        userId: userId,
        content: content
    }

    $.ajax({
        data: data,
        type: 'POST',
        url: '/reply/enroll',
        success: function(result) {
            alert("댓글이 등록되었습니다!");
            return location.reload();
        	}
    	});
	});
	
	/* 리뷰 삭제 버튼 */
	 $(".replyDelete").on('click', function(e){

		let replyId = $(this).attr('id');
		
		$.ajax({
			data : {
				replyId : replyId,
				bno : '${pageInfo.bno}'
			},
			url : '/reply/delete',
			type : 'POST',
			success : function(result){
				alert('삭제가 완료되엇습니다.');
				return location.reload();
			}
		});		
			
	 });
	
</script>	
</body>
</html>