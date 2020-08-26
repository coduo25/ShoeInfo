<%@page import="java.text.DecimalFormat"%>
<%@page import="net.member.db.MemberDrawDTO"%>
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
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>SHOE INFO.</title>
<link href="./css/board/sneakerDetail.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:600&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<!-- Header -->	
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<%
		request.setCharacterEncoding("UTF-8");
		
		//로그인한 사용자가 체크
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		if(user == null){
			user = "";
			usr_position = "";
		}

		//사용자 응모한 브랜드 리스트
		List<String> userDrawBrandList = (List<String>) request.getAttribute("userDrawBrandList");
	
		//신발 기본 정보 리스트
		SneakerDTO sdto = (SneakerDTO) request.getAttribute("sneakerDetail");

		// ---------- 온라인 정보 -----------
		//대한민국
		ArrayList<OnlineDTO> onlineList_kr = (ArrayList<OnlineDTO>) request.getAttribute("onlineList_kr");
		ArrayList<BrandDTO> brandList_kr = (ArrayList<BrandDTO>) request.getAttribute("brandList_kr");
		
		//아시아(대한민국빼고)
		ArrayList<OnlineDTO> onlineList_asia = (ArrayList<OnlineDTO>) request.getAttribute("onlineList_asia");
		ArrayList<BrandDTO> brandList_asia = (ArrayList<BrandDTO>) request.getAttribute("brandList_asia");
		
		//아메리카
		ArrayList<OnlineDTO> onlineList_america = (ArrayList<OnlineDTO>) request.getAttribute("onlineList_america");
		ArrayList<BrandDTO> brandList_america = (ArrayList<BrandDTO>) request.getAttribute("brandList_america");
		
		//유럽
		ArrayList<OnlineDTO> onlineList_europe = (ArrayList<OnlineDTO>) request.getAttribute("onlineList_europe");
		ArrayList<BrandDTO> brandList_europe = (ArrayList<BrandDTO>) request.getAttribute("brandList_europe");
		
		//기타
		ArrayList<OnlineDTO> onlineList_etc = (ArrayList<OnlineDTO>) request.getAttribute("onlineList_etc");
		ArrayList<BrandDTO> brandList_etc = (ArrayList<BrandDTO>) request.getAttribute("brandList_etc");
		
		SimpleDateFormat original_format = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		SimpleDateFormat new_format = new SimpleDateFormat("M/d HH:mm");
		SimpleDateFormat count_format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
		
		DecimalFormat formatter = new DecimalFormat("#,###,###");
		
		// 오늘 날짜
		Date currentTime = new Date();
		String current = original_format.format(currentTime);
		Date today = original_format.parse(current);
	%>
	<input type="hidden" class="login_user" value="<%=user%>">
	<input type="hidden" class="num" id="num" value="<%=sdto.getNum()%>">
	
	<div id="wrapper" class="container">

		<!-- content -->
		<div id="content_sneakerDetail">
			<!-- 카테고리 -->
			<div id="cate_Detail">
				<a href="./SneakerList.go"> <span> HOME </span> </a>
				<span class="arrow"> <i class="fas fa-angle-right"></i> </span>
				<span> <%=sdto.getModel_name() %></span>
			</div>
			<%	//관리자 권한일때 제품 기본정보 수정하는 페이지로 가는 버튼
				if(usr_position.equals("admin")){
			%>
				<a href="./UpdateSneakerInfo.ad?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>"><input type="button" value="기본정보 수정하기" style="float: right;"></a>
			<%}%>
			<!-- 신발 기본 정보 -->
			<div id="sneaker_Detail">
				<div class="sneaker_image_wrapper"> 
					<div class="sneaker_image"> 
						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>">
					</div>
					<!-- 신발 이름 -->
					<div class="sneaker_name">
						<span><%=sdto.getModel_name() %></span>
					</div>
				</div>
					
				<div class="detail_wrapper">
					<!-- 세부사항 -->					
					<div class="desc_wrapper">
						<div class="sneaker_option_wrapper">

							<div class="sneaker_cate">
								<label> <strong> STYLECODE </strong> </label>
								<span id="model_stylecode"><%=sdto.getModel_stylecode()%></span>
							</div>
							<div class="sneaker_cate">
								<label> <strong> COLORWAY </strong> </label>
								<span> <%=sdto.getModel_colorway() %> </span>
							</div>
							<div class="sneaker_cate">
								<label> <strong> PRICE </strong> </label>
								 
								<%if(sdto.getPrice() == 0){%> 
								<span> 미정 </span>
								<%}else{%> 
								<span> ₩ <%=formatter.format(sdto.getPrice())%> </span>
								<%}%>
								
							</div>
							<div class="sneaker_cate">
								<label> <strong> RELEASE DATE </strong> </label>
								<span> 
								<%if(sdto.getRelease_date().contains("99")){%>
									미정
								<%}else{%>
									<%=sdto.getRelease_date()%>
								<%}%>	
								</span>
							</div>
						</div>

					</div>
					
					<!-- 발매정보 추가버튼 -->
					<div class="relBtn_wrapper">
						<div class="sneaker_cate">
							<label> <strong> 발매정보: </strong> </label>
						</div>
						<!-- 추가하기 버튼 -->
						<div class="sneaker_cate">
							<button type="button" class="rel_Btn">
								<span id="rel_Btn_label"> 발매정보 추가하기 </span>
							</button>
						</div>
						<!-- 조회수 -->
						<div class="sneaker_cate" id="clickNum-wrapper">
							<span> <i class="fas fa-eye"></i>&nbsp;&nbsp;<%=formatter.format(sdto.getViews())%> views </span>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="switch-wrapper">
			정보 ON/OFF
			<label class="switch">
				<input type="checkbox" class="info_switch" name="info_switch">
				<span class="slider round"></span>
			</label>
		</div>

		<!-- 발매 정보 리스트 -->
		<div id="content_sneakerInfo">
			
			<%
				for(int z=0; z<=4; z++){
						ArrayList<OnlineDTO> new_onlineList = new ArrayList<OnlineDTO>();
						ArrayList<BrandDTO> new_brandList = new ArrayList<BrandDTO>();
						String country_name_eng = "";
						String country_name_kr = "";
						//kr
						if(z==0) { new_onlineList = onlineList_kr; new_brandList = brandList_kr; country_name_eng = "kr"; country_name_kr = "한국"; }
						//asia
						if(z==1) { new_onlineList = onlineList_asia; new_brandList = brandList_asia; country_name_eng = "asia"; country_name_kr = "아시아"; }
						//america
						if(z==2) { new_onlineList = onlineList_america; new_brandList = brandList_america; country_name_eng = "america"; country_name_kr = "북미"; }
						//europe
						if(z==3) { new_onlineList = onlineList_europe; new_brandList = brandList_europe; country_name_eng = "europe"; country_name_kr = "유럽"; }
						//etc
						if(z==4) { new_onlineList = onlineList_etc; new_brandList = brandList_etc; country_name_eng = "etc"; country_name_kr = "기타"; }
			%>
				
				<!-- 국가 발매처 -->
				<div id="grid-list">
					<h4> <%=country_name_kr%> 발매 리스트 </h4>
					<%
						if(new_onlineList.isEmpty()){
					%>
						<div id="no-info-wrapper">
							<div id="no-info-label"> 아직 온라인 발매 정보가 없습니다. </div>
						</div> 
					<% } else { 
						for(int i=0; i<new_onlineList.size(); i++) {
							OnlineDTO odto = (OnlineDTO) new_onlineList.get(i);
							BrandDTO bdto = (BrandDTO) new_brandList.get(i);
							
							String online_start_date = "";
							String online_start_time = "";
							String online_end_date = "";
							String online_end_time = "";
							
							if((odto.getOnline_start_date().isEmpty())){
								online_start_date = "0000-00-00";
							} else{
								online_start_date = odto.getOnline_start_date();
							}
							
							if((odto.getOnline_start_time().isEmpty())){
								online_start_time = "24:00";
							} else{
								online_start_time = odto.getOnline_start_time();
							}
							
							if((odto.getOnline_end_date().isEmpty())){
								online_end_date = "0000-00-00";
							} else{
								online_end_date = odto.getOnline_end_date();
							}
							
							if((odto.getOnline_end_time().isEmpty())){
								online_end_time = "24:00";
							} else{
								online_end_time = odto.getOnline_end_time();
							}
							
							//시작시간, 끝나는 시간 새로운 포맷으로 바꾸기
							// 2020-04-18 10:00
							Date original_Online_start_time = original_format.parse(online_start_date + " " + online_start_time);
							Date original_Online_end_time = original_format.parse(online_end_date + " " + online_end_time);
							// 04/18 10:00
							String new_Online_start_time = new_format.format(original_Online_start_time);
							String new_Online_end_time = new_format.format(original_Online_end_time);
							
							// 04/18/2020 10:00
							String count_Online_start_time = count_format.format(original_Online_start_time);
							String count_Online_end_time = count_format.format(original_Online_end_time);
							
							// 04/18
							String[] start_time_Arr = online_start_date.split("-");
							String[] end_time_Arr = online_end_date.split("-");
							int month_start = Integer.parseInt(start_time_Arr[1]);
							int date_start = Integer.parseInt(start_time_Arr[2]);
							int month_end = Integer.parseInt(end_time_Arr[1]);
							int date_end = Integer.parseInt(end_time_Arr[2]);
							
							String new_date_start_time = month_start + "/" + date_start;
							String new_date_end_time = month_end + "/" + date_end;
							
							int compare_w_start_result = today.compareTo(original_Online_start_time);	//응모 시작하는 시간
							int compare_w_end_result = today.compareTo(original_Online_end_time); 		//응모 끝나는 시간
					
							//앞에서 3글자 따오기
							String splitWriter = odto.getOnline_writer().substring(0, 4);
							String X = "";
							for(int j=0; j<(odto.getOnline_writer().length()-4); j++){
								X = X + "*";
							}
							String f_splitWriter = splitWriter.concat(X);
					%>
						<div class="grid-wrapper">
							<div class="grid-item" id="grid-item-<%=country_name_eng%><%=i%>">
							
								<!-- 로고 사진 -->
								<div class="grid-logo">
									<a href="<%=odto.getOnline_link()%>" target="_blank" id="onlineLink_<%=country_name_eng%><%=i%>"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto.getBrand_logo()%>" width="100" height="100"> </a>	
								</div>
								
								<!-- 발매 정보 작성자 아이콘 -->
								<div class="grid-info-writer" id="grid-info-writer-<%=country_name_eng%><%=i%>"> 작성자: <%=f_splitWriter%> </div>
								<div class="grid-info" id="grid-info-<%=country_name_eng%><%=i%>">
									<span> <i class="fas fa-user"></i> </span>
								</div>
								
								<!-- 진행중 마크 -->
								<div class="grid-ing">
									<!-- 응모 진행중 여부 -->
									<%if(odto.getOnline_method().contains("선착")){%>
											<span></span>
									<%}else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("-")){%>
										<%if(compare_w_start_result == 1 && compare_w_end_result == -1 && !odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty() && !odto.getOnline_end_date().isEmpty() && !odto.getOnline_end_time().isEmpty()){%>
											<span id="draw_count_result_ing">진행중</span>
										<!-- 시작시간이 없고 끝나는 시간만 존재하고 지금시간이 응모 끝나는 시간보다 전일때 -->
										<%}else if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty() && compare_w_end_result == -1){%>
											<span id="draw_count_result_ing">진행중</span>
										<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 후일때 -->
										<%}else if(!odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty() && odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty() && compare_w_start_result == 1){%>
											<span id="draw_count_result_ing">진행중</span>
										<%}else{ %>
											<span></span>
										<%}%>
									<%}%>
								</div>
								
								<!-- 모바일 버전 toggle down/up 버튼 -->
								<div class="mobile-toggle-down" id="mobile-toggle-Down-<%=country_name_eng%><%=i%>">
									<span> <i class="fas fa-chevron-down"></i> </span>
								</div>
								<div class="mobile-toggle-up" id="mobile-toggle-Up-<%=country_name_eng%><%=i%>">
									<span> <i class="fas fa-chevron-up"></i> </span>
								</div>
								
								<div class="detail_area" id="detail_area<%=country_name_eng%><%=i%>">
								
					
								<!-- 응모 내용 -->
								<div class="grid-content">
									<!-- 이름 & 국기-->
									<div id="wrapper-name">
										<a href="<%=odto.getOnline_link()%>" target="_blank" id="onlineLink_<%=country_name_eng%><%=i%>"> <span id="brand_name"> <%=bdto.getBrand_name()%> </span> </a>		
										<span id="span-flag"> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto.getCountry_flag()%>" width="22" height="15"> </span>
									</div>
									<!-- 기간 -->
									<div id="wrapper-period">
										<span>
											<!-- 선착일시 -->
											<%if(odto.getOnline_method().contains("선착")){%>
												<!-- 시작시간이 아직 미정일때 -->
												<%if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty()){%>
													<span> 추후공지예정 </span>
												<!-- 날짜는 존재하고 시간이 미정일때 -->
												<%}else if(!odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty()){%>
													<span class="start_time"> <%=new_date_start_time%> 시간미정 </span>
												<%}else{%>
												 	<span class="start_time"> <%=new_Online_start_time%> </span> 
												<%}%>
											<!-- 드로우 또는 미정일시 -->
											<%}else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("-")){%> 
												<!-- 시간시간에 날짜와 시간, 끝나는 시간 날짜와 시간이 모두 없을때 -->
												<%if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty() && odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty()){%>
													<span> 추후공지예정 </span>
												<!-- 시작시간이 없고 끝나는 시간만 존재할때 -->
												<%}else if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty() && !odto.getOnline_end_date().isEmpty() && !odto.getOnline_end_time().isEmpty()){%>
													<span class="end_time"> ~ <%=new_Online_end_time%> </span>
												<!-- 끝나는 시간이 없고 시작시작만 존재할때 -->
												<%}else if(odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty() && !odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty()){%>
													<span class="start_time"> <%=new_Online_start_time%> ~ </span>
												<!-- 시작시간의 날짜만 있고 시간이 없을경우 -->
												<%}else if(!odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty()){%>
													<span class="start_time"> <%=new_date_start_time%> 시간미정 </span>
												<!-- 시작시간은 없고 끝나는 시간의 시간은 없고 날짜만 존재할 경우 -->
												<%}else if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty() && !odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty()){%>
													<span class="end_time"> ~ <%=new_date_end_time%> 시간미정 </span>
												<%}else if(odto.getOnline_start_time().isEmpty() || odto.getOnline_end_time().isEmpty()) {%>
													<span> 추후공지예정 </span>
												<%}else{%>
													<span class="start_time"><%=new_Online_start_time%></span> ~ <span class="end_time"><%=new_Online_end_time%></span>
												<%}%>
											<%}%>
										</span>
									</div>
									<!-- 방식 -->
									<div class="wrapper-content">
										<div> <span> 방식 </span> </div>
										<div>
											<%if(odto.getOnline_method().contains("선착")){%> 
												<span style="color:#ff6600; font-weight: bold;"> <%=odto.getOnline_method()%> </span>
											<%}else if(odto.getOnline_method().contains("드로우")) {%>
												<span style="color:#006600; font-weight: bold;"> <%=odto.getOnline_method()%> </span> 
											<%}else if(odto.getOnline_method().contains("-")) {%>
												<span> 미정 </span>
											<%}%>
										</div>
									</div>
									<!-- 구매방식 -->
									<div class="wrapper-content">
										<div> <span> 구매방식 </span> </div>
										<div> <span> <%=odto.getBuy_method()%> </span> </div>
									</div>
									<!-- 배송여부 -->
									<div class="wrapper-content">
										<div> <span> 배송여부 </span> </div>
										<div> <span> <%=odto.getDelivery_method()%> </span> </div>
									</div>
									<!-- 응모여부 -->
									<div class="wrapper-content">
										<div> <span> 응모여부 </span> </div>
										<div>
											<!-- 온라인 방식이 '드로우'이고  로그인이 안되어있으면 -->
											<%if(odto.getOnline_method().contains("드로우") && user.equals("")){%>
												<span id="draw-status_<%=country_name_eng%><%=i%>"> <input id="drawCheckbox_<%=country_name_eng%><%=i%>" type="checkbox" class="draw_checkbox" style="width:16px; height:16px; vertical-align: middle;"> </span>
											<!-- 온라인 방식이 '드로우'이고 로그인이 되어있으면 -->
											<%}else if(odto.getOnline_method().contains("드로우") && user != null && !userDrawBrandList.contains(odto.getBrand_id())){%>
												<span id="draw-status_<%=country_name_eng%><%=i%>">
													<input type="hidden" id="<%=country_name_eng%>_model_stylecode<%=i%>" value="<%=odto.getModel_stylecode()%>">
													<input type="hidden" id="<%=country_name_eng%>_brand_id<%=i%>" value="<%=odto.getBrand_id()%>">
													<input type="hidden" id="<%=country_name_eng%>_country_name<%=i%>" value="<%=odto.getCountry_name()%>">
													<input type="checkbox" class="draw_checkbox" id="drawCheckbox_<%=country_name_eng%><%=i%>" style="width:16px; height:16px; vertical-align: middle;">
												</span>
											<!-- 온라인 방식이 '드로우'이고  응모완료 했으면 -->
											<%}else if(odto.getOnline_method().contains("드로우") && user != null && userDrawBrandList.contains(odto.getBrand_id())){%>
												<span id="draw-status_<%=country_name_eng%><%=i%>"> 
													<input type="hidden" id="<%=country_name_eng%>_model_stylecode<%=i%>" value="<%=odto.getModel_stylecode()%>">
													<input type="hidden" id="<%=country_name_eng%>_brand_id<%=i%>" value="<%=odto.getBrand_id()%>">
													<input type="hidden" id="<%=country_name_eng%>_country_name<%=i%>" value="<%=odto.getCountry_name()%>">
													<input type="checkbox" class="draw_checkbox" id="drawCheckbox_<%=country_name_eng%><%=i%>" style="width:16px; height:16px; vertical-align: middle;" checked>
												</span>
											<%}else {%>
												<span id="draw-status_<%=country_name_eng%><%=i%>"> - </span>
											<%}%>
										</div>
									</div>
								</div>
								<!-- 남은 시간 -->
								<span id="count_Online_start_time_<%=country_name_eng%><%=i%>" style="display:none;"> <%=count_Online_start_time%> </span>
								<span id="count_Online_end_time_<%=country_name_eng%><%=i%>" style="display:none;"> <%=count_Online_end_time%> </span>
								<div class="grid-time">
									<div id="remain-time">	
										<%if(odto.getOnline_method().contains("선착")){%>
										<span id="remain_time_status_<%=country_name_eng%><%=i%>"> 
											<!-- 시작 시간이 존재할때  -->
											<%if(compare_w_start_result == -1 && !odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty()) {%>
												
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>	
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>		
											
											<%}else if(compare_w_start_result == 1 && !odto.getOnline_start_date().isEmpty()) {%>
												<!-- 시작시간이 오늘보다 지났을때 -->
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 종료 </span>
												
											<%}else if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty()) {%>
												<!-- 시작 시간이 미정일때 -->
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
											<%}else {%>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
											<%} %>
										</span>
										<%}else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("-")){%>
										<span id="remain_time_status_<%=country_name_eng%><%=i%>">
											<!-- 시작 시간과 끝나는 시간이 아직 미정일때 -->
											<%if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty() && odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty()) {%>
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
											<!-- 시작 시간 또는 끝나는 시간안에 날짜는 있지만 시간이 없을때 -->
											<%}else if(odto.getOnline_start_time().isEmpty() && odto.getOnline_end_time().isEmpty()) {%>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 오늘이 시작시간 전이고 시작시간과 끝나는 시간이 모두 존재할때-->
											<%}else if(compare_w_start_result == -1 && !odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty() && !odto.getOnline_end_date().isEmpty() && !odto.getOnline_end_time().isEmpty()){%>			
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>

												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>	
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
											<!-- 시작시간과 끝나는 시간이 모두 존재하고 지금시간이 응모시간 사이일때 -->
											<%}else if(compare_w_start_result == 1 && compare_w_end_result == -1 && !odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty() && !odto.getOnline_end_date().isEmpty() && !odto.getOnline_end_time().isEmpty()){%>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
												
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>	
												
											<!-- 시작시간이 없고 끝나는 시간만 존재하고 지금시간이 응모 끝나는 시간보다 전일때 -->
											<%}else if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty() && compare_w_end_result == -1){%>
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
											<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 후일때 -->
											<%}else if(!odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty() && odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty() && compare_w_start_result == 1){%>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 전일때 -->
											<%}else if(!odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty() && odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty() && compare_w_start_result == -1) {%>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 시작시간과 끝나는 시간이 모두 존재하고 오늘이 끝나는 시간을 지났을때 -->
											<%}else if(compare_w_end_result == 1 && !odto.getOnline_end_date().isEmpty() && !odto.getOnline_end_time().isEmpty()){%>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 응모종료 </span>
												
											<%}else{%>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
												
											<%}%>
										</span>
										<%}%>
									</div>
								</div>
								
								<!-- 바로가기 버튼 -->
								<div class="grid-link">
									<a href="<%=odto.getOnline_link()%>" target="_blank" id="direct-link-<%=country_name_eng%><%=i%>" class="direct-link">
										<span> 바로가기 </span>
									</a>
								</div>
								
								<!-- 수정하기 버튼 toggle 바 -->
								<div class="grid-toggle-Down" id="grid-toggle-Down-<%=country_name_eng%><%=i%>">
									<span> <i class="fas fa-chevron-down"></i> </span>
								</div>
								
								<div class="grid-toggle-Up" id="grid-toggle-Up-<%=country_name_eng%><%=i%>">
									<span> <i class="fas fa-chevron-up"></i> </span>
								</div>
								
								<!-- 수정 버튼 -->
								<div class="grid-edit" id="grid-edit-<%=country_name_eng%><%=i%>">
									<span> <i class="fas fa-pen"></i> 수정하기 </span>
									<input type="hidden" id="modi_modelStylecode-<%=country_name_eng%><%=i%>" value="<%=odto.getModel_stylecode()%>">
									<input type="hidden" id="modi_brandId-<%=country_name_eng%><%=i%>" value="<%=odto.getBrand_id()%>">
								</div>
								
								<!-- 관리자 권한 버튼 -->
								<%if(usr_position.equals("admin")){%>
									<div id="wrapper-admin">
										<input type="button" id="adminDelBtn_<%=country_name_eng%><%=i%>" value="삭제" onclick="location.href='./DeleteDrawInfo.ad?model_stylecode=<%=odto.getModel_stylecode()%>&brand_id=<%=odto.getBrand_id()%>&model_num=<%=sdto.getNum()%>'">
									</div>
								<%}%>
							</div>
							
							</div>
						</div>
					<% 
							}
						} 
					%>
				</div>
			<%
				}
			%>
		</div>
	</div>

	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>
	
</body>
<script type="text/javascript">

	const countDownTimer = function (id, date, drawstatus_id) { 
		var _vDate = new Date(date);
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
				return; 
			} 
			var days = Math.floor(distDt / _day); 
			var hours = Math.floor((distDt % _day) / _hour); 
			var minutes = Math.floor((distDt % _hour) / _minute); 
			var seconds = Math.floor((distDt % _minute) / _second); 
			
			if(days <= 9) { days = '0' + days; }
			if(hours <= 9) { hours = '0' + hours; }
			if(minutes <= 9) { minutes = '0' + minutes; }
			if(seconds <= 9) { seconds = '0' + seconds; }
			
			if(days || hours || minutes || seconds){
				document.getElementById(id + 'days').textContent = days; 
				document.getElementById(id + 'hours').textContent = hours; 
				document.getElementById(id + 'minutes').textContent = minutes; 
				document.getElementById(id + 'seconds').textContent = seconds;
			}
		} 
		timer = setInterval(showRemaining, 1000); 
	}

	$(document).ready(function(){
		
		var model_stylecode = document.getElementById('model_stylecode').innerHTML;
		var num = $('.num').val();
		
		//정보 on/off 토클 선택했을시
		$('.info_switch').click(function(){
			if($(this).is(":checked") == true) {
				$(this).prop("checked", true);
				//toggle down 없애고 toggle up 나타내기
				$('.mobile-toggle-down').hide();
				$('.mobile-toggle-up').show();
				$('.detail_area').show();
			}else{
				$(this).prop("checked", false);
				//toggle down 없애고 toggle up 나타내기
				$('.mobile-toggle-down').show();
				$('.mobile-toggle-up').hide();
				$('.detail_area').hide();
			}
		});
		
		//발매정보 추가하기 버튼 눌렸을시
		$('.rel_Btn').click(function(){
			//로그인 체크
			if($(".login_user").val() == "") {
				var login_confirm = confirm("발매정보는 회원만 추가할 수 있습니다. \n로그인 페이지로 가시겠습니까?");
				if(login_confirm){
					location.href="./MemberLogin.me";
				}
			}
			else {
				location.href="./SearchBrand.me?model_stylecode=" + model_stylecode + "&num=" + num;
			}	
		});
		
		//발매 정보 작성자 아이콘 눌렸을시
		$('.grid-info').click(function(){
			//아이디 값 가져오기
			var gridInfoID = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = gridInfoID.split('-');
			// 제일 마지막 kr1 만 가지고 오기
			var lastElement = splitArray[splitArray.length - 1];
			
			//작성자 div 나타내기
			$('#grid-info-writer-' + lastElement).slideDown(300);
			setTimeout(function() {
				$('#grid-info-writer-' + lastElement).slideUp(300);
			}, 4000);
		});
		
		//mobile-toggle bar slideDown 했을시 해당 브랜드 상세 영역 나타내기
		$('.mobile-toggle-down').click(function(){
			//mobile-toggle-Down-kr1
			var toggleDownID = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = toggleDownID.split('-');
 			// 제일 마지막 kr1 만 가지고 오기
			var lastElement = splitArray[splitArray.length - 1];
			
			//toggle down 없애고 toggle up 나타내기
			$('#mobile-toggle-Down-' + lastElement).hide();
			$('#mobile-toggle-Up-' + lastElement).show();
			//상세영역 나타내기
			$('#detail_area' + lastElement).slideDown(300);
		});
		
		//mobile-toggle bar slideUp 했을시 해당 브랜드 상세 영역 나타내기
		$('.mobile-toggle-up').click(function(){
			//mobile-toggle-Down-kr1
			var toggleDownID = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = toggleDownID.split('-');
 			// 제일 마지막 kr1 만 가지고 오기
			var lastElement = splitArray[splitArray.length - 1];
			
			//toggle down 없애고 toggle up 나타내기
			$('#mobile-toggle-Down-' + lastElement).show();
			$('#mobile-toggle-Up-' + lastElement).hide();
			//상세영역 접기
			$('#detail_area' + lastElement).slideUp(200);
		});
	
		
		//toggle bar slideDown 했을시 해당 브랜드의 수정 아이콘 나타내기
		$('.grid-toggle-Down').click(function(){
			//grid-toggle-Down-kr1
			var toggleDownID = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = toggleDownID.split('-');
 			// 제일 마지막 kr1 만 가지고 오기
			var lastElement = splitArray[splitArray.length - 1];
 			
 			//toggle down 없애고 toggle up 나타내기
 			$('#grid-toggle-Down-' + lastElement).hide();
 			$('#grid-toggle-Up-' + lastElement).show();
 			//수정하기 영역 나타내기
 			$('#grid-edit-' + lastElement).slideDown(300);
		});
		
		//toggle bar slideUp 했을시 해당 브랜드의 수정 아이콘 나타내기
		$('.grid-toggle-Up').click(function(){
			//grid-toggle-Down-kr1
			var toggleDownID = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = toggleDownID.split('-');
 			// 제일 마지막 kr1 만 가지고 오기
			var lastElement = splitArray[splitArray.length - 1];
 			
 			//toggle down 없애고 toggle up 나타내기
 			$('#grid-toggle-Down-' + lastElement).show();
 			$('#grid-toggle-Up-' + lastElement).hide();
 			//수정하기 영역 없애기
 			$('#grid-edit-' + lastElement).slideUp(200);
		});
		
		//수정버튼을 클릭했을시 로그인 체크하기
		$(".grid-edit").on('click', function() {
			//grid-edit-kr1
			var grid_editID = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = grid_editID.split('-');
 			// 제일 마지막 kr1 만 가지고 오기
			var lastElement = splitArray[splitArray.length - 1];
			
			//로그인 체크
			if($(".login_user").val() == "") {
				var login_confirm = confirm("정보를 수정하시려면 로그인을 해야합니다. \n로그인 페이지로 가시겠습니까?");
				if(login_confirm){
					location.href="./MemberLogin.me";
				}
			}
			else {
				var model_num = $('#num').val()
				var model_stylecode = $('#modi_modelStylecode-' + lastElement).val();
				var brand_id = $('#modi_brandId-' + lastElement).val();
		
				location.href="./UpdateDrawInfo.me?model_stylecode=" + model_stylecode + "&brand_id=" + brand_id + "&num=" + model_num;
			}
		});
		
		
		//온라인 한국 리스트
		var onLineList_kr = [];
		<c:forEach items="${onlineList_kr}" var="onLineList_kr">
			onLineList_kr.push("${onLineList_kr}");
		</c:forEach>
		//onLineList_kr 리스트를 자바로부터 받아와 리스트 길이만큼 남은시간 정보 뿌려주기
		for(var i=0; i<onLineList_kr.length; i++) {		
			var count_span_start = document.getElementById("count_Online_start_time_kr"+i).innerText;
			var count_span = document.getElementById("count_Online_end_time_kr"+i).innerText;
			
			countDownTimer('final_count_Online_start_time_kr'+i, count_span_start, 'draw-status_kr'+i);
			countDownTimer('final_count_Online_end_time_kr'+i, count_span, 'draw-status_kr'+i);
			
			//남은시간란이 '응모종료'이면 해당 브랜드 줄 투명, 클릭x 바꾸기
			var remain_time_status_kr = document.getElementById('remain_time_status_kr'+i).innerText;
			if(remain_time_status_kr.match("종료") || remain_time_status_kr.match("응모종료")){
				var kr_drawRaw = $('#grid-item-kr'+i);
				kr_drawRaw.css({"opacity" : "0.2",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
				var mobile_toggle_Down_kr = $('#mobile-toggle-Down-kr' + i);
				mobile_toggle_Down_kr.css({"pointer-events" : "auto"});
				var mobile_toggle_Up_kr = $('#mobile-toggle-Up-kr' + i);
				mobile_toggle_Up_kr.css({"pointer-events" : "auto"});
				
				var grid_info_writer_kr = $('#grid-info-kr' + i);
				grid_info_writer_kr.css({"pointer-events" : "auto"});
				
				var onlineLink_kr = $('a[id=onlineLink_kr' + i + ']');
				onlineLink_kr.css({"pointer-events" : "auto"});
				
				var drawCheckbox_kr = $('#drawCheckbox_kr' + i);
				drawCheckbox_kr.css({"pointer-events" : "auto"});
				
				var directLink_kr = $('#direct-link-kr' + i);
				directLink_kr.css({"pointer-events" : "auto"});
				
				//수정파트
				var toggleDown_kr = $('#grid-toggle-Down-kr' + i);
				toggleDown_kr.css({"pointer-events" : "auto"});
				var toggleUp_kr = $('#grid-toggle-Up-kr' + i);
				toggleUp_kr.css({"pointer-events" : "auto"});
				var editBtn_kr = $('#grid-edit-kr' + i);
				editBtn_kr.css({"pointer-events" : "auto"});
				
				var adminModiBtn = $('#adminDelBtn_kr' + i);
				adminModiBtn.css({"pointer-events" : "auto"});
			}
		}
		
		//온라인 아시아 리스트
		var onLineList_asia = [];
		<c:forEach items="${onlineList_asia}" var="onLineList_asia">
			onLineList_asia.push("${onLineList_asia}");
		</c:forEach>
		//onLineList_asia 리스트를 자바로부터 받아와 리스트 길이만큼 남은시간 정보 뿌려주기
		for(var i=0; i<onLineList_asia.length; i++) {		
			var count_span_start = document.getElementById("count_Online_start_time_asia"+i).innerText;
			var count_span = document.getElementById("count_Online_end_time_asia"+i).innerText;
			
			countDownTimer('final_count_Online_start_time_asia'+i, count_span_start, 'draw-status_asia'+i);
			countDownTimer('final_count_Online_end_time_asia'+i, count_span, 'draw-status_asia'+i);
			
			//남은시간란이 '응모종료'이면 해당 브랜드 줄 투명, 클릭x 바꾸기
			var remain_time_status_asia = document.getElementById('remain_time_status_asia'+i).innerText;
			if(remain_time_status_asia.match("종료") || remain_time_status_asia.match("응모종료")){
				var asia_drawRaw = $('#grid-item-asia'+i);
				asia_drawRaw.css({"opacity" : "0.2",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
				var mobile_toggle_Down_asia = $('#mobile-toggle-Down-asia' + i);
				mobile_toggle_Down_asia.css({"pointer-events" : "auto"});
				var mobile_toggle_Up_asia = $('#mobile-toggle-Up-asia' + i);
				mobile_toggle_Up_asia.css({"pointer-events" : "auto"});
				
				var grid_info_writer_asia = $('#grid-info-asia' + i);
				grid_info_writer_asia.css({"pointer-events" : "auto"});
				
				var onlineLink_asia = $('a[id=onlineLink_asia' + i + ']');
				onlineLink_asia.css({"pointer-events" : "auto"});
				
				var drawCheckbox_asia = $('#drawCheckbox_asia' + i);
				drawCheckbox_asia.css({"pointer-events" : "auto"});
				
				var directLink_asia = $('#direct-link-asia' + i);
				directLink_asia.css({"pointer-events" : "auto"});
				
				//수정파트
				var toggleDown_asia = $('#grid-toggle-Down-asia' + i);
				toggleDown_asia.css({"pointer-events" : "auto"});
				var toggleUp_asia = $('#grid-toggle-Up-asia' + i);
				toggleUp_asia.css({"pointer-events" : "auto"});
				var editBtn_asia = $('#grid-edit-asia' + i);
				editBtn_asia.css({"pointer-events" : "auto"});
				
				var adminModiBtn = $('#adminDelBtn_asia' + i);
				adminModiBtn.css({"pointer-events" : "auto"});
			}
		}
		
		//온라인 아메리카 리스트
		var onLineList_america = [];
		<c:forEach items="${onlineList_america}" var="onLineList_america">
			onLineList_america.push("${onLineList_america}");
		</c:forEach>
		//onLineList_america 리스트를 자바로부터 받아와 리스트 길이만큼 남은시간 정보 뿌려주기
		for(var i=0; i<onLineList_america.length; i++) {
			var count_span_start = document.getElementById("count_Online_start_time_america"+i).innerText;
			var count_span = document.getElementById("count_Online_end_time_america"+i).innerText;
			
			countDownTimer('final_count_Online_start_time_america'+i, count_span_start, 'draw-status_america'+i);
			countDownTimer('final_count_Online_end_time_america'+i, count_span, 'draw-status_america'+i);
			
			//남은시간란이 '응모종료'이면 해당 브랜드 줄 투명, 클릭x 바꾸기
			var remain_time_status_america = document.getElementById('remain_time_status_america'+i).innerText;
			if(remain_time_status_america.match("종료") || remain_time_status_america.match("응모종료")){
				var america_drawRaw = $('#grid-item-america'+i);
				america_drawRaw.css({"opacity" : "0.2",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
				var mobile_toggle_Down_america = $('#mobile-toggle-Down-america' + i);
				mobile_toggle_Down_america.css({"pointer-events" : "auto"});
				var mobile_toggle_Up_america = $('#mobile-toggle-Up-america' + i);
				mobile_toggle_Up_america.css({"pointer-events" : "auto"});
				
				var grid_info_writer_america = $('#grid-info-america' + i);
				grid_info_writer_america.css({"pointer-events" : "auto"});
				
				var onlineLink_america = $('a[id=onlineLink_america' + i + ']');
				onlineLink_america.css({"pointer-events" : "auto"});
				
				var drawCheckbox_america = $('#drawCheckbox_america' + i);
				drawCheckbox_america.css({"pointer-events" : "auto"});
				
				var directLink_america = $('#direct-link-america' + i);
				directLink_america.css({"pointer-events" : "auto"});
				
				//수정파트
				var toggleDown_america = $('#grid-toggle-Down-america' + i);
				toggleDown_america.css({"pointer-events" : "auto"});
				var toggleUp_america = $('#grid-toggle-Up-america' + i);
				toggleUp_america.css({"pointer-events" : "auto"});
				var editBtn_america = $('#grid-edit-america' + i);
				editBtn_america.css({"pointer-events" : "auto"});
				
				var adminModiBtn = $('#adminDelBtn_america' + i);
				adminModiBtn.css({"pointer-events" : "auto"});
			}
		}
		
		//온라인 유럽 리스트
		var onLineList_europe = [];
		<c:forEach items="${onlineList_europe}" var="onLineList_europe">
			onLineList_europe.push("${onLineList_europe}");
		</c:forEach>
		//onLineList_europe 리스트를 자바로부터 받아와 리스트 길이만큼 남은시간 정보 뿌려주기
		for(var i=0; i<onLineList_europe.length; i++) {		
			var count_span_start = document.getElementById("count_Online_start_time_europe"+i).innerText;
			var count_span = document.getElementById("count_Online_end_time_europe"+i).innerText;
			
			countDownTimer('final_count_Online_start_time_europe'+i, count_span_start, 'draw-status_europe'+i);
			countDownTimer('final_count_Online_end_time_europe'+i, count_span, 'draw-status_europe'+i);
			
			//남은시간란이 '응모종료'이면 해당 브랜드 줄 투명, 클릭x 바꾸기
			var remain_time_status_europe = document.getElementById('remain_time_status_europe'+i).innerText;
			//alert(remain_time_status_europe);
			if(remain_time_status_europe.match("종료") || remain_time_status_europe.match("응모종료")){
				var europe_drawRaw = $('#grid-item-europe'+i);
				europe_drawRaw.css({"opacity" : "0.2",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
				var mobile_toggle_Down_europe = $('#mobile-toggle-Down-europe' + i);
				mobile_toggle_Down_europe.css({"pointer-events" : "auto"});
				var mobile_toggle_Up_europe = $('#mobile-toggle-Up-europe' + i);
				mobile_toggle_Up_europe.css({"pointer-events" : "auto"});
				
				var grid_info_writer_europe = $('#grid-info-europe' + i);
				grid_info_writer_europe.css({"pointer-events" : "auto"});
				
				var onlineLink_europe = $('a[id=onlineLink_europe' + i + ']');
				onlineLink_europe.css({"pointer-events" : "auto"});
				
				var drawCheckbox_europe = $('#drawCheckbox_europe' + i);
				drawCheckbox_europe.css({"pointer-events" : "auto"});
				
				var directLink_europe = $('#direct-link-europe' + i);
				directLink_europe.css({"pointer-events" : "auto"});
				
				//수정파트
				var toggleDown_europe = $('#grid-toggle-Down-europe' + i);
				toggleDown_europe.css({"pointer-events" : "auto"});
				var toggleUp_europe = $('#grid-toggle-Up-europe' + i);
				toggleUp_europe.css({"pointer-events" : "auto"});
				var editBtn_europe = $('#grid-edit-europe' + i);
				editBtn_europe.css({"pointer-events" : "auto"});
				
				var adminModiBtn = $('#adminDelBtn_europe' + i);
				adminModiBtn.css({"pointer-events" : "auto"});
			}
		}
		
		//온라인 기타지역 리스트
		var onLineList_etc = [];
		<c:forEach items="${onlineList_etc}" var="onLineList_etc">
			onLineList_etc.push("${onLineList_etc}");
		</c:forEach>
		//onLineList_etc 리스트를 자바로부터 받아와 리스트 길이만큼 남은시간 정보 뿌려주기
		for(var i=0; i<onLineList_etc.length; i++) {		
			var count_span_start = document.getElementById("count_Online_start_time_etc"+i).innerText;
			var count_span = document.getElementById("count_Online_end_time_etc"+i).innerText;
			
			countDownTimer('final_count_Online_start_time_etc'+i, count_span_start, 'draw-status_etc'+i);
			countDownTimer('final_count_Online_end_time_etc'+i, count_span, 'draw-status_etc'+i);
			
			//남은시간란이 '응모종료'이면 해당 브랜드 줄 투명, 클릭x 바꾸기
			var remain_time_status_etc = document.getElementById('remain_time_status_etc'+i).innerText;
			if(remain_time_status_etc.match("종료") || remain_time_status_etc.match("응모종료")){
				var etc_drawRaw = $('#grid-item-etc'+i);
				etc_drawRaw.css({"opacity" : "0.2",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
				var mobile_toggle_Down_etc = $('#mobile-toggle-Down-etc' + i);
				mobile_toggle_Down_etc.css({"pointer-events" : "auto"});
				var mobile_toggle_Up_etc = $('#mobile-toggle-Up-etc' + i);
				mobile_toggle_Up_etc.css({"pointer-events" : "auto"});
				
				var grid_info_writer_etc = $('#grid-info-etc' + i);
				grid_info_writer_etc.css({"pointer-events" : "auto"});
				
				var onlineLink_etc = $('a[id=onlineLink_etc' + i + ']');
				onlineLink_etc.css({"pointer-events" : "auto"});
				
				var drawCheckbox_etc = $('#drawCheckbox_etc' + i);
				drawCheckbox_etc.css({"pointer-events" : "auto"});
				
				var directLink_etc = $('#direct-link-etc' + i);
				directLink_etc.css({"pointer-events" : "auto"});
				
				//수정파트
				var toggleDown_etc = $('#grid-toggle-Down-etc' + i);
				toggleDown_etc.css({"pointer-events" : "auto"});
				var toggleUp_etc = $('#grid-toggle-Up-etc' + i);
				toggleUp_etc.css({"pointer-events" : "auto"});
				var editBtn_etc = $('#grid-edit-etc' + i);
				editBtn_etc.css({"pointer-events" : "auto"});
				
				var adminModiBtn = $('#adminDelBtn_etc' + i);
				adminModiBtn.css({"pointer-events" : "auto"});
			}
		}

		
		// 응모 여부 체크박스 클릭했을시 -----------------------------------------------
		$(".draw_checkbox").on('click', function() {
			
			//로그인 체크
			if($(".login_user").val() == "") {
				var login_confirm = confirm("응모여부를 체크하시려면 로그인을 해야합니다. \n로그인 페이지로 가시겠습니까?");
				if(login_confirm){
					location.href="./MemberLogin.me";
					$(this).prop("checked", false);
				}else {
					$(this).prop("checked", false);
				}
			}
			else {
				//drawCheckbox_kr + i
				var checkbox_id = $(this).attr("id");
				//i
				var checkbox_id_num = checkbox_id.replace(/[^0-9]/g,'');
				//kr3
				var idx = checkbox_id.indexOf("_");
				var checkbox_id_country_num = checkbox_id.substring(idx+1);
				//kr
				var checkbox_country = checkbox_id_country_num.replace(/[0-9]/g,'');
				
				var num = $('.num').val();
				
				if($(this).is(":checked")==true){
					//체크가 안된 상태에서 응모여부 물어보기
					$(this).prop("checked", false);
					var draw_confirm_yes = confirm("해당 사이트를 응모 하셨습니까?");
				   	if(draw_confirm_yes){
				   		$.ajax({
				   			type:'get',
				   			url:'./addUserDrawInfoAction.me',
				   			data: 'model_num=' + num + '&model_stylecode='+$('#'+checkbox_country +'_model_stylecode'+checkbox_id_num).val()+'&brand_id='+$('#'+checkbox_country +'_brand_id'+checkbox_id_num).val()+'&country_name='+$('#'+checkbox_country +'_country_name'+checkbox_id_num).val(),
				   			dataType: 'html',
				   			success:function(data) {
// 				   				alert("해당 사이트를 나의 페이지에 저장하였습니다.");	
				   			},error:function(request,status,error){
							 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
							}
				   		});
				   		$(this).prop("checked", true);
				   		$(this).css({'color':'green', 'font-size':16});
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
				   			data: 'model_num=' + num + '&model_stylecode='+$('#'+checkbox_country +'_model_stylecode'+checkbox_id_num).val()+'&brand_id='+$('#'+checkbox_country +'_brand_id'+checkbox_id_num).val()+'&country_name='+$('#'+checkbox_country +'_country_name'+checkbox_id_num).val(),
				   			dataType: 'html',
				   			success:function(data) {
// 				   				alert("응모여부를 취소하였습니다.");
				   			},error:function(request,status,error){
							 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
							}
				   		});
				   		$(this).prop("checked", false);	
				   	}else {
				   		$(this).prop("checked", true);
				   	}
				}
			}

			
		});
		
	});
	
	

</script>
</html>