<%@page import="net.member.db.MemberDTO"%>
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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body>

	<%
		String user = (String) session.getAttribute("email");
		if(user == null){
			response.sendRedirect("./SneakerList.go");
		}
		
		MemberDTO mdto = (MemberDTO) request.getAttribute("mdto");
	%>
	
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
			<div id="content_upPos" style="height: 650px;">
				
				<div class="change_form">
					<div class="up-toggle" style="font-size: 1.1em;">
						<span> 열심회원 등업신청 </span>
					</div>
				</div>
	
				<!-- 등업 신청 form -->
				<form action="#" method="post" id="upPosForm">
					<div class="up-form">
					
						<!-- 주의 문구 -->
						<div class="fm_warn">
							<span style="color:#424242;"><i class="fas fa-exclamation-triangle"></i> &nbsp;열심회원은 일반회원과 달리 <span style="padding-bottom:0.2%; border-bottom: 1.8px solid green; color: green;">발매정보를 추가</span> 할 수 있습니다. </span>
						</div>
						<div class="fm_warn">
							<span style="color:#424242;"><i class="fas fa-exclamation-triangle"></i> &nbsp;발매정보를 <span style="padding-bottom:0.2%; border-bottom: 1.8px solid red; color:red; ">주기적으로 추가 안할시 일반회원으로 될 수 있습니다.</span> </span>
						</div>
						<div class="fm_warn" style="margin: 10px 2px 30px 2px !important;">
							<span style="color:#424242;"><i class="fas fa-exclamation-triangle"></i> &nbsp;신청사유가 타당하지 않을시 등업신청이 거부될 수 있습니다. </span>
						</div>

						<!-- 이메일 -->
						<div class="fm_label">	
							<span> 이메일 </span>
						</div>
						<div class="fm_email">
							<input type="text" name="email" id="fm_email_login" placeholder="이메일" id="email" value="<%=mdto.getEmail()%>" readonly>
						</div>
						
						<!-- 이름 -->
						<div class="fm_label">	
							<span> 이름 </span>
						</div>
						<div class="fm_name">
							<input type="text" name="name" id="fm_name_login" id="name" value="<%=mdto.getName()%>" readonly>
						</div>
						
						<!-- 열심회원 신청이유 -->
						<div class="fm_label">
							<span> 열심회원 신청 사유 </span>
						</div>
						<div class="fm_reason">
							<textarea id="reason" name="reason" rows="5" cols="30"></textarea>
						</div>
						
						<!-- 신청하기 -->
						<div class="fm_submitBtn">
							<button type="button" class="request_submitBtn">
								<span id="join_text">신청하기</span>
							</button>
						</div>
						
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
<script type="text/javascript">

	//Enter키 눌렸을시
	$('input').keypress(function(event){
		if(event.which == 13){
			$('.request_submitBtn').click();
			return false;
		}
	});
	
	//모든 input 체크하기
	$('.request_submitBtn').click(function(){
		//textarea 란이 비어있으면
		if($('#reason').val() == ''){
			alert("등업신청 이유를 작성해주세요.");
			$('#reason').focus();
			return false;
		}
		
		$.ajax({
			type:'post',
			url:'./RequestUpPosAction.me',
			data: 'email=' + $('#fm_email_login').val() + '&name=' + $('#fm_name_login').val() + '&reason=' + $('#reason').val(),
			success:function(data) {
				if($.trim(data) == "EXIST"){
					alert("이미 등업신청을 하였습니다.");
				}else if($.trim(data) == "SUCCESS"){
					alert("등업신청을 완료하였습니다.");
					location.href="./Main.bo";
				}
			},error:function(request,status,error){
			 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}
		});

// 		$('#upPosForm').submit();
	});

</script>
</html>