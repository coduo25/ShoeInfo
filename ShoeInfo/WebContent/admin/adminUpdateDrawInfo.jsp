<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.online.db.OnlineDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="./css/board/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
	
		OnlineDTO onlineDrawInfo = (OnlineDTO) request.getAttribute("onlineDrawInfo");
	
		SimpleDateFormat original_format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
		SimpleDateFormat new_date_format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat new_hour_format = new SimpleDateFormat("HH:mm");
		
		Date original_Online_start_time = original_format.parse(onlineDrawInfo.getOnline_start_time());
		Date original_Online_end_time = original_format.parse(onlineDrawInfo.getOnline_end_time());
		
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
				<h3> 온라인 발매 정보 수정하기 </h3>
				<form action="./UpdateDrawInfoAction.ad" method="post">
					<table border = "1">
						<input type="hidden" name="country_region" value="<%=onlineDrawInfo.getCountry_region()%>">
						<input type="hidden" name="country_name" value="<%=onlineDrawInfo.getCountry_name()%>">
						<input type="hidden" name="brand_id" value="<%=onlineDrawInfo.getBrand_id()%>">
						<tr>
							<td> 신발 스타일 코드 </td>
							<td> <input type="text" name="model_stylecode" value="<%=onlineDrawInfo.getModel_stylecode()%>"> </td>
						</tr>
						<tr>
							<td> 온라인 링크 </td>
							<td> <input type="text" name="online_link" value="<%=onlineDrawInfo.getOnline_link()%>"> </td>
						</tr>
						<tr>
							<td> 온라인 시간  <br> (시간이 없으면 그대로 두기!) <br> <span style="color: red; font-weight: bold"> (수정할때 0002-11-30 이면 전부 delete 하기!) </span> </td>
							<td> 
								<input type="date" name="online_date_start" value="<%=new_Online_start_date%>">
								<input type="time" name="online_hour_start" value="<%=new_Online_start_hour%>">
								~
								<input type="date" name="online_date_end" value="<%=new_Online_end_date%>">
								<input type="time" name="online_hour_end" value="<%=new_Online_end_hour%>">
							</td>
						</tr>
						<tr>
							<td> 온라인 방식 </td>
							<td> 
								<select name="online_method">
									<option value="default" <%if(onlineDrawInfo.getOnline_method().equals("default")){%> selected<%}%>> 온라인 방식을 선택해주세요. </option>
									<option value="선착" <%if(onlineDrawInfo.getOnline_method().equals("선착")){%> selected<%}%>> 선착 </option>
									<option value="드로우" <%if(onlineDrawInfo.getOnline_method().equals("드로우")){%> selected<%}%>> 드로우 </option>
								</select>
							</td>
						</tr>
						<tr>
							<td> 구매 방식 </td>
							<td>
								<select name="buy_method">
									<option value="default" <%if(onlineDrawInfo.getBuy_method().equals("default")){%> selected<%}%>> 구매 방식을 선택해주세요. </option>
									<option value="선착순 구매" <%if(onlineDrawInfo.getBuy_method().equals("선착순 구매")){%> selected<%}%>> 선착순 구매 </option>
									<option value="당첨 후 결제" <%if(onlineDrawInfo.getBuy_method().equals("당첨 후 결제")){%> selected<%}%>> 당첨 후 결제 </option>
									<option value="당첨전 선결제" <%if(onlineDrawInfo.getBuy_method().equals("당첨전 선결제")){%> selected<%}%>> 당첨 전 선결제 </option>
									<option value="당첨자간 선착순 구매" <%if(onlineDrawInfo.getBuy_method().equals("당첨자간 선착순 구매")){%> selected<%}%>> 당첨자간 선착순 구매 </option> 
									<option value="-" <%if(onlineDrawInfo.getBuy_method().equals("-")){%> selected<%}%>> - </optino>
								</select>
							</td>
						</tr>
						<tr>
							<td> 직배 여부 </td>
							<td>
								<select name="delivery_method">
									<option value="default" <%if(onlineDrawInfo.getDelivery_method().equals("default")){%> selected<%}%>> 직배여부를 선택해주세요. </option>
									<option value="직배가능" <%if(onlineDrawInfo.getDelivery_method().equals("직배가능")){%> selected<%}%>> 직배가능 </option>
									<option value="배대지" <%if(onlineDrawInfo.getDelivery_method().equals("배대지")){%> selected<%}%>> 배대지 </option>
									<option value="국내배송" <%if(onlineDrawInfo.getDelivery_method().equals("국내배송")){%> selected<%}%>> 국내배송 </option>
								</select>
							</td>
						</tr>
						<tr>
							<td> 특이사항 </td>
							<td> <textarea name="description"><%=onlineDrawInfo.getDescription()%></textarea>
						</tr>
						<tr>
							<td colspan="2"> 
								<input type="submit" value="수정하기">
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
</html>