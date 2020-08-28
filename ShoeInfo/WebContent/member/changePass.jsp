<%@page import="net.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>SHOE INFO.</title>
<link href="./css/board/member.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

	<%
		String email = request.getParameter("email");
	%>
	
	<!-- Header -->
<!-- 	<header> -->
<%-- 		<jsp:include page="/include/header.jsp" /> --%>
<!-- 	</header> -->
	
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
			<div id="content_modifyPW">
				<h3>비밀번호 재설정</h3>
				<form action="#" method="post" name="modiForm" id="modiForm">
					<div class="modi-form">
					
						<!-- 이메일 -->
						<div class="fm_email">
							<input type="email" name="email" placeholder="이메일" value="<%=email%>" disabled> 
						</div>
	
						<!-- 비밀번호 -->
						<div class="fm_pass">
							<input type="password" name="pass" placeholder="비밀번호 (8~16 영문/숫자 포함)" maxlength="16">
							
						</div>
						
							<div class="confirmMsg1" style="display: none;">
								<span id="pwConfirmMsg1"></span>
							</div>
	
						<!-- 비밀번호 체크 --> 
						<div class="fm_passChk">
							<input type="password" name="pass2" placeholder="비밀번호 확인">
						</div>
						
							<div class="confirmMsg2" style="display: none;">
								<span id="pw2ConfirmMsg"></span>
							</div>
						
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

	<!-- FOOTER -->
<!-- 	<footer> -->
<%-- 		<jsp:include page="/include/footer.jsp" /> --%>
<!-- 	</footer> -->

</body>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		//비밀번호 유효성 검사
		$("input[name=pass]").change(function(){
			//비밀번호 조건(8~16자, 영문/숫자 포함)
			if(/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$/.test($(this).val())){
				$('#pwConfirmMsg1').text('사용할 수 있는 비밀번호 입니다.').css({'color':'#009c00'});
				$('.confirmMsg1').show("fast");
			} else{
				$('#pwConfirmMsg1').text('사용할 수 없는 비밀번호 입니다.').css({'color':'#af0000'});
				$('.confirmMsg1').show("fast");
				$('input[name=pass]').focus();
			}
		});
		
		//비밀번호 input를 다시 클릭했을시
		$("input[name=pass]").click(function(){
			this.value = '';
			$('#pwConfirmMsg1').text('');
			$('.confirmMsg1').hide("fast");
		});
		
		//비밀번호 확인란 체크하기
		$("input[name=pass2]").change(function(){
			if($("input[name=pass]").val() == ''){
				alert("비밀번호를 작성해주세요.");
				$("input[name=pass2]").val('');
				$("input[name=pass]").focus();
				return false;
			}
			else if(document.modiForm.pass.value != document.modiForm.pass2.value){
				$('#pw2ConfirmMsg').text('비밀번호가 다릅니다.').css({'color':'#af0000'});
				$('.confirmMsg2').show("fast");
				$('input[name=pass2]').focus();
			} else{
				$('#pw2ConfirmMsg').text('✔').css({'color':'#009c00'});
				$('.confirmMsg2').show("fast");
			}
		});
		
		//비밀번호 확인 input를 다시 클릭했을시
		$("input[name=pass2]").click(function(){
			this.value = '';
		});
		
		//비밀번호확인 input를 다시 클릭했을시
		$("input[name=pass2]").click(function(){
			this.value = '';
			$('#pw2ConfirmMsg').text('');
			$('.confirmMsg2').hide("fast");
		});
		
		// ----------------------------------------------------------------------------
		// 모든 input 유효성 검사하는 함수
		
		$(".modi_submitBtn").click(function(){
			
			//비밀번호 빈칸이면
			if($('input[name=pass]').val() == ''){
				alert("비밀번호를 입력해주세요.");
				$('input[name=pass]').focus();
				return false;
			}
			//비밀번호가 유효한 비밀번호인지 체크 (사용할 수 없는~) 포함 여부
			else if($('#pwConfirmMsg1').text().includes('없는')){
				alert("유효한 비밀번호를 입력해주세요.");
				$('input[name=pass]').focus();
				return false;
			}
			//비밀번호 확인 빈칸이면
			else if($('input[name=pass2]').val() == ''){
				alert("비밀번호 확인란을 입력해주세요.");
				$('input[name=pass2]').focus();
				return false;
			}
			//비밀번호 확인란 체크하기
			else if(document.modiForm.pass.value != document.modiForm.pass2.value){
				alert("비밀번호가 다릅니다.");
				$('input[name=pass2]').focus();
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

</script>
</html>