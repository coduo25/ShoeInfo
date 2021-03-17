<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=0, maximum-scale=1.0, width=device-width" />
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>비밀번호 요청 | SHOE INFO.</title>
<link href="./css/board/member.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
	
		<div class="component-page">
			<!-- content -->
			<div class="findPass-box">
				<div class="findPass_subtitle">
					<span> Password Request </span>
				</div>
				<div class="findPassformBox">
					<div class="pwfind-form">
					
						<!-- 이메일 -->
						<div class="fm_txt">
							<span>이메일</span>
						</div>
						<div class="fm_input">
							<input type="email" name="email" placeholder="이메일" id="pwfind_email">
						</div>
						<!-- 이름 -->
						<div class="fm_txt">
							<span>이름</span>
						</div>
						<div class="fm_input">
							<input type="text" name="name" placeholder="이름" id="pwfind_name">
						</div>
					
						<!-- 비밀번호 찾기 -->
						<div class="fm_submitBtn">
							<button type="button" class="pwfind_btn">
								<span id="pass_text">이메일 보내기</span>&nbsp;<span id="loading" style="display:none; font-size: 1.1em;"><i class="fa fa-spinner fa-spin"></i> </span>
							</button>
						</div>
					</div>
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
		
		//이름 input에 한글,영어만 입력하도록 하는 함수
		$("input[name=name]").keyup(function(event){
			var inputName = $(this).val();
			$(this).val(inputName.replace(/[^ㄱ-힣a-zA-Z\u119E\u11A2]/gi,''));
		});
		
		//enter 키를 눌렸을시
		$('#pwfind_name, #pwfind_email').keypress(function(event){
			if(event.which == 13){
				$(".pwfind_btn").click();
				return false;
			}
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
			
// 			alert("비밀번호 찾기 기능은 현재 준비중입니다.\ninfo@shoeinfo.co.kr로 문의주시면 감사하겠습니다.")
			
			$('#pass_text').hide();
			$('#loading').show();
			
			$.ajax({
				type:"post",
				url:"./MemberPWFindAction.me",
				data:{"name":$("#pwfind_name").val(), "email":$("#pwfind_email").val()},
				success:function(data) {
					//가입 되어 있지 않은 이메일이면
					if($.trim(data) == "NOEMAIL") {
						alert("회원 정보가 일치 하지 않습니다.");
						$('#loading').hide();
						$('#pass_text').show();
						$("#pwfind_name").focus();
					}
					//가입된 메일이면
					else if($.trim(data) == "CHECKEMAIL"){
						$('#loading').hide();
						$('#pass_text').show();
						alert("인증메일이 발송되었습니다. 메일을 확인해주세요.");
						location.href="./MemberLogin.me";
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