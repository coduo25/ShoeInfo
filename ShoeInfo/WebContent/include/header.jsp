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

	<nav class="acc_navbar">
		<div class="acc_wrapper">
			<!-- 인스타  -->
			<div class="insta-icon">
				<span> <a href="https://www.instagram.com/shoeinfo.official/" target="_blank"><i class="fab fa-instagram"></i> <i class="fas fa-caret-left"></i> visit ShoeInfo.official Instagram </a> </span>
			</div>
			<!-- 로그인/회원가입 -->
			<div class="login-wrapper">
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
						<span> <a href="./MemberLogin.me"> 회원가입 / 로그인  </a> </span>
					<%
						}else if(usr_position.equals("admin")){ 
					%>
						<span class="acc_list"> <a href="./Main.ad"> ADMIN PAGE </a> </span>
						<span class="acc_list"> <a href="./MemberInfoCheck.me"> 나의정보관리 </a> </span> 
						<span> <a href="./MemberLogout.me"> 로그아웃 </a> </span>
					<% 
						}else{ 
					%>
						<span class="acc_list"> <a href="./MemberInfoCheck.me"> 나의정보관리 </a> </span>
						<span> <a href="./MemberLogout.me"> 로그아웃 </a> </span> 
					<% } %>
			</div>
		</div>
	</nav>

	<nav class="navbar">
		<!-- 로고 -->
		<div class="navbar_logo">
			<div>
				<a href="./SneakerList.go"> SHOE Info. </a>
			</div>
		</div>
	
		<!-- 메인메뉴  -->
		<ul class="navbar_menu">
			<li> <a href="./SneakerList.go"> <span id="cal_icon"><i class="fas fa-calendar"></i></span> 런칭 캘린더 </a> </li>
			<li> <a href="./AllSneaker.go"> <span id="all_icon"><i class="fas fa-calendar-alt"></i></span> 전체 보기 </a>
		</ul>
		
		<!-- 나의 드로우 -->
		<ul class="navbar_userlinks">
			<li class="pc_icon"> <a href="./MemberDrawInfo.me"> MY DRAW </a> </li>
			<%
				if(user == null){
			%>
				<li class="mypage_btn_mobile"> <a href="./MemberLogin.me"> <div id="user_icon"><i class="fas fa-user"></i> <div> LOGIN </div> </div> </a> </li>
			<%
				}else if(usr_position.equals("admin")){ 
			%>
				<li class="mypage_btn_mobile"> <a href="./Main.ad"> <div id="user_icon"> <i class="fas fa-tools"></i> <div>ADMIN PAGE</div>   </div> </a> </li>

				<li class="mypage_btn_mobile"> <a href="./MemberInfoCheck.me"> <div id="user_icon"> <i class="fas fa-user"></i> <div id="user_label" > <%=user%> </div> </div>  </a> </li>
				<li class="mypage_btn_mobile"> <a href="./MemberDrawInfo.me"> <div id="user_icon"> <i class="fas fa-calendar-check"></i> <div>MY DRAW</div> </div> </a> </li>
				<li class="mypage_btn_mobile"> <a href="./MemberLogout.me"> <div id="logout_icon"> <i class="fas fa-sign-out-alt"></i> <div> LOGOUT</div>  </div> </a> </li>
			<% 
				}else{ 
			%>
				<li class="mypage_btn_mobile"> <a href="./MemberInfoCheck.me"> <div id="user_icon"> <i class="fas fa-user"></i>  <div id="user_label" ><%=user%></div> </div> </a> </li>
				<li class="mypage_btn_mobile"> <a href="./MemberDrawInfo.me"> <div id="user_icon"> <i class="fas fa-calendar-check"></i> <div>MY DRAW</div> </div>  </a> </li>
				<li class="mypage_btn_mobile"> <a href="./MemberLogout.me"> <div id="logout_icon"> <i class="fas fa-sign-out-alt"></i> <div>LOGOUT</div> </div> </a> </li>			
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

		$(".navbar_toggleBtn").click(function(){
			if($(".navbar_menu").is(":visible")){
				$(".navbar_menu").slideUp();
				$(".navbar_userlinks").slideUp();
			}
			else if(!$(".navbar_menu").is(":visible")){
				$(".navbar_menu").slideDown();
				$(".navbar_userlinks").slideDown();
			}
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