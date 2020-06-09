<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/include/header.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
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
			<li> <a href="./SneakerList.go"> 런칭 캘린더 </a> </li> 
		</ul>
		
		<!-- 로그인, 마이페이지, 로그아웃 링크 -->
		<ul class="navbar_userlinks">
			<%
				//로그인 되었는지	
				String user = (String) session.getAttribute("id");
				if(user == null){
			%>
				<li> <a href="./MemberLogin.me"> LOGIN </a> </li>
			<%
				}else if(user.equals("admin")){ 
			%>
				<li> <a href="./Main.ad"> ADMIN_PAGE </a> </li>
				<li> <a href="./MemberDrawInfo.me"> MYPAGE </a> </li>
				<li> <a href="./MemberLogout.me"> LOGOUT </a> </li>
			<% 
				}else{ 
			%>
				<li> <a href="./MemberDrawInfo.me"> MYPAGE </a> </li>
				<li> <a href="./MemberLogout.me"> LOGOUT </a> </li>
			<% 
				} 
			%> 
		</ul>
		
		<a href="#" class="navbar_toggleBtn">
			<i class="fas fa-bars"></i>
		</a>
		
	</nav>

</body>
<script type="text/javascript">
	const toggleBtn = document.querySelector('.navbar_toggleBtn');
	const menu = document.querySelector('.navbar_menu');
	const userLinks = document.querySelector('.navbar_userlinks');
	
	toggleBtn.addEventListener('click', () => {
		menu.classList.toggle('active');
		userLinks.classList.toggle('active');
	});
</script>
</html>