<%@page import="net.sneaker.db.SneakerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=0, maximum-scale=1.0, width=device-width" />
<title>Insert title here</title>
<link href="./css/include/sideBar.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Oxanium&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
	<%
		//로그인한 사용자가 체크
		String user = (String) session.getAttribute("email");
		//로그인 된 사용자의 position 가져오기
		String usr_position = (String) session.getAttribute("usr_position");
		if(user == null){
			user = "";
		}
		if(usr_position == null){
			usr_position = "";
		}	
	%>
<body>

	<!-- 우측 사이드 광고 -->
	<div class="right-sideAds-container">
		<div class="right-sideAds-box">
		</div>
	</div>
	<!-- 나의 응모내역 보러가기 box -->
<!-- 	<div class="myDrawPopUp" id="myDrawPopUp"> -->
	
<!-- 		<div class="myDrawPopUpIcon" style="display:inline-block;"> -->
<!-- 			<i class="fas fa-user-check"></i> -->
<!-- 		</div> -->
		
<!-- 		<div style="display:inline-block;"> -->
<!-- 			<div class="myDrawPopUpTxt1"> -->
<!-- 				<span>나의 응모내역</span> -->
<!-- 			</div> -->
<!-- 			<div class="myDrawPopUpTxt2"> -->
<!-- 				<span>보러가기</span> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
		
</body>
<script type="text/javascript">

	$(window).scroll(function(event){
	//		화면을 200정도만 내렸을때 좌측 메뉴 고정
		if(document.body.scrollTop > 200 || document.documentElement.scrollTop > 200){
// 			$(".right-sideAds-container").css('position','fixed');
// 			$(".right-sideAds-container").css('bottom','0');
// 			$(".right-sideAds-container").css('right','0');
// 			$(".right-sideAds-container").css('margin-right','0');
// 			$(".right-sideAds-container").css('top','unset');
		} else {
// 			$(".right-sideAds-container").css('position','absolute');
// 			$(".right-sideAds-container").css('margin-right','-380px');
// 			$(".right-sideAds-container").css('top','0');
		}
	});

$(document).ready(function(){

	//마이드로우 눌렸을시
	$('#myDrawPopUp').click(function(){
		//로그인 체크
		if($(".user").val() == "" || $(".user").val() == "undefined" || $(".user").val() == null) {
			location.href="./MemberLogin.me";
		}else {
			location.href="./MemberDrawInfo.me";
		}
	});
	
});

</script>
</html>