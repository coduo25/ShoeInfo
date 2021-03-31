<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=0, maximum-scale=1.0, width=device-width" />
<title>SHOE INFO.</title>
<link href="./css/include/header.css" rel="stylesheet">
<script data-ad-client="ca-pub-8228533393025739" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>

<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Racing+Sans+One&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- <script data-ad-client="ca-pub-8228533393025739" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script> -->

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-7TDM95C3N4"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-7TDM95C3N4');
</script>
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
							<input type="hidden" class="user" value="<%=user%>">
						<% 
							}else{ 
						%>
							<span class="acc_list"> <a href="./MemberInfoCheck.me"> <i class="fas fa-user-alt"></i> 나의정보관리 </a> </span>
							<span> <a href="./MemberLogout.me"> 로그아웃 </a> </span>
							<input type="hidden" class="user" value="<%=user%>"> 
						<% } %>
				</div>
			</div>
		</div>
		
		<!-- PC버전 상단 바 -->
		<div class="logo-row container">
			<div class="navbar_logo">
				<div>
					<a href="./Main.bo"> SHOE INFO. </a>
				</div>
			</div>
		</div>
		
		<!-- 모바일 버전 상단 바 -->
		<div class="mob-logo-row">
			<!-- 로고 -->
			<div class="mob-logo">
				<a href="./Main.bo"> SHOE INFO. </a>
			</div>
			<!-- 로그인/회원정보 버튼 -->
			<div class="mob-container">
				<!-- 회원관련 버튼들 -->
				<div class="mob-acc">
					<% if(user == null || user.length() == 0){ %>
						<span> <a href="./MemberLogin.me"><i class="far fa-user"></i></a> </span>
					<%
						}else if(usr_position.equals("admin")){ 
					%>
						<span> <a href="./MemberLogout.me"><i class="fas fa-sign-out-alt"></i></a> </span>
						<span class="acc_list"> <a href="./Main.ad"> <i class="fas fa-user-secret"></i> </a> </span>
						<span class="acc_list"> <a href="./MemberInfoCheck.me"> <i class="fas fa-user-edit"></i> </a> </span> 
					<% 
						}else{ 
					%>
						<span class="acc_list_logout"> <a href="./MemberLogout.me"><i class="fas fa-sign-out-alt"></i></a> </span> 
						<span class="acc_list"> <a href="./MemberInfoCheck.me"> <i class="fas fa-user-edit"></i> </a> </span>
					<% } %>
				</div>
				<!-- 모바일 버전일때 메뉴 버튼 -->
				<div class="mob-nav">
					<a href="javascript:void(0);" class="navbar_toggleBtn">
						<i class="fas fa-bars"></i>
					</a>
				</div>
				
				<div class="mob-nav-exitBtn">
					<a href="javascript:void(0);" class="navbar_toggleBtn">
						<i class="fas fa-times"></i>
					</a>
				</div>
			</div>
		</div>
		
		<div class="menu-row container">
			<div class="block-list">
				<div class="block-content">
					<ul class="nav">
						<li <%if(pageName.equals("allReleaseList.jsp")) {%> style="border-bottom:2px solid black;"<%}%>> 
							<a href="./AllReleaseList.go">발매 중&#8226;발매예정</a>
						</li>
						<li <%if(pageName.equals("todaysReleaseList.jsp")) {%> style="border-bottom:2px solid black;"<%}%>>
							<a href="./TodaysReleaseList.go" style="color:#4990e2;">오늘의 발매처 </a>
						</li>
						<li <%if(pageName.equals("allReleasedList.jsp")) {%> style="border-bottom:2px solid black;"<%}%>>
							<a href="./AllReleasedList.go">발매완료</a>
						</li>
						<li <%if(pageName.equals("snkrsKRList.jsp")) {%> style="border-bottom:2px solid black;"<%}%>>
							<a href="./SnkrsKRList.go">SNKRS</a>
						</li>
						<li <%if(pageName.equals("memberDrawList.jsp")) {%> style="border-bottom:2px solid black;"<%}%>>
							<a href="#" id="myDrawBtn" style="color:#AE0F19;"> 나의 응모내역 </a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
	</header>
	
	<!-- 모바일 흰색 메뉴판 -->
	<div class="mob-menuBoard">
		<a href="./Main.bo">Main</a>
		<a href="./AllReleaseList.go">발매 중 &#8226; 발매예정</a>
		<a href="./TodaysReleaseList.go" style="color:#4990e2;">오늘의 발매처 </a>
		<a href="./AllReleasedList.go">발매완료</a>
		<a href="./SnkrsKRList.go">SNKRS</a>
		<a href="#" id="myDrawBtn" style="color:#AE0F19; margin-bottom:15px !important"> 나의 응모내역 </a>
		<% if(user == null || user.length() == 0){ %>
			
		<% 
			}else{ 
		%>
			<span style="display:block; border-top:1px dotted #e6e6e6;">
				<a href="./MemberLogout.me" style="margin-top:15px !important;">로그아웃</a>
			</span>
		<% } %>
	</div>
	
	<!-- top link -->
	<button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fas fa-caret-up"></i></button>
	
	
	<div id="datebar_div" style="display: none;">
		<nav class="datebar" id="datebar">
			<!-- 오늘 날짜 표시 -->
			<div class="today_date">	
				<span id="today_date_val">  </span>
			</div>
		</nav>
	</div>
	
	

</body>
<script type="text/javascript">

	window.onscroll = function() {myFunction()};
	
	var mybutton = document.getElementById("myBtn");
	
	function myFunction() {		
		//최상단으로 가는 버튼 활성화
	  	if (document.body.scrollTop > 500 || document.documentElement.scrollTop > 500) {
	  		$('#myBtn').fadeIn();
	  		$(".googleAd-leftbottomBox").css('display','block')
		} else {
			$('#myBtn').hide();
			$(".googleAd-leftbottomBox").css('display','none')
		}
	}

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
		
		//모바일 버전 메뉴 버튼 눌렸을시 (메뉴 나오게하기)
		$('.mob-nav').click(function(){
			$(this).hide();
			$('.mob-nav-exitBtn').css('display','inline-block');
			$('.mob-menuBoard').show(0.0001).animate({
                right:0
            });

			$('.mob-menuBoard').on('scroll touchmove mousewheel', function(event) {
				event.preventDefault();
				event.stopPropagation();
				return false;
			});
		});
		//모바일 버전 메뉴 버튼 눌렸을시 (메뉴 없애기)
		$('.mob-nav-exitBtn').click(function(){
			$(this).hide();
			$('.mob-nav').css('display','inline-block');
			$('.mob-menuBoard').show(0.0001).animate({
                right:'-'+100+'%'
            });

// 			$('.mob-menuBoard').off('scroll touchmove mousewheel');
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

</script>
</html>