<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
<link rel="stylesheet" href="../resources/css/reserve/reserveCheck.css?after">
</head>
<body>
	<div class="revWrap">
		<div class="wrap">
			<div class="title">
				예약내역
			</div>
			<div class="contentWrap">
				<div class="imgLogo">
					<img src="../resources/img/doglogo.png">
				</div>
				<div class="ment">
					예약이 완료되었습니다.
				</div>
				<c:forEach items="${rList}">
					${rList.reserveName}
					<div class="lb">예약자</div>
					<div class="name">${rList.reserveName}</div>
					<div class="lb">예약자 번호</div>
					<div class="phone">${rList.reservePhone}</div>
					<div class="lb">예약 날짜</div>
					<div class="revDate">${rList.reserveDate}</div>
				</c:forEach>
			</div>
		</div>
	</div>

<script>
$(document).ready(function(){
	
	function checkResult(data){
		
		if(data === ''){
			return;
		}
		
		if(data === 'rev_result') {
			alert("예약이 완료되었습니다.");	
		}
	}

});
</script>
</body>
</html> --%>