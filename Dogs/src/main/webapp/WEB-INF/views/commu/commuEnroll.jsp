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
	.ck_warn{
	display: none;
    padding-top: 10px;
    text-align: center;
    color: #e05757;
    font-weight: 300;
    font-size: 16px !important; 
}
	
</style>
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
							<dd><span class="ck_warn title_warn">제목을 입력해주세요</span></dd>
						</dl>
					</div>
					<div class="info">
						<dl>
							<dt>글쓴이</dt>
							<dd>
								<input name="writer" type="text" value="${user.userName}" />
							</dd>
						</dl>
						<dl>
							<dt>게시판 선택</dt>
							<dd>
								<select name="comCateCode" class="cate1">
									<option selected value="none">선택</option>
								</select>
							</dd>
							<dd>
								<span class="ck_warn cate1_warn">글을 올릴 게시판을 선택해주세요.</span>
							</dd>
						</dl>
					</div>
					<div class="cont">
						<textarea name="comContent" placeholder="내용 입력"></textarea>
						<span class="ck_warn comContent_warn">내용을 입력해주세요.</span>
					</div>
					<div class="form_section">
						<div class="form_section_content">
							<input type="file" id="fileItem" name="uploadFile" style="height:30px;" multiple="multiple">
							<div id="uploadResult">
								<!-- <div id="result_card">
									<div class="imgDeleteBtn">x</div>
									<img src="/commu/commuDisplay?fileName=test.png">
								</div> -->
							</div>
						</div>
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
			
			let titleCk = null;
			let writerCk = null;
			let comCateCodeCk = null;
			let comContentCk = null;
			
			let title = $("input[name='title']").val();
			let writer = $("input[name='writer']").val();
			let comCateCode = $("select[name='comCateCode']").val();
			let comContent = $(".cont p").html();
			
			if(title){
				$(".title_warn").css('display','none');
				titleCk = true;
			} else {
				$(".title_warn").css('display','block');
				titleCk = false;
			}
			
			if(writer){
				$(".writer_warn").css('display','none');
				writerCk = true;
			} else {
				$(".writer_warn").css('display','block');
				writerCk = false;
			}
			
			if(comCateCode != 'none'){
				$(".cate1_warn").css('display','none');
				comCateCodeCk = true;
			} else {
				$(".cate1_warn").css('display','block');
				comCateCodeCk = false;
			}	
			
			if(comContent != '<br data-cke-filler="true"'){
				$(".comContent_warn").css('display','none');
				comContentCk = true;
			} else {
				$(".comContent_warn").css('display','block');
				comContentCk = false;
			}
			
			if(titleCk && writerCk && comCateCodeCk && comContentCk){
				enrollForm.submit();
			} else {
				return false;
			}
			
		});

		// 취소 버튼
		$("#cancel_btn").on("click", function(e) {
			location.href = '/commu/commuList'
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
		
		/* 이미지 업로드 */
		$("input[type='file']").on("change", function(e) {
			
			/* 이미지 존재시 삭제 */
			if($(".imgDeleteBtn").length > 0){
				deleteFile();
			}
			
			let formData = new FormData();
			let fileInput = $('input[name="uploadFile"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];
			/* 
			if(!fileCheck(fileObj.name, fileObj.size)) {
				return false;
			}
			 */
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
		
		/* 이미지 삭제 버튼 동작 */
		$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
			deleteFile();
			
		});
		
		/* 파일 삭제 메서드 */
		function deleteFile(){
			
			let targetFile = $(".imgDeleteBtn").data("file");
			
			let targetDiv = $("#result_card");
			
			$.ajax({
				url: '/commu/deleteFileCommu',
				data : {fileName : targetFile},
				dataType : 'text',
				type : 'POST',
				success : function(result){
					console.log(result);
					targetDiv.remove();
					$("input[type='file']").val("");
					
				},
				error : function(result){
					console.log(result);
					alert("파일을 삭제하지 못하였습니다.")
				}
			});
		}
	</script>
</body>
</html>