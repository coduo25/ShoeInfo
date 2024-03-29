<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=0, maximum-scale=1.0, width=device-width" />
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>회원정보 확인 | SHOE INFO.</title>
<link href="./css/board/member.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
	
	<%
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		if(user == null){
			response.sendRedirect("./SneakerList.go");
		}
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
	
		<div class="component-page">
			<!-- content -->
			<div class="accCheck-box">
				<div class="accCheck_subtitle">
					<span> Account Check  </span>
				</div>
				<div class="accCheckformBox">
					<form action="./MemberInfoCheckAction.me" method="post" id="loginForm">
						<div class="login-form">
						
							<!-- 이메일 -->
							<div class="fm_txt">
								<span>이메일</span>
							</div>
							<div class="fm_input">
								<input type="text" name="email" id="fm_email_login" id="email" value="<%=user%>" readonly style="background-color:#ececec !important;">
							</div>
							
							<!-- 비밀번호 -->
							<div class="fm_txt">
								<span>비밀번호</span>
							</div>
							<div class="fm_input">
								<input type="password" name="pass" id="fm_pass_login">
							</div>
							
							<!-- 로그인 -->
							<div class="fm_submitBtn">
								<button type="button" class="login_submitBtn">
									<span id="join_text">인증하기</span>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>

</body>
<script type="text/javascript">

	$(document).ready(function(){
		//방지
		$(document).bind('keydown', function(e){
			if(e.keyCode == 123 /* F12 */){
				e.preventDefault();
				e.returnVale = false;
			}
		});
	});

	//---------------- 로그인 Form 관련 유효성 검사 --------------------
	//Enter키 눌렸을시
	$('input').keypress(function(event){
		if(event.which == 13){
			$('.login_submitBtn').click();
			return false;
		}
	});
	
	//모든 input 체크하기
	$('.login_submitBtn').click(function(){
	
		//비밀번호란이 비어있으면
		if($('#fm_pass_login').val() == ''){
			alert("비밀번호를 입력해주세요.");
			$('#fm_pass_login').focus();
			return false;
		}
		
		$('#loginForm').submit();
		
	});
	
	document.onmousedown=disableclick;
	//status="Right click is not availble";
	
	function disableclick(event){
		if(event.button==2){
			//alert(status);
			return false;
		}
	}

</script>
</html>