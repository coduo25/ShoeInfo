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
		<div id="content_idpwfind">
		
			<div id="idfind_wrap">
			
				<h3> 아이디 찾기 </h3>
				
				<p> 회원가입 시, 입력하신 이름 + 이메일로 아이디를 확인하실 수 있습니다. </p> 	
			
				<form method="post" id="idfindForm">
					<div class="idfind-form">
					
						<!-- 이름 -->
						<div class="fm_name">
							<input type="text" name="name" placeholder="이름" id="name">
						</div>
					
						<!-- 이메일 -->
						<div class="fm_email">
							<input type="email" name="email" placeholder="이메일" id="email">
						</div>
						
						<!-- 아이디 찾기 -->
						<div class="fm_idpwsubmitBtn">
							<input type="submit" value="아이디 찾기">
						</div>
	
					</div>
				</form>
			
			</div>
			
			<div id="pwfind_wrap">
			
				<h3> 비밀번호 찾기 </h3>
				
				<p> 가입하신 이메일을 통해 비밀번호를 재설정 하실 수 있습니다. </p> 	
				
				<form method="post" id="pwfindForm">
					<div class="pwfind-form">
					
						<!-- 이메일 -->
						<div class="fm_email">
							<input type="email" name="email" placeholder="이메일" id="email">
						</div>
						
						<!-- 비밀번호 찾기 -->
						<div class="fm_idpwsubmitBtn">
							<input type="submit" value="비밀번호 찾기">
						</div>
	
					</div>
				</form>
			
			</div>
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>
	
</body>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		//모든 input 체크하기
		$('#loginForm').submit(function(){
		
			//이메일란이 비어있으면
			if($('input[name=email]').val() == ''){
				alert("이메일을 입력해주세요.");
				$('input[name=email]').focus();
				return false;
			}
			//비밀번호란이 비어있으면
			else if($('input[name=pass]').val() == ''){
				alert("비밀번호를 입력해주세요.");
				$('input[name=pass]').focus();
				return false;
			}
			
		});
		
		
	});
</script>
</html>