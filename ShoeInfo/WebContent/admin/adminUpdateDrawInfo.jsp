<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.online.db.OnlineDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>SHOE INFO.</title>
<link href="./css/board/adminForm.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
	
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
			online_start_time = "00:00";
		}else {
			online_start_time = onlineDrawInfo.getOnline_start_time();
		}
		if(onlineDrawInfo.getOnline_end_time().isEmpty()){
			online_end_date = "9999-99-99";
		}else {
			online_end_date = onlineDrawInfo.getOnline_end_date();
		}
		if(onlineDrawInfo.getOnline_end_time().isEmpty()){
			online_end_time = "00:00";
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


	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_adminAddSneaker">
			<!-- 온라인 정보 추가하는 란 -->
			<div>
				<h3> 발매 정보 수정하기 </h3>
				<form action="./UpdateDrawInfoAction.ad" id="updateDrawForm" method="post">
					<input type="hidden" name="online_num" value="<%=onlineDrawInfo.getOnline_num()%>">
					<table border = "1">
						<input type="hidden" name="country_region" value="<%=onlineDrawInfo.getCountry_region()%>">
						<input type="hidden" name="country_name" value="<%=onlineDrawInfo.getCountry_name()%>">
						<input type="hidden" name="brand_id" value="<%=onlineDrawInfo.getBrand_id()%>">
						<input type="hidden" name="start_date" value="<%=onlineDrawInfo.getOnline_start_date()%>">
						<input type="hidden" name="start_time" value="<%=onlineDrawInfo.getOnline_start_time()%>">
						<input type="hidden" name="end_date" value="<%=onlineDrawInfo.getOnline_end_date()%>">
						<input type="hidden" name="end_time" value="<%=onlineDrawInfo.getOnline_end_time()%>">
						<tr>
							<td id="category"> 신발 스타일 코드* </td>
							<td> <input type="text" name="model_stylecode" value="<%=onlineDrawInfo.getModel_stylecode()%>"> </td>
						</tr>
						<tr>
							<td id="category"> 온라인 링크* </td>
							<td> <input type="text" name="online_link" value="<%=onlineDrawInfo.getOnline_link()%>"> </td>
						</tr>
						<tr>
							<td id="category"> 온라인 시간 </td>
							<td> 
								<span id="cate_ref"> <i class="fas fa-exclamation-triangle"></i> &nbsp; 발매방식이 선착일시, 시작시간만 작성하기 </span> 
								<span id="cate_ref"> <i class="fas fa-exclamation-triangle"></i> &nbsp; 발매방식이 미정이고 발매날짜가 있을시, 시작시간에 입력 </span>
								<span id="cate_ref"> <i class="fas fa-exclamation-triangle"></i> &nbsp; 발매날짜와 시간이 없을시, 모두 빈칸으로 입력 </span>
								<br>
								
								<input type="date" name="online_date_start" value="<%=new_Online_start_date%>" id="input_date">
								<input type="time" name="online_hour_start" value="<%=new_Online_start_hour%>" id="input_date">
								~
								<input type="date" name="online_date_end" value="<%=new_Online_end_date%>" id="input_date">
								<input type="time" name="online_hour_end" value="<%=new_Online_end_hour%>" id="input_date">
							</td>
						</tr>
						<tr>
							<td id="category"> 발매 방식* </td>
							<td> 
								<select name="online_method" id="online_method">
									<option value="default" <%if(onlineDrawInfo.getOnline_method().equals("default")){%> selected<%}%>> 발매 방식을 선택해주세요. </option>
									<option value="default" disabled> ------------------------ </option>
									<option value="선착" <%if(onlineDrawInfo.getOnline_method().equals("선착")){%> selected<%}%>> 선착 </option>
									<option value="드로우" <%if(onlineDrawInfo.getOnline_method().equals("드로우")){%> selected<%}%>> 드로우 </option>
									<option value="default" disabled> ------------------------ </option>
									<option value="-" <%if(onlineDrawInfo.getOnline_method().equals("-")){%> selected <%}%>> 미정 </option>
								</select>
							</td>
						</tr>
						<tr>
							<td id="category"> 구매 방식* </td>
							<td>
								<select name="buy_method" id="buy_method">
									<option value="default" <%if(onlineDrawInfo.getBuy_method().equals("default")){%> selected<%}%>> 구매 방식을 선택해주세요. </option>
									<option value="default" disabled> ------------------------ </option>
									<option value="선착순 구매" <%if(onlineDrawInfo.getBuy_method().equals("선착순 구매")){%> selected<%}%>> 선착순 구매 </option>
									<option value="default" disabled> ------------------------ </option>
									<option value="당첨 후 결제" <%if(onlineDrawInfo.getBuy_method().equals("당첨 후 결제")){%> selected<%}%>> 당첨 후 결제 </option>
									<option value="당첨전 선결제" <%if(onlineDrawInfo.getBuy_method().equals("당첨전 선결제")){%> selected<%}%>> 당첨 전 선결제 </option>
									<option value="당첨자간 선착순 구매" <%if(onlineDrawInfo.getBuy_method().equals("당첨자간 선착순 구매")){%> selected<%}%>> 당첨자간 선착순 구매 </option> 
									<option value="default" disabled> ------------------------ </option>
									<option value="-" <%if(onlineDrawInfo.getBuy_method().equals("-")){%> selected<%}%>> 미정 </optino>
								</select>
							</td>
						</tr>
						<tr>
							<td id="category"> 직배 여부* </td>
							<td>
								<select name="delivery_method" id="delivery_method">
									<option value="default" <%if(onlineDrawInfo.getDelivery_method().equals("default")){%> selected<%}%>> 직배여부를 선택해주세요. </option>
									<option value="default" disabled> ------------------------ </option>
									<option value="직배가능" <%if(onlineDrawInfo.getDelivery_method().equals("직배가능")){%> selected<%}%>> 직배가능 </option>
									<option value="배대지" <%if(onlineDrawInfo.getDelivery_method().equals("배대지")){%> selected<%}%>> 배대지 </option>
									<option value="default" disabled> ------------------------ </option>
									<option value="국내배송" <%if(onlineDrawInfo.getDelivery_method().equals("국내배송")){%> selected<%}%>> 국내배송 </option>
									<option value="default" disabled> ------------------------ </option>
									<option value="매장수령" <%if(onlineDrawInfo.getDelivery_method().equals("매장수령")){%> selected<%}%>>> 매장수령 </option>
								</select>
							</td>
						</tr>
						<tr>
							<td id="category"> 특이사항 </td>
							<td> <textarea name="description"><%=onlineDrawInfo.getDescription()%></textarea>
						</tr>
						<tr>
							<td colspan="2"> 
								<input type="submit" id="submit_btn" value="수정하기">
							</td>
						</tr>
					</table>
				</form>
			</div>	
		</div>
	</div>
	
	
	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>
	
</body>

<script type="text/javascript">

	$(document).ready(function(){
		
		//온라인 시간 안에 10007이 포함되어있으면 delete 하게 만들기
		if($('input[name=online_date_start]').val().match("10007")){
			$('input[name=online_date_start]').val('');
			$('input[name=online_hour_start]').val('');
		}
		if($('input[name=online_date_end]').val().match("10007")){
			$('input[name=online_date_end]').val('');
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
		
		$('#country_name_on').change(function() {
			//온라인 나라 항목을 선택했을시 브랜드 호출하는 함수
			$.ajax({
				type:'get',
				url:'./admin/searchBrandAjax.jsp',
				data:'country_name='+$("#country_name_on").val(),
				dataType:"html",
				success:function(data){
					$('#brand_name_on').html(data);
				},error:function(request,status,error){
					 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
	    });
		
		
		//모든 input 유효성 검사
		//온라인 발매 정보 추가하는 form 태그 검사
		$('#addOnlineForm').submit(function(){
			//신발 스타일 코드가 빈칸일때
			if($('input[name=model_stylecode]').val() == '') {
				alert("스타일 코드를 입력해주세요.");
				$('input[name=model_stylecode]').focus();
				return false;
			}
			//나라를 선택 안했을시
			else if($('#country_name_on').val() == 'default'){
				alert("나라를 선택해주세요.");
				$('#country_name_on').focus();
				return false;
			}
			//브랜드를 선택 안했을시
			else if($('#brand_name').val() == 'default'){
				alert("브랜드를 선택해주세요.");
				$('#brand_name').focus();
				return false;
			}
			//온라인 링크가 빈칸일때
			else if($('input[name=online_link]').val() == '') {
				alert("온라인 링크를 입력해주세요.");
				$('input[name=online_link]').focus();
				return false;
			}
			//온라인 방식을 선택 안했을시
			else if($('#online_method').val() == 'default'){
				alert("온라인 방식을 선택해주세요.");
				$('#online_method').focus();
				return false;
			}
			//구매 방식을 선택 안했을시
			else if($('#buy_method').val() == 'default'){
				alert("구매 방식을 선택해주세요.");
				$('#buy_method').focus();
				return false;
			}
			//직배 여부를 선택 안했을시
			else if($('#delivery_method').val() == 'default'){
				alert("직배 여부를 선택해주세요.");
				$('#delivery_method').focus();
				return false;
			}
			
		});
		
	}); 
</script>
</html>