<%@page import="net.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=0, maximum-scale=1.0, width=device-width" />
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>비밀번호 변경 | SHOE INFO.</title>
<link href="./css/board/member.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>

	<%
		String email = request.getParameter("email");
	%>
	
	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<div class="component-page">
			<div class="resetPass-box">
				<div class="resetPass_subtitle">
					<span>Reset Password</span>
				</div>
				<div class="resetPassBox">
					<form action="#" method="post" name="modiForm" id="modiForm">
						<div class="modi-form">
						
							<!-- 이메일 -->
							<div class="fm_txt">
								<span>이메일</span>
							</div>
							<div class="fm_input">
								<input type="text" name="email" value="<%=email%>" readonly style="background-color:#ececec !important;"> 
							</div>
		
							<!-- 비밀번호 -->
							<div class="fm_txt">
								<span>비밀번호*</span>
							</div>
							<div class="fm_input">
								<input type="password" id="fm_pass_join" name="pass" placeholder="(8~16 영문/숫자 포함)" maxlength="16">
							</div>
								<!-- 비밀번호 유효성 검사 체크 -->
								<input type="hidden" name="checkedPass" value="">
							
							<!-- 수정하기 버튼 -->
							<div class="fm_submitBtn">
								<button type="button" class="modi_submitBtn">
									<span id="join_text">재설정하기</span>
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

		// ----------------------------------------------------------------------------
		// 모든 input 유효성 검사하는 함수
		
		$(".modi_submitBtn").click(function(){
			
			//이메일 값이 빈칸이면
			if($('input[name=email]').val() == ''){
				alert("이메일이 없습니다.");
				location.href="./MemberLogin.me";
				return false;
			}
			//비밀번호 빈칸이면
			else if($('#fm_pass_join').val() == ''){
				alert("비밀번호를 작성해주세요.");
				$('#fm_pass_join').focus();
				return false;
			}
			//비밀번호가 유효한 비밀번호인지 체크 (사용할 수 없는~) 포함 여부
			else if($('#pwConfirmMsg').text().includes('없는')){
				alert("유효한 비밀번호를 입력해주세요.");
				$('input[name=pass]').focus();
				return false;
			}
			//비밀번호 체크 input이 빈칸이면
			else if($('input[name=checkedPass]').val() == ''){
				alert("올바른 비밀번호를 작성해주세요.");
				$('#fm_pass_join').focus();
				return false;
			}
			
			//모든 유효성 검사 통과했을시 Ajax로 정보 수정하기
			$.ajax({
				type:"post",
				url:"./MemberChangePassAction.me",
				data: {"email":$("input[name=email]").val(), "pass":$("input[name=pass]").val()},
				success:function(data){
					//정보 수정했을시
					if($.trim(data) == "YES"){
						alert("비밀번호가 재설정되었습니다.");
						location.href="./MemberLogin.me";
					}
					//가입되어 있지 않은 이메일이면
					else if($.trim(data) == "NO"){
						alert("가입 되어 있지 않은 이메일입니다.");
						location.href="./MemberJoin.me";
					}
				},
				error:function(request,status,error){
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

</script>
</html>