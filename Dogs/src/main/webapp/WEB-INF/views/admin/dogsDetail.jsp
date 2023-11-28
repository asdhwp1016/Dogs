<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/dogsDetail.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
  <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>

</head>
<body>

<%@include file="../includes/admin/header.jsp" %>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>강아지 상품 상세</span></div>

                    <div class="admin_content_main">

                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="dogName" value="<c:out value="${dogsInfo.dogName}"/>" disabled>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>등록 날짜</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input value="<fmt:formatDate value='${dogsInfo.regDate}' pattern='yyyy-MM-dd'/>" disabled>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>최근 수정 날짜</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input value="<fmt:formatDate value='${dogsInfo.updateDate}' pattern='yyyy-MM-dd'/>" disabled>
                    			</div>
                    		</div>                    		                    		                    
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<div class="cate_wrap">
                    					<span>종류</span>
                    					<select class="cate3" name="dogCateCode" disabled>
                    						<option value="none">선택</option>
                    					</select>
                    				</div>                  				                    				
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="dogPrice" value="<c:out value="${dogsInfo.dogPrice}"/>" disabled>
                    			</div>
                    		</div>                          		        		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 특징</label>
                    			</div>
                    			<div class="form_section_content bit">
                    				<textarea name="dogPoint" id="dogPoint_textarea" disabled>${dogsInfo.dogPoint}</textarea>
                    			</div>
                    		</div>        		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 소개</label>
                    			</div>
                    			<div class="form_section_content bct">
                    				<textarea name="dogContent" id="dogContent_textarea" disabled>${dogsInfo.dogContent}</textarea>
                    			</div>
                    		</div>
                   		
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">강아지 목록</button>
	                    		<button id="modifyBtn" class="btn enroll_btn">수정 </button>
	                    	</div> 
                    </div>      

                	
                	<form id="moveForm" action="/admin/dogsManage" method="get" >
 						<input type="hidden" name="pageNum" value="${cri.pageNum}">
						<input type="hidden" name="amount" value="${cri.amount}">
						<input type="hidden" name="keyword" value="${cri.keyword}">
                	</form>
                	
                </div>




<script>

$(document).ready(function(){

	/* 강아지 특징 */
	ClassicEditor
		.create(document.querySelector('#dogPoint_textarea'))
		.then(editor => {
			console.log(editor);
			editor.isReadOnly = true;
		})
		.catch(error=>{
			console.error(error);
		});
		
	/* 강아지 소개 */	
	ClassicEditor
	.create(document.querySelector('#dogContent_textarea'))
	.then(editor => {
		console.log(editor);
		editor.isReadOnly = true;
	})
	.catch(error=>{
		console.error(error);
	});
	
	
	/*강아지 카테고리(종류)*/
	let dogCateList = JSON.parse('${dogCateList}');
	
	let cate3Array = new Array();
	let cate3Obj = new Object();
	
	let cateSelect3 = $(".cate3");
	
	/*강아지 카테고리 배열 초기화 메서드*/
	function makeCateArray(obj, array, dogCateList) {
		for(let i = 0; i < dogCateList.length; i++) {
			obj = new Object();
			
			obj.dCateName = dogCateList[i].dCateName;
			obj.dCateCode = dogCateList[i].dCateCode;
			
			array.push(obj);
		}
	}
	
	/*배열 초기화*/
	makeCateArray(cate3Obj, cate3Array, dogCateList, 3);
	
	let targetCate3 = '${dogsInfo.dogCateCode}';
	
	for(let i = 0; i < cate3Array.length; i++) {
		if(targetCate3 === cate3Array[i].dCateCode){
			targetCate3 = cate3Array[i];
		}
	}//for
	
	for(let i = 0; i < cate3Array.length; i++) {
		cateSelect3.append("<option value='"+cate3Array[i].dCateCode+"'>" + cate3Array[i].dCateName + "</option>");
	}
	
	$(".cate3 option").each(function(i, obj){
		if(targetCate3.dCateCode === obj.value){
			$(obj).attr("selected", "selected");
		}
	});
	
	
	/* 목록 이동 버튼 */
	$("#cancelBtn").on("click", function(e){
		e.preventDefault();
		$("#moveForm").submit();	
	});	
	
	/* 수정 페이지 이동 */
	$("#modifyBtn").on("click", function(e){
		e.preventDefault();
		let addInput = '<input type="hidden" name="dogId" value="${dogsInfo.dogId}">';
		$("#moveForm").append(addInput);
		$("#moveForm").attr("action", "/admin/dogsModify");
		$("#moveForm").submit();
	});
	

}); //$(document).ready

</script>


</body>
</html>