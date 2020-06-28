<%@page import="net.member.db.MemberDTO"%>
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

	<%
		MemberDTO mdto = (MemberDTO) session.getAttribute("mdto");
	%>

	<!-- Header -->
	<header>
		<jsp:include page="/include/header.jsp" />
	</header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_register">

			<h3>회원정보 입력</h3>

			<form action="./MemberJoinAction.me" method="post" name="joinForm" id="joinForm">
				<div class="modi-form">
				
					<!-- 이메일 -->
					<div class="fm_email">
						<input type="email" name="email" placeholder="이메일" style="float: left;" value="<%=mdto.getEmail()%>" disabled> 
					</div>

					<!-- 비밀번호 -->
					<div class="fm_pass">
						<input type="password" name="pass" placeholder="비밀번호 (8~16 영문/숫자 포함)" maxlength="16">
						
					</div>
					
					<div class="confirmMsg" style="display: none;">
						<span id="pwConfirmMsg"></span>
					</div>

					<!-- 비밀번호 체크 --> 
					<div class="fm_passChk">
						<input type="password" name="pass2" placeholder="비밀번호 확인">
					</div>

					<!-- 이름 -->
					<div class="fm_name">
						<input type="text" name="name" placeholder="이름" value="<%=mdto.getName()%>">
					</div>

					<!-- 휴대폰번호 -->
					<div class="fm_phone">
						<input type="text" name="phone" placeholder="휴대폰번호( '-' 제외)" maxlength="13" pattern="\d*" value="<%=mdto.getPhone()%>">
					</div>
					
					<!-- 수정하기 버튼 -->
					<div class="fm_submitBtn">
						<input type="submit" value="수정하기" class="modi_submitBtn">
					</div>
				</div>

				
			</form>
		</div>
	</div>

	<!-- FOOTER -->
	<footer>
		<jsp:include page="/include/footer.jsp" />
	</footer>

</body>
</html>