<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.online.db.OnlineDTO"%>
<%@page import="net.sneaker.db.SneakerDTO"%>
<%@page import="net.country.db.CountryDTO"%>
<%@page import="net.brand.db.BrandDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%	request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>SHOE INFO.</title>
<link href="./css/board/sneakerDetail.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body>

	<%
	
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		if(user == null){
			response.sendRedirect("./SneakerList.go");
		}
		
		//신발정보
		SneakerDTO sdto = (SneakerDTO) request.getAttribute("sneakerDetail"); 
		
		//선택된 브랜드 정보
		BrandDTO bdto = (BrandDTO) request.getAttribute("brandDetail");
		
		//저장된 온라인 정보
		OnlineDTO onlineDrawInfo = (OnlineDTO) request.getAttribute("onlineDrawInfo");
	
		SimpleDateFormat original_format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
		SimpleDateFormat new_date_format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat new_hour_format = new SimpleDateFormat("HH:mm");
		
		String online_start_date = "";
		String online_start_time = "";
		String online_end_date = "";
		String online_end_time = "";
		
		if(onlineDrawInfo.getOnline_start_date().isEmpty()){
			online_start_date = "9999-99-99";
		}else {
			online_start_date = onlineDrawInfo.getOnline_start_date();
		}
		if(onlineDrawInfo.getOnline_start_time().isEmpty()){
			online_start_time = "12:34";
		}else {
			online_start_time = onlineDrawInfo.getOnline_start_time();
		}
		if(onlineDrawInfo.getOnline_end_time().isEmpty()){
			online_end_date = "9999-99-99";
		}else {
			online_end_date = onlineDrawInfo.getOnline_end_date();
		}
		if(onlineDrawInfo.getOnline_end_time().isEmpty()){
			online_end_time = "12:34";
		}else {
			online_end_time = onlineDrawInfo.getOnline_end_time();
		}
		
		Date original_Online_start_time = original_format.parse(online_start_date + " " + online_start_time);
		Date original_Online_end_time = original_format.parse(online_end_date + " " + online_end_time);
		
		//가지고온 시간 나누기(yyyy-MM-dd랑 HH:mm)
		String new_Online_start_date = new_date_format.format(original_Online_start_time);
		String new_Online_start_hour = new_hour_format.format(original_Online_start_time);
		
		String new_Online_end_date = new_date_format.format(original_Online_end_time);
		String new_Online_end_hour = new_hour_format.format(original_Online_end_time);
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>
	
	<div id="wrapper" class="container">

		<!-- content -->
		<div id="content_sneakerDetail">
			<!-- 신발 기본 정보 -->
			<div id="sneaker_Detail">
				<div class="sneaker_image_wrapper" style="border-bottom: 1px solid #b7b7b7;"> 
					<div class="sneaker_image"> 
						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>">
					</div>
					<!-- 신발 이름 -->
					<div class="sneaker_name">
						<span><%=sdto.getModel_name()%></span>
					</div>
				</div>

				<!-- 수정하는 form -->
				<div class="add_wrapper" style="margin-bottom: 5%;">
					<form action="./UpdateDrawInfoAction.me" id="updateOnlineForm" method="post">
						<input type="hidden" name="online_num" value="<%=onlineDrawInfo.getOnline_num()%>">
						<input type="hidden" name="model_num" value="<%=sdto.getNum()%>">
						<input type="hidden" name="country_region" value="<%=onlineDrawInfo.getCountry_region()%>">
						<input type="hidden" name="brand_id" value="<%=onlineDrawInfo.getBrand_id()%>">
						<div id="stylecode-form">
							<span id="category"> 스타일 코드 <span id="req_icon"><i class="fas fa-asterisk"></i></span> </span>
							<input type="text" name="model_stylecode" value="<%=sdto.getModel_stylecode()%>" readonly>
						</div>
						
						<div id="brand-form">
							<span id="category"> 브랜드 <span id="req_icon"><i class="fas fa-asterisk"></i></span> </span>
							
							<div class="picked-form" style="display:block;">
								<div>
									<img id="brandlogo_img" src="./brand_img_upload/<%=bdto.getBrand_logo()%>">
								</div>
								<div>
									<span class="picked-name"><%=bdto.getBrand_name()%></span>
								</div>
								
								<input type="hidden" name="country_name" id="country_name" value="<%=bdto.getCountry_name()%>">
								<input type="hidden" name="brand_name" id="brand_name" value="<%=bdto.getBrand_name()%>">
							</div>

						</div>
						
						<div id="link-form"> 
							<span id="category"> 온라인 링크 <span id="req_icon"><i class="fas fa-asterisk"></i></span></span>
							<input type="text" name="online_link" value="<%=onlineDrawInfo.getOnline_link()%>">
						</div>
						
						<div id="online_method-form">
							<span id="category"> 발매 방식 <span id="req_icon"><i class="fas fa-asterisk"></i></span> </span>
							
							<div id="onlineM-radio-wrapper">
								<input type="radio" id="fcfs" name="online_method" value="선착" <%if(onlineDrawInfo.getOnline_method().equals("선착")){%>checked<%}%>> <label for="fcfs">선착</label>
							</div>
							
							<div id="onlineM-radio-wrapper">
								<input type="radio" id="draw" name="online_method" value="드로우" <%if(onlineDrawInfo.getOnline_method().equals("드로우")){%>checked<%}%>> <label for="draw">드로우</label>
							</div>
							
							<div id="onlineM-radio-wrapper">
								<input type="radio" id="instadraw" name="online_method" value="인스타라플" <%if(onlineDrawInfo.getOnline_method().equals("인스타라플")){%>checked<%}%>> <label for="instadraw">인스타라플</label>
							</div>
							
							<div id="onlineM-radio-wrapper">
								<input type="radio" id="emaildraw" name="online_method" value="이메일라플" <%if(onlineDrawInfo.getOnline_method().equals("이메일라플")){%>checked<%}%>> <label for="emaildraw">이메일라플</label>
							</div>
							
							<div id="onlineM-radio-wrapper">
								<input type="radio" id="Undefined" name="online_method" value="-" <%if(onlineDrawInfo.getOnline_method().equals("-")){%>checked<%}%>> <label for="Undefined">미정</label>
							</div>
								
						</div>
						
						<div id="onlineTime-form">
							<span id="category"> 발매 시간 </span>
							
							<input type="date" name="online_date_start" id="input_date" value="<%=new_Online_start_date%>">
							<input type="time" name="online_hour_start" id="input_date" value="<%=new_Online_start_hour%>">
							<span id="tilde">~</span>
							<input type="date" name="online_date_end" id="input_date" value="<%=new_Online_end_date%>">
							<input type="time" name="online_hour_end" id="input_date" value="<%=new_Online_end_hour%>">
							
							<span id="warn_label"> <i class="fas fa-exclamation-triangle"></i> &nbsp; 날짜와 시간이 없을시, 빈칸으로 놔두기(지우기)! </span>
							
						</div>
						
						<div id="buyMethod-form">
							<span id="category"> 구매 방식 <span id="req_icon"><i class="fas fa-asterisk"></i></span></span>
							
							<div id="radio-wrapper" class="buy_fcfs">
								<input type="radio" id="buy_fcfs" name="buy_method" value="선착순 구매" <%if(onlineDrawInfo.getBuy_method().equals("선착순 구매")){%>checked<%}%>> <label for="buy_fcfs">선착순 구매</label>
							</div>
							
							<div id="radio-wrapper" class=buy_afCredit>
								<input type="radio" id="buy_afCredit" name="buy_method" value="당첨후 결제" <%if(onlineDrawInfo.getBuy_method().equals("당첨후 결제")){%>checked<%}%>> <label for="buy_afCredit">당첨후 결제</label>
							</div>
							<div id="radio-wrapper" class="buy_beCredit">
								<input type="radio" id="buy_beCredit" name="buy_method" value="당첨전 선결제" <%if(onlineDrawInfo.getBuy_method().equals("당첨전 선결제")){%>checked<%}%>> <label for="buy_beCredit">당첨전 선결제</label>
							</div>
							<div id="radio-wrapper" class="buy_affcfs">
								<input type="radio" id="buy_affcfs" name="buy_method" value="당첨후 선착구매" <%if(onlineDrawInfo.getBuy_method().equals("당첨후 선착구매")){%>checked<%}%>> <label for="buy_affcfs">당첨후 선착구매</label>
							</div>
							<div id="radio-wrapper" class="buy_Undefined">
								<input type="radio" id="buy_Undefined" name="buy_method" value="-" <%if(onlineDrawInfo.getBuy_method().equals("-")){%>checked<%}%>> <label for="buy_Undefined">미정</label>
							</div>	
							
						</div>
						
						<div id="delivery_method-form">
							<span id="category"> 배송 여부 <span id="req_icon"><i class="fas fa-asterisk"></i></span></span>
							
							<div style="padding:0;">
								<div id="del-radio-wrapper">
									<input type="radio" id="can" name="delivery_method" value="직배가능" <%if(onlineDrawInfo.getDelivery_method().equals("직배가능")){%>checked<%}%>> <label for="can">직배가능</label>
								</div>
								<div id="del-radio-wrapper">
									<input type="radio" id="cant" name="delivery_method" value="배대지" <%if(onlineDrawInfo.getDelivery_method().equals("배대지")){%>checked<%}%>> <label for="cant">배대지</label>
								</div>
								<div id="del-radio-wrapper">
									<input type="radio" id="domestic" name="delivery_method" value="국내배송" <%if(onlineDrawInfo.getDelivery_method().equals("국내배송")){%>checked<%}%>> <label for="domestic">국내배송</label>
								</div>
								<div id="del-radio-wrapper">
									<input type="radio" id="instore" name="delivery_method" value="매장수령" <%if(onlineDrawInfo.getDelivery_method().equals("매장수령")){%>checked<%}%>> <label for="instore">매장수령</label>
								</div>
								<div id="del-radio-wrapper">
									<input type="radio" id="onlyLocal" name="delivery_method" value="직배x배대지x" <%if(onlineDrawInfo.getDelivery_method().equals("직배x배대지x")){%>checked<%}%>> <label for="onlyLocal">직배x 배대지x</label>
								</div>
							</div>
							
						</div>
						
						<input type="hidden" name="online_writer" value="<%=onlineDrawInfo.getOnline_writer()%>" id="online_writer">
						
						<div id="submitBtn-form">
							<button type="button" class="rel_Btn2"> 
								<span> 수정하기 </span>
							</button>
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
		
		//온라인 날짜 안에 10007이 포함되어있으면 delete 하게 만들기
		if($('input[name=online_date_start]').val().match("10007")){
			$('input[name=online_date_start]').val('');
			$('input[name=online_hour_start]').val('');
		}
		if($('input[name=online_date_end]').val().match("10007")){
			$('input[name=online_date_end]').val('');
			$('input[name=online_hour_end]').val('');
		}
		//온라인 시간 안에 12:34가 포함되어있으면 delete 하게 만들기
		if($('input[name=online_hour_start]').val().match("12:34")){
			$('input[name=online_hour_start]').val('');
		}
		if($('input[name=online_hour_end]').val().match("12:34")){
			$('input[name=online_hour_end]').val('');
		}
		
		if($('input[name=start_date]').val() == ''){
			$('input[name=online_date_start]').val('');
		}
		if($('input[name=start_time]').val() == ''){
			$('input[name=online_hour_start]').val('');
		}
		if($('input[name=end_date]').val() == ''){
			$('input[name=online_date_end]').val('');
		}
		if($('input[name=end_time]').val() == ''){
			$('input[name=online_hour_end]').val('');
		}
		
		var online_method = $('input:radio[name=online_method]:checked').val();
		
		//발매방식에 따라 UI 변경하기
		if(online_method == '선착'){
			$('input[name=online_date_start]').show();
			$('input[name=online_hour_start]').show();
			$('#tilde').show();
			$('input[name=online_date_end]').hide();
			$('input[name=online_hour_end]').hide();	
		}
		
		if(online_method == '드로우' || online_method == '인스타라플' || online_method == '이메일라플'){
			$('input[name=online_date_start]').show();
			$('input[name=online_hour_start]').show();
			$('#tilde').show();
			$('input[name=online_date_end]').show();
			$('input[name=online_hour_end]').show();
		}
		
		if(online_method == '-'){
			$('input[name=online_date_start]').show();
			$('input[name=online_hour_start]').show();
			$('#tilde').hide();
			$('input[name=online_date_end]').hide();
			$('input[name=online_hour_end]').hide();	
		}
		
	});

	//발매방식 선착을 선택했을시
	$('input:radio[name=online_method]').click(function(){
		
		var online_method = $('input:radio[name=online_method]:checked').val();
		
		//선착일시 끝나는 발매시간 없애기
		if(online_method == '선착'){
			$('input[name=online_date_end]').hide();
			$('input[name=online_hour_end]').hide();	
			$('#tilde').show();
			
			//선착란
			$('.buy_fcfs').show();
			$('#buy_fcfs').removeAttr("disabled");
			$('#buy_fcfs').prop('checked', true);
			
			//드로우란
			$('.buy_afCredit').hide();
			$('.buy_beCredit').hide();
			$('.buy_affcfs').hide();
			
			$('#buy_afCredit').prop('checked', false);
			$('#buy_beCredit').prop('checked', false);
			$('#buy_affcfs').prop('checked', false);
			
			//미정란
			$('.buy_Undefined').show();
			$('#buy_Undefined').removeAttr("disabled");
			$('#buy_Undefined').prop('checked', false);
		}
		
		//드로우일시 그대로 놔두기
		if(online_method == '드로우' || online_method == '인스타라플' || online_method == '이메일라플'){
			$('input[name=online_date_start]').show();
			$('input[name=online_hour_start]').show();
			$('#tilde').show();
			$('input[name=online_date_end]').show();
			$('input[name=online_hour_end]').show();
			
			//선착란
			$('.buy_fcfs').hide();
			$('#buy_fcfs').prop('checked', false);
			
			//드로우란
			$('.buy_afCredit').show();
			$('.buy_beCredit').show();
			$('.buy_affcfs').show();
	
			$('#buy_afCredit').removeAttr("disabled");
			$('#buy_beCredit').removeAttr("disabled");
			$('#buy_affcfs').removeAttr("disabled");
			
			$('#buy_afCredit').prop('checked', false);
			$('#buy_beCredit').prop('checked', false);
			$('#buy_affcfs').prop('checked', false);
			
			//미정란
			$('.buy_Undefined').show();
			$('#buy_Undefined').removeAttr("disabled");
			$('#buy_Undefined').prop('checked', false);
		}
		
		//미정일때 끝나는 시간과 물결표시 없애기
		if(online_method == '-'){
			$('#tilde').hide();
			$('input[name=online_date_end]').hide();
			$('input[name=online_hour_end]').hide();
			
			//선착란
			$('.buy_fcfs').show();
			$('#buy_fcfs').removeAttr("disabled");
			$('#buy_fcfs').prop('checked', false);
			
			//드로우란
			$('.buy_afCredit').show();
			$('.buy_beCredit').show();
			$('.buy_affcfs').show();
	
			$('#buy_afCredit').removeAttr("disabled");
			$('#buy_beCredit').removeAttr("disabled");
			$('#buy_affcfs').removeAttr("disabled");
			
			$('#buy_afCredit').prop('checked', false);
			$('#buy_beCredit').prop('checked', false);
			$('#buy_affcfs').prop('checked', false);
			
			//미정란
			$('.buy_Undefined').show();
			$('#buy_Undefined').removeAttr("disabled");
			$('#buy_Undefined').prop('checked', false);
		}
		
	});


	//모든 input 유효성 검사
	//온라인 발매 정보 추가하는  form 태그 검사
	$('.rel_Btn2').click(function(){
	
		//신발 스타일 코드가 빈칸일때
		if($('input[name=model_stylecode]').val() == '') {
			alert("스타일 코드를 입력해주세요.");
			$('input[name=model_stylecode]').focus();
			return false;
		}
		//브랜드를 선택 안했을시
		else if($('#country_name').val() == '' || $('#brand_name').val() == ''){
			alert("브랜드를 선택해주세요.");
			$('#textBrand').focus();
			return false;
		}
		//온라인 링크가 빈칸일때
		else if($('input[name=online_link]').val() == '') {
			alert("온라인 링크를 입력해주세요.");
			$('input[name=online_link]').focus();
			return false;
		}
		//발매 방식을 선택 안했을시
		else if(!$('input:radio[name=online_method]').is(':checked')) {
			alert("발매 방식을 선택해주세요.");
			return false;
		}
		//구매 방식을 선택 안했을시
		else if(!$('input:radio[name=buy_method]').is(':checked')) {
			alert("구매 방식을 선택해주세요.");
			return false;
		}
		//배송 여부를 선택 안했을시
		else if(!$('input:radio[name=delivery_method]').is(':checked')) {
			alert("배송 여부를 선택해주세요.");
			return false;
		}
		//유저 이름 확인란
		else if($('#online_writer').val() == ''){
			alert("로그인을 해주세요.");
			location.href="./MemberLogin.me";
			return false;
		}
		else {
			var submitConfirm = confirm("발매정보를 수정하시겠습니까?");
			if(submitConfirm){
				$('#updateOnlineForm').submit();
			}else{
				return false;
			}
			
		}
		
	});

</script>

</html>