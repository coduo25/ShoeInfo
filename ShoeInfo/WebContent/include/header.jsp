<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=0, maximum-scale=1.0, width=device-width" />
<title>SHOE INFO.</title>
<link href="./css/include/header.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<nav class="navbar">
	
		<!-- 로고 -->
		<div class="navbar_logo">
			<a href="./SneakerList.go"> SHOE Info. </a>
		</div>
	
		<!-- 메인메뉴  -->
		<ul class="navbar_menu">
			<li> <a href="./SneakerList.go"> <span id="cal_icon"><i class="fas fa-calendar"></i></span> 런칭 캘린더 </a> </li>
		</ul>
		
		<!-- 로그인, 마이페이지, 로그아웃 링크 -->
		<ul class="navbar_userlinks">
			<%
				//로그인 되었는지	
				String user = (String) session.getAttribute("email");
				//로그인 된 사용자의 position 가져오기
				String usr_position = (String) session.getAttribute("usr_position");
				if(usr_position == null){
					usr_position = "";
				}
				
				if(user == null){
			%>
				<li> <a href="./MemberLogin.me"> <span id="user_icon"><i class="fas fa-user"></i></span> LOGIN </a> </li>
			<%
				}else if(usr_position.equals("admin")){ 
			%>
				<li> <a href="./Main.ad"> <span id="user_icon"> <i class="fas fa-tools"></i> </span> ADMIN PAGE </a> </li>
				<div class="mypage_btn"> 
					<li> MYPAGE <i class="fas fa-caret-down"></i> </li> 
					<div class="dropdown_mymenu">
						<a href="./MemberUpdateInfo.me"> MY INFO </a>
						<a href="./MemberDrawInfo.me"> MY DRAW </a>
					</div>
				</div>

				<li class="mypage_btn_mobile"> <a href="./MemberUpdateInfo.me"> <span id="user_icon"> <i class="fas fa-user"></i> </span> <%=user%> </a> </li>
				<li class="mypage_btn_mobile"> <a href="./MemberDrawInfo.me"> <span id="user_icon"> <i class="fas fa-calendar-check"></i> </span> MY DRAW  </a> </li>
				<li class="mypage_btn_mobile"> <a href="./MemberLogout.me"> <span id="logout_icon"> <i class="fas fa-sign-out-alt"></i> </span>  LOGOUT </a> </li>
				
				<li class="logout"> <a href="./MemberLogout.me"> LOGOUT </a> </li>
			<% 
				}else{ 
			%>
				<div class="mypage_btn"> 
					<li> MYPAGE <i class="fas fa-caret-down"></i> </li> 
					<div class="dropdown_mymenu">
						<a href="./MemberUpdateInfo.me"> MY INFO </a>
						<a href="./MemberDrawInfo.me"> MY DRAW </a>
					</div>
				</div>
				
				<li class="mypage_btn_mobile"> <a href="./MemberUpdateInfo.me"> <span id="user_icon"> <i class="fas fa-user"></i> </span> <%=user%> </a> </li>
				<li class="mypage_btn_mobile"> <a href="./MemberDrawInfo.me"> <span id="user_icon"> <i class="fas fa-calendar-check"></i> </span> MY DRAW  </a> </li>
				<li class="mypage_btn_mobile"> <a href="./MemberLogout.me"> <span id="logout_icon"> <i class="fas fa-sign-out-alt"></i> </span>  LOGOUT </a> </li>
				
				<li class="logout"> <a href="./MemberLogout.me"> LOGOUT </a> </li>
				
			<% 
				} 
			%> 
		</ul>
		
		<!-- 모바일 버전일때 메뉴 버튼 -->
		<a href="#" class="navbar_toggleBtn">
			<i class="fas fa-bars"></i>
		</a>
		
	</nav>
	
	<div id="datebar_div">
		<nav class="datebar" id="datebar">
			<!-- 오늘 날짜 표시 -->
			<div class="today_date">	
				<span id="today_date_val">  </span>
			</div>
		</nav>
	</div>
	

</body>
<script type="text/javascript">

		//현재 시간 계산해주는 함수
		function getTime(){
			
			//현재 시간 계산
			var date = new Date();
			//요일
			var week = new Array('일', '월', '화', '수', '목', '금', '토'); 
			
			var currentDate = date.getFullYear() + "년 " + (date.getMonth() + 1) + "월 " +  date.getDate() + "일 " + "(" + week[date.getDay()] +")"; 
			
			var hours = date.getHours();
			var minutes = date.getMinutes();
			var seconds = date.getSeconds();
			//오전/오후 표시하기
			var AMorPM = date.getHours() < 12 ? "AM" : "PM";
			
			//오후시간일때 12시간 빼기
			if(hours > 12) {
				hours -= 12;
			}
			
			//시간, 분, 초 앞에 한자리수이면 앞자리수에 0 붙이기
			if(hours < 10){ hours = "0" + hours; }
			if(minutes < 10){ minutes = "0" + minutes; }
			if(seconds < 10){ seconds = "0" + seconds; }
			
			var currentTime = hours + ":" + minutes + ":" + seconds  + " " + AMorPM;
			
			var result = document.getElementById("today_date_val");
			
			result.innerHTML = "현재시간: " + currentDate + " " + currentTime;
			
		}
	
		//실시간 갱신시켜주는 함수
		function init(){
		    setInterval(getTime, 1000);
		}
		
		init();
	
	
// 		if($(".navbar_toggleBtn").css("display") == "none"){
// 			$(".navbar_menu").css("display", "flex");
// 			$(".navbar_userlinks").css("display", "flex");
// 		}
	

		$(".navbar_toggleBtn").click(function(){
			if($(".navbar_menu").css("display") == "none"){
				$(".navbar_menu").slideDown();
				$(".navbar_userlinks").slideDown();
			}
			else if($(".navbar_menu").css("display") == "block"){
				$(".navbar_menu").slideUp();
				$(".navbar_userlinks").slideUp();
			}
//	 		$(".navbar_menu").slideToggle("fast");
//	 		$(".navbar_userlinks").slideToggle("fast");
		});

		//헤더 스크롤 내려도 메뉴바 상단에 고정시키는 스크립트
		window.onscroll = function() {myFunction()};
			var navbar = document.getElementById("datebar_div");
			var sticky = navbar.offsetTop;
			function myFunction() {
		  	if (window.pageYOffset >= sticky) {
		  	  navbar.classList.add("sticky")
		  	}else {
		  	  navbar.classList.remove("sticky");
		 	}
		}
</script>
</html>