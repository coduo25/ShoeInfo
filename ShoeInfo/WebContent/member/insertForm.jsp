<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SHOE INFO.</title>
<link href="./css/board/member.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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

			<h3>회원정보 입력</h3>

			<form action="./MemberJoinAction.me" method="post">
				<div class="join-form">
				
					<!-- 이메일 -->
					<div class="fm_email">
						<input type="text" name="email" placeholder="이메일" style="float: left;">
						
						<div class="emailCheck">
							<button type="button" class="checkEmail"> 중복체크 </button>
							<input type="hidden" name="checkedEmail" value="">
						</div>
					</div>

					<!-- 비밀번호 -->
					<div class="fm_pass">
						<input type="password" name="pass" placeholder="비밀번호">
					</div>

					<!-- 비밀번호 체크 --> 
					<div class="fm_passChk">
						<input type="password" name="pass2" placeholder="비밀번호 확인">
					</div>

					<!-- 이름 -->
					<div class="fm_name">
						<input type="text" name="name" placeholder="이름">
					</div>

					<!-- 휴대폰번호 -->
					<div class="fm_phone">
						<input type="text" name="phone" placeholder="휴대폰번호( '-' 제외)" maxlength="13" pattern="\d*">
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
						<input type="submit" value="가입하기" class="submitBtn">
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
<script type="text/javascript">
	
	//올바른 이메일 양식 체크하는 함수
	$('.checkEmail').click(function(){
		var email = $("input[name=email]").val();
		//이메일란에 빈칸을 작성했을시
		if(email == ""){
			alert("이메일을 작성해주세요.");
			$("input[name=email]").focus();
		}
		
		//올바른 이메일 양식 체크하기
		else if(/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/.test($.trim(email))){
			 //alert("사용하실수 있는 양식의 이메일입니다.");
			 $.ajax({
				type:"post",
				url:"./MemberCheckEmailAction.me",
				data: {"email":$("input[name=email]").val()},
				success:function(data){
					//가입 되어 있지 않은 이메일이면
					if($.trim(data) == "YES"){
			 			alert("사용하실수 있는 이메일입니다.");
			 			
			 			//checkedEmail input 값에 checked 값 넣기
			 			$("input[name=checkedEmail]").val("checked");
			 			$("input[name=pass]").focus();
			 		}
			 		//이미 가입되어있는 이메일이면
			 		else if($.trim(data) == "NO"){
			 			alert("이미 가입되어 있는 이메일입니다.");
			 			$("input[name=email]").focus();
			 		}
				},
				error:function(request,status,error){
				 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
				
			 });
		}
		else if(!/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/.test($.trim(email))){
			alert("올바른 양식의 이메일을 작성해주세요.");
			$("input[name=email]").focus();
		}
		
		
		//이메일 input 값이 변경되었을시 감지하는 함수
		$('input[name=email]').change(function(){
			//checkedEmail input 값에 null 값 넣기
 			$("input[name=checkedEmail]").val(null);
		});
	});
	
	//이름 input에 한글, 영어만 입력하도록 하는 함수
	$("input[name=name]").keyup(function(event){
		var inputName = $(this).val();
		$(this).val(inputName.replace(/[^a-z][^A-Z]/gi,''));
	});
	
	//휴대폰번호 input에 숫자만 입력하도록 하는 함수
	$("input[name=phone]").keyup(function(event){
		var inputNum = $(this).val();
		$(this).val(inputNum.replace(/[^0-9]/gi,''));
	});
	
	
	
	
	//이름 input 태그를 클릭했을시 (사이트 공식 배포하고 사업자 등록 한 후 업체 등록하기)
// 	$('input[name=name]').click(function(){
// 		//이메일 인증 체크하기
// 		if($("input[name=checkedEmail]").val() == "checked"){
// 			alert("본인 인증하기");
// 		} else{
// 			alert("본인인증은 이메일 인증 이후 가능합니다.");
// 		}
// 	});
	
</script>
</html>