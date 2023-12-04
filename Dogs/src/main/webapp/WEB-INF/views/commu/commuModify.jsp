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
<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
</style>
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
                <div class="form_section">
           			<div class="form_section_title">
           				<label>상품 이미지</label>
           			</div>
           			<div class="form_section_content">
						<input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
						<div id="uploadResult">
								
						</div>	
           			</div>
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
	        str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
	        str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
	        str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
	        str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
	        str += "</div>";     
	        
	        uploadResult.html(str);                        
	        
	    });   
	    
	    /* 이미지 삭제 버튼 동작 */
	    $("#uploadResult").on("click", ".imgDeleteBtn", function(e){
	        deleteFile();
	        
	    });
	    
	    /* 파일 삭제 메서드 */
	    function deleteFile(){
	        
	        $("#result_card").remove();
	        
	    }
	    
	    /* 이미지 업로드 */
	    $("input[type='file']").on("change", function(e) {
	        
	        /* 이미지 존재시 삭제 */
	        if($("#result_card").length > 0){
	            deleteFile();
	        }
	        
	        let formData = new FormData();
	        let fileInput = $('input[name="uploadFile"]');
	        let fileList = fileInput[0].files;
	        let fileObj = fileList[0];
	        
	        for(let i = 0; i < fileList.length; i++) {
	            formData.append("uploadFile", fileObj);                
	        }
	        
	        $.ajax({
	            url: '/commu/imgUploadCommu',
	            processData: false,
	            contentType: false,
	            data: formData,
	            type: 'POST',
	            dataType: 'json',
	            success : function(result){
	                console.log(result);
	                showUploadImage(result);
	            },
	            error : function(result){
	                alert("이미지 파일이 아닙니다.");
	            }
	        });
	        
	    });
	    
	    // var , method, related with attachFile
	    let regex = new RegExp("(.*?)\.(jpg|png)$");
	    let maxSize = 1048576;
	    
	    function fileCheck(fileName, fileSize) {
	        if(fileSize >= maxSize) {
	            alert("파일 사이즈 초과");
	            return false;
	        }
	        
	        if(!regex.test(fileName)) {
	            alert("해당 종류의 파일은 업로드 할 수 없습니다.");
	            return false;
	        }
	        
	        return true;
	    }
	    
	    /* 이미지 출력 */
	    function showUploadImage(uploadResultArr){
	        
	        /* 전달받은 데이터 검증 */
	        if(!uploadResultArr || uploadResultArr.length == 0){return}
	        
	        let uploadResult = $("#uploadResult");
	        
	        let obj = uploadResultArr[0];
	        
	        let str = "";
	        
	        let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
	        
	        str += "<div id='result_card'>";
	        str += "<img src='/commu/commuDisplay?fileName=" + fileCallPath +"'>";
	        str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
	        str += "<input type='hidden' name='comImageList[0].fileName' value='"+ obj.fileName +"'>";
	        str += "<input type='hidden' name='comImageList[0].uuid' value='"+ obj.uuid +"'>";
	        str += "<input type='hidden' name='comImageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
	        str += "</div>";     
	        
	        uploadResult.append(str);
	        
	    }
	});
</script>	
</body>
</html>