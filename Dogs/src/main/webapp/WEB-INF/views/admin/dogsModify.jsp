<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/dogsModify.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
 <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
</head>
<body>

				<%@include file="../includes/admin/header.jsp" %>
				
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>강쥐 등록</span></div>
                    <div class="admin_content_main">
                    	<form action="/admin/dogsModify" method="post" id="modifyForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="dogName" value="${dogsInfo.dogName}">
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
                    				<input name="dogPrice" value="${dogsInfo.dogPrice}">
                    				<span class="ck_warn dogPrice_warn">강아지 가격을 입력해주세요.</span>
                    			</div>
                    		</div>                               		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 특징</label>
                    			</div>
                    			<div class="form_section_content bit">
                    				<textarea name="dogPoint" id="dogPoint_textarea">${dogsInfo.dogPoint}</textarea>
                    				<span class="ck_warn dogPoint_warn">강아지 소개를 입력해주세요.</span>
                    			</div>
                    		</div>        		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>강아지 소개</label>
                    			</div>
                    			<div class="form_section_content bct">
                    				<textarea name="dogContent" id="dogContent_textarea">${dogsInfo.dogContent}</textarea>
                    				<span class="ck_warn dogContent_warn">강아지 소개를 입력해주세요.</span>
                    			</div>
                    		</div>
                    		<input type="hidden" name='dogId' value="${dogsInfo.dogId}">
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="modifyBtn" class="btn modify_btn">수 정</button>
	                    		<button id="deleteBtn" class="btn delete_btn">삭 제</button>
	                    	</div> 
                    </div>  
                	<form id="moveForm" action="/admin/dogsManage" method="get" >
 						<input type="hidden" name="pageNum" value="${cri.pageNum}">
						<input type="hidden" name="amount" value="${cri.amount}">
						<input type="hidden" name="keyword" value="${cri.keyword}">
						<input type="hidden" name='dogId' value="${dogsInfo.dogId}">
                	</form>                     
                </div>
 
 				


<script>

$(document).ready(function(){
	
    /* 강아지 카테고리(종류) */
    let dogCateList = JSON.parse('${dogCateList}');
    let cate3Array = new Array();
    let cate3Obj = new Object();
    let cateSelect3 = $(".cate3");

    /* 강아지 카테고리 배열 초기화 메서드 */
    function makeCateArray(obj, array, dogCateList) {
        for(let i = 0; i < dogCateList.length; i++) {
            obj = new Object();
            obj.dCateName = dogCateList[i].dCateName;
            obj.dCateCode = dogCateList[i].dCateCode;
            array.push(obj);
        }
    }

    /* 배열 초기화 */
    makeCateArray(cate3Obj, cate3Array, dogCateList, 3);

    let targetCate3 = '${dogsInfo.dogCateCode}';

    for(let i = 0; i < cate3Array.length; i++) {
        if(targetCate3 === cate3Array[i].dCateCode){
            targetCate3 = cate3Array[i];
        }
    }

    for(let i = 0; i < cate3Array.length; i++) {
        cateSelect3.append("<option value='"+cate3Array[i].dCateCode+"'>" + cate3Array[i].dCateName + "</option>");
    }

    $(".cate3 option").each(function(i, obj){
        if(targetCate3.dCateCode === obj.value){
            $(obj).attr("selected", "selected");
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
	
	
	/* 삭제 버튼 */
	$("#deleteBtn").on("click", function(e){
		e.preventDefault();
		let moveForm = $("#moveForm");
		moveForm.find("input").remove();
		moveForm.append('<input type="hidden" name="dogId" value="${dogsInfo.dogId}">');
		moveForm.attr("action", "/admin/dogsDelete");
		moveForm.attr("method", "post");
		moveForm.submit();
	});
	
	
	/* 취소 버튼 */
	$("#cancelBtn").on("click", function(e){
		e.preventDefault();
		$("#moveForm").submit();
	});
	
	/* 수정 버튼 */
	$("#modifyBtn").on("click", function(e){
		
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
			$("#modifyForm").submit();
		} else {
			return false;
		}
		
	});
    
}); //(document).ready 끝

</script>

 				
</body>
</html>