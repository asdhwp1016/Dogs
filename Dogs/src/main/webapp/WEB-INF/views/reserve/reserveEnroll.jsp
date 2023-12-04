<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/reserve/reserveEnroll.css?after">
<!-- CSS CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"/> 
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
 <!-- datetimepicker jQuery CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"> </script>
</head>
<body>
	<div class="revWrap">
		<div class="wrap">
		<form action="/reserve/reserveEnroll" method="post" id="enrollForm">
			<input type="hidden" name="reserveId" value="${user.userId}">
			<div class="title">방문 예약</div>
			<div class="revName">
				<div class="info">예약자 정보</div>
				<div class="lb">예약자 이름</div>
				<input type="text" placeholder="홍길동" name="reserveName">
			</div>
				<span class="ck_warn name_warn">예약자 이름을 입력해주세요.</span>
			<div class="lb">예약자 번호</div>
			<div class="revPhone">
				<input type="text" placeholder="010-1234-1234" name="reservePhone" id="phone">
				<button type="button" id="phoneChk">핸드폰 인증요청</button>
			</div>
			<div class="revPhone2">
				<input type="text" placeholder="인증번호 입력" id="phone2">
				<button type="button" id="phoneChk2">핸드폰 인증</button>
			</div>
				<span class="ck_warn successPhoneChk">핸드폰 번호를 입력해주세요.</span>
				<input type="hidden" id="phoneDoubleChk"/>
			<div class="lb">예약 날짜</div>
			<div class="revDate">
				<input name="reserveDate" placeholder="클릭하세요" autocomplete="off" readonly="readonly">
			</div>
				<span class="ck_warn date_warn">날짜를 선택해 주세요.</span>
		</form>	
			<button class="enrollBtn">예약하기</button>
			<button class="cancelBtn">예약취소</button>
		</div>
	</div>

	<script>
		let enrollForm = $("#enrollForm")
		
		/* 취소 버튼 */
		$(".cancelBtn").click(function(){
			location.href="/main"
		});
	
		/* 상품 등록 버튼 */
		$(".enrollBtn").on("click",function(e){
			e.preventDefault();

			let nameCk = null;
			let dateCk = null;
			
			let name = $("input[name='reserveName']").val();
			let date = $("input[name='reserveDate']").val();
			
			if(name){
				$(".name_warn").css('display','none');
				nameCk = true;
			} else {
				$(".name_warn").css('display','block');
				nameCk = false;
			}
			
			if(date){
				$(".date_warn").css('display','none');
				dateCk = true;
			} else {
				$(".date_warn").css('display','block');
				dateCk = false;
			}
			
		
			if(nameCk && dateCk){
				enrollForm.submit();
			} else {
				return false;
			}
			
		});	

		/* const config = {
				
		}; */

		$(document).ready(function() {
		    $("input[name='reserveDate']").datetimepicker({
		    	lang:'kr',
		    	format:"Y-m-d H:i",
		    	allowTimes:[
		    		  '09:00', '09:30', '10:00', '10:30', '11:00', '11:30', 
		    		  '12:00', '12:30', '14:00', '14:30', '15:00', '15:30',
		    		  '16:00', '16:30', '17:00', '17:30', '18:00', '18:30'
		    		 ]
		    });
		});
		
		//휴대폰 번호 인증
		var code2 = "";
		$("#phoneChk").click(function(){
			var phone = $("#phone").val();
			$.ajax({
		        type:"GET",
		        url:"/reserve/phoneCheck?phone=" + phone,
		        cache : false,
		        success:function(data){
		        	if(!phone){
		        		alert("휴대폰 번호를 입력해주세요")
		        	} else if(!/^\d{11}$/.test(phone)) {
		        		alert("휴대폰 번호가 올바르지 않습니다.")
		        	}else{
		        		alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
		        		$("#phone2").attr("disabled",false);
		        		$("#phone").attr("readonly",true);
		        		code2 = data;
		        	}
		        }
		    });
		});
		
		//휴대폰 인증번호 대조
		$("#phoneChk2").click(function(){
			 if($("#phone2").val() == code2){ // 위에서 저장한값을 ㅣ교함
		           alert('인증에 성공하였습니다.')
		      }else{
		          alert('인증에 실패하였습니다.')
		      }
		});
		
	</script>
</body>
</html>