<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<title>SHOE INFO.</title>
<link href="./css/board/member.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_login">
		
			<h3> 로그인 </h3>
		
			<form action="./MemberLoginAction.me" method="post">
				<div class="login-form">
				
					<!-- 이메일 -->
					<div class="fm_email">
						<input type="text" name="email" placeholder="이메일">
					</div>
					
					<!-- 비밀번호 -->
					<div class="fm_pass">
						<input type="password" name="pass" placeholder="비밀번호">
					</div>
					
					<!-- 로그인 -->
					<div class="fm_submitBtn">
						<input type="submit" value="로그인">
					</div>
					
					<!-- 아이디 찾기/비밀번호 찾기 -->
					<div class="fm_findBtn"> 
						<ul>
							<li> <a href="#"> ID/PW 찾기 </a> </li>
							<li style="border-left: 1px solid #666666"> <a href="./MemberJoin.me"> 회원가입 </a> </li>
						</ul>
					</div>
					
					
				</div>
			</form>
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>
	
</body>
</html>