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
<body>
		<!-- 좌측 사이드 광고 -->
		<div class="left-sideAds-container">
			<div class="left-sideAds-box">
			</div>
		</div>
		
		<!-- 상단 왼쪽 현시간 표시 박스 (화면 줄였을때) -->
		<div class="leftTopClock" id="leftTopClock" style="padding:0.5% 0.8%;">
			<div class="month_date_mob" id="month_date_mob" style="font-size:15px;">
			</div>
			<div class="time_zone_mob" id="time_zone_mob" style="font-size:24px; padding:8px 0 0 0 !important;">
			</div>
		</div>
		
</body>

<script type="text/javascript">

	$(window).scroll(function(event){
// 		화면을 200정도만 내렸을때 좌측 메뉴 고정
		if(document.body.scrollTop > 200 || document.documentElement.scrollTop > 200){
// 			$(".left-sideAds-container").css('position','fixed');
// 			$(".left-sideAds-container").css('bottom','0');
// 			$(".left-sideAds-container").css('left','0');
// 			$(".left-sideAds-container").css('margin-left','0');
// 			$(".left-sideAds-container").css('top','unset');
		} else {
// 			$(".left-sideAds-container").css('position','absolute');
// 			$(".left-sideAds-container").css('margin-left','-380px');
// 			$(".left-sideAds-container").css('top','0');
		}
	});
	
	/////////////////////////////////////////////////////////
	//실시간 현재 시간
	function getTime(){
			
		//현재 시간 계산
		var date = new Date();
		//요일
		var week = new Array('일', '월', '화', '수', '목', '금', '토'); 	
		var currentDate = (date.getMonth() + 1) + "월 " +  date.getDate() + "일" + "(" + week[date.getDay()] +")"; 
		var hours = date.getHours();
		var minutes = date.getMinutes();
		var seconds = date.getSeconds();
		//오전/오후 표시하기
		var AMorPM = date.getHours() < 12 ? "AM" : "PM";
		//오후시간일때 12시간 빼기
	//		if(hours > 12) {
	//			hours -= 12;
	//		}
		
		//시간, 분, 초 앞에 한자리수이면 앞자리수에 0 붙이기
		if(hours < 10){ hours = "0" + hours; }
		if(minutes < 10){ minutes = "0" + minutes; }
		if(seconds < 10){ seconds = "0" + seconds; }
	
		var currentTime = hours + ":" + minutes + ":" + seconds;
		
		//모바일 버전 현재시간
		var monthDate_div_mob = document.getElementById("month_date_mob");
		var time_div_mob = document.getElementById("time_zone_mob");
		
		//월 + 일 넣기
		monthDate_div_mob.innerHTML = currentDate;
		//시간 넣기
		time_div_mob.innerHTML = currentTime;
	}
	
	//실시간 갱신시켜주는 함수
	function init(){
	    setInterval(getTime, 1000);
	}
	
	init();
	
</script>




</html>