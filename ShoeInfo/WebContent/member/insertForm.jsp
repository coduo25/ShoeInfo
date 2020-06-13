<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SHOE INFO.</title>
<link href="./css/board/main.css" rel="stylesheet">
</head>
<body>

	<!-- Header -->
	<header>
		<jsp:include page="/include/header.jsp" />
	</header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_register">

			<h2>회원가입</h2>

			<form action="./MemberJoinAction.me" method="post">
			
				<!-- 이메일 -->
				<div class="fm_email">
					<span> 이메일 * </span> 
					<input type="text" name="email"> <br>
				</div>
				
				<!-- 비밀번호 -->
				<div class="fm_pass">
					<span> 비밀번호 * </span>
					<input type="password" name="pass">
				</div>
				
				<!-- 비밀번호 체크 -->
				<div class="fm_passChk">
					<span> 비밀번호 확인 * </span>
					<input type="password" name="pass2">
				</div>

				<!-- 이름 -->
				<div class="fm_name">
					<span> 이름 * </span>
					<input type="text" name="name">
				</div>
				
				<!-- 휴대폰번호 -->
				<div class="fm_phone">
					<span> 휴대폰번호 * </span>
					<input type="text" name="phone">
				</div>
				
				<!-- 개인정보 처리방침 & 이용약관 동의 체크박스 -->
				<div class="fm_Agree">
					<div>
						<input type="checkbox"> <span> <a href="#">개인정보처리방침</a>을 모두 읽었으며, 이에 동의합니다. </span>
					</div>
					<div>
						<input type="checkbox"> <span> <a href="#">이용약관</a>을 모두 읽었으며, 이에 동의합니다. </span>
					</div>
				</div>
				 
				 
				<input type="submit" value="가입하기">
			</form>
		</div>
	</div>

	<!-- FOOTER -->
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>
</body>
</html>