<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/dogsEnroll.css?after">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
  <!-- 위지윅 기능 -->
<script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>
</head>
</head>
<body>
 
    	<%@include file="../includes/admin/header.jsp" %>
    
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>강쥐 등록</span></div>
                    <div class="admin_content_main">
                    	<form action="/admin/dogsEnroll" method="post" id="enrollForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="dogName">
                    			</div>
                    		</div>           
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="dogCateCode">
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="dogPrice" value="0">
                    			</div>
                    		</div>                                 		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 특징</label>
                    			</div>
                    			<div class="form_section_content">
                    				<textarea name="dogPoint" id="dogPoint_textarea"></textarea>
                    			</div>
                    		</div>        		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 소개</label>
                    			</div>
                    			<div class="form_section_content">
                    				<textarea name="dogContent" id="dogContent_textarea"></textarea>
                    			</div>
                    		</div>
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
	                    	</div> 
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
      
        
    </div>    <!-- class="wrap" -->
</div>    <!-- class="wrapper" -->
 
 
<script>

	let enrollForm = $("#enrollForm")
	
/* 취소 버튼 */
$("#cancelBtn").click(function(){
	
	location.href="/admin/goodsManage"
	
});

/* 상품 등록 버튼 */
$("#enrollBtn").on("click",function(e){
	
	e.preventDefault();
	
	enrollForm.submit();
	
});


/* 위지윅 적용 */

/* 강아지 특징 */
ClassicEditor
	.create(document.querySelector('#dogPoint_textarea'))
	.catch(error=>{
		console.error(error);
	});
	
/* 강아지 소개 */	
ClassicEditor
.create(document.querySelector('#dogContent_textarea'))
.catch(error=>{
	console.error(error);
});

</script>
 
 
</body>
</html>