<%@page import="net.member.db.MemberDTO"%>
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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body> <!-- oncontextmenu='return false' onselectstart='return false' ondragstart='return false' -->

	<%
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		if(user == null){
			response.sendRedirect("./SneakerList.go");
		}
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("mdto");
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<div class="component-page">
			
			<div class="update-box">
				<div class="update_subtitle">
					<span>Update Information</span>
				</div>
				<div class="updateformBox">
					<!-- 회원정보수정 form -->
					<form action="#" method="post" name="modiForm" id="modiForm">
						<div class="modi-form">
						
							<!-- 이메일 -->
							<div class="fm_txt">
								<span>이메일</span>
							</div>
							<div class="fm_input">
								<input type="email" id="fm_email_join" name="email" value="<%=mdto.getEmail()%>" disabled style="background-color:#ececec !important;" > 
							</div>
		
							<!-- 비밀번호 -->
							<div class="fm_txt">
								<span>비밀번호</span>
							</div>
							<div class="fm_input">
								<input type="password" id="fm_pass_join" name="pass" maxlength="16">
							</div>
								<!-- 비밀번호 유효성 검사 체크 -->
								<input type="hidden" name="checkedPass" value="">
		
							<!-- 이름 -->
							<div class="fm_txt">
								<span>이름</span>
							</div>
							<div class="fm_input">
								<input type="text" id="fm_name_join" name="name" value="<%=mdto.getName()%>">
							</div>
							
							<!-- 수정하기 버튼 -->
							<div class="fm_submitBtn">
								<button type="button" class="modi_submitBtn">
									<span id="join_text">수정하기</span>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			
			<div class="content_modify">
				<div class="delete_text"> 회원탈퇴신청 </div>
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
		
		//이름 input에 한글,영어만 입력하도록 하는 함수
		$("#fm_name_join").on("propertychange change keyup paste input", function(){
			var inputName = $(this).val();
			$(this).val(inputName.replace(/[^ㄱ-힣a-zA-Z\u119E\u11A2]/gi,''));
		});

		
		//Enter키 눌렸을시
		$('input').keypress(function(event){
			if(event.which == 13){
				$(".modi_submitBtn").click();
				return false;
			}
		});
		
		//모든 회원 수정 input 유효성 검사하는 함수 -------------------------
		$(".modi_submitBtn").click(function(){
			
			//비밀번호 빈칸이면
			if($('#fm_pass_join').val() == ''){
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
			//이름 빈칸이면
			else if($('#fm_name_join').val() == ''){
				alert("이름을 작성해주세요.");
				$('#fm_name_join').focus();
				return false;
			}
			
			//모든 유효성 검사 통과했을시 Ajax로 정보 수정하기
			$.ajax({
				type:"post",
				url:"./MemberUpdateInfoAction.me",
				data: {"email":$("input[name=email]").val(), "pass":$("input[name=pass]").val(), "name":$("input[name=name]").val()},
				success:function(data){
					//정보 수정했을시
					if($.trim(data) == "YES"){
						alert("회원 정보가 수정되었습니다.");
						location.href="./Main.bo";
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
		
		//탈퇴신청 문구 클릭했을시
		$('.delete_text').click(function(){
			 var confirm_delete = confirm("회원탈퇴를 하시겠습니까? (철회불가) \n탈퇴시 모든 정보가 삭제됩니다.");
			 if(confirm_delete) {
				$.ajax({
					type:"post",
					url:"./MemberDeleteAction.me",
					data:{"email":$("input[name=email]").val()},
					success:function(data){
						if($.trim(data) == "SUCCESS"){
							alert("성공적으로 탈퇴 하였습니다.");
							location.href="./Main.bo";
						}
					},
					error:function(request,status,error){
					 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					}
				});
			 }
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