<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=0, maximum-scale=1.0, width=device-width" />
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>SHOE INFO.</title>
<link href="./css/board/member.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
			<!-- content -->
			<div id="content_login">
			
				<div class="change_form">
					<div class="signup-toggle">
						<span> 회원가입 </span>
					</div>
					<div class="login-toggle">
						<span> 로그인  </span>
					</div>
				</div>
				
				<!-- 회원가입 form -->
				<form action="./MemberJoinAction.me" method="post" name="joinForm" id="joinForm">
					<div class="join-form">
					
						<!-- 이메일 -->
						<div class="fm_email">
							<input type="text" name="email" id="fm_email_join" placeholder="이메일" style="float: left;"> 
						</div>
						
						<button type="button" class="checkEmail"> 중복체크 </button>
						<input type="hidden" name="checkedEmail" value="">
	
						<!-- 비밀번호 -->
						<div class="fm_pass">
							<input type="password" name="pass" id="fm_pass_join" placeholder="비밀번호 (8~16 영문/숫자 포함)" maxlength="16">
						</div>
						
							<div class="confirmMsg1" style="display: none;">
								<span id="pwConfirmMsg"></span>
							</div>
	
						<!-- 비밀번호 체크 --> 
						<div class="fm_passChk">
							<input type="password" id="fm_passChk_join" name="pass2" placeholder="비밀번호 확인">
						</div>
						
							<div class="confirmMsg2" style="display: none;">
								<span id="pw2ConfirmMsg"></span>
							</div>
	
						<!-- 이름 -->
						<div class="fm_name">
							<input type="text" name="name" id="fm_name_join" placeholder="이름">
						</div>
	
						<!-- 휴대폰번호 -->
						<div class="fm_phone">
							<input type="text" name="phone" id="fm_phone_join" placeholder="휴대폰번호( '-' 제외)" maxlength="13" pattern="\d*">
						</div>
	
						<!-- 개인정보 처리방침 & 이용약관 동의 체크박스 -->
	<!-- 					<div class="fm_Agree"> -->
	<!-- 						<div> -->
	<!-- 							<input type="checkbox"> <span> <a href="#">개인정보처리방침</a>을 모두 읽었으며, 이에 동의합니다. </span> -->
	<!-- 						</div> -->
	<!-- 						<div> -->
	<!-- 							<input type="checkbox"> <span> <a href="#">이용약관</a>을 모두 읽었으며, 이에 동의합니다. </span> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
						
						<!-- 가입하기 버튼 -->
						<div class="fm_submitBtn">
							<button type="button" class="join_submitBtn">
								<span id="join_text">가입하기</span> <span id="loading" style="display:none; font-size: 1.1em;"><i class="fa fa-spinner fa-spin"></i> </span>
							</button>
						</div>
						
					</div>
				</form>
				
				<!-- 로그인 form -->
				<form action="./MemberLoginAction.me" method="post" id="loginForm">
					<div class="login-form">
					
						<!-- 이메일 -->
						<div class="fm_email">
							<input type="email" name="email" id="fm_email_login" placeholder="이메일" id="email">
						</div>
						
						<!-- 비밀번호 -->
						<div class="fm_pass">
							<input type="password" name="pass" id="fm_pass_login" placeholder="비밀번호">
						</div>
						
						<div class="fm_find">
							<a href="./MemberFindIDPW.me"> 이메일 또는 암호를 잊으셨습니까? </a>
						</div>
						
						<!-- 로그인 -->
						<div class="fm_submitBtn">
							<button type="button" class="login_submitBtn">
								<span id="join_text">로그인</span>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- FOOTER -->
<%-- 	<footer> <jsp:include page="/include/footer.jsp"/> </footer> --%>
	
</body>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		//회원가입 form을 클릭했을시
		$('.signup-toggle').click(function(){
			$('#content_login').css("height", "550px");
			$('.signup-toggle').css({"border-bottom":"3px solid #424242", "color":"#424242"})
			$('.login-toggle').css({"border-bottom":"3px solid #e0e0e0", "color":"#939393"})
			$('#loginForm').hide();
			$('#joinForm').show();
		});
		
		$('.login-toggle').click(function(){
			$('#content_login').css("height", "350px");
			$('.signup-toggle').css({"border-bottom":"3px solid #e0e0e0", "color":"#939393"})
			$('.login-toggle').css({"border-bottom":"3px solid #424242", "color":"#424242"})
			$('#joinForm').hide();
			$('#loginForm').show();
		});
		
		// ---------------- 회원가입 Form 관련 유효성 검사 --------------------
		
		//올바른 이메일 양식 체크하는 함수
		$('.checkEmail').click(function(){
			var email = $("#fm_email_join").val();
			//이메일란에 빈칸을 작성했을시
			if(email == ""){
				alert("이메일을 작성해주세요.");
				$("#fm_email_join").focus();
			}
			
			//올바른 이메일 양식 체크하기
			else if(/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/.test($.trim(email))){
				 //alert("사용하실수 있는 양식의 이메일입니다.");
				 $.ajax({
					type:"post",
					url:"./MemberCheckEmailAction.me",
					data: {"email":$("#fm_email_join").val()},
					success:function(data){
						//가입 되어 있지 않은 이메일이면
						if($.trim(data) == "YES"){
				 			alert("사용하실수 있는 이메일입니다.\n\n※ 주의 : 반드시 본인이 수신가능한 메일이어야합니다.");
				 			
				 			//checkedEmail input 값에 checked 값 넣기
				 			$("input[name=checkedEmail]").val("checked");
				 			$('#emailConfirmIcon').text('✔').css({'color':'green', 'font-size':16, 'font-weight':'bold'});
				 			$("#fm_pass_join").focus();
				 				
				 		}
				 		//이미 가입되어있는 이메일이면
				 		else if($.trim(data) == "NO"){
				 			alert("이미 가입되어 있는 이메일입니다.");
				 			$("#fm_email_join").focus();
				 		}
					},
					error:function(request,status,error){
					 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					}
					
				 });
			}
			else if(!/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/.test($.trim(email))){
				alert("올바른 양식의 이메일을 작성해주세요.");
				$("#fm_email_join").focus();
			}
			
			
			//이메일 input 값이 변경되었을시 감지하는 함수
			$('#fm_email_join').change(function(){
				//checkedEmail input 값에 null 값 넣기
	 			$("input[name=checkedEmail]").val(null);
			});
		});
		
		//비밀번호 유효성 검사
		$("#fm_pass_join").change(function(){
			//비밀번호 조건(8~16자, 영문/숫자 포함)
			if(/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$/.test($(this).val())){
				$('#pwConfirmMsg').text('사용할 수 있는 비밀번호 입니다.').css({'color':'#009c00'});
				$('.confirmMsg1').show("fast");
			} else{
				$('#pwConfirmMsg').text('사용할 수 없는 비밀번호 입니다. (8~16 영문/숫자 포함)').css({'color':'#af0000'});
				$('.confirmMsg1').show("fast");
				$('#fm_pass_join').focus();
			}
		});
		
		//비밀번호 input를 다시 클릭했을시
		$("#fm_pass_join").click(function(){
			this.value = '';
			$('#pwConfirmMsg').text('');
			$('.confirmMsg1').hide("fast");
		});
		
		//비밀번호 확인란 체크하기
		$("#fm_passChk_join").change(function(){
			if($("#fm_pass_join").val() == ''){
				alert("비밀번호를 작성해주세요.");
				$("#fm_passChk_join").val('');
				$("#fm_pass_join").focus();
				return false;
			}
			else if(document.joinForm.pass.value != document.joinForm.pass2.value){
				$('#pw2ConfirmMsg').text('비밀번호가 다릅니다.').css({'color':'#af0000'});
				$('.confirmMsg2').show("fast");
				$('#fm_passChk_join').focus();
			} else{
				$('#pw2ConfirmMsg').text('✔').css({'color':'#009c00'});
				$('.confirmMsg2').show("fast");
			}
		});
		
		//비밀번호확인 input를 다시 클릭했을시
		$("#fm_passChk_join").click(function(){
			this.value = '';
			$('#pw2ConfirmMsg').text('');
			$('.confirmMsg2').hide("fast");
		});
		
		//이름 input에 한글,영어만 입력하도록 하는 함수
		$("#fm_name_join").keyup(function(event){
			var inputName = $(this).val();
			$(this).val(inputName.replace(/[^ㄱ-힣a-zA-Z\u119E\u11A2]/gi,''));
		});
		
		//휴대폰번호 input에 숫자만 입력하도록 하는 함수
		$("#fm_phone_join").keyup(function(event){
			var inputNum = $(this).val();
			$(this).val(inputNum.replace(/[^0-9]/gi,''));
		});
		
		//모든 회원가입 input 유효성 검사하는 함수 -------------------------
		$(".join_submitBtn").click(function(){
			//이메일 빈칸이면
			if($('#fm_email_join').val() == ''){
				alert("이메일을 입력해주세요.");
				$('#fm_email_join').focus();
				return false;
			}
			//중복체크 안했으면
			else if($('input[name=checkedEmail]').val() == ''){
				alert("이메일 중복체크를 해주세요.");
				return false;
			}
			//비밀번호 빈칸이면
			else if($('#fm_pass_join').val() == ''){
				alert("비밀번호를 입력해주세요.");
				$('#fm_pass_join').focus();
				return false;
			}
			//비밀번호가 유효한 비밀번호인지 체크 (사용할 수 없는~) 포함 여부
			else if($('#pwConfirmMsg').text().includes('없는')){
				alert("유효한 비밀번호를 입력해주세요.");
				$('#fm_pass_join').focus();
				return false;
			}
			//비밀번호 확인 빈칸이면
			else if($('#fm_passChk_join').val() == ''){
				alert("비밀번호 확인란을 입력해주세요.");
				$('#fm_passChk_join').focus();
				return false;
			}
			//비밀번호 확인란 체크하기
			else if(document.joinForm.pass.value != document.joinForm.pass2.value){
				alert("비밀번호가 다릅니다.");
				$('#fm_passChk_join').focus();
				return false;
			}
			//이름 빈칸이면
			else if($('#fm_name_join').val() == ''){
				alert("이름을 입력해주세요.");
				$('#fm_name_join').focus();
				return false;
			}
			//휴대폰 번호 빈칸이면
			else if($('#fm_phone_join').val() == ''){
				alert("휴대폰을 입력해주세요.");
				$('#fm_phone_join').focus();
				return false;
			}
			
			$('#join_text').hide();
			$('#loading').show();
			$('#joinForm').submit();
		});
		
		
		
		// ---------------- 로그인 Form 관련 유효성 검사 --------------------
		
		//모든 input 체크하기
		$('.login_submitBtn').click(function(){
		
			//이메일란이 비어있으면
			if($('#fm_email_login').val() == ''){
				alert("이메일을 입력해주세요.");
				$('#fm_email_login').focus();
				return false;
			}
			//비밀번호란이 비어있으면
			else if($('#fm_pass_login').val() == ''){
				alert("비밀번호를 입력해주세요.");
				$('#fm_pass_login').focus();
				return false;
			}
			
			$('#loginForm').submit();
			
		});
		
		
	});
</script>
</html>