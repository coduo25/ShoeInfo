<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=0, maximum-scale=1.0, width=device-width" />
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>로그인 &#8226; 회원가입 | SHOE INFO.</title>
<link href="./css/board/member.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>

	<%
		String user = (String) session.getAttribute("email");
		if(user != null){
			response.sendRedirect("./SneakerList.go");
		}
	%>
	
	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>
	
	<!-- Main Content -->
	<div id="wrapper" class="container">
	
		<div class="component-page">
			<!-- login content -->
			<div class="login-box">
				<div class="login_subtitle">
					<span>Login</span>
				</div>
				<div class="loginformBox">
					<!-- 로그인 form -->
					<form action="./MemberLoginAction.me" method="post" id="loginForm">
						<div class="login-form">
						
							<!-- 이메일 -->
							<div class="fm_txt">
								<span>이메일</span>
							</div>
							<div class="fm_input">
								<input type="email" name="email" id="fm_email_login">
							</div>
							
							<!-- 비밀번호 -->
							<div class="fm_txt">
								<span>비밀번호</span>
							</div>
							<div class="fm_input">
								<input type="password" name="pass" id="fm_pass_login">
							</div>
							
							<div class="fm_find">
								<a href="./MemberFindIDPW.me"> 암호를 잊으셨습니까? </a>
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
			
			<!-- 회원이 아니십니까? -->
			<div class="joinPopUp-text" style="margin:20px 0;">
				<span>계정이 없으십니까?</span>
			</div>
			<div class="joinPopUp-textUp" style="display:none; margin:15px 0 5px 0;">
				<span style="font-size:20px !important;"><i class="fas fa-angle-up"></i></span>
			</div>
			
			<!-- register content  -->
			<div class="join-box" style="display:none; background-color:#f2f2f2; ">
				<div class="join_subtitle">
					<span>Create Account</span>
				</div>
				<div class="joinformBox">
					<form action="./MemberJoinAction.me" method="post" name="joinForm" id="joinForm">
						<div class="join-form">
						
							<!-- 이메일 -->
							<div class="fm_txt">
								<span>이메일*</span>
							</div>
							<div class="fm_input">
								<input type="text" name="email" id="fm_email_join"> 
							</div>
								<!-- 중복체크 input 없을시 checked -->
								<input type="hidden" name="checkedEmail" value="">
		
							<!-- 비밀번호 -->
							<div class="fm_txt">
								<span>비밀번호*</span>
							</div>
							<div class="fm_input">
								<input type="password" name="pass" id="fm_pass_join" placeholder="(8~16 영문/숫자 포함)" maxlength="16">
							</div>
								<!-- 비밀번호 유효성 검사 체크 -->
								<input type="hidden" name="checkedPass" value="">
							
							<!-- 이름 -->
							<div class="fm_txt">
								<span>이름*</span>
							</div>
							<div class="fm_input">
								<input type="text" name="name" id="fm_name_join">
							</div>
							
							<!-- 이용약관 & 개인정보정책 동의란 -->
							<div class="privacyBox">
								<p>
									<input type="checkbox" name="privacy" id="fm_privacy"> <span id="privacy_label"> (필수) 이용약관 <span id="popup_privacy" onclick="openJoin_term()" >전체보기</span></span>
								</p>
								<p>
									<input type="checkbox" name="privacy" id="fm_join_term"> <span id="privacy_label"> (필수) 개인정보정책 <span id="popup_privacy" onclick="openPrivacy()">전체보기</span> </span>
								</p>
							</div>
							
							
							<!-- 가입하기 버튼 -->
							<div class="fm_submitBtn">
								<button type="button" class="join_submitBtn">
									<span id="join_text">가입하기</span> <span id="loading" style="display:none; font-size: 1.1em;"><i class="fa fa-spinner fa-spin"></i> </span>
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
		
		$('#fm_email_login').focus();
		
		//방지
		$(document).bind('keydown', function(e){
			if(e.keyCode == 123 /* F12 */){
				e.preventDefault();
				e.returnVale = false;
			}
		});
		
		//회원이 아닙니다 클릭했을시 
		$('.joinPopUp-text').click(function(){
			$(this).css('display', 'none');
			
			$('.joinPopUp-textUp').css('display', 'block');
			
			//회원가입 form 밑으로 내리기
			$('.join-box').fadeIn();
		});
		//회원가입 form 접는 버튼 클릭했을시
		$('.joinPopUp-textUp').click(function(){
			$(this).css('display', 'none');
			
			$('.joinPopUp-text').css('display', 'block');
			
			//회원가입 form 밑으로 내리기
			$('.join-box').slideUp('fast');
		});
		
		// ---------------- 회원가입 Form 관련 유효성 검사 --------------------
		
		//올바른 이메일 양식 체크하는 함수
		$('#fm_email_join').on("propertychange change keyup paste input", function(){
			var email = $("#fm_email_join").val();
			//이메일란에 빈칸을 작성했을시
			if(email == ""){
// 				alert("이메일을 작성해주세요.");
				$("#fm_email_join").focus();
			}
			
			//올바른 이메일 양식 체크하기
			else if(/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/.test($.trim(email))){
				 $.ajax({
					type:"post",
					url:"./MemberCheckEmailAction.me",
					data: {"email":$("#fm_email_join").val()},
					success:function(data){
						//가입 되어 있지 않은 이메일이면
						if($.trim(data) == "YES"){
// 				 			alert("사용하실수 있는 이메일입니다.\n\n※ 주의 : 반드시 본인이 수신가능한 메일이어야합니다.");
				 			$('#fm_email_join').css({"border":"1px solid #46a74e", "color":"#46a74e"}); //초록
				 			
				 			//checkedEmail input 값에 checked 값 넣기
				 			$("input[name=checkedEmail]").val("checked");
				 		}
				 		//이미 가입되어있는 이메일이면
				 		else if($.trim(data) == "NO"){
// 				 			alert("이미 가입되어 있는 이메일입니다.");
				 			$('#fm_email_join').css({"border":"1px solid #f13340", "color":"#f13340"}); //레드
				 			$("input[name=checkedEmail]").val(null);
				 		}
					},
					error:function(request,status,error){
					 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					}
					
				 });
			}
			else if(!/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/.test($.trim(email))){
// 				alert("올바른 양식의 이메일을 작성해주세요.");
				$('#fm_email_join').css({"border":"1px solid #f13340", "color":"#f13340"}); //레드
				$("input[name=checkedEmail]").val(null);
			}
			
			//이메일 input 값이 변경되었을시 감지하는 함수
			$('#fm_email_join').change(function(){
				//checkedEmail input 값에 null 값 넣기
	 			$("input[name=checkedEmail]").val(null);
			});
		});
		
		//비밀번호 input를 클릭했을시
		$("#fm_pass_join").click(function(){
			this.value = '';
			$('#fm_pass_join').css({"border":"1px solid #f13340", "color":"#f13340"}); //레드
			$('input[name=checkedPass]').val(null);
		});
		
		//비밀번호 유효성 검사
		$("#fm_pass_join").on("propertychange change keyup paste input", function(){
			//비밀번호 조건(8~16자, 영문/숫자 포함)
			if(/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$/.test($(this).val())){
				$('#fm_pass_join').css({"border":"1px solid #46a74e", "color":"#46a74e"}); //초록
				$("input[name=checkedPass]").val("checked");
			} else{
				$('#fm_pass_join').css({"border":"1px solid #f13340", "color":"#f13340"}); //레드
				$('input[name=checkedPass]').val(null);
			}
		});

		//이름 input에 한글,영어만 입력하도록 하는 함수
		$("#fm_name_join").on("propertychange change keyup paste input", function(){
			var inputName = $(this).val();
			$(this).val(inputName.replace(/[^ㄱ-힣a-zA-Z\u119E\u11A2]/gi,''));
		});
		
		//enter 키 눌렸을시
		$('#fm_email_join, #fm_pass_join, #fm_passChk_join, #fm_name_join').keypress(function(event){
			if(event.which == 13){
				$(".join_submitBtn").click();
				return false;
			}
		});
		
		//모든 회원가입 input 유효성 검사하는 함수 -------------------------
		$(".join_submitBtn").click(function(){
			//이메일 빈칸이면
			if($('#fm_email_join').val() == ''){
				alert("이메일을 작성해주세요.");
				$('#fm_email_join').focus();
				return false;
			}
			//중복체크 안했으면
			else if($('input[name=checkedEmail]').val() == ''){
				alert("이미 가입되어 있거나 올바른 이메일 양식을 작성해주세요.");
				$('#fm_email_join').focus();
				return false;
			}
			//비밀번호 빈칸이면
			else if($('#fm_pass_join').val() == ''){
				alert("비밀번호를 작성해주세요.");
				$('#fm_pass_join').focus();
				return false;
			}
			//비밀번호 체크 input이 빈칸이면
			else if($('input[name=checkedPass]').val() == ''){
				alert("올바른 비밀번호를 작성해주세요.");
				$('#fm_pass_join').focus();
				return false;
			}
			//이름 빈칸이면
			else if($('#fm_name_join').val() == ''){
				alert("이름을 작성해주세요.");
				$('#fm_name_join').focus();
				return false;
			}
			//이용약관 개인정보정책 동의 체크하기
			else if($("#fm_privacy").is(":checked") == false){
				alert("이용약관에 동의를 해주세요.");
				return false;
			}
			else if($("#fm_join_term").is(":checked") == false){
				alert("개인정보정책에 동의를 해주세요.");
				return false;
			}
			
			$('#join_text').hide();
			$('#loading').show();
			$('#joinForm').submit();
		});
		
		

		// ---------------- 로그인 Form 관련 유효성 검사 --------------------
		//Enter키 눌렸을시
		$('#fm_email_login, #fm_pass_login').keypress(function(event){
			if(event.which == 13){
				$('.login_submitBtn').click();
				return false;
			}
		});
		
		//모든 input 체크하기
		$('.login_submitBtn').click(function(){
		
			//이메일란이 비어있으면
			if($('#fm_email_login').val() == ''){
				alert("이메일을 작성해주세요.");
				$('#fm_email_login').focus();
				return false;
			}
			//비밀번호란이 비어있으면
			else if($('#fm_pass_login').val() == ''){
				alert("비밀번호를 작성해주세요.");
				$('#fm_pass_login').focus();
				return false;
			}

			$.ajax({
				type:"post",
				url:"./MemberLoginAction.me",
				data: 'email=' + $('#fm_email_login').val() + '&pass=' + $('#fm_pass_login').val(),
				success:function(data) {
					if($.trim(data) == "NOEMAIL"){
						alert("존재하지 않는 이메일입니다.");
					}else if($.trim(data) == "WRONGPASS"){
						alert("비밀번호가 올바르지 않습니다.");
						$('#fm_pass_login').focus();
					}else if($.trim(data) == "SUCCESS"){
						location.href="./Main.bo";
					}
				},error:function(request,status,error){
				 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
			
		});
		
	});
	
	document.onmousedown=disableclick;
	//status="Right click is not availble";
	
	function disableclick(event){
		if(event.button==2){
			//alert(status);
			return false;
		}
	}
	
	function openJoin_term() {
		window.open("./include/join_terms.html", "a", "width=550, height=500, left=100, top=50");
	}
	
	function openPrivacy() {
		window.open("./include/privacy.html", "a", "width=550, height=500, left=100, top=50");
	}
	
</script>
</html>