<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/dogsEnroll.css?v=1">
 
<script src="https://code.jquery.com/jquery-3.4.1.js"
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
                    	<form action="/admin/dogsEnroll" method="post" id="enrollForm" enctype="multipart/form-data">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="dogName">
                    				<span class="ck_warn dogName_warn">강아지 이름을 입력해주세요.</span>
                    			</div>
                    		</div>           
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<div class="cate_wrap">
										<span>종류</span>
										<select class="cate3" name="dogCateCode">
											<option selected value="none">선택</option>
										</select>
									</div>
									<span class="ck_warn dogCateCode_warn">종류를 선택해주세요.</span> 
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="dogPrice" value="0">
                    				<span class="ck_warn dogPrice_warn">강아지 가격을 입력해주세요.</span>
                    			</div>
                    		</div>                                 		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 특징</label>
                    			</div>
                    			<div class="form_section_content bit">
                    				<textarea name="dogPoint" id="dogPoint_textarea"></textarea>
                    				<span class="ck_warn dogPoint_warn">강아지 특징을 입력해주세요.</span>
                    			</div>
                    		</div>        		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 소개</label>
                    			</div>
                    			<div class="form_section_content bct">
                    				<textarea name="dogContent" id="dogContent_textarea"></textarea>
                    				<span class="ck_warn dogContent_warn">강아지 소개를 입력해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>메인 이미지</label>
                    			</div>
                    			<div class="form_section_content">
									<input type="file" multiple id ="fileMain" name='uploadFile' style="height: 30px;">
									<div id="uploadResult">
									<!--<div id="result_card">
										<div class="imgDeleteBtn">x</div>
										<img src="/display?fileName=img.png">
									</div>-->
									</div>
                    			</div>
                    		</div>  
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상세 이미지1</label>
                    			</div>
                    			<div class="form_section_content">
									<input type="file" multiple id ="fileSub1" name='uploadFile' style="height: 30px;">
									<div id="uploadResult1">
									<!--<div id="result_card">
										<div class="imgDeleteBtn">x</div>
										<img src="/display?fileName=img.png">
									</div>-->
									</div>
                    			</div>
                    		</div> 
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상세 이미지2</label>
                    			</div>
                    			<div class="form_section_content">
									<input type="file" multiple id ="fileSub2" name='uploadFile' style="height: 30px;">
									<div id="uploadResult2">
									<!--<div id="result_card">
										<div class="imgDeleteBtn">x</div>
										<img src="/display?fileName=img.png">
									</div>-->
									</div>
                    			</div>
                    		</div> 
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 이미지3</label>
                    			</div>
                    			<div class="form_section_content">
									<input type="file" multiple id ="fileSub3" name='uploadFile' style="height: 30px;">
									<div id="uploadResult3">
									<!--<div id="result_card">
										<div class="imgDeleteBtn">x</div>
										<img src="/display?fileName=img.png">
									</div>-->
									</div>
                    			</div>
                    		</div> 
                   		</form>
                   		<div class="btn_section">
                   			<button id="cancelBtn" class="btn">취 소</button>
            				<button id="enrollBtn" class="btn enroll_btn">등 록</button>
	                    </div> 
                    </div>
                </div>

 
<script>

	let enrollForm = $("#enrollForm")
	
/* 취소 버튼 */
$("#cancelBtn").click(function(){
	
	location.href="/admin/dogsManage"
	
});

/* 상품 등록 버튼 */
$("#enrollBtn").on("click",function(e){
	
	e.preventDefault();
	
	/*체크 변수*/
	let dogNameCk = false;
	let dogCateCodeCk = false;
	let dogPriceCk = false;
	let dogPointCk = false;
	let dogContentCk = false;
	
	/*체크 대상 변수*/
	let dogName = $("input[name='dogName']").val();
	let dogCateCode = $("select[name='dogCateCode']").val();
	let dogPrice = $("input[name='dogPrice']").val();
	let dogPoint = $(".bit p").html();
	let dogContent = $(".bct p").html();
	
	/*공란 체크*/
	if(dogName) {
		$(".dogName_warn").css('display', 'none');
		dogNameCk = true;
	} else {
		$(".dogName_warn").css('display', 'block');
		dogNameCk = false;
	}
	
	if(dogCateCode != 'none' && dogCateCode !== null) {
		$(".dogCateCode_warn").css('display', 'none');
		dogCateCodeCk = true;
	} else {
		$(".dogCateCode_warn").css('display', 'block');
		dogCateCodeCk = false;
	}
	
	if(dogPrice != 0) {
		$(".dogPrice_warn").css('display', 'none');
		dogPriceCk = true;
	} else {
		$(".dogPrice_warn").css('display', 'block');
		dogPriceCk = false;
	}
	
	if(dogPoint == '<br data-cke-filler="true">') {
		$(".dogPoint_warn").css('display','block');
		dogPointCk = false;
	} else {
		$(".dogPoint_warn").css('display','none');
		dogPointCk = true;
	}
	
	if(dogPoint == '<br data-cke-filler="true">'){
        $(".dogPoint_warn").css('display','block');
        dogPointCk = false;
     } else {
    	 $(".dogPoint_warn").css('display','none');
    	 dogPointCk = true;
     }   
     
     if(dogContent == '<br data-cke-filler="true">'){
        $(".dogContent_warn").css('display','block');
        dogContentCk = false;
     } else {
    	 $(".dogContent_warn").css('display','none');
    	 dogContentCk = true;
     }
	
	if(dogNameCk && dogCateCodeCk && dogPriceCk && dogPointCk && dogContentCk) {
		enrollForm.submit();
	} else {
		return false;
	}
	
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

/* $(document).ready(function(){
	console.log('${dogCateList}');
}) */

/*강아지 카테고리*/
 let dogCateList = JSON.parse('${dogCateList}');
 
 let cate3Array = new Array();
 let cate3Obj = new Object();
 
 let cateSelect3 = $(".cate3");
 
 /*강아지 카테고리 배열 초기화 메서드*/
 function makeCateArray(obj,array,dogCateList) {
	 for(let i = 0; i < dogCateList.length; i++) {
		 obj = new Object();
		 
		 obj.dCateName = dogCateList[i].dCateName;
		 obj.dCateCode = dogCateList[i].dCateCode;
		 
		 array.push(obj);
	 }
 }
 
 /*강아지 카테고리 배열 초기화*/
 makeCateArray(cate3Obj, cate3Array, dogCateList,3);
 
 /*
 $(document).ready(function(){
	console.log(cate3Array); 
 });
 */
 
 /*강아지 종류 분류 option태그*/
 for(let i = 0; i < cate3Array.length; i++){
		cateSelect3.append("<option value='"+cate3Array[i].dCateCode+"'>" + cate3Array[i].dCateName + "</option>");
 }
 
 
 /*파일 이미지 업로드*/
 $("input[type='file']").on("change", function (e) {
	    // 이미지 존재시 삭제
	    if ($(this).siblings(".imgDeleteBtn").length > 0) {
	        deleteFile($(this).siblings(".imgDeleteBtn").data("file"));
	    }

	    let formData = new FormData();
	    let fileInput = $(this);
	    let fileList = fileInput[0].files;

	    for (let i = 0; i < fileList.length; i++) {
	        formData.append("uploadFile", fileList[i]);
	    }

	    $.ajax({
	        url: '/admin/uploadAjaxAction',
	        processData: false,
	        contentType: false,
	        data: formData,
	        type: 'POST',
	        dataType: 'json',
	        success: function (result) {
	            // 동적으로 결정된 uploadResult에 이미지 출력
	            let uploadResultId = $(e.target).attr("id").replace("file", "uploadResult");
	            showUploadImage(result, uploadResultId);
	        },
	        error: function (result) {
	            alert("이미지 파일이 아닙니다.");
	        }
	    });
	});

	// 이미지 출력
	function showUploadImage(uploadResultArr, uploadResultId) {
	    // 전달받은 데이터 검증
	    if (!uploadResultArr || uploadResultArr.length === 0) {
	        return;
	    }

	    let uploadResult = $("#" + uploadResultId);
	    let obj = uploadResultArr[0];
	    let str = "";
	    let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);

	    str += "<div id='result_card'>";
	    str += "<img src='/display?fileName=" + fileCallPath + "'>";
	    str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
	    str += "<input type='hidden' name='imageList[0].fileName' value='" + obj.fileName + "'>";
	    str += "<input type='hidden' name='imageList[0].uuid' value='" + obj.uuid + "'>";
	    str += "<input type='hidden' name='imageList[0].uploadPath' value='" + obj.uploadPath + "'>";
	    str += "</div>";

	    uploadResult.html(str);
	}

	// 이미지 삭제 버튼 동작
	$(document).on("click", ".imgDeleteBtn", function () {
	    deleteFile($(this).data("file"));
	});

	// 파일 삭제 메서드
	function deleteFile(targetFile) {
	    let targetDiv = $("#result_card");

	    $.ajax({
	        url: '/admin/deleteFile',
	        data: { fileName: targetFile },
	        dataType: 'text',
	        type: 'POST',
	        success: function (result) {
	            console.log(result);
	            targetDiv.remove();
	            $("input[type='file']").val("");
	        },
	        error: function (result) {
	            console.log(result);
	            alert("파일을 삭제하지 못하였습니다.")
	        }
	    });
	}
	
	
</script>
 
 
</body>
</html>