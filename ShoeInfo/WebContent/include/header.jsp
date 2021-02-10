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

<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Racing+Sans+One&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<header class="header-container">
	
		<div class="toplink-container">
			<div class="container row-fluid">
				<!-- instagram -->
				<div class="insta-label">
					<span>
						<a href="https://www.instagram.com/shoeinfo_official/" target="_blank"><i class="fab fa-instagram"></i> <i class="fas fa-caret-left"></i> visit ShoeInfo_official Instagram </a> 
					</span> 
				</div>
				
				<!-- register/login container -->
				<div class="acc-container"> 
					<%
						request.setCharacterEncoding("UTF-8");
					
						//현재 페이지 이름, main.jsp or sneakerDetail.jsp
						String pageName = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);
					
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
	
						if(user == null || user.length() == 0){
						%>
							<span> <a href="./MemberLogin.me"> <i class="fas fa-user-alt"></i> 회원가입 / 로그인  </a> </span>
						<%
							}else if(usr_position.equals("admin")){ 
						%>
							<span class="acc_list"> <a href="./Main.ad"> ADMIN PAGE </a> </span>
							<span class="acc_list"> <a href="./MemberInfoCheck.me"> <i class="fas fa-user-alt"></i> 나의정보관리 </a> </span> 
							<span> <a href="./MemberLogout.me"> 로그아웃 </a> </span>
						<% 
							}else{ 
						%>
							<span class="acc_list"> <a href="./MemberInfoCheck.me"> <i class="fas fa-user-alt"></i> 나의정보관리 </a> </span>
							<span> <a href="./MemberLogout.me"> 로그아웃 </a> </span> 
						<% } %>
				</div>
			</div>
		</div>
		
		<div class="logo-row container">
			<div class="navbar_logo">
				<div>
					<a href="./SneakerList.go"> SHOE INFO. </a>
				</div>
			</div>
		</div>
		
		<div class="menu-row container">
			<div class="block-list">
				<div class="block-content">
					<ul class="nav">
						<li> <a href="./SneakerList.go"> 발매중/발매예정 </a> </li>
						<li> <a href="#"> 발매완료 </a> </li>
						<li> <a href="#"> SNKRS </a> </li>
						<li> <a href="#" id="myDrawBtn"> 나의 응모내역 </a> </li>
					</ul>
				</div>
			</div>
		</div>
	
	</header>
	
	
	
	<!-- 여기서 부터 구버전 -->
	<!-- 여기서 부터 구버전 -->
	<!-- 여기서 부터 구버전 -->
	<!-- 여기서 부터 구버전 -->
	<!-- 여기서 부터 구버전 -->
	
	<nav class="acc_navbar" style="display:none;">
		<div class="acc_wrapper">
			<!-- 인스타  -->
			<div class="insta-icon">
				<span> <a href="https://www.instagram.com/shoeinfo_official/" target="_blank"><i class="fab fa-instagram"></i> <i class="fas fa-caret-left"></i> visit ShoeInfo_official Instagram </a> </span>
			</div>
			<!-- 로그인/회원가입 -->
			<div class="login-wrapper">
					<%
						request.setCharacterEncoding("UTF-8");
					
						//현재 페이지 이름, main.jsp or sneakerDetail.jsp
						//String pageName = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);
					
						//로그인한 사용자가 체크
						//String user = (String) session.getAttribute("email");
						//로그인 된 사용자의 position 가져오기
						//String usr_position = (String) session.getAttribute("usr_position");
						if(user == null){
							user = "";
						}
						if(usr_position == null){
							usr_position = "";
						}
						
						if(user == null || user.length() == 0){
					%>
						<span class="acc_pos" style="display:none;">비회원&nbsp;<i class="far fa-question-circle"></i></span><span> <a href="./MemberLogin.me"> 회원가입 / 로그인  </a> </span>
					<%
						}else if(usr_position.equals("admin")){ 
					%>
						<span class="acc_pos" style="display:none;"><%if(usr_position.equals("general")){%>일반회원<%}else if(usr_position.equals("prime")){%>열심회원<%} else if(usr_position.equals("admin")){%>관리자<%}%>&nbsp;<i class="far fa-question-circle"></i></span>
						
						<span class="acc_list"> <a href="./Main.ad"> ADMIN PAGE </a> </span>
						<span class="acc_list"> <a href="./MemberInfoCheck.me"> 나의정보관리 </a> </span> 
						<span> <a href="./MemberLogout.me"> 로그아웃 </a> </span>
					<% 
						}else{ 
					%>
						<span class="acc_pos" style="display:none;"><%if(usr_position.equals("general")){%>일반회원<%}else if(usr_position.equals("prime")){%>열심회원<%}%>&nbsp;<i class="far fa-question-circle"></i></span>
					
						<span class="acc_list"> <a href="./MemberInfoCheck.me"> 나의정보관리 </a> </span>
						<span> <a href="./MemberLogout.me"> 로그아웃 </a> </span> 
					<% } %>
			</div>
		</div>
	</nav>
	
	<!-- 회원등급별표 -->
	<div id="memberChart" style="display:none;">
		<div id="mc_title">
			<span>
				현재&nbsp;
				<span id="current_rank">
					<%if(user == null || user.length() == 0){%>
						
						비회원
					
					<%}else if(usr_position.equals("general")){%>
					
						일반회원
						
					<%}else if(usr_position.equals("prime")){%>
					
						열심회원
						
					<%}else if(usr_position.equals("admin")){%>
					
						관리자
						
					<%}%>
				</span> 
				&nbsp;입니다
			</span>
			<span id="mc_exit">
				<i class="fas fa-times"></i>
			</span>
		</div>
		<div id="memberRank-wrapper">
			<div id="rank-wrapper">
				<div id="rank_label">비회원</div>
				<div id="stars"><i class="fas fa-star"></i></div>
				<div id="rank_content"> 
					<p onclick="location.href='./Main.bo'">발매정보 보기</p>
				</div>
			</div>
			<div id="rank-wrapper">
				<div id="rank_label">일반회원</div>
				<div id="stars"><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
				<div id="rank_content"> 
					<p onclick="location.href='./Main.bo'">발매정보 보기</p>
					<p id="myDrawBtn2"><i class="far fa-calendar-check"></i> MYDRAW 관리 </p>
				</div>
			</div>
			<div id="rank-wrapper">
				<div id="rank_label">열심회원</div>
				<div id="stars"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
				<div id="rank_content"> 
					<p onclick="location.href='./Main.bo'">발매정보 보기</p>
					<p id="myDrawBtn2"><i class="far fa-calendar-check"></i> MYDRAW 관리</p>
					<p id="addDrawInfo"><i class="far fa-edit"></i> 발매정보 추가</p>			 
				</div>
			</div>
		</div>
	</div>

	<input type="hidden" class="user" id="user" value="<%=user%>">
		
	<nav class="navbar" style="display: none;">
		<!-- 로고 -->
		<div class="navbar_logo">
			<div>
				<a href="./SneakerList.go"> SHOE Info. </a>
			</div>
		</div>
	
		<!-- 메인메뉴  -->
		<ul class="navbar_menu">
			<li <%if(pageName.equals("main.jsp") || pageName.equals("sneakerDetail.jsp")) {%> style="font-weight:bold;"<%}%>> <a href="./SneakerList.go"> <span id="cal_icon"><i class="fas fa-calendar"></i></span> 런칭 캘린더 </a> </li>
			<li <%if(pageName.equals("allSneaker.jsp")) {%> style="font-weight:bold;"<%}%>> <a href="./AllSneaker.go"> <span id="all_icon"><i class="fas fa-calendar-alt"></i></span> 전체 보기 </a>
			<li class="mypage_btn_mobile" id="myDrawBtn_mobile"> <div id="user_icon"> <i class="fas fa-calendar-check"></i> <div>MY DRAW</div> </div> </li>
		</ul>
		
		<!-- 나의 드로우 -->
		<ul class="navbar_userlinks">
			<li class="pc_icon"> <span id="myDrawBtn" style="cursor: pointer; font-family: 'Source Sans Pro', sans-serif;"> <i class="far fa-calendar-check"></i>  MY DRAW </span> </li>
			<%
				if(user == null || user.length() == 0){
			%>
				<li class="mypage_btn_mobile"> <a href="./MemberLogin.me"> <div id="user_icon"><i class="fas fa-user"></i> <div> 로그인 </div> </div> </a> </li>
			<%
				}else if(usr_position.equals("admin")){ 
			%>
				<li class="mypage_btn_mobile"> <a href="./Main.ad"> <div id="user_icon"> <i class="fas fa-tools"></i> <div>ADMIN PAGE</div>   </div> </a> </li>
				<li class="mypage_btn_mobile"> <a href="./MemberInfoCheck.me"> <div id="user_icon"> <i class="fas fa-user"></i> <div id="user_label" > <%=user%> </div> </div>  </a> </li>
				<li class="mypage_btn_mobile"> <a href="./MemberLogout.me"> <div id="logout_icon"> <i class="fas fa-sign-out-alt"></i> <div> 로그아웃 </div>  </div> </a> </li>
			<% 
				}else{
			%>
				<li class="mypage_btn_mobile"> <a href="./MemberInfoCheck.me"> <div id="user_icon"> <i class="fas fa-user"></i>  <div id="user_label" ><%=user%></div> </div> </a> </li>
				<li class="mypage_btn_mobile"> <a href="./MemberLogout.me"> <div id="logout_icon"> <i class="fas fa-sign-out-alt"></i> <div>로그아웃</div> </div> </a> </li>			
			<% 
				} 
			%> 
		</ul>
		
		<!-- 모바일 버전일때 메뉴 버튼 -->
		<a href="#" class="navbar_toggleBtn">
			<i class="fas fa-bars"></i>
		</a>
		
	</nav>
	
	<div id="datebar_div" style="display: none;">
		<nav class="datebar" id="datebar">
			<!-- 오늘 날짜 표시 -->
			<div class="today_date">	
				<span id="today_date_val">  </span>
			</div>
		</nav>
	</div>
	
	<!-- top link -->
	<button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fas fa-caret-up"></i></button>

</body>
<script type="text/javascript">

	$(document).ready(function(){

		$('.acc_pos').click(function(){
			$('#memberChart').slideDown(400);
		});	
		
		$('#mc_exit').click(function(){
			$('#memberChart').slideUp(400);
		});
		
		//마이드로우 눌렸을시
		$('#myDrawBtn, #myDrawBtn2, #myDrawBtn_mobile').click(function(){
			//로그인 체크
			if($(".user").val() == "" || $(".user").val() == "undefined" || $(".user").val() == null) {
				location.href="./MemberLogin.me";
			}else {
				location.href="./MemberDrawInfo.me";
			}
		});
		
		$('#addDrawInfo').click(function(){
			alert("발매정보 추가는 신발 상세 페이지에서 확인 할 수 있습니다.");
		});
		
	});
		
		//현재 시간 계산해주는 함수
		function getTime(){
			
			//현재 시간 계산
			var date = new Date();
			//요일
			var week = new Array('일', '월', '화', '수', '목', '금', '토'); 
			
// 			date.getFullYear() + "년 " + 
			
			var currentDate = (date.getMonth() + 1) + "월 " +  date.getDate() + "일" + "(" + week[date.getDay()] +")"; 
			
			var hours = date.getHours();
			var minutes = date.getMinutes();
			var seconds = date.getSeconds();
			//오전/오후 표시하기
			var AMorPM = date.getHours() < 12 ? "오전" : "오후";
			
			//오후시간일때 12시간 빼기
			if(hours > 12) {
				hours -= 12;
			}
			
			//시간, 분, 초 앞에 한자리수이면 앞자리수에 0 붙이기
			if(hours < 10){ hours = "0" + hours; }
			if(minutes < 10){ minutes = "0" + minutes; }
			if(seconds < 10){ seconds = "0" + seconds; }
	
			var currentTime = AMorPM + " " + hours + ":" + minutes + ":" + seconds  + "";
			
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
		
		
		function topFunction() {
			$('html,body').animate({ scrollTop: 0 }, 'fast');
// 			document.body.scrollTop = 0;
// 			document.documentElement.scrollTop = 0;
		}

		//헤더 스크롤 내려도 메뉴바 상단에 고정시키는 스크립트
		window.onscroll = function() {myFunction()};
		
		var navbar = document.getElementById("datebar_div");
		var sticky = navbar.offsetTop;
		var mybutton = document.getElementById("myBtn");
		
		function myFunction() {
		  	if (window.pageYOffset >= sticky) {
		  		navbar.classList.add("sticky")
		  	}else {
		  		navbar.classList.remove("sticky");
		 	}
	  	
		  	if (document.body.scrollTop > 500 || document.documentElement.scrollTop > 500) {
		  		$('#myBtn').fadeIn();
			} else {
				$('#myBtn').hide();
			}
		  	
		}
</script>
</html>