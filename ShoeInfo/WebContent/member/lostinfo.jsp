<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>SHOE INFO.</title>
<link href="./css/board/member.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body>

	<!-- Header -->
<%-- 	<header> <jsp:include page="/include/header.jsp" /> </header> --%>

	<div class="mem_header">
		<!-- 로고 -->
		<div class="navbar_logo">
			<a href="./SneakerList.go"> SHOE Info. </a>
		</div>
	</div>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<div class="component-page">
		
			<div class="pre-page">
				<p> <a href="./MemberLogin.me"> <i class="fas fa-angle-left"></i> 뒤로가기  </a> </p>
			</div>

			<!-- content -->
			<div id="content_idpwfind">
			
				<div id="idfind_wrap">
				
					<h3> 이메일 찾기 </h3>
					
					<p> 회원가입 시, 입력하신 이름 + 전화번호로 이메일을 확인하실 수 있습니다. </p> 	
	
					<div class="idfind-form">
					
						<!-- 이름 -->
						<div class="fm_name">
							<input type="text" name="name" placeholder="이름" id="idfind_name">
						</div>
					
						<!-- 전화번호 -->
						<div class="fm_phone">
							<input type="phone" name="phone" placeholder="휴대폰번호( '-' 제외)" id="idfind_phone">
						</div>
						
						<!-- 아이디 찾기 -->
						<div class="fm_idpwsubmitBtn">
							<input type="button" value="이메일 찾기" class="idfind_btn">
						</div>
						
						<!-- 가입한 이메일 나타내는 div -->
						<div class="fm_my_email" style="display: none">
							가입하신 이메일은 <span id="fd_email"></span> 입니다.
						</div>
	
					</div>
	
				</div>
				
				<div id="pwfind_wrap">
				
					<h3> 비밀번호 찾기 </h3>
					
					<p> 이름과 가입하신 이메일을 통해 비밀번호를 재설정 하실 수 있습니다. </p> 	
					
						<div class="pwfind-form">
						
							<!-- 이름 -->
							<div class="fm_name">
								<input type="text" name="name" placeholder="이름" id="pwfind_name">
							</div>
						
							<!-- 이메일 -->
							<div class="fm_email">
								<input type="email" name="email" placeholder="이메일" id="pwfind_email">
							</div>
							
							<!-- 비밀번호 찾기 -->
							<div class="fm_idpwsubmitBtn">
								<input type="button" value="비밀번호 찾기" class="pwfind_btn">
							</div>
		
						</div>
				
				</div>
			</div>
		</div>
	</div>
	
	<!-- FOOTER -->
<%-- 	<footer> <jsp:include page="/include/footer.jsp"/> </footer> --%>
	
</body>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		//이름 input에 한글,영어만 입력하도록 하는 함수
		$("input[name=name]").keyup(function(event){
			var inputName = $(this).val();
			$(this).val(inputName.replace(/[^ㄱ-힣a-zA-Z]/gi,''));
		});
		
		//휴대폰번호 input에 숫자만 입력하도록 하는 함수
		$("input[name=phone]").keyup(function(event){
			var inputNum = $(this).val();
			$(this).val(inputNum.replace(/[^0-9]/gi,''));
		});
		
		//이메일 찾기 버튼 눌렸을시
		$('.idfind_btn').click(function(){
		
			//이름란이 비어있으면
			if($('#idfind_name').val() == ''){
				alert("이름을 입력해주세요.");
				$('#idfind_name').focus();
				return false;
			}
			//전화번호란이 비어있으면
			else if($('#idfind_phone').val() == ''){
				alert("휴대폰번호를 입력해주세요.");
				$('#idfind_phone').focus();
				return false;
			}
			
			//아이디 찾으러 DB에 들어갔다 오기
			$.ajax({
				type:"post",
				url:"./MemberIDFindAction.me",
				data:{"name":$("#idfind_name").val(), "phone":$("#idfind_phone").val()},
				success:function(data){
					//가입 되어 있지 않은 이메일이면
					if($.trim(data) == "NOEMAIL") {
						alert("가입되어 있지 않은 메일입니다.");
					}
					//가입된 메일이면
					else {
						$(".fm_my_email").show();
						$("#fd_email").text(data).css({"color":"#009c00"});
					}
				},
				error:function(request,status,error){
				 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});

		});
		
		//비밀번호 찾기 버튼 눌렸을시
		$(".pwfind_btn").click(function(){

			//이름란이 비어있으면
			if($('#pwfind_name').val() == ''){
				alert("이름을 입력해주세요.");
				$('#pwfind_name').focus();
				return false;
			}
			//이메일란이 비어있으면
			else if($('#pwfind_email').val() == ''){
				alert("이메일을 입력해주세요.");
				$('#pwfind_email').focus();
				return false;
			}
			
			$.ajax({
				type:"post",
				url:"./MemberPWFindAction.me",
				data:{"name":$("#pwfind_name").val(), "email":$("#pwfind_email").val()},
				success:function(data) {
					//가입 되어 있지 않은 이메일이면
					if($.trim(data) == "NOEMAIL") {
						alert("회원 정보가 일치 하지 않습니다.");
						$("#pwfind_name").focus();
					}
					//가입된 메일이면
					else {
						alert("인증메일이 발송되었습니다. 메일을 확인해주세요.");
					}
				},
				error:function(request,status,error){
				 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
			
		});
		
		
	});
</script>
</html>