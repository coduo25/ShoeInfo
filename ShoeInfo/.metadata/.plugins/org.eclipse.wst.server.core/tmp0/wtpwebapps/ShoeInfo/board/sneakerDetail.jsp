<%@page import="net.offline.db.OfflineDTO"%>
<%@page import="net.online.db.OnlineDTO"%>
<%@page import="java.util.Date"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.brand.db.BrandDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sneaker.db.SneakerDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/board/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:600&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<!-- Header -->	
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<%
		SneakerDTO sdto = (SneakerDTO) request.getAttribute("sneakerDetail");
	
		// ---------- 오프라인 정보 -----------
		List<OfflineDTO> offLineList_kr = (List<OfflineDTO>) request.getAttribute("offLineList_kr");
		List<BrandDTO> brandList_off_kr = (List<BrandDTO>) request.getAttribute("brandList_off_kr");
		
		// ---------- 온라인 정보 -----------
		//대한민국
		List<OnlineDTO> onlineList_kr = (List<OnlineDTO>) request.getAttribute("onlineList_kr");
		List<BrandDTO> brandList_kr = (List<BrandDTO>) request.getAttribute("brandList_kr");
		
		//아시아(대한민국빼고)
		List<OnlineDTO> onlineList_asia = (List<OnlineDTO>) request.getAttribute("onlineList_asia");
		List<BrandDTO> brandList_asia = (List<BrandDTO>) request.getAttribute("brandList_asia");
		
		//아메리카
		List<OnlineDTO> onlineList_america = (List<OnlineDTO>) request.getAttribute("onlineList_america");
		List<BrandDTO> brandList_america = (List<BrandDTO>) request.getAttribute("brandList_america");
		
		//유럽
		List<OnlineDTO> onlineList_europe = (List<OnlineDTO>) request.getAttribute("onlineList_europe");
		List<BrandDTO> brandList_europe = (List<BrandDTO>) request.getAttribute("brandList_europe");
		
		//기타
		List<OnlineDTO> onlineList_etc = (List<OnlineDTO>) request.getAttribute("onlineList_etc");
		List<BrandDTO> brandList_etc = (List<BrandDTO>) request.getAttribute("brandList_etc");
		
		SimpleDateFormat original_format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		SimpleDateFormat new_format = new SimpleDateFormat("MM/dd HH:mm");
		SimpleDateFormat count_format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
	%>
	<div id="wrapper" class="container">
		<!-- side bar -->
		<div id="main-nav">
			<a href="./SneakerList.go" class="menu-link">런칭 캘린더</a>
			<a href="" class="menu-link">발매 정보</a>
		</div>
		<!-- content -->
		<div id="content_sneakerDetail">
			<table id="sneaker_Detail" border="0">
				<tr> 
					<td colspan="3"> 
						<div class="sneaker_image"> 
							<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>">
						</div>
					</td>
					<td class="detail_table">
						<!-- 신발 이름 -->
						<div class="sneaker_name">
							<span> <%=sdto.getModel_name() %></span>
						</div>
						<!-- colorway -->
						<div class="sneaker_colorway">
							<span> <%=sdto.getModel_colorway() %></span>
						</div>
						<!-- stylecode -->
						<div class="sneaker_stylecode">
							<span> <%=sdto.getModel_stylecode() %></span>
						</div>
						<!-- price -->
						<div class="sneaker_price">
							<span> $<%=sdto.getPrice() %></span>
						</div>
						<!-- relase_date -->
						<div class="sneaker_release_date">
							<span> <%=sdto.getRelease_date() %></span>
						</div>
					</td>
				</tr>
				
				<tr>
					<td> 
						<div class="sneaker_image2"> 
							<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>">
						</div> 
					</td>
					<td> 
						<div class="sneaker_image2"> 
							<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[1]%>">
						</div> 
					</td>
					<td> 
						<div class="sneaker_image2"> 
							<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[2]%>">
						</div> 
					</td>
				</tr>
			</table>
			<!-- 신발 온라인/오프라인 정보 -->
			<div id="content_sneakerOnlineInfo">
				<!-- 오프라인 테이블 -->
				<table id="sneakerOfflineInfo_table" border="0">
						<h4> [오프라인 발매처]</h4>
						<tr>
							<td style="width:50px;"> </td>
							<td style="width:150px;"> </td>
							<td style="width:200px;"> 기간 </td>
							<td style="width:200px;"> 남은시간 </td>
							<td style="width:160px;"> 응모방식 </td>
						</tr>
					<%
						if(offLineList_kr.isEmpty()){
					%>
						<tr style="height: 70px;">
							<td colspan="7"> 아직 오프라인 발매 정보가 없습니다. </td>
						</tr>	 
					<%	} else {
						for(int i=0; i<offLineList_kr.size();i++){	
							OfflineDTO ofdto_kr = (OfflineDTO) offLineList_kr.get(i);
							BrandDTO bdto_kr = (BrandDTO) brandList_off_kr.get(i);
							
							Date original_Offline_start_time_date = original_format.parse(ofdto_kr.getOffline_start_time());
							String new_Offline_start_time_date = new_format.format(original_Offline_start_time_date);
							
							Date original_Offline_end_time_date = original_format.parse(ofdto_kr.getOffline_end_time());
							String new_Offline_end_time_date = new_format.format(original_Offline_end_time_date);
					%>
					<tr>
						<td> <a href="<%=ofdto_kr.getOffline_link()%>" target="_blank"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_kr.getBrand_logo()%>" width="50" height="50"> </a> </td>
						<td style="text-align:left; padding-left: 15px;"> <a href="<%=ofdto_kr.getOffline_link()%>" target="_blank"> <%=ofdto_kr.getOffline_location()%> <%=bdto_kr.getBrand_name()%> </a> </td>
						<td> <span id="offline_start_time_date"> <%=new_Offline_start_time_date%> </span> ~ <%=new_Offline_end_time_date%> </td>
						
						<span id="new_count_start_time_date" style="display:none;"> - </span>
						<td id="final_new_count_start_time_date"> </td>
						
						<td> <%=ofdto_kr.getOffline_method()%> </td>
					</tr>
					<%
							}
						}
					%>
				</table>
				<br>
				<br>
				<br>
				<br>
				<!-- 온라인 테이블 -->
				<table id="sneakerOnlineInfo_table" border="0">
						<h4> [한국 온라인 발매처] </h4>
						<tr>
							<td style="width:50px;"> </td>
							<td style="width:150px;"> </td>
							<td style="width:30px;"> </td>
							<td style="width:200px;"> 기간 </td>
							<td style="width:200px;"> 남은시간 </td>
							<td style="width:160px;"> 응모방식 </td>
							<td style="width:60px;"> 응모여부 </td>
						</tr>
					<%
						if(onlineList_kr.isEmpty()){
					%>
						<tr style="height: 70px;">
							<td colspan="7"> 아직 온라인 발매 정보가 없습니다. </td>
						</tr>	 
					<%	} else {
						for(int i=0; i<onlineList_kr.size();i++){	
							OnlineDTO odto_kr = (OnlineDTO) onlineList_kr.get(i);
							BrandDTO bdto_kr = (BrandDTO) brandList_kr.get(i);
							
							Date original_Online_start_time_date = original_format.parse(odto_kr.getOnline_start_time());
							String new_Online_start_time_date = new_format.format(original_Online_start_time_date);
							
							Date original_Online_end_time_date = original_format.parse(odto_kr.getOnline_end_time());
							String new_Online_end_time_date = new_format.format(original_Online_end_time_date);
							
							//새로운 카운트 다운 값
							String new_count_start_time_date = count_format.format(original_Online_start_time_date);
					%>
					<tr>
						<td> <a href="<%=odto_kr.getOnline_link()%>" target="_blank"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_kr.getBrand_logo()%>" width="50" height="50"> </a> </td>
						<td style="text-align:left; padding-left: 15px;"> <a href="<%=odto_kr.getOnline_link()%>" target="_blank"> <%=bdto_kr.getBrand_name()%> </a> </td>
						<td> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto_kr.getCountry_flag()%>" width="22" height="15"> </td>
						<td> <span id="online_start_time_date"> <%=new_Online_start_time_date%> </span> ~ <%=new_Online_end_time_date%> </td>
						
						<span id="new_count_start_time_date" style="display:none;"> <%= new_count_start_time_date %> </span>
						<td id="final_new_count_start_time_date"> </td>
						
						<td> <%=odto_kr.getOnline_method()%> </td>
						<%
							if(odto_kr.getOnline_method().contains("드로우")){
						%>
							<form action="" method="get">
								<td> <input type="button" value="응모하기"> </td>
							</form>
						<%
							}else{
						%>
							<td> - </td>
						<%
							}
						%>
					</tr>
					<%
							}
						}
					%>
				</table>
				<br>
				<br>
				<br>
				<br>
				<table id="sneakerOnlineInfo_table" border="0">
					<h4> [아시아 지역 발매처] </h4>
					<tr>
						<td style="width:50px;"> </td>
						<td style="width:150px;"> </td>
						<td style="width:30px;"> </td>
						<td style="width:200px;"> 기간 </td>
						<td style="width:200px;"> 남은시간 </td>
						<td style="width:160px;"> 응모방식 </td>
						<td style="width:60px;"> 응모여부 </td>
					</tr>
					<%
						if(onlineList_asia.isEmpty()){
					%>
						<tr style="height: 70px;">
							<td colspan="7"> 아직 온라인 발매 정보가 없습니다. </td>
						</tr>	 
					<%	} else {
						for(int i=0; i<onlineList_asia.size();i++){
							OnlineDTO odto_asia = (OnlineDTO) onlineList_asia.get(i);
							BrandDTO bdto_asia = (BrandDTO) brandList_asia.get(i);
							
							Date original_Online_start_time_date = original_format.parse(odto_asia.getOnline_start_time());
							String new_Online_start_time_date = new_format.format(original_Online_start_time_date);
							
							Date original_Online_end_time_date = original_format.parse(odto_asia.getOnline_end_time());
							String new_Online_end_time_date = new_format.format(original_Online_end_time_date);
					%>
					<tr>
						<td> <a href="<%=odto_asia.getOnline_link()%>" target="_blank"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_asia.getBrand_logo()%>" width="50" height="50"> </a> </td>
						<td style="text-align:left; padding-left: 15px;"> <a href="<%=odto_asia.getOnline_link()%>" target="_blank"> <%=bdto_asia.getBrand_name()%> </a> </td>
						<td> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto_asia.getCountry_flag()%>" width="22" height="15"> </td>
						<td> <%=new_Online_start_time_date%> ~ <%=new_Online_end_time_date%> </td>
						<td> - </td>
						<td> <%=odto_asia.getOnline_method()%> / <%=odto_asia.getDelivery_method()%> </td>
						<td> - </td>
					</tr>
					<%
							}
						}
					%>
				</table>
				<br>
				<br>
				<br>
				<br>
				<table id="sneakerOnlineInfo_table" border="0">
					<h4> [아메리카 지역 발매처] </h4>
					<tr>
						<td style="width:50px;"> </td>
						<td style="width:150px;"> </td>
						<td style="width:30px;"> </td>
						<td style="width:200px;"> 기간 </td>
						<td style="width:200px;"> 남은시간 </td>
						<td style="width:160px;"> 응모방식 </td>
						<td style="width:60px;"> 응모여부 </td>
					</tr>
					<%
						if(onlineList_america.isEmpty()){
					%>
						<tr style="height: 70px;">
							<td colspan="7"> 아직 온라인 발매 정보가 없습니다. </td>
						</tr>	 
					<%	} else {
						for(int i=0; i<onlineList_america.size();i++){
							OnlineDTO odto_america = (OnlineDTO) onlineList_america.get(i);
							BrandDTO bdto_america = (BrandDTO) brandList_america.get(i);
							
							Date original_Online_start_time_date = original_format.parse(odto_america.getOnline_start_time());
							String new_Online_start_time_date = new_format.format(original_Online_start_time_date);
							
							Date original_Online_end_time_date = original_format.parse(odto_america.getOnline_end_time());
							String new_Online_end_time_date = new_format.format(original_Online_end_time_date);
					%>
					<tr>
						<td> <a href="<%=odto_america.getOnline_link()%>" target="_blank"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_america.getBrand_logo()%>" width="50" height="50"> </a> </td>
						<td style="text-align:left; padding-left: 15px;"> <a href="<%=odto_america.getOnline_link()%>" target="_blank"> <%=bdto_america.getBrand_name()%> </a> </td>
						<td> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto_america.getCountry_flag()%>" width="22" height="15"> </td>
						<td> <%=new_Online_start_time_date%> ~ <%=new_Online_end_time_date%> </td>
						<td> - </td>
						<td> <%=odto_america.getOnline_method()%> / <%=odto_america.getDelivery_method()%> </td>
						<td> - </td>
					</tr>
					<%
							}
						}
					%>
				</table>
				<br>
				<br>
				<br>
				<br>
				<table id="sneakerOnlineInfo_table" border="0">
					<h4> [유럽 	지역 발매처] </h4>
					<tr>
						<td style="width:50px;"> </td>
						<td style="width:150px;"> </td>
						<td style="width:30px;"> </td>
						<td style="width:200px;"> 기간 </td>
						<td style="width:200px;"> 남은시간 </td>
						<td style="width:160px;"> 응모방식 </td>
						<td style="width:60px;"> 응모여부 </td>
					</tr>
					<%
						if(onlineList_europe.isEmpty()){
					%>
						<tr style="height: 70px;">
							<td colspan="7"> 아직 온라인 발매 정보가 없습니다. </td>
						</tr>	 
					<%	} else {
						for(int j=0; j<onlineList_europe.size();j++){
							OnlineDTO odto_europe = (OnlineDTO) onlineList_europe.get(j);
							BrandDTO bdto_europe = (BrandDTO) brandList_europe.get(j);
							
							Date original_Online_start_time_date = original_format.parse(odto_europe.getOnline_start_time());
							String new_Online_start_time_date = new_format.format(original_Online_start_time_date);
							
							Date original_Online_end_time_date = original_format.parse(odto_europe.getOnline_end_time());
							String new_Online_end_time_date = new_format.format(original_Online_end_time_date);
					%>
					<tr>
						<td> <a href="<%=odto_europe.getOnline_link()%>" target="_blank"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_europe.getBrand_logo()%>" width="50" height="50"> </a> </td>
						<td style="text-align:left; padding-left: 15px;"> <a href="<%=odto_europe.getOnline_link()%>" target="_blank"> <%=bdto_europe.getBrand_name()%> </a> </td>
						<td> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto_europe.getCountry_flag()%>" width="22" height="15"> </td>
						<td> <%=new_Online_start_time_date%> ~ <%=new_Online_end_time_date%> </td>
						<td> - </td>
						<td> <%=odto_europe.getOnline_method()%> / <%=odto_europe.getDelivery_method()%> </td>
						<td> - </td>
					</tr>
					<%
							}
						}	
					%>
				</table>
				<br>
				<br>
				<br>
				<br>
				<table id="sneakerOnlineInfo_table" border="0">
					<h4> [기타 지역 발매처] </h4>
					<tr>
						<td style="width:50px;"> </td>
						<td style="width:150px;"> </td>
						<td style="width:30px;"> </td>
						<td style="width:200px;"> 기간 </td>
						<td style="width:200px;"> 남은시간 </td>
						<td style="width:160px;"> 응모방식 </td>
						<td style="width:60px;"> 응모여부 </td>
					</tr>
					<%
						if(onlineList_etc.isEmpty()){
					%>
						<tr style="height: 70px;">
							<td colspan="7"> 아직 온라인 발매 정보가 없습니다. </td>
						</tr>	 
					<%	} else {
						for(int j=0; j<onlineList_etc.size();j++){
							OnlineDTO odto_etc = (OnlineDTO) onlineList_etc.get(j);
							BrandDTO bdto_etc = (BrandDTO) brandList_etc.get(j);
							
							Date original_Online_start_time_date = original_format.parse(odto_etc.getOnline_start_time());
							String new_Online_start_time_date = new_format.format(original_Online_start_time_date);
							
							Date original_Online_end_time_date = original_format.parse(odto_etc.getOnline_end_time());
							String new_Online_end_time_date = new_format.format(original_Online_end_time_date);	
					%>
					<tr>
						<td> <a href="<%=odto_etc.getOnline_link()%>" target="_blank"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_etc.getBrand_logo()%>" width="50" height="50"> </a> </td>
						<td style="text-align:left; padding-left: 15px;"> <a href="<%=odto_etc.getOnline_link()%>" target="_blank"> <%=bdto_etc.getBrand_name()%> </a> </td>
						<td> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto_etc.getCountry_flag()%>" width="22" height="15"> </td>
						<td> <%=new_Online_start_time_date%> ~ <%=new_Online_end_time_date%> </td>
						<td>  </td>
						<td> <%=odto_etc.getOnline_method()%> / <%=odto_etc.getDelivery_method()%> </td>
						<td> - </td>
					</tr>
					<%
							}
						}
					%>
				</table>
			</div>
		</div>	
	</div>

	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>
</body>
<script type="text/javascript">

	$(document).ready(function(){
		const countDownTimer = function (id, date) { 
			var _vDate = new Date(date); // 전달 받은 일자 
			var _second = 1000; 
			var _minute = _second * 60; 
			var _hour = _minute * 60; 
			var _day = _hour * 24; 
			var timer; 
			
			function showRemaining() { 
				var now = new Date(); 
				var distDt = _vDate - now; 
				if (distDt < 0) { 
					clearInterval(timer); 
					document.getElementById(id).textContent = '해당 응모가 종료 되었습니다!'; 
					return; 
				} 
			
				var days = Math.floor(distDt / _day); 
				var hours = Math.floor((distDt % _day) / _hour); 
				var minutes = Math.floor((distDt % _hour) / _minute); 
				var seconds = Math.floor((distDt % _minute) / _second); 
				
				//document.getElementById(id).textContent = date.toLocaleString() + "까지 : "; 
				document.getElementById(id).textContent = days + '일 '; 
				document.getElementById(id).textContent += hours + '시간 '; 
				document.getElementById(id).textContent += minutes + '분 '; 
				document.getElementById(id).textContent += seconds + '초'; 
			} 
			
			timer = setInterval(showRemaining, 1000); 
		} 
		// 2024년 4월 1일까지, 시간을 표시하려면 01:00 AM과 같은 형식을 사용한다. 
		//countDownTimer('sample02', '04/01/2024 00:00 AM'); 
		//countDownTimer('sample03', '04/01/2024'); // 2024년 4월 1일까지 
		
		//var count_span = document.getElementById("new_count_start_time_date").innerText;
		//countDownTimer('final_new_count_start_time_date', count_span);	
	});

</script>
</html>