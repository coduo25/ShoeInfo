<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SHOE INFO.</title>
<link href="./css/board/main.css" rel="stylesheet">
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

			<h2>회원가입</h2>

			<form action="./MemberJoinAction.me" method="post">
			
				<!-- 이메일 -->
				<div class="fm_email">
					<span> 이메일 * </span> 
					<input type="text" name="email">
					
					<button type="button" class="checkEmail"> 중복체크 </button>
					<input type="hidden" name="checkedEmail" value="">
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
	
	//이름 input 태그를 클릭했을시
	$('input[name=name]').click(function(){
		//이메일 인증 체크하기
		if($("input[name=checkedEmail]").val() == "checked"){
			alert("본인 인증하기");
		} else{
			alert("본인인증은 이메일 인증 이후 가능합니다.");
		}
	});
	
</script>
</html>