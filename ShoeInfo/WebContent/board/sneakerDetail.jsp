<%@page import="net.member.db.MemberDrawDTO"%>
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		request.setCharacterEncoding("UTF-8");
		
		//로그인한 사용자가 체크
		String user = (String) session.getAttribute("id");
		if(user == null){
			user = "";
		}
		
		//사용자 응모한 브랜드 리스트
		List<String> userDrawBrandList = (List<String>) request.getAttribute("userDrawBrandList");
	
		//신발 기본 정보 리스트
		SneakerDTO sdto = (SneakerDTO) request.getAttribute("sneakerDetail");
	
		//브랜드 정보 리스트
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
		
		SimpleDateFormat new_format = new SimpleDateFormat("M/d a HH:mm");
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
			<!-- 신발 기본 정보 -->
			<table id="sneaker_Detail">
				<tr>
					<td> 
						<div class="sneaker_image"> 
							<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>">
						</div>
					</td>
					<td class="detail_table">
						<%	//관리자 권한일때 제품 기본정보 수정하는 페이지로 가는 버튼
							if(user.equals("admin")){
						%>
							<a href="./UpdateSneakerInfo.ad?model_stylecode=<%=sdto.getModel_stylecode()%>"><input type="button" value="기본정보 수정하기" style="float: right;"></a>
						<%}%>
						<!-- 신발 이름 -->
						<div class="sneaker_name">
							<span> <%=sdto.getModel_name() %></span>
						</div>
						<!-- stylecode -->
						<div class="sneaker_option_info">
							스타일코드 : <span> <%=sdto.getModel_stylecode() %></span>
						</div>
						<!-- price -->
						<div class="sneaker_option_info">
							가격 : 
							<%if(sdto.getPrice() == 0){%> <span>미정</span>
							<%}else{%> <span> $<%=sdto.getPrice() %></span> <%}%>
						</div>
						<!-- relase_date -->
						<div class="sneaker_option_info">
							발매일(한국기준) : <span> <%=sdto.getRelease_date() %></span>
						</div>
					</td>
				</tr>
			</table>
			<%	//관리자 권한일때 제품 발매정보 추가하는 페이지로 가는 버튼
				if(user.equals("admin")){
			%>
				<a href="./searchBrand.ad?model_stylecode=<%=sdto.getModel_stylecode()%>"><input type="button" value="제품 발매 정보 추가하기" style="float: right;"></a>
			<%}%>
			<!-- 신발 온라인/오프라인 정보 -->
			<div id="content_sneakerInfo">
				<!-- 오프라인 테이블 -->
				<table id="sneakerOfflineInfo_table">
						<h4> [오프라인 발매처]</h4>
						<tr class="ta_release_info">
							<td style="width:50px;"> </td>
							<td style="width:130px;"> </td>
							<td style="width:200px;"> </td>
							<td style="width:200px;"> 남은시간 </td>
							<td style="width:160px;"> 응모방식 </td>
							<td style="width:60px;"> 정보 </td>
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
							
							//시작시간, 끝나는 시간 새로운 포맷으로 바꾸기
							// 2020-04-18 10:00
							Date original_Offline_start_time = original_format.parse(ofdto_kr.getOffline_start_time());
							Date original_Offline_end_time = original_format.parse(ofdto_kr.getOffline_end_time());
							// 04/18 10:00
							String new_Offline_start_time = new_format.format(original_Offline_start_time);
							String new_Offline_end_time = new_format.format(original_Offline_end_time);
							
							// 04/18/2020 10:00
							String count_Offline_start_time = count_format.format(original_Offline_start_time);
					%>
					<tr>
						<td> <a href="<%=ofdto_kr.getOffline_link()%>" target="_blank"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_kr.getBrand_logo()%>" width="50" height="50"> </a> </td>
						<td style="text-align:left; padding-left: 15px;"> <a href="<%=ofdto_kr.getOffline_link()%>" target="_blank"> <%=ofdto_kr.getOffline_location()%> <%=bdto_kr.getBrand_name()%> </a> </td>
						<td> <span id="offline_start_time"> <%=new_Offline_start_time%> </span> ~ <%=new_Offline_end_time%> </td>
						
						<span id="count_Offline_start_time<%=i%>" style="display:none;"> <%=count_Offline_start_time%> </span>
						<td id="final_count_Offline_start_time<%=i%>"> </td>
						
						<td> <%=ofdto_kr.getOffline_method()%> </td>
						<% if(ofdto_kr.getOffline_link().equals("")) {%>
							<td> - </td>
						<%} else {%>
							<td> <a href="<%=ofdto_kr.getOffline_link()%>">보기</a> </td>
						<%}%>
						
						<%if(user.equals("admin")){%>
							<td style="width:30px;"> <input type="button" value="수정" onclick="location.href='./UpdateDrawInfo.ad?model_stylecode=<%=ofdto_kr.getModel_stylecode()%>&brand_id=<%=ofdto_kr.getBrand_id()%>'"> </td> 
						<%}%>
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
				<table id="sneakerOnlineInfo_table">
						<h4> [한국 온라인 발매처] </h4>
						<tr class="ta_release_info">
							<td style="width:50px;"> </td>
							<td style="width:100px;"> </td>
							<td style="width:30px;"> </td>
							<td style="width:200px;"> 시간 </td>
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
							
							//시작시간, 끝나는 시간 새로운 포맷으로 바꾸기
							// 2020-04-18 10:00
							Date original_Online_start_time_kr = original_format.parse(odto_kr.getOnline_start_time());
							Date original_Online_end_time_kr = original_format.parse(odto_kr.getOnline_end_time());
							// 04/18 10:00
							String new_Online_start_time_kr = new_format.format(original_Online_start_time_kr);
							String new_Online_end_time_kr = new_format.format(original_Online_end_time_kr);
							
							// 04/18/2020 10:00
							String count_Online_end_time_kr = count_format.format(original_Online_end_time_kr);
							
							// 오늘 날짜
							Date currentTime = new Date();
							String current = original_format.format(currentTime);
							Date today = original_format.parse(current);
							
							int compare_w_start_result_kr = today.compareTo(original_Online_start_time_kr);		//응모 시작하는 시간
							int compare_w_end_result_kr = today.compareTo(original_Online_end_time_kr); 		//응모 끝나는 시간
					%>
					<tr id="kr_drawRaw<%=i%>">
						<td> <a href="<%=odto_kr.getOnline_link()%>" target="_blank"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_kr.getBrand_logo()%>" width="50" height="50"> </a> </td>
						<td style="text-align:left; padding-left: 15px;"> <a href="<%=odto_kr.getOnline_link()%>" target="_blank"> <%=bdto_kr.getBrand_name()%> </a> </td>
						<td> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto_kr.getCountry_flag()%>" width="22" height="15"> </td>
						
						<!-- 응모시간 -->
						<td>
							<!-- 선착일시 -->
							<%if(odto_kr.getOnline_method().contains("선착")){%>
								<!-- 시작시간이 아직 미정일때 -->
								<%if(odto_kr.getOnline_start_time().contains("0000-00-00 00:00")){%>
									<span> 추후공지예정 </span>
								<%}else{%>
								 	<%=new_Online_start_time_kr%> ~ 
								<%}%>
							<!-- 드로우일시 -->
							<%}else if(odto_kr.getOnline_method().contains("드로우")){%> 
								<%if(odto_kr.getOnline_start_time().contains("0000-00-00 00:00") && odto_kr.getOnline_end_time().contains("0000-00-00 00:00")){%>
									<span> 추후공지예정 </span>
								<%}else if(odto_kr.getOnline_start_time().contains("0000-00-00 00:00")){%>
									~ <%=new_Online_end_time_kr%>
								<%}else if(odto_kr.getOnline_end_time().contains("0000-00-00 00:00")){%>
									<%=new_Online_start_time_kr%> ~
								<%}else{%>
									<%=new_Online_start_time_kr%> ~ <%=new_Online_end_time_kr%>
								<%}%>
							<%}%>
						</td>
						
						<!-- 남은시간 -->
						<span id="count_Online_end_time_kr<%=i%>" style="display:none;"> <%=count_Online_end_time_kr%> </span>
						<%if(odto_kr.getOnline_method().contains("선착")){%>
						<td id="remain_time_status_kr<%=i%>">
							<span> - </span>
						</td>
						<%}else if(odto_kr.getOnline_method().contains("드로우")){%>
						<td id="remain_time_status_kr<%=i%>">
							<%if(compare_w_start_result_kr == -1){%>
							<span id="final_count_Online_end_time_kr<%=i%>"></span>
							<%}else if(compare_w_start_result_kr == 1 && compare_w_end_result_kr == -1){%>
							<span id="final_count_Online_end_time_kr<%=i%>"></span><span id="draw_count_result_ing">진행중 </span>
							<%}else if(compare_w_end_result_kr == 1){%>
							<span id="draw_count_result_after"> 응모종료 </span> <br>
							<%}%>
						</td>
						<%}%>
						
						<!-- 응모방식 -->
						<td> <%=odto_kr.getOnline_method()%> </td>
						
						<!-- 응모여부 -->
						<!-- 온라인 방식이 '드로우'이고  로그인이 안되어있으면 -->
						<%if(odto_kr.getOnline_method().contains("드로우") && user.equals("")){%>
							<td id="draw-status_kr<%=i%>"> <a href="./MemberLogin.me"> <input type="button" value="로그인필요"> </a></td>
						<!-- 온라인 방식이 '드로우'이고 로그인이 되어있으면 -->
						<%}else if(odto_kr.getOnline_method().contains("드로우") && user != null && !userDrawBrandList.contains(odto_kr.getBrand_id())){%>
							<td id="draw-status_kr<%=i%>"> 
								<input type="hidden" id="kr_model_stylecode<%=i%>" value="<%=odto_kr.getModel_stylecode()%>">
								<input type="hidden" id="kr_brand_id<%=i%>" value="<%=odto_kr.getBrand_id()%>">
								<input type="hidden" id="kr_country_name<%=i%>" value="<%=odto_kr.getCountry_name()%>">
								<input type="checkbox" id="drawCheckbox_kr<%=i%>" style="width:18px; height:18px; vertical-align: middle;">
							</td>
						<!-- 온라인 방식이 '드로우'이고  응모완료 했으면 -->
						<%}else if(odto_kr.getOnline_method().contains("드로우") && user != null && userDrawBrandList.contains(odto_kr.getBrand_id())){%>
							<td id="draw-status_kr<%=i%>"> 
								<input type="hidden" id="kr_model_stylecode<%=i%>" value="<%=odto_kr.getModel_stylecode()%>">
								<input type="hidden" id="kr_brand_id<%=i%>" value="<%=odto_kr.getBrand_id()%>">
								<input type="hidden" id="kr_country_name<%=i%>" value="<%=odto_kr.getCountry_name()%>">
								<input type="checkbox" id="drawCheckbox_kr<%=i%>" style="width:18px; height:18px; vertical-align: middle;" checked>
							</td>
						<%}else {%>
							<td id="draw-status_kr<%=i%>"> - </td>
						<%}%>
						
						<%if(user.equals("admin")){%>
							<td style="width:30px;"> <input type="button" value="수정" onclick="location.href='./UpdateDrawInfo.ad?model_stylecode=<%=odto_kr.getModel_stylecode()%>&brand_id=<%=odto_kr.getBrand_id()%>'"> </td> 
						<%}%>
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
				<table id="sneakerOnlineInfo_table">
					<h4> [아시아 지역 발매처] </h4>
					<tr class="ta_release_info">
						<td style="width:50px;"> </td>
						<td style="width:100px;"> </td>
						<td style="width:30px;"> </td>
						<td style="width:200px;"> 시간 </td>
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
							
							//시작시간, 끝나는 시간 새로운 포맷으로 바꾸기
							// 2020-04-18 10:00
							Date original_Online_start_time_asia = original_format.parse(odto_asia.getOnline_start_time());
							Date original_Online_end_time_asia = original_format.parse(odto_asia.getOnline_end_time());
							// 04/18 10:00
							String new_Online_start_time_asia = new_format.format(original_Online_start_time_asia);
							String new_Online_end_time_asia = new_format.format(original_Online_end_time_asia);
							
							// 04/18/2020 10:00
							String count_Online_end_time_asia = count_format.format(original_Online_end_time_asia);
							
							// 오늘 날짜
							Date currentTime = new Date();
							String current = original_format.format(currentTime);
							Date today = original_format.parse(current);
							
							int compare_w_start_result_asia = today.compareTo(original_Online_start_time_asia);		//응모 시작하는 시간
							int compare_w_end_result_asia = today.compareTo(original_Online_end_time_asia); 		//응모 끝나는 시간
					%>
					<tr id="asia_drawRaw<%=i%>">
						<td> <a href="<%=odto_asia.getOnline_link()%>" target="_blank"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_asia.getBrand_logo()%>" width="50" height="50"> </a> </td>
						<td style="text-align:left; padding-left: 15px;"> <a href="<%=odto_asia.getOnline_link()%>" target="_blank"> <%=bdto_asia.getBrand_name()%> </a> </td>
						<td> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto_asia.getCountry_flag()%>" width="22" height="15"> </td>
						
						<!-- 응모시간 -->
						<td>
							<!-- 선착일시 -->
							<%if(odto_asia.getOnline_method().contains("선착")){%>
								<!-- 시작시간이 아직 미정일때 -->
								<%if(odto_asia.getOnline_start_time().contains("0000-00-00 00:00")){%>
									<span> 추후공지예정 </span>
								<%}else{%>
								 	<%=new_Online_start_time_asia%> ~ 
								<%}%>
							<!-- 드로우일시 -->
							<%}else if(odto_asia.getOnline_method().contains("드로우")){%> 
								<%if(odto_asia.getOnline_start_time().contains("0000-00-00 00:00") && odto_asia.getOnline_end_time().contains("0000-00-00 00:00")){%>
									<span> 추후공지예정 </span>
								<%}else if(odto_asia.getOnline_start_time().contains("0000-00-00 00:00")){%>
									~ <%=new_Online_end_time_asia%>
								<%}else if(odto_asia.getOnline_end_time().contains("0000-00-00 00:00")){%>
									<%=new_Online_start_time_asia%> ~
								<%}else{%>
									<%=new_Online_start_time_asia%> ~ <%=new_Online_end_time_asia%>
								<%}%>
							<%}%>
						</td>
						
						<!-- 남은시간 -->
						<span id="count_Online_end_time_asia<%=i%>" style="display:none;"> <%=count_Online_end_time_asia%> </span>
						<%if(odto_asia.getOnline_method().contains("선착")){%>
						<td id="remain_time_status_asia<%=i%>">
							<span> - </span>
						</td>
						<%}else if(odto_asia.getOnline_method().contains("드로우")){%>
						<td id="remain_time_status_asia<%=i%>">
							<%if(compare_w_start_result_asia == -1){%>
							<span id="final_count_Online_end_time_asia<%=i%>"></span>
							<%}else if(compare_w_start_result_asia == 1 && compare_w_end_result_asia == -1){%>
							<span id="final_count_Online_end_time_asia<%=i%>"></span><span id="draw_count_result_ing">진행중 </span>
							<%}else if(compare_w_end_result_asia == 1){%>
							<span id="draw_count_result_after"> 응모종료 </span> <br>
							<%}%>
						</td>
						<%}%>
						
						<!-- 응모 방식 -->
						<td> <span class="tooltip1"> <%=odto_asia.getOnline_method()%> <span class="tooltiptext1"> <%=odto_asia.getBuy_method()%></span></span> / <span class="tooltip2"> 직배여부 <span class="tooltiptext2"><%=odto_asia.getDelivery_method()%></span></span> </td>
						
						<!-- 응모여부 -->
						<!-- 온라인 방식이 '드로우'이고  로그인이 안되어있으면 -->
						<%if(odto_asia.getOnline_method().contains("드로우") && user.equals("")){%>
							<td id="draw-status_asia<%=i%>"> <a href="./MemberLogin.me"> <input type="button" value="로그인필요"> </a></td>
						<!-- 온라인 방식이 '드로우'이고 로그인이 되어있으면 -->
						<%}else if(odto_asia.getOnline_method().contains("드로우") && user != null && !userDrawBrandList.contains(odto_asia.getBrand_id())){%>
							<td id="draw-status_asia<%=i%>"> 
								<input type="hidden" id="asia_model_stylecode<%=i%>" value="<%=odto_asia.getModel_stylecode()%>">
								<input type="hidden" id="asia_brand_id<%=i%>" value="<%=odto_asia.getBrand_id()%>">
								<input type="hidden" id="asia_country_name<%=i%>" value="<%=odto_asia.getCountry_name()%>">
								<input type="checkbox" id="drawCheckbox_asia<%=i%>" style="width:18px; height:18px; vertical-align: middle;">
							</td>
						<!-- 온라인 방식이 '드로우'이고  응모완료 했으면 -->
						<%}else if(odto_asia.getOnline_method().contains("드로우") && user != null && userDrawBrandList.contains(odto_asia.getBrand_id())){%>
							<td id="draw-status_asia<%=i%>"> 
								<input type="hidden" id="asia_model_stylecode<%=i%>" value="<%=odto_asia.getModel_stylecode()%>">
								<input type="hidden" id="asia_brand_id<%=i%>" value="<%=odto_asia.getBrand_id()%>">
								<input type="hidden" id="asia_country_name<%=i%>" value="<%=odto_asia.getCountry_name()%>">
								<input type="checkbox" id="drawCheckbox_asia<%=i%>" style="width:18px; height:18px; vertical-align: middle;" checked>
							</td>
						<%}else {%>
							<td id="draw-status_asia<%=i%>"> - </td>
						<%}%>
						
						<%if(user.equals("admin")){%>
							<td style="width:30px;"> <input type="button" value="수정" onclick="location.href='./UpdateDrawInfo.ad?model_stylecode=<%=odto_asia.getModel_stylecode()%>&brand_id=<%=odto_asia.getBrand_id()%>'"> </td> 
						<%}%>
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
				<table id="sneakerOnlineInfo_table">
					<h4> [북미 지역 발매처] </h4>
					<tr class="ta_release_info">
						<td style="width:50px;"> </td>
						<td style="width:100px;"> </td>
						<td style="width:30px;"> </td>
						<td style="width:200px;"> 시간 </td>
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
							
							//시작시간, 끝나는 시간 새로운 포맷으로 바꾸기
							// 2020-04-18 10:00
							Date original_Online_start_time_america = original_format.parse(odto_america.getOnline_start_time());
							Date original_Online_end_time_america = original_format.parse(odto_america.getOnline_end_time());
							// 04/18 10:00
							String new_Online_start_time_america = new_format.format(original_Online_start_time_america);
							String new_Online_end_time_america = new_format.format(original_Online_end_time_america);
							
							// 04/18/2020 10:00
							String count_Online_end_time_america = count_format.format(original_Online_end_time_america);
							
							// 오늘 날짜
							Date currentTime = new Date();
							String current = original_format.format(currentTime);
							Date today = original_format.parse(current);
							
							int compare_w_start_result_america = today.compareTo(original_Online_start_time_america);	//응모 시작하는 시간
							int compare_w_end_result_america = today.compareTo(original_Online_end_time_america); 		//응모 끝나는 시간
					%>
					<tr id="america_drawRaw<%=i%>">
						<td> <a href="<%=odto_america.getOnline_link()%>" target="_blank"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_america.getBrand_logo()%>" width="50" height="50"> </a> </td>
						<td style="text-align:left; padding-left: 15px;"> <a href="<%=odto_america.getOnline_link()%>" target="_blank"> <%=bdto_america.getBrand_name()%> </a> </td>
						<td> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto_america.getCountry_flag()%>" width="22" height="15"> </td>
						
						<!-- 응모시간 -->
						<td>
							<!-- 선착일시 -->
							<%if(odto_america.getOnline_method().contains("선착")){%>
								<!-- 시작시간이 아직 미정일때 -->
								<%if(odto_america.getOnline_start_time().contains("0000-00-00 00:00")){%>
									<span> 추후공지예정 </span>
								<%}else{%>
								 	<%=new_Online_start_time_america%> ~ 
								<%}%>
							<!-- 드로우일시 -->
							<%}else if(odto_america.getOnline_method().contains("드로우")){%> 
								<%if(odto_america.getOnline_start_time().contains("0000-00-00 00:00") && odto_america.getOnline_end_time().contains("0000-00-00 00:00")){%>
									<span> 추후공지예정 </span>
								<%}else if(odto_america.getOnline_start_time().contains("0000-00-00 00:00")){%>
									~ <%=new_Online_end_time_america%>
								<%}else if(odto_america.getOnline_end_time().contains("0000-00-00 00:00")){%>
									<%=new_Online_start_time_america%> ~
								<%}else{%>
									<%=new_Online_start_time_america%> ~ <%=new_Online_end_time_america%>
								<%}%>
							<%}%>
						</td>
						
						<!-- 남은시간 -->
						<span id="count_Online_end_time_america<%=i%>" style="display:none;"> <%=count_Online_end_time_america%> </span>
						<%if(odto_america.getOnline_method().contains("선착")){%>
						<td id="remain_time_status_america<%=i%>">
							<span> - </span>
						</td>
						<%}else if(odto_america.getOnline_method().contains("드로우")){%>
						<td id="remain_time_status_america<%=i%>">
							<%if(compare_w_start_result_america == -1){%>
							<span id="final_count_Online_end_time_america<%=i%>"></span>
							<%}else if(compare_w_start_result_america == 1 && compare_w_end_result_america == -1){%>
							<span id="final_count_Online_end_time_america<%=i%>"></span><span id="draw_count_result_ing">진행중 </span>
							<%}else if(compare_w_end_result_america == 1){%>
							<span id="draw_count_result_after"> 응모종료 </span> <br>
							<%}%>
						</td>
						<%}%>
						
						<!-- 응모방식/직배 여부 -->
						<td> <span class="tooltip1"> <%=odto_america.getOnline_method()%> <span class="tooltiptext1"> <%=odto_america.getBuy_method()%></span></span> / <span class="tooltip2"> 직배여부 <span class="tooltiptext2"><%=odto_america.getDelivery_method()%></span></span> </td>
						
						<!-- 응모여부 -->
						<!-- 온라인 방식이 '드로우'이고  로그인이 안되어있으면 -->
						<%if(odto_america.getOnline_method().contains("드로우") && user.equals("")){%>
							<td id="draw-status_america<%=i%>"> <a href="./MemberLogin.me"> <input type="button" value="로그인필요"> </a></td>
						<!-- 온라인 방식이 '드로우'이고 로그인이 되어있으면 -->
						<%}else if(odto_america.getOnline_method().contains("드로우") && user != null && !userDrawBrandList.contains(odto_america.getBrand_id())){%>
							<td id="draw-status_america<%=i%>"> 
								<input type="hidden" id="america_model_stylecode<%=i%>" value="<%=odto_america.getModel_stylecode()%>">
								<input type="hidden" id="america_brand_id<%=i%>" value="<%=odto_america.getBrand_id()%>">
								<input type="hidden" id="america_country_name<%=i%>" value="<%=odto_america.getCountry_name()%>">
								<input type="checkbox" id="drawCheckbox_america<%=i%>" style="width:18px; height:18px; vertical-align: middle;">
							</td>
						<!-- 온라인 방식이 '드로우'이고  응모완료 했으면 -->
						<%}else if(odto_america.getOnline_method().contains("드로우") && user != null && userDrawBrandList.contains(odto_america.getBrand_id())){%>
							<td id="draw-status_america<%=i%>"> 
								<input type="hidden" id="america_model_stylecode<%=i%>" value="<%=odto_america.getModel_stylecode()%>">
								<input type="hidden" id="america_brand_id<%=i%>" value="<%=odto_america.getBrand_id()%>">
								<input type="hidden" id="america_country_name<%=i%>" value="<%=odto_america.getCountry_name()%>">
								<input type="checkbox" id="drawCheckbox_america<%=i%>" style="width:18px; height:18px; vertical-align: middle;" checked>
							</td>
						<%}else {%>
							<td id="draw-status_america<%=i%>"> - </td>
						<%}%>
						
						<%if(user.equals("admin")){%>
							<td style="width:30px;"> <input type="button" value="수정" onclick="location.href='./UpdateDrawInfo.ad?model_stylecode=<%=odto_america.getModel_stylecode()%>&brand_id=<%=odto_america.getBrand_id()%>'"> </td> 
						<%}%>
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
				<table id="sneakerOnlineInfo_table">
					<h4> [유럽 지역 발매처] </h4>
					<tr class="ta_release_info">
						<td style="width:50px;"> </td>
						<td style="width:100px;"> </td>
						<td style="width:30px;"> </td>
						<td style="width:200px;"> 시간 </td>
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
						for(int i=0; i<onlineList_europe.size();i++){
							OnlineDTO odto_europe = (OnlineDTO) onlineList_europe.get(i);
							BrandDTO bdto_europe = (BrandDTO) brandList_europe.get(i);
							
							//시작시간, 끝나는 시간 새로운 포맷으로 바꾸기
							// 2020-04-18 10:00
							Date original_Online_start_time_europe = original_format.parse(odto_europe.getOnline_start_time());
							Date original_Online_end_time_europe = original_format.parse(odto_europe.getOnline_end_time());
							// 04/18 10:00
							String new_Online_start_time_europe = new_format.format(original_Online_start_time_europe);
							String new_Online_end_time_europe = new_format.format(original_Online_end_time_europe);
							
							// 04/18/2020 10:00
							String count_Online_end_time_europe = count_format.format(original_Online_end_time_europe);
							
							// 오늘 날짜
							Date currentTime = new Date();
							String current = original_format.format(currentTime);
							Date today = original_format.parse(current);
							
							int compare_w_start_result_europe = today.compareTo(original_Online_start_time_europe);		//오늘이랑 응모 시작하는 시간이랑 비교, -1 이면 오늘이 응모시간보다 전	1이면 오늘이 응모시간보다 후
							int compare_w_end_result_europe = today.compareTo(original_Online_end_time_europe); 		//오늘이랑 응모 끝나는 시간 비교
							
							System.out.println(odto_europe.getOnline_end_time());
							System.out.println(compare_w_start_result_europe);
					%>
					<tr id="europe_drawRaw<%=i%>">
						<td> <a href="<%=odto_europe.getOnline_link()%>" target="_blank"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_europe.getBrand_logo()%>" width="50" height="50"> </a> </td>
						<td style="text-align:left; padding-left: 15px;"> <a href="<%=odto_europe.getOnline_link()%>" target="_blank"> <%=bdto_europe.getBrand_name()%> </a> </td>
						<td> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto_europe.getCountry_flag()%>" width="22" height="15"> </td>
						
						<!-- 응모시간 -->
						<td> 
							<!-- 선착일시 -->
							<%if(odto_europe.getOnline_method().contains("선착")){%>
								<!-- 시작시간이 아직 미정일때 -->
								<%if(odto_europe.getOnline_start_time().contains("0000-00-00 00:00")){%>
									<span> 추후공지예정 </span>
								<%}else{%>
								 	<%=new_Online_start_time_europe%> ~ 
								<%}%>
							<!-- 드로우일시 -->
							<%}else if(odto_europe.getOnline_method().contains("드로우")){%> 
								<%if(odto_europe.getOnline_start_time().contains("0000-00-00 00:00") && odto_europe.getOnline_end_time().contains("0000-00-00 00:00")){%>
									<span> 추후공지예정 </span>
								<%}else if(odto_europe.getOnline_start_time().contains("0000-00-00 00:00")){%>
									~ <%=new_Online_end_time_europe%>
								<%}else if(odto_europe.getOnline_end_time().contains("0000-00-00 00:00")){%>
									<%=new_Online_start_time_europe%> ~
								<%}else{%>
									<%=new_Online_start_time_europe%> ~ <%=new_Online_end_time_europe%>
								<%}%>
							<%}%>
						</td>
						
						<!-- 남은시간 -->
						<span id="count_Online_end_time_europe<%=i%>" style="display:none;"> <%=count_Online_end_time_europe%> </span>
						<%if(odto_europe.getOnline_method().contains("선착")){%>
						<td id="remain_time_status_europe<%=i%>">
							<span> - </span>
						</td>
						<%}else if(odto_europe.getOnline_method().contains("드로우")){%>
						<td id="remain_time_status_europe<%=i%>">
							<!-- 오늘이 시작시간 전일때 -->
							<%if(compare_w_start_result_europe == -1){%>
								<span id="final_count_Online_end_time_europe<%=i%>"></span>
							<!-- 시작시간과 끝나는 시간이 모두 존재하고 오늘이 응모시간 사이일때 -->
							<%}else if(compare_w_start_result_europe == 1 && compare_w_end_result_europe == -1){%>
								<span id="final_count_Online_end_time_europe<%=i%>"></span>	<span id="draw_count_result_ing">진행중</span>
							<!-- 시작시간이 없고 끝나는 시간만 존재하고 오늘이 응모시간 전일때 -->
							<%}else if(odto_europe.getOnline_start_time().contains("0000-00-00") && compare_w_end_result_europe == -1){%>
								<span id="final_count_Online_end_time_europe<%=i%>"></span>	<span id="draw_count_result_ing">진행중</span>
							<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 전일때 -->
							<%}else if(odto_europe.getOnline_end_time().contains("0000-00-00") && compare_w_start_result_europe == -1){%>
								<span> 응모전</span>
							<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 후일때 -->
							<%}else if(odto_europe.getOnline_end_time().contains("0000-00-00") && compare_w_start_result_europe == 1){%>
								<span> 계산전 </span> <span id="draw_count_result_ing">진행중</span>
							<!-- 오늘이 끝나는 시간을 지났을때 -->
							<%}else if(compare_w_end_result_europe == 1 && !odto_europe.getOnline_start_time().contains("0000-00-00") && !odto_europe.getOnline_end_time().contains("0000-00-00")){%>
								<span id="draw_count_result_after"> 응모종료 </span> <br>
							<%}else{%>
								<span> - </span>
							<%}%>
						</td>
						<%}%>
						
						<!-- 응모방식/직배여부 -->
						<td> <span class="tooltip1"> <%=odto_europe.getOnline_method()%> <span class="tooltiptext1"> <%=odto_europe.getBuy_method()%></span></span> / <span class="tooltip2"> 직배여부 <span class="tooltiptext2"><%=odto_europe.getDelivery_method()%></span></span> </td>
						
						<!-- 응모여부 -->
						<!-- 온라인 방식이 '드로우'이고  로그인이 안되어있으면 -->
						<%if(odto_europe.getOnline_method().contains("드로우") && user.equals("")){%>
							<td id="draw-status_europe<%=i%>"> <a href="./MemberLogin.me"> <input type="button" value="로그인필요"> </a></td>
						<!-- 온라인 방식이 '드로우'이고 로그인이 되어있으면 -->
						<%}else if(odto_europe.getOnline_method().contains("드로우") && user != null && !userDrawBrandList.contains(odto_europe.getBrand_id())){%>
							<td id="draw-status_europe<%=i%>"> 
								<input type="hidden" id="europe_model_stylecode<%=i%>" value="<%=odto_europe.getModel_stylecode()%>">
								<input type="hidden" id="europe_brand_id<%=i%>" value="<%=odto_europe.getBrand_id()%>">
								<input type="hidden" id="europe_country_name<%=i%>" value="<%=odto_europe.getCountry_name()%>">
								<input type="checkbox" id="drawCheckbox_europe<%=i%>" style="width:18px; height:18px; vertical-align: middle;">
							</td>
						<!-- 온라인 방식이 '드로우'이고  응모완료 했으면 -->
						<%}else if(odto_europe.getOnline_method().contains("드로우") && user != null && userDrawBrandList.contains(odto_europe.getBrand_id())){%>
							<td id="draw-status_europe<%=i%>"> 
								<input type="hidden" id="europe_model_stylecode<%=i%>" value="<%=odto_europe.getModel_stylecode()%>">
								<input type="hidden" id="europe_brand_id<%=i%>" value="<%=odto_europe.getBrand_id()%>">
								<input type="hidden" id="europe_country_name<%=i%>" value="<%=odto_europe.getCountry_name()%>">
								<input type="checkbox" id="drawCheckbox_europe<%=i%>" style="width:18px; height:18px; vertical-align: middle;" checked>
							</td>
						<%}else {%>
							<td id="draw-status_europe<%=i%>"> - </td>
						<%}%>
						
						<%if(user.equals("admin")){%>
							<td style="width:30px;"> <input type="button" value="수정" onclick="location.href='./UpdateDrawInfo.ad?model_stylecode=<%=odto_europe.getModel_stylecode()%>&brand_id=<%=odto_europe.getBrand_id()%>'"> </td> 
						<%}%>
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
				<table id="sneakerOnlineInfo_table">
					<h4> [기타 지역 발매처] </h4>
					<tr class="ta_release_info">
						<td style="width:50px;"> </td>
						<td style="width:100px;"> </td>
						<td style="width:30px;"> </td>
						<td style="width:200px;"> 시간 </td>
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
						for(int i=0; i<onlineList_etc.size();i++){
							OnlineDTO odto_etc = (OnlineDTO) onlineList_etc.get(i);
							BrandDTO bdto_etc = (BrandDTO) brandList_etc.get(i);
							
							//시작시간, 끝나는 시간 새로운 포맷으로 바꾸기
							// 2020-04-18 10:00
							Date original_Online_start_time_etc = original_format.parse(odto_etc.getOnline_start_time());
							Date original_Online_end_time_etc = original_format.parse(odto_etc.getOnline_end_time());
							// 04/18 10:00
							String new_Online_start_time_etc = new_format.format(original_Online_start_time_etc);
							String new_Online_end_time_etc = new_format.format(original_Online_end_time_etc);
							
							// 04/18/2020 10:00
							String count_Online_end_time_etc = count_format.format(original_Online_start_time_etc);
							
							// 오늘 날짜
							Date currentTime = new Date();
							String current = original_format.format(currentTime);
							Date today = original_format.parse(current);
							
							int compare_w_start_result_etc = today.compareTo(original_Online_start_time_etc);	//응모 시작하는 시간
							int compare_w_end_result_etc = today.compareTo(original_Online_end_time_etc); 		//응모 끝나는 시간
					%>
					<tr id="etc_drawRaw<%=i%>">
						<td> <a href="<%=odto_etc.getOnline_link()%>" target="_blank"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_etc.getBrand_logo()%>" width="50" height="50"> </a> </td>
						<td style="text-align:left; padding-left: 15px;"> <a href="<%=odto_etc.getOnline_link()%>" target="_blank"> <%=bdto_etc.getBrand_name()%> </a> </td>
						<td> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto_etc.getCountry_flag()%>" width="22" height="15"> </td>
						
						<!-- 응모시간 -->
						<td>
							<!-- 선착일시 -->
							<%if(odto_etc.getOnline_method().contains("선착")){%>
								<!-- 시작시간이 아직 미정일때 -->
								<%if(odto_etc.getOnline_start_time().contains("0000-00-00 00:00")){%>
									<span> 추후공지예정 </span>
								<%}else{%>
								 	<%=new_Online_start_time_etc%> ~ 
								<%}%>
							<!-- 드로우일시 -->
							<%}else if(odto_etc.getOnline_method().contains("드로우")){%> 
								<%if(odto_etc.getOnline_start_time().contains("0000-00-00 00:00") && odto_etc.getOnline_end_time().contains("0000-00-00 00:00")){%>
									<span> 추후공지예정 </span>
								<%}else if(odto_etc.getOnline_start_time().contains("0000-00-00 00:00")){%>
									~ <%=new_Online_end_time_etc%>
								<%}else if(odto_etc.getOnline_end_time().contains("0000-00-00 00:00")){%>
									<%=new_Online_start_time_etc%> ~
								<%}else{%>
									<%=new_Online_start_time_etc%> ~ <%=new_Online_end_time_etc%>
								<%}%>
							<%}%>
						</td>
						
						<!-- 남은시간 -->
						<span id="count_Online_end_time_etc<%=i%>" style="display:none;"> <%=count_Online_end_time_etc%> </span>
						<%if(odto_etc.getOnline_method().contains("선착")){%>
						<td id="remain_time_status_etc<%=i%>">
							<span> - </span>
						</td>
						<%}else if(odto_etc.getOnline_method().contains("드로우")){%>
						<td id="remain_time_status_etc<%=i%>">
							<%if(compare_w_start_result_etc == -1){%>
							<span id="final_count_Online_end_time_etc<%=i%>"></span>
							<%}else if(compare_w_start_result_etc == 1 && compare_w_end_result_etc == -1){%>
							<span id="final_count_Online_end_time_etc<%=i%>"></span><span id="draw_count_result_ing">진행중 </span>
							<%}else if(compare_w_end_result_etc == 1){%>
							<span id="draw_count_result_after"> 응모종료 </span> <br>
							<%}%>
						</td>
						<%}%>
						
						<!-- 응모방식/직배 여부 -->
						<td> <span class="tooltip1"> <%=odto_etc.getOnline_method()%> <span class="tooltiptext1"> <%=odto_etc.getBuy_method()%></span></span> / <span class="tooltip2"> 직배여부 <span class="tooltiptext2"><%=odto_etc.getDelivery_method()%></span></span> </td>
						
						<!-- 응모여부 -->
						<!-- 온라인 방식이 '드로우'이고  로그인이 안되어있으면 -->
						<%if(odto_etc.getOnline_method().contains("드로우") && user.equals("")){%>
							<td id="draw-status_etc<%=i%>"> <a href="./MemberLogin.me"> <input type="button" value="로그인필요"> </a></td>
						<!-- 온라인 방식이 '드로우'이고 로그인이 되어있으면 -->
						<%}else if(odto_etc.getOnline_method().contains("드로우") && user != null && !userDrawBrandList.contains(odto_etc.getBrand_id())){%>
							<td id="draw-status_etc<%=i%>"> 
								<input type="hidden" id="etc_model_stylecode<%=i%>" value="<%=odto_etc.getModel_stylecode()%>">
								<input type="hidden" id="etc_brand_id<%=i%>" value="<%=odto_etc.getBrand_id()%>">
								<input type="hidden" id="etc_country_name<%=i%>" value="<%=odto_etc.getCountry_name()%>">
								<input type="checkbox" id="drawCheckbox_etc<%=i%>" style="width:18px; height:18px; vertical-align: middle;">
							</td>
						<!-- 온라인 방식이 '드로우'이고  응모완료 했으면 -->
						<%}else if(odto_etc.getOnline_method().contains("드로우") && user != null && userDrawBrandList.contains(odto_etc.getBrand_id())){%>
							<td id="draw-status_etc<%=i%>"> 
								<input type="hidden" id="etc_model_stylecode<%=i%>" value="<%=odto_etc.getModel_stylecode()%>">
								<input type="hidden" id="etc_brand_id<%=i%>" value="<%=odto_etc.getBrand_id()%>">
								<input type="hidden" id="etc_country_name<%=i%>" value="<%=odto_etc.getCountry_name()%>">
								<input type="checkbox" id="drawCheckbox_etc<%=i%>" style="width:18px; height:18px; vertical-align: middle;" checked>
							</td>
						<%}else {%>
							<td id="draw-status_etc<%=i%>"> - </td>
						<%}%>
						
						<%if(user.equals("admin")){%>
							<td style="width:30px;"> <input type="button" value="수정" onclick="location.href='./UpdateDrawInfo.ad?model_stylecode=<%=odto_etc.getModel_stylecode()%>&brand_id=<%=odto_etc.getBrand_id()%>'"> </td> 
						<%}%>
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
		const countDownTimer = function (id, date, drawstatus_id) { 
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
					document.getElementById(id).textContent = '응모종료'; 
					document.getElementById(drawstatus_id).textContent = '-';
					return; 
				} 
				var days = Math.floor(distDt / _day); 
				var hours = Math.floor((distDt % _day) / _hour); 
				var minutes = Math.floor((distDt % _hour) / _minute); 
				var seconds = Math.floor((distDt % _minute) / _second); 		
				document.getElementById(id).textContent = days + '일 '; 
				document.getElementById(id).textContent += hours + '시간 '; 
				document.getElementById(id).textContent += minutes + '분 '; 
				document.getElementById(id).textContent += seconds + '초'; 
			} 
			timer = setInterval(showRemaining, 1000); 
		}
		
		//오프라인 한국 리스트
		var offLineList_kr = [];
		<c:forEach items="${offLineList_kr}" var="offLineList_kr">
			offLineList_kr.push("${offLineList_kr}");
		</c:forEach>
		//offLineList_kr 리스트를 자바로부터 받아와 리스트 길이만큼 남은시간 정보 뿌려주기
		for(var i=0; i<offLineList_kr.length; i++) {		
			var count_span = document.getElementById("count_Offline_start_time"+i).innerText;
			countDownTimer('final_count_Offline_start_time'+i, count_span);
		}
		
		//온라인 한국 리스트
		var onLineList_kr = [];
		<c:forEach items="${onlineList_kr}" var="onLineList_kr">
			onLineList_kr.push("${onLineList_kr}");
		</c:forEach>
		//onLineList_kr 리스트를 자바로부터 받아와 리스트 길이만큼 남은시간 정보 뿌려주기
		for(var i=0; i<onLineList_kr.length; i++) {		
			var count_span = document.getElementById("count_Online_end_time_kr"+i).innerText;
			countDownTimer('final_count_Online_end_time_kr'+i, count_span, 'draw-status_kr'+i);
			
			//남은시간란이 '응모종료'이면 해당 브랜드 줄 투명, 클릭x 바꾸기
			var remain_time_status_kr = document.getElementById('remain_time_status_kr'+i).innerText;
			if(remain_time_status_kr.match("응모종료")){
				var kr_drawRaw = $('#kr_drawRaw'+i);
				kr_drawRaw.css({"opacity" : "0.3", "pointer-events" : "none"});
			}
		}
		
		//온라인 아시아 리스트
		var onLineList_asia = [];
		<c:forEach items="${onlineList_asia}" var="onLineList_asia">
			onLineList_asia.push("${onLineList_asia}");
		</c:forEach>
		//onLineList_asia 리스트를 자바로부터 받아와 리스트 길이만큼 남은시간 정보 뿌려주기
		for(var i=0; i<onLineList_asia.length; i++) {		
			var count_span = document.getElementById("count_Online_end_time_asia"+i).innerText;
			countDownTimer('final_count_Online_end_time_asia'+i, count_span, 'draw-status_asia'+i);
			
			//남은시간란이 '응모종료'이면 해당 브랜드 줄 투명, 클릭x 바꾸기
			var remain_time_status_asia = document.getElementById('remain_time_status_asia'+i).innerText;
			if(remain_time_status_asia.match("응모종료")){
				var asia_drawRaw = $('#asia_drawRaw'+i);
				asia_drawRaw.css({"opacity" : "0.3", "pointer-events" : "none"});
			}
		}
		
		//온라인 아메리카 리스트
		var onLineList_america = [];
		<c:forEach items="${onlineList_america}" var="onLineList_america">
			onLineList_america.push("${onLineList_america}");
		</c:forEach>
		//onLineList_america 리스트를 자바로부터 받아와 리스트 길이만큼 남은시간 정보 뿌려주기
		for(var i=0; i<onLineList_america.length; i++) {		
			var count_span = document.getElementById("count_Online_end_time_america"+i).innerText;
			countDownTimer('final_count_Online_end_time_america'+i, count_span, 'draw-status_america'+i);
			
			//남은시간란이 '응모종료'이면 해당 브랜드 줄 투명, 클릭x 바꾸기
			var remain_time_status_america = document.getElementById('remain_time_status_america'+i).innerText;
			if(remain_time_status_america.match("응모종료")){
				var america_drawRaw = $('#america_drawRaw'+i);
				america_drawRaw.css({"opacity" : "0.3", "pointer-events" : "none"});
			}
		}
		
		//온라인 유럽 리스트
		var onLineList_europe = [];
		<c:forEach items="${onlineList_europe}" var="onLineList_europe">
			onLineList_europe.push("${onLineList_europe}");
		</c:forEach>
		//onLineList_europe 리스트를 자바로부터 받아와 리스트 길이만큼 남은시간 정보 뿌려주기
		for(var i=0; i<onLineList_europe.length; i++) {		
			var count_span = document.getElementById("count_Online_end_time_europe"+i).innerText;
			countDownTimer('final_count_Online_end_time_europe'+i, count_span, 'draw-status_europe'+i);
			
			//남은시간란이 '응모종료'이면 해당 브랜드 줄 투명, 클릭x 바꾸기
			var remain_time_status_europe = document.getElementById('remain_time_status_europe'+i).innerText;
			if(remain_time_status_europe.match("응모종료")){
				var europe_drawRaw = $('#europe_drawRaw'+i);
				europe_drawRaw.css({"opacity" : "0.3", "pointer-events" : "none"});
			}
		}
		
		//온라인 기타지역 리스트
		var onLineList_etc = [];
		<c:forEach items="${onlineList_etc}" var="onLineList_etc">
			onLineList_etc.push("${onLineList_etc}");
		</c:forEach>
		//onLineList_etc 리스트를 자바로부터 받아와 리스트 길이만큼 남은시간 정보 뿌려주기
		for(var i=0; i<onLineList_etc.length; i++) {		
			var count_span = document.getElementById("count_Online_end_time_etc"+i).innerText;
			countDownTimer('final_count_Online_end_time_etc'+i, count_span, 'draw-status_etc'+i);
			
			//남은시간란이 '응모종료'이면 해당 브랜드 줄 투명, 클릭x 바꾸기
			var remain_time_status_etc = document.getElementById('remain_time_status_etc'+i).innerText;
			if(remain_time_status_etc.match("응모종료")){
				var etc_drawRaw = $('#etc_drawRaw'+i);
				etc_drawRaw.css({"opacity" : "0.3", "pointer-events" : "none"});
			}
		}
		
		//체크박스 클릭했을시
		$("input:checkbox").on('click', function() {
			//drawCheckbox_kr + i
			var checkbox_id = $(this).attr("id");
			//i
			var checkbox_id_num = checkbox_id.substr(checkbox_id.length - 1);
			//kr3
			var idx = checkbox_id.indexOf("_");
			var checkbox_id_country_num = checkbox_id.substring(idx+1);
			//kr
			var checkbox_country = checkbox_id_country_num.substr(0, checkbox_id_country_num.length-1);
			
			if($(this).is(":checked")==true){
				//체크가 안된 상태에서 응모여부 물어보기
				$(this).prop("checked", false);
				var draw_confirm_yes = confirm("해당 사이트를 응모 하셨습니까?");
			   	if(draw_confirm_yes){
			   		$.ajax({
			   			type:'get',
			   			url:'./addUserDrawInfoAction.me',
			   			data: 'model_stylecode='+$('#'+checkbox_country +'_model_stylecode'+checkbox_id_num).val()+'&brand_id='+$('#'+checkbox_country +'_brand_id'+checkbox_id_num).val()+'&country_name='+$('#'+checkbox_country +'_country_name'+checkbox_id_num).val(),
			   			dataType: 'html',
			   			success:function(data) {
			   				alert("해당 사이트를 나의 페이지에 저장하였습니다.");	
			   			},error:function(request,status,error){
						 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
						}
			   		});
			   		$(this).prop("checked", true);
			   	}else {
			   		$(this).prop("checked", false);
			   	}
			}
			else if($(this).is(":not(:checked)")==true){
				//체크가 된 상태에서 응모여부 물어보기
				$(this).prop("checked", true);
				var draw_confirm_no = confirm("해당 사이트 응모를 취소하셨습니까?");
			   	if(draw_confirm_no){
			   		$.ajax({
			   			type:'get',
			   			url:'./deleteUserDrawInfoAction.me',
			   			data: 'model_stylecode='+$('#'+checkbox_country +'_model_stylecode'+checkbox_id_num).val()+'&brand_id='+$('#'+checkbox_country +'_brand_id'+checkbox_id_num).val()+'&country_name='+$('#'+checkbox_country +'_country_name'+checkbox_id_num).val(),
			   			dataType: 'html',
			   			success:function(data) {
			   				alert("응모여부를 취소하였습니다.");
			   			},error:function(request,status,error){
						 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
						}
			   		});
			   		$(this).prop("checked", false);	
			   	}else {
			   		$(this).prop("checked", true);
			   	}
			}
		});
		
	});
	
	

</script>
</html>