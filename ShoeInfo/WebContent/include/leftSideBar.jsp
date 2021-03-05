<%@page import="net.sneaker.db.SneakerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/include/sideBar.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Oxanium&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body>
		<!-- 좌측 사이드바 -->
		<div class="left-sideBar" id="left-sideBar">
			<!-- 달력 -->
			<div class="calendar-box">
			</div>
			<!-- 시계 -->
			<div class="clock" id="clock">
				<div class="month_date" id="month_date">
				</div>
				<div class="time_zone" id="time_zone">
				</div>
				<div class="ampm_zone_container" >
					<span id="ampm_zone"></span>
				</div>
			</div>
		</div>
</body>

<script type="text/javascript">

	var sticky = $(".left-sideBar").offsetTop;
	
	$(window).scroll(function(event){
		//화면을 200정도만 내렸을때 좌측 메뉴 고정
		if(document.body.scrollTop > 200 || document.documentElement.scrollTop > 200){
			$(".left-sideBar").css('position','fixed');
			$(".left-sideBar").css('top','40px');
		} else {
			$(".left-sideBar").css('position','absolute');
			$(".left-sideBar").css('top','0');
		}
	});
	
	/////////////////////////////////////////////////////////
	//Calendar date 객체 생성 
	var Calendar = new Date();
	var day_of_week = ['일', '월', '화', '수', '목', '금', '토'];
	var month_of_year = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
	
	var year = Calendar.getFullYear();
	var month = Calendar.getMonth();
	var today = Calendar.getDate();
	var weekday = Calendar.getDay();
	
	Calendar.setDate(1); //1일
	
	var DAYS_OF_WEEK = 7;
	var DAYS_OF_MONTH = 31;
	var str;
	
	//tr
	var TR_start = "<tr>";
	var TR_end = "</tr>";
	
	var TD_week_start = "<td class='week'>";
	var TD_blank_start = "<td class='blank'>";
	var TD_today_start = "<td class='today'>";
	var TD_day_start = "<td class='day'>";
	var TD_saturday_start = "<td class='saturday'>";
	var TD_sunday_start = "<td class='sunday'>";
	var TD_end = "</td>";
	
	str = "<table width=100% border:1 cellspacing=0 cellpadding=0><tr><td style='text-align:center;'>";
	str += "<strong class='cal-title'>" + year + "." + month_of_year[month] + "</strong>";
	str += "<table class='calendar' border=0 cellspacing=0 celpadding=2>";
	
	//tr 시간
	str += TR_start;
	
	for(var i=0; i<DAYS_OF_WEEK; ++i){
		str += TD_week_start + day_of_week[i] + TD_end;
	}
	
	str += TR_end;
	
	for(var i=0; i<Calendar.getDay(); ++i){
		str += TD_blank_start + TD_end;
	}
	
	//1일부터 시작
	for(i=0; i<DAYS_OF_MONTH; ++i){
		if(Calendar.getDate() >i){
			var day = Calendar.getDate();
			var week_day = Calendar.getDay();
			if(week_day ==0){
				str += TR_start;
			}
			if(day == today){
				str += TD_today_start + day + TD_end;
			}
			else {
				switch(week_day){
					case 0 :
						str += TD_sunday_start + day + TD_end;
						break;
					case 6 :
						str += TD_saturday_start + day + TD_end;
						str += TR_end
						break;
					default :
						str += TD_day_start + day + TD_end;
					break;
				}
			}
		}
		
		Calendar.setDate(Calendar.getDate() + 1);
	} //for end
	str += "</table></td></tr></table>";
	
	//calendar 태그에 넣기
	$('.calendar-box').html(str);
	
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
	
		var monthDate_div = document.getElementById("month_date");
		var time_div = document.getElementById("time_zone");
		var ampm_zone = document.getElementById("ampm_zone");
	
		//월 + 일 넣기
		monthDate_div.innerHTML = currentDate;
		//시간 넣기
		time_div.innerHTML = currentTime;
		//am pm 넣기
		ampm_zone.innerHTML = AMorPM;
	}
	
	//실시간 갱신시켜주는 함수
	function init(){
	    setInterval(getTime, 1000);
	}
	
	init();
	
</script>




</html>