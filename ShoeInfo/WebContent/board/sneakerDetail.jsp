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

	<!-- Main Content -->
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
	
		//브랜드 정보 리스트
		
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
		
// 		SimpleDateFormat new_format = new SimpleDateFormat("M/d a h:mm");
		SimpleDateFormat new_format = new SimpleDateFormat("M/d HH:mm");
		SimpleDateFormat count_format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
		
		DecimalFormat formatter = new DecimalFormat("#,###,###");
		
		// 오늘 날짜
		Date currentTime = new Date();
		String current = original_format.format(currentTime);
		Date today = original_format.parse(current);
	%>
	<input type="hidden" class="login_user" value="<%=user%>">
	
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
				<a href="./UpdateSneakerInfo.ad?model_stylecode=<%=sdto.getModel_stylecode()%>"><input type="button" value="기본정보 수정하기" style="float: right;"></a>
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
								<span> 발매정보 추가하기 </span>
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
		
		
			<%	//관리자 권한일때 제품 발매정보 추가하는 페이지로 가는 버튼
				if(usr_position.equals("admin")){
			%>
				<a href="./searchBrand.ad?model_stylecode=<%=sdto.getModel_stylecode()%>"><input type="button" value="제품 발매 정보 추가하기"></a>
			<%}%>
			
			<!-- 발매 정보 리스트 -->
			<div id="content_sneakerInfo">
				
				<!-- 한국 발매처 -->
				<div id="grid-list">
					<h4> 한국 발매 리스트 </h4>
					<%
						if(onlineList_kr.isEmpty()){
					%>
						<div id="no-info-wrapper">
							<div id="no-info-label"> 아직 온라인 발매 정보가 없습니다. </div>
						</div> 
					<% } else { 
						for(int i=0; i<onlineList_kr.size(); i++) {
							OnlineDTO odto_kr = (OnlineDTO) onlineList_kr.get(i);
							BrandDTO bdto_kr = (BrandDTO) brandList_kr.get(i);
							
							String online_start_date = "";
							String online_start_time = "";
							String online_end_date = "";
							String online_end_time = "";
							
							if((odto_kr.getOnline_start_date().isEmpty())){
								online_start_date = "0000-00-00";
							} else{
								online_start_date = odto_kr.getOnline_start_date();
							}
							
							if((odto_kr.getOnline_start_time().isEmpty())){
								online_start_time = "24:00";
							} else{
								online_start_time = odto_kr.getOnline_start_time();
							}
							
							if((odto_kr.getOnline_end_date().isEmpty())){
								online_end_date = "0000-00-00";
							} else{
								online_end_date = odto_kr.getOnline_end_date();
							}
							
							if((odto_kr.getOnline_end_time().isEmpty())){
								online_end_time = "24:00";
							} else{
								online_end_time = odto_kr.getOnline_end_time();
							}
							
							//시작시간, 끝나는 시간 새로운 포맷으로 바꾸기
							// 2020-04-18 10:00
							Date original_Online_start_time_kr = original_format.parse(online_start_date + " " + online_start_time);
							Date original_Online_end_time_kr = original_format.parse(online_end_date + " " + online_end_time);
							// 04/18 10:00
							String new_Online_start_time_kr = new_format.format(original_Online_start_time_kr);
							String new_Online_end_time_kr = new_format.format(original_Online_end_time_kr);
							
							// 04/18/2020 10:00
							String count_Online_start_time_kr = count_format.format(original_Online_start_time_kr);
							String count_Online_end_time_kr = count_format.format(original_Online_end_time_kr);
							
							// 04/18
							String[] start_time_Arr = online_start_date.split("-");
							String[] end_time_Arr = online_end_date.split("-");
							int month_start = Integer.parseInt(start_time_Arr[1]);
							int date_start = Integer.parseInt(start_time_Arr[2]);
							int month_end = Integer.parseInt(end_time_Arr[1]);
							int date_end = Integer.parseInt(end_time_Arr[2]);
							
							String new_date_start_time_kr = month_start + "/" + date_start;
							String new_date_end_time_kr = month_end + "/" + date_end;
							
							int compare_w_start_result_kr = today.compareTo(original_Online_start_time_kr);		//응모 시작하는 시간
							int compare_w_end_result_kr = today.compareTo(original_Online_end_time_kr); 		//응모 끝나는 시간
					
							//앞에서 3글자 따오기
							String splitWriter = odto_kr.getOnline_writer().substring(0, 4);
							String X = "";
							for(int j=0; j<(odto_kr.getOnline_writer().length()-4); j++){
								X = X + "*";
							}
							String f_splitWriter = splitWriter.concat(X);
					%>
						<div class="grid-wrapper">
							<div class="grid-item" id="grid-item-kr<%=i%>">
								<!-- 진행중 마크 -->
								<div class="grid-ing">
									<!-- 응모 진행중 여부 -->
									<%if(odto_kr.getOnline_method().contains("선착")){%>
											<span></span>
									<%}else if(odto_kr.getOnline_method().contains("드로우") || odto_kr.getOnline_method().contains("-")){%>
										<%if(compare_w_start_result_kr == 1 && compare_w_end_result_kr == -1 && !odto_kr.getOnline_start_date().isEmpty() && !odto_kr.getOnline_start_time().isEmpty() && !odto_kr.getOnline_end_date().isEmpty() && !odto_kr.getOnline_end_time().isEmpty()){%>
											<span id="draw_count_result_ing">진행중</span>
										<!-- 시작시간이 없고 끝나는 시간만 존재하고 지금시간이 응모 끝나는 시간보다 전일때 -->
										<%}else if(odto_kr.getOnline_start_date().isEmpty() && odto_kr.getOnline_start_time().isEmpty() && compare_w_end_result_kr == -1){%>
											<span id="draw_count_result_ing">진행중</span>
										<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 후일때 -->
										<%}else if(!odto_kr.getOnline_start_date().isEmpty() && !odto_kr.getOnline_start_time().isEmpty() && odto_kr.getOnline_end_date().isEmpty() && odto_kr.getOnline_end_time().isEmpty() && compare_w_start_result_kr == 1){%>
											<span id="draw_count_result_ing">진행중</span>
										<%}else{ %>
											<span></span>
										<%}%>
									<%}%>
								</div>
								
								<!-- 로고 사진 -->
								<div class="grid-logo">
									<a href="<%=odto_kr.getOnline_link()%>" target="_blank" id="onlineLink_kr<%=i%>"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_kr.getBrand_logo()%>" width="100" height="100"> </a>	
								</div>
								
								<!-- 수정 버튼 -->
<%-- 								<div class="grid-edit" id="grid-edit-kr<%=i%>"> --%>
<!-- 									<span> <i class="fas fa-pen"></i> </span> -->
<!-- 								</div> -->
								
								<!-- 발매 정보 작성자 아이콘 -->
								<div class="grid-info-writer" id="grid-info-writer-kr<%=i%>"> 작성자: <%=f_splitWriter%> </div>
								<div class="grid-info" id="grid-info-kr<%=i%>">
									<span> <i class="fas fa-user"></i> </span>
								</div>
								
								<!-- 응모 내용 -->
								<div class="grid-content">
									<!-- 이름 & 국기-->
									<div id="wrapper-name">
										<a href="<%=odto_kr.getOnline_link()%>" target="_blank" id="onlineLink_kr<%=i%>"> <span id="brand_name"> <%=bdto_kr.getBrand_name()%> </span> </a>
										<span id="span-flag"> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto_kr.getCountry_flag()%>" width="22" height="15"> </span>
									</div>
									<!-- 기간 -->
									<div id="wrapper-period">
										<span>
											<!-- 선착일시 -->
											<%if(odto_kr.getOnline_method().contains("선착")){%>
												<!-- 시작시간이 아직 미정일때 -->
												<%if(odto_kr.getOnline_start_date().isEmpty() && odto_kr.getOnline_start_time().isEmpty()){%>
													<span> 추후공지예정 </span>
												<!-- 날짜는 존재하고 시간이 미정일때 -->
												<%}else if(!odto_kr.getOnline_start_date().isEmpty() && odto_kr.getOnline_start_time().isEmpty()){%>
													<%=new_date_start_time_kr%> 시간미정
												<%}else{%>
												 	<%=new_Online_start_time_kr%> 
												<%}%>
											<!-- 드로우 또는 미정일시 -->
											<%}else if(odto_kr.getOnline_method().contains("드로우") || odto_kr.getOnline_method().contains("-")){%> 
												<!-- 시간시간에 날짜와 시간, 끝나는 시간 날짜와 시간이 모두 없을때 -->
												<%if(odto_kr.getOnline_start_date().isEmpty() && odto_kr.getOnline_start_time().isEmpty() && odto_kr.getOnline_end_date().isEmpty() && odto_kr.getOnline_end_time().isEmpty()){%>
													<span> 추후공지예정 </span>
												<!-- 시작시간이 없고 끝나는 시간만 존재할때 -->
												<%}else if(odto_kr.getOnline_start_date().isEmpty() && odto_kr.getOnline_start_time().isEmpty() && !odto_kr.getOnline_end_date().isEmpty() && !odto_kr.getOnline_end_time().isEmpty()){%>
													~ <%=new_Online_end_time_kr%>
												<!-- 끝나는 시간이 없고 시작시작만 존재할때 -->
												<%}else if(odto_kr.getOnline_end_date().isEmpty() && odto_kr.getOnline_end_time().isEmpty() && !odto_kr.getOnline_start_date().isEmpty() && !odto_kr.getOnline_start_time().isEmpty()){%>
													<%=new_Online_start_time_kr%> ~
												<!-- 시작시간의 날짜만 있고 시간이 없을경우 -->
												<%}else if(!odto_kr.getOnline_start_date().isEmpty() && odto_kr.getOnline_start_time().isEmpty()){%>
													<%=new_date_start_time_kr%> 시간미정
												<!-- 시작시간은 없고 끝나는 시간의 시간은 없고 날짜만 존재할 경우 -->
												<%}else if(odto_kr.getOnline_start_date().isEmpty() && odto_kr.getOnline_start_time().isEmpty() && !odto_kr.getOnline_end_date().isEmpty() && odto_kr.getOnline_end_time().isEmpty()){%>
													~ <%=new_date_end_time_kr%> 시간미정
												<%}else if(odto_kr.getOnline_start_time().isEmpty() || odto_kr.getOnline_end_time().isEmpty()) {%>
													<span> 추후공지예정 </span>
												<%}else{%>
													<span class="start_time"><%=new_Online_start_time_kr%></span> ~ <%=new_Online_end_time_kr%>
												<%}%>
											<%}%>
										</span>
									</div>
									<!-- 방식 -->
									<div id="wrapper-method">
										<span> 방식 </span>
										<span id="wrapper-content">
											<%if(odto_kr.getOnline_method().contains("선착")){%> 
												<span style="color:#ff6600; font-weight: bold;"> <%=odto_kr.getOnline_method()%> </span>
											<%}else if(odto_kr.getOnline_method().contains("드로우")) {%>
												<span style="color:#006600; font-weight: bold;"> <%=odto_kr.getOnline_method()%> </span> 
											<%}else if(odto_kr.getOnline_method().contains("-")) {%>
												<span> 미정 </span>
											<%}%>
										</span>
									</div>
									<!-- 구매방식 -->
									<div id="wrapper-bmethod">
										<span> 구매방식 </span>
										<span id="wrapper-content">
											<span> <%=odto_kr.getBuy_method()%> </span>
										</span>
									</div>
									<!-- 직배여부 -->
									<div id="wrapper-ship">
										<span> 직배여부 </span>
										<span id="wrapper-content">
											<span> <%=odto_kr.getDelivery_method()%> </span>
										</span>
									</div>
									<!-- 응모여부 -->
									<div id="wrapper-check">
										<span> 응모여부 </span>
										<span id="wrapper-content">
											<!-- 온라인 방식이 '드로우'이고  로그인이 안되어있으면 -->
											<%if(odto_kr.getOnline_method().contains("드로우") && user.equals("")){%>
												<span id="draw-status_kr<%=i%>"> <input id="drawCheckbox_kr<%=i%>" type="checkbox" style="width:16px; height:16px; vertical-align: middle;"> </span>
											<!-- 온라인 방식이 '드로우'이고 로그인이 되어있으면 -->
											<%}else if(odto_kr.getOnline_method().contains("드로우") && user != null && !userDrawBrandList.contains(odto_kr.getBrand_id())){%>
												<span id="draw-status_kr<%=i%>"> 
													<input type="hidden" id="kr_model_stylecode<%=i%>" value="<%=odto_kr.getModel_stylecode()%>">
													<input type="hidden" id="kr_brand_id<%=i%>" value="<%=odto_kr.getBrand_id()%>">
													<input type="hidden" id="kr_country_name<%=i%>" value="<%=odto_kr.getCountry_name()%>">
													<input type="checkbox" id="drawCheckbox_kr<%=i%>" style="width:16px; height:16px; vertical-align: middle;">
												</span>
											<!-- 온라인 방식이 '드로우'이고  응모완료 했으면 -->
											<%}else if(odto_kr.getOnline_method().contains("드로우") && user != null && userDrawBrandList.contains(odto_kr.getBrand_id())){%>
												<span id="draw-status_kr<%=i%>"> 
													<input type="hidden" id="kr_model_stylecode<%=i%>" value="<%=odto_kr.getModel_stylecode()%>">
													<input type="hidden" id="kr_brand_id<%=i%>" value="<%=odto_kr.getBrand_id()%>">
													<input type="hidden" id="kr_country_name<%=i%>" value="<%=odto_kr.getCountry_name()%>">
													<input type="checkbox" id="drawCheckbox_kr<%=i%>" style="width:16px; height:16px; vertical-align: middle;" checked>
												</span>
											<%}else {%>
												<span id="draw-status_kr<%=i%>"> - </span>
											<%}%>
										</span>
									</div>
								</div>
								<!-- 남은 시간 -->
								<span id="count_Online_start_time_kr<%=i%>" style="display:none;"> <%=count_Online_start_time_kr%> </span>
								<span id="count_Online_end_time_kr<%=i%>" style="display:none;"> <%=count_Online_end_time_kr%> </span>
								<div class="grid-time">
									<div id="remain-time">	
										<%if(odto_kr.getOnline_method().contains("선착")){%>
										<span id="remain_time_status_kr<%=i%>"> 
											
											<%if(compare_w_start_result_kr == -1 && !odto_kr.getOnline_start_date().isEmpty()) {%>
												<!-- 시작 시간이 존재할때  -->
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_kr<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_kr<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_kr<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>	
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_kr<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
												
											
											<%}else if(compare_w_start_result_kr == 1 && !odto_kr.getOnline_start_date().isEmpty()) {%>
												<!-- 시작시간이 오늘보다 지났을때 -->
												<span id="final_count_Online_start_time_kr<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 종료 </span>
												
											<%}else if(odto_kr.getOnline_start_date().isEmpty() && odto_kr.getOnline_start_time().isEmpty()) {%>
												<!-- 시작 시간이 미정일때 -->
												<span id="final_count_Online_start_time_kr<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
											<%}else {%>
												<span id="final_count_Online_start_time_kr<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
											<%} %>
										</span>
										<%}else if(odto_kr.getOnline_method().contains("드로우") || odto_kr.getOnline_method().contains("-")){%>
										<span id="remain_time_status_kr<%=i%>">
											<!-- 시작 시간과 끝나는 시간이 아직 미정일때 -->
											<%if(odto_kr.getOnline_start_date().isEmpty() && odto_kr.getOnline_start_time().isEmpty() && odto_kr.getOnline_end_date().isEmpty() && odto_kr.getOnline_end_time().isEmpty()) {%>
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
											<!-- 시작 시간 또는 끝나는 시간안에 날짜는 있지만 시간이 없을때 -->
											<%}else if(odto_kr.getOnline_start_time().isEmpty() && odto_kr.getOnline_end_time().isEmpty()) {%>
												<span id="final_count_Online_start_time_kr<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_kr<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_kr<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_kr<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_kr<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 오늘이 시작시간 전이고 시작시간과 끝나는 시간이 모두 존재할때-->
											<%}else if(compare_w_start_result_kr == -1 && !odto_kr.getOnline_start_date().isEmpty() && !odto_kr.getOnline_start_time().isEmpty() && !odto_kr.getOnline_end_date().isEmpty() && !odto_kr.getOnline_end_time().isEmpty()){%>			
												<span id="final_count_Online_start_time_kr<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>seconds" style="display:none;"></span>

												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_kr<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_kr<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_kr<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>	
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_kr<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
											<!-- 시작시간과 끝나는 시간이 모두 존재하고 지금시간이 응모시간 사이일때 -->
											<%}else if(compare_w_start_result_kr == 1 && compare_w_end_result_kr == -1 && !odto_kr.getOnline_start_date().isEmpty() && !odto_kr.getOnline_start_time().isEmpty() && !odto_kr.getOnline_end_date().isEmpty() && !odto_kr.getOnline_end_time().isEmpty()){%>
												<span id="final_count_Online_start_time_kr<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>seconds" style="display:none;"></span>
												
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_kr<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_kr<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_kr<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_kr<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>	
												
											<!-- 시작시간이 없고 끝나는 시간만 존재하고 지금시간이 응모 끝나는 시간보다 전일때 -->
											<%}else if(odto_kr.getOnline_start_date().isEmpty() && odto_kr.getOnline_start_time().isEmpty() && compare_w_end_result_kr == -1){%>
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_kr<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_kr<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_kr<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_kr<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
											<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 후일때 -->
											<%}else if(!odto_kr.getOnline_start_date().isEmpty() && !odto_kr.getOnline_start_time().isEmpty() && odto_kr.getOnline_end_date().isEmpty() && odto_kr.getOnline_end_time().isEmpty() && compare_w_start_result_kr == 1){%>
												<span id="final_count_Online_start_time_kr<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 전일때 -->
											<%}else if(!odto_kr.getOnline_start_date().isEmpty() && !odto_kr.getOnline_start_time().isEmpty() && odto_kr.getOnline_end_date().isEmpty() && odto_kr.getOnline_end_time().isEmpty() && compare_w_start_result_kr == -1) {%>
												<span id="final_count_Online_start_time_kr<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 시작시간과 끝나는 시간이 모두 존재하고 오늘이 끝나는 시간을 지났을때 -->
											<%}else if(compare_w_end_result_kr == 1 && !odto_kr.getOnline_end_date().isEmpty() && !odto_kr.getOnline_end_time().isEmpty()){%>
												<span id="final_count_Online_start_time_kr<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_kr<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_kr<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_kr<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_kr<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 응모종료 </span>
												
											<%}else{%>
												<span id="final_count_Online_start_time_kr<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_kr<%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_kr<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_kr<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_kr<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_kr<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
												
											<%}%>
										</span>
										<%}%>
									</div>
								</div>
								
								<!-- 바로가기 버튼 -->
								<div class="grid-link">
									<a href="<%=odto_kr.getOnline_link()%>" target="_blank" id="direct-link-kr<%=i%>" class="direct-link">
										<span>  바로가기 </span>
									</a>
								</div>
								
								<!-- 관리자 권한 버튼 -->
								<%if(usr_position.equals("admin")){%>
									<div id="wrapper-admin">
										<input type="button" id="adminModiBtn_kr<%=i%>" value="수정" onclick="location.href='./UpdateDrawInfo.ad?model_stylecode=<%=odto_kr.getModel_stylecode()%>&brand_id=<%=odto_kr.getBrand_id()%>'"> 
										<input type="button" id="adminDelBtn_kr<%=i%>" value="삭제" onclick="location.href='./DeleteDrawInfo.ad?model_stylecode=<%=odto_kr.getModel_stylecode()%>&brand_id=<%=odto_kr.getBrand_id()%>'">
									</div>
								<%}%>
							</div>
						</div>
					<% 
							}
						} 
					%>
				</div>

				<!-- 아시아 발매처 -->
				<div id="grid-list">
					<h4> 아시아 발매 리스트 </h4>
					<%
						if(onlineList_asia.isEmpty()){
					%>
						<div id="no-info-wrapper">
							<div id="no-info-label"> 아직 온라인 발매 정보가 없습니다. </div>
						</div> 
					<% } else { 
						for(int i=0; i<onlineList_asia.size(); i++) {
							OnlineDTO odto_asia = (OnlineDTO) onlineList_asia.get(i);
							BrandDTO bdto_asia = (BrandDTO) brandList_asia.get(i);
							
							String online_start_date = "";
							String online_start_time = "";
							String online_end_date = "";
							String online_end_time = "";
							
							if((odto_asia.getOnline_start_date().isEmpty())){
								online_start_date = "0000-00-00";
							} else{
								online_start_date = odto_asia.getOnline_start_date();
							}
							
							if((odto_asia.getOnline_start_time().isEmpty())){
								online_start_time = "24:00";
							} else{
								online_start_time = odto_asia.getOnline_start_time();
							}
							
							if((odto_asia.getOnline_end_date().isEmpty())){
								online_end_date = "0000-00-00";
							} else{
								online_end_date = odto_asia.getOnline_end_date();
							}
							
							if((odto_asia.getOnline_end_time().isEmpty())){
								online_end_time = "24:00";
							} else{
								online_end_time = odto_asia.getOnline_end_time();
							}
							
							//시작시간, 끝나는 시간 새로운 포맷으로 바꾸기
							// 2020-04-18 10:00
							Date original_Online_start_time_asia = original_format.parse(online_start_date + " " + online_start_time);
							Date original_Online_end_time_asia = original_format.parse(online_end_date + " " + online_end_time);
							// 04/18 10:00
							String new_Online_start_time_asia = new_format.format(original_Online_start_time_asia);
							String new_Online_end_time_asia = new_format.format(original_Online_end_time_asia);
							
							// 04/18/2020 10:00
							String count_Online_start_time_asia = count_format.format(original_Online_start_time_asia);
							String count_Online_end_time_asia = count_format.format(original_Online_end_time_asia);
							
							// 04/18
							String[] start_time_Arr = online_start_date.split("-");
							String[] end_time_Arr = online_end_date.split("-");
							int month_start = Integer.parseInt(start_time_Arr[1]);
							int date_start = Integer.parseInt(start_time_Arr[2]);
							int month_end = Integer.parseInt(end_time_Arr[1]);
							int date_end = Integer.parseInt(end_time_Arr[2]);
							
							String new_date_start_time_asia = month_start + "/" + date_start;
							String new_date_end_time_asia = month_end + "/" + date_end;
							
							int compare_w_start_result_asia = today.compareTo(original_Online_start_time_asia);		//응모 시작하는 시간
							int compare_w_end_result_asia = today.compareTo(original_Online_end_time_asia); 		//응모 끝나는 시간
					%>
						<div class="grid-wrapper">
							<div class="grid-item" id="grid-item-asia<%=i%>">
								<!-- 진행중 마크 -->
								<div class="grid-ing">
									<!-- 응모 진행중 여부 -->
									<%if(odto_asia.getOnline_method().contains("선착")){%>
											<span></span>
									<%}else if(odto_asia.getOnline_method().contains("드로우") || odto_asia.getOnline_method().contains("-")){%>
										<%if(compare_w_start_result_asia == 1 && compare_w_end_result_asia == -1 && !odto_asia.getOnline_start_date().isEmpty() && !odto_asia.getOnline_start_time().isEmpty() && !odto_asia.getOnline_end_date().isEmpty() && !odto_asia.getOnline_end_time().isEmpty()){%>
											<span id="draw_count_result_ing">진행중</span>
										<!-- 시작시간이 없고 끝나는 시간만 존재하고 지금시간이 응모 끝나는 시간보다 전일때 -->
										<%}else if(odto_asia.getOnline_start_date().isEmpty() && odto_asia.getOnline_start_time().isEmpty() && compare_w_end_result_asia == -1){%>
											<span id="draw_count_result_ing">진행중</span>
										<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 후일때 -->
										<%}else if(!odto_asia.getOnline_start_date().isEmpty() && !odto_asia.getOnline_start_time().isEmpty() && odto_asia.getOnline_end_date().isEmpty() && odto_asia.getOnline_end_time().isEmpty() && compare_w_start_result_asia == 1){%>
											<span id="draw_count_result_ing">진행중</span>
										<%}else{ %>
											<span></span>
										<%}%>
									<%}%>
								</div>
								
								<!-- 로고 사진 -->
								<div class="grid-logo">
									<a href="<%=odto_asia.getOnline_link()%>" target="_blank" id="onlineLink_asia<%=i%>"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_asia.getBrand_logo()%>" width="100" height="100"> </a>	
								</div>
								
								<!-- 수정 버튼 -->
<%-- 								<div class="grid-edit" id="grid-edit-asia<%=i%>"> --%>
<!-- 									<span> <i class="fas fa-pen"></i> </span> -->
<!-- 								</div> -->
								
								<!-- 발매 정보 작성자 아이콘 -->
								<div class="grid-info">
									<span> <i class="fas fa-user"></i> </span>
								</div>
								
								<!-- 응모 내용 -->
								<div class="grid-content">
									<!-- 이름 & 국기-->
									<div id="wrapper-name">
										<a href="<%=odto_asia.getOnline_link()%>" target="_blank" id="onlineLink_asia<%=i%>"> <span id="brand_name"> <%=bdto_asia.getBrand_name()%> </span> </a>
										<span id="span-flag"> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto_asia.getCountry_flag()%>" width="22" height="15"> </span>
									</div>
									<!-- 기간 -->
									<div id="wrapper-period">
										<span>
											<!-- 선착일시 -->
											<%if(odto_asia.getOnline_method().contains("선착")){%>
												<!-- 시작시간이 아직 미정일때 -->
												<%if(odto_asia.getOnline_start_date().isEmpty() && odto_asia.getOnline_start_time().isEmpty()){%>
													<span> 추후공지예정 </span>
												<!-- 날짜는 존재하고 시간이 미정일때 -->
												<%}else if(!odto_asia.getOnline_start_date().isEmpty() && odto_asia.getOnline_start_time().isEmpty()){%>
													<%=new_date_start_time_asia%> 시간미정
												<%}else{%>
												 	<%=new_Online_start_time_asia%> 
												<%}%>
											<!-- 드로우 또는 미정일시 -->
											<%}else if(odto_asia.getOnline_method().contains("드로우") || odto_asia.getOnline_method().contains("-")){%> 
												<!-- 시간시간에 날짜와 시간, 끝나는 시간 날짜와 시간이 모두 없을때 -->
												<%if(odto_asia.getOnline_start_date().isEmpty() && odto_asia.getOnline_start_time().isEmpty() && odto_asia.getOnline_end_date().isEmpty() && odto_asia.getOnline_end_time().isEmpty()){%>
													<span> 추후공지예정 </span>
												<!-- 시작시간이 없고 끝나는 시간만 존재할때 -->
												<%}else if(odto_asia.getOnline_start_date().isEmpty() && odto_asia.getOnline_start_time().isEmpty() && !odto_asia.getOnline_end_date().isEmpty() && !odto_asia.getOnline_end_time().isEmpty()){%>
													~ <%=new_Online_end_time_asia%>
												<!-- 끝나는 시간이 없고 시작시작만 존재할때 -->
												<%}else if(odto_asia.getOnline_end_date().isEmpty() && odto_asia.getOnline_end_time().isEmpty() && !odto_asia.getOnline_start_date().isEmpty() && !odto_asia.getOnline_start_time().isEmpty()){%>
													<%=new_Online_start_time_asia%> ~
												<!-- 시작시간의 날짜만 있고 시간이 없을경우 -->
												<%}else if(!odto_asia.getOnline_start_date().isEmpty() && odto_asia.getOnline_start_time().isEmpty()){%>
													<%=new_date_start_time_asia%> 시간미정
												<!-- 시작시간은 없고 끝나는 시간의 시간은 없고 날짜만 존재할 경우 -->
												<%}else if(odto_asia.getOnline_start_date().isEmpty() && odto_asia.getOnline_start_time().isEmpty() && !odto_asia.getOnline_end_date().isEmpty() && odto_asia.getOnline_end_time().isEmpty()){%>
													~ <%=new_date_end_time_asia%> 시간미정
												<%}else if(odto_asia.getOnline_start_time().isEmpty() || odto_asia.getOnline_end_time().isEmpty()) {%>
													<span> 추후공지예정 </span>
												<%}else{%>
													<span class="start_time"><%=new_Online_start_time_asia%></span> ~ <%=new_Online_end_time_asia%>
												<%}%>
											<%}%>
										</span>
									</div>
									<!-- 방식 -->
									<div id="wrapper-method">
										<span> 방식 </span>
										<span id="wrapper-content">
											<%if(odto_asia.getOnline_method().contains("선착")){%> 
												<span style="color:#ff6600; font-weight: bold;"> <%=odto_asia.getOnline_method()%> </span>
											<%}else if(odto_asia.getOnline_method().contains("드로우")) {%>
												<span style="color:#006600; font-weight: bold;"> <%=odto_asia.getOnline_method()%> </span> 
											<%}else if(odto_asia.getOnline_method().contains("-")) {%>
												<span> 미정 </span>
											<%}%>
										</span>
									</div>
									<!-- 구매방식 -->
									<div id="wrapper-bmethod">
										<span> 구매방식 </span>
										<span id="wrapper-content">
											<span> <%=odto_asia.getBuy_method()%> </span>
										</span>
									</div>
									<!-- 직배여부 -->
									<div id="wrapper-ship">
										<span> 직배여부 </span>
										<span id="wrapper-content">
											<span> <%=odto_asia.getDelivery_method()%> </span>
										</span>
									</div>
									<!-- 응모여부 -->
									<div id="wrapper-check">
										<span> 응모여부 </span>
										<span id="wrapper-content">
											<!-- 온라인 방식이 '드로우'이고  로그인이 안되어있으면 -->
											<%if(odto_asia.getOnline_method().contains("드로우") && user.equals("")){%>
												<span id="draw-status_asia<%=i%>"> <input id="drawCheckbox_asia<%=i%>" type="checkbox" style="width:16px; height:16px; vertical-align: middle;"> </span>
											<!-- 온라인 방식이 '드로우'이고 로그인이 되어있으면 -->
											<%}else if(odto_asia.getOnline_method().contains("드로우") && user != null && !userDrawBrandList.contains(odto_asia.getBrand_id())){%>
												<span id="draw-status_asia<%=i%>"> 
													<input type="hidden" id="asia_model_stylecode<%=i%>" value="<%=odto_asia.getModel_stylecode()%>">
													<input type="hidden" id="asia_brand_id<%=i%>" value="<%=odto_asia.getBrand_id()%>">
													<input type="hidden" id="asia_country_name<%=i%>" value="<%=odto_asia.getCountry_name()%>">
													<input type="checkbox" id="drawCheckbox_asia<%=i%>" style="width:16px; height:16px; vertical-align: middle;">
												</span>
											<!-- 온라인 방식이 '드로우'이고  응모완료 했으면 -->
											<%}else if(odto_asia.getOnline_method().contains("드로우") && user != null && userDrawBrandList.contains(odto_asia.getBrand_id())){%>
												<span id="draw-status_asia<%=i%>"> 
													<input type="hidden" id="asia_model_stylecode<%=i%>" value="<%=odto_asia.getModel_stylecode()%>">
													<input type="hidden" id="asia_brand_id<%=i%>" value="<%=odto_asia.getBrand_id()%>">
													<input type="hidden" id="asia_country_name<%=i%>" value="<%=odto_asia.getCountry_name()%>">
													<input type="checkbox" id="drawCheckbox_asia<%=i%>" style="width:16px; height:16px; vertical-align: middle;" checked>
												</span>
											<%}else {%>
												<span id="draw-status_asia<%=i%>"> - </span>
											<%}%>
										</span>
									</div>
								</div>
								<!-- 남은 시간 -->
								<span id="count_Online_start_time_asia<%=i%>" style="display:none;"> <%=count_Online_start_time_asia%> </span>
								<span id="count_Online_end_time_asia<%=i%>" style="display:none;"> <%=count_Online_end_time_asia%> </span>
								<div class="grid-time">
									<div id="remain-time">	
										<%if(odto_asia.getOnline_method().contains("선착")){%>
										<span id="remain_time_status_asia<%=i%>"> 
											<!-- 시작 시간이 존재할때  -->
											<%if(compare_w_start_result_asia == -1 && !odto_asia.getOnline_start_date().isEmpty() && !odto_asia.getOnline_start_time().isEmpty()) {%>
												
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_asia<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_asia<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_asia<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>	
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_asia<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
												
											<!-- 시작시간이 오늘보다 지났을때 -->
											<%}else if(compare_w_start_result_asia == 1 && !odto_asia.getOnline_start_date().isEmpty()) {%>
												<span id="final_count_Online_start_time_asia<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 종료 </span>
												
											<!-- 시작 시간이 미정일때 -->
											<%}else if(odto_asia.getOnline_start_date().isEmpty() && odto_asia.getOnline_start_time().isEmpty()) {%>
												<span id="final_count_Online_start_time_asia<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
											<%}else {%>
												<span id="final_count_Online_start_time_asia<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
											<%} %>

										</span>
										<%}else if(odto_asia.getOnline_method().contains("드로우") || odto_asia.getOnline_method().contains("-")){%>
										<span id="remain_time_status_asia<%=i%>">
											<!-- 시작 시간과 끝나는 시간이 아직 미정일때 -->
											<%if(odto_asia.getOnline_start_date().isEmpty() && odto_asia.getOnline_start_time().isEmpty() && odto_asia.getOnline_end_date().isEmpty() && odto_asia.getOnline_end_time().isEmpty()) {%>
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
											<!-- 시작 시간 또는 끝나는 시간안에 날짜는 있지만 시간이 없을때 -->
											<%}else if(odto_asia.getOnline_start_time().isEmpty() && odto_asia.getOnline_end_time().isEmpty()) {%>
												<span id="final_count_Online_start_time_asia<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_asia<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_asia<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_asia<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_asia<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 오늘이 시작시간 전이고 시작시간과 끝나는 시간이 모두 존재할때-->
											<%}else if(compare_w_start_result_asia == -1 && !odto_asia.getOnline_start_date().isEmpty() && !odto_asia.getOnline_start_time().isEmpty() && !odto_asia.getOnline_end_date().isEmpty() && !odto_asia.getOnline_end_time().isEmpty()){%>			
												<span id="final_count_Online_start_time_asia<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>seconds" style="display:none;"></span>

												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_asia<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_asia<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_asia<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>	
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_asia<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
											<!-- 시작시간과 끝나는 시간이 모두 존재하고 지금시간이 응모시간 사이일때 -->
											<%}else if(compare_w_start_result_asia == 1 && compare_w_end_result_asia == -1 && !odto_asia.getOnline_start_date().isEmpty() && !odto_asia.getOnline_start_time().isEmpty() && !odto_asia.getOnline_end_date().isEmpty() && !odto_asia.getOnline_end_time().isEmpty()){%>
												<span id="final_count_Online_start_time_asia<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>seconds" style="display:none;"></span>
												
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_asia<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_asia<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_asia<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_asia<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>	
												
											<!-- 시작시간이 없고 끝나는 시간만 존재하고 지금시간이 응모 끝나는 시간보다 전일때 -->
											<%}else if(odto_asia.getOnline_start_date().isEmpty() && odto_asia.getOnline_start_time().isEmpty() && compare_w_end_result_asia == -1){%>
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_asia<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_asia<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_asia<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_asia<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
											<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 후일때 -->
											<%}else if(!odto_asia.getOnline_start_date().isEmpty() && !odto_asia.getOnline_start_time().isEmpty() && odto_asia.getOnline_end_date().isEmpty() && odto_asia.getOnline_end_time().isEmpty() && compare_w_start_result_asia == 1){%>
												<span id="final_count_Online_start_time_asia<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 전일때 -->
											<%}else if(!odto_asia.getOnline_start_date().isEmpty() && !odto_asia.getOnline_start_time().isEmpty() && odto_asia.getOnline_end_date().isEmpty() && odto_asia.getOnline_end_time().isEmpty() && compare_w_start_result_asia == -1) {%>
												<span id="final_count_Online_start_time_asia<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 시작시간과 끝나는 시간이 모두 존재하고 오늘이 끝나는 시간을 지났을때 -->
											<%}else if(compare_w_end_result_asia == 1 && !odto_asia.getOnline_end_date().isEmpty() && !odto_asia.getOnline_end_time().isEmpty()){%>
												<span id="final_count_Online_start_time_asia<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_asia<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_asia<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_asia<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_asia<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 응모종료 </span>
												
											<%}else{%>
												<span id="final_count_Online_start_time_asia<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_asia<%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_asia<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_asia<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_asia<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_asia<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
												
											<%}%>
										</span>
										<%}%>
									</div>
								</div>
								
								<!-- 바로가기 버튼 -->
								<div class="grid-link">
									<a href="<%=odto_asia.getOnline_link()%>" target="_blank" id="direct-link-asia<%=i%>" class="direct-link">
										<span> 바로가기 </span>
									</a>
								</div>
								
								<!-- 관리자 권한 버튼 -->
								<%if(usr_position.equals("admin")){%>
									<div id="wrapper-admin">
										<input type="button" id="adminModiBtn_asia<%=i%>" value="수정" onclick="location.href='./UpdateDrawInfo.ad?model_stylecode=<%=odto_asia.getModel_stylecode()%>&brand_id=<%=odto_asia.getBrand_id()%>'"> 
										<input type="button" id="adminDelBtn_asia<%=i%>" value="삭제" onclick="location.href='./DeleteDrawInfo.ad?model_stylecode=<%=odto_asia.getModel_stylecode()%>&brand_id=<%=odto_asia.getBrand_id()%>'">
									</div>
								<%}%>
							</div>
						</div>
					<% 
							}
						} 
					%>
				</div>
				
				<!-- 북미 발매처 -->
				<div id="grid-list">
					<h4> 북미 발매 리스트 </h4>
					<%
						if(onlineList_america.isEmpty()){
					%>
						<div id="no-info-wrapper">
							<div id="no-info-label"> 아직 온라인 발매 정보가 없습니다. </div>
						</div> 
					<% } else { 
						for(int i=0; i<onlineList_america.size(); i++) {
							OnlineDTO odto_america = (OnlineDTO) onlineList_america.get(i);
							BrandDTO bdto_america = (BrandDTO) brandList_america.get(i);
							
							String online_start_date = "";
							String online_start_time = "";
							String online_end_date = "";
							String online_end_time = "";
							
							if((odto_america.getOnline_start_date().isEmpty())){
								online_start_date = "0000-00-00";
							} else{
								online_start_date = odto_america.getOnline_start_date();
							}
							
							if((odto_america.getOnline_start_time().isEmpty())){
								online_start_time = "24:00";
							} else{
								online_start_time = odto_america.getOnline_start_time();
							}
							
							if((odto_america.getOnline_end_date().isEmpty())){
								online_end_date = "0000-00-00";
							} else{
								online_end_date = odto_america.getOnline_end_date();
							}
							
							if((odto_america.getOnline_end_time().isEmpty())){
								online_end_time = "24:00";
							} else{
								online_end_time = odto_america.getOnline_end_time();
							}
							
							//시작시간, 끝나는 시간 새로운 포맷으로 바꾸기
							// 2020-04-18 10:00
							Date original_Online_start_time_america = original_format.parse(online_start_date + " " + online_start_time);
							Date original_Online_end_time_america = original_format.parse(online_end_date + " " + online_end_time);
							// 04/18 10:00
							String new_Online_start_time_america = new_format.format(original_Online_start_time_america);
							String new_Online_end_time_america = new_format.format(original_Online_end_time_america);
							
							// 04/18/2020 10:00
							String count_Online_start_time_america = count_format.format(original_Online_start_time_america);
							String count_Online_end_time_america = count_format.format(original_Online_end_time_america);
							
							// 04/18
							String[] start_time_Arr = online_start_date.split("-");
							String[] end_time_Arr = online_end_date.split("-");
							int month_start = Integer.parseInt(start_time_Arr[1]);
							int date_start = Integer.parseInt(start_time_Arr[2]);
							int month_end = Integer.parseInt(end_time_Arr[1]);
							int date_end = Integer.parseInt(end_time_Arr[2]);
							
							String new_date_start_time_america = month_start + "/" + date_start;
							String new_date_end_time_america = month_end + "/" + date_end;
							
							int compare_w_start_result_america = today.compareTo(original_Online_start_time_america);		//응모 시작하는 시간
							int compare_w_end_result_america = today.compareTo(original_Online_end_time_america); 		//응모 끝나는 시간
					%>
						<div class="grid-wrapper">
							<div class="grid-item" id="grid-item-america<%=i%>">
								<!-- 진행중 마크 -->
								<div class="grid-ing">
									<!-- 응모 진행중 여부 -->
									<%if(odto_america.getOnline_method().contains("선착")){%>
											<span></span>
									<%}else if(odto_america.getOnline_method().contains("드로우") || odto_america.getOnline_method().contains("-")){%>
										<%if(compare_w_start_result_america == 1 && compare_w_end_result_america == -1 && !odto_america.getOnline_start_date().isEmpty() && !odto_america.getOnline_start_time().isEmpty() && !odto_america.getOnline_end_date().isEmpty() && !odto_america.getOnline_end_time().isEmpty()){%>
											<span id="draw_count_result_ing">진행중</span>
										<!-- 시작시간이 없고 끝나는 시간만 존재하고 지금시간이 응모 끝나는 시간보다 전일때 -->
										<%}else if(odto_america.getOnline_start_date().isEmpty() && odto_america.getOnline_start_time().isEmpty() && compare_w_end_result_america == -1){%>
											<span id="draw_count_result_ing">진행중</span>
										<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 후일때 -->
										<%}else if(!odto_america.getOnline_start_date().isEmpty() && !odto_america.getOnline_start_time().isEmpty() && odto_america.getOnline_end_date().isEmpty() && odto_america.getOnline_end_time().isEmpty() && compare_w_start_result_america == 1){%>
											<span id="draw_count_result_ing">진행중</span>
										<%}else{ %>
											<span></span>
										<%}%>
									<%}%>
								</div>
								
								<!-- 로고 사진 -->
								<div class="grid-logo">
									<a href="<%=odto_america.getOnline_link()%>" target="_blank" id="onlineLink_america<%=i%>"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_america.getBrand_logo()%>" width="100" height="100"> </a>	
								</div>
								
								<!-- 수정 버튼 -->
<%-- 								<div class="grid-edit" id="grid-edit-america<%=i%>"> --%>
<!-- 									<span> <i class="fas fa-pen"></i> </span> -->
<!-- 								</div> -->
								
								<!-- 발매 정보 작성자 아이콘 -->
								<div class="grid-info">
									<span> <i class="fas fa-user"></i> </span>
								</div>
								
								<!-- 응모 내용 -->
								<div class="grid-content">
									<!-- 이름 & 국기-->
									<div id="wrapper-name">
										<a href="<%=odto_america.getOnline_link()%>" target="_blank" id="onlineLink_america<%=i%>"> <span id="brand_name"> <%=bdto_america.getBrand_name()%> </span> </a>
										<span id="span-flag"> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto_america.getCountry_flag()%>" width="22" height="15"> </span>
									</div>
									<!-- 기간 -->
									<div id="wrapper-period">
										<span>
											<!-- 선착일시 -->
											<%if(odto_america.getOnline_method().contains("선착")){%>
												<!-- 시작시간이 아직 미정일때 -->
												<%if(odto_america.getOnline_start_date().isEmpty() && odto_america.getOnline_start_time().isEmpty()){%>
													<span> 추후공지예정 </span>
												<!-- 날짜는 존재하고 시간이 미정일때 -->
												<%}else if(!odto_america.getOnline_start_date().isEmpty() && odto_america.getOnline_start_time().isEmpty()){%>
													<%=new_date_start_time_america%> 시간미정
												<%}else{%>
												 	<%=new_Online_start_time_america%> 
												<%}%>
											<!-- 드로우 또는 미정일시 -->
											<%}else if(odto_america.getOnline_method().contains("드로우") || odto_america.getOnline_method().contains("-")){%> 
												<!-- 시간시간에 날짜와 시간, 끝나는 시간 날짜와 시간이 모두 없을때 -->
												<%if(odto_america.getOnline_start_date().isEmpty() && odto_america.getOnline_start_time().isEmpty() && odto_america.getOnline_end_date().isEmpty() && odto_america.getOnline_end_time().isEmpty()){%>
													<span> 추후공지예정 </span>
												<!-- 시작시간이 없고 끝나는 시간만 존재할때 -->
												<%}else if(odto_america.getOnline_start_date().isEmpty() && odto_america.getOnline_start_time().isEmpty() && !odto_america.getOnline_end_date().isEmpty() && !odto_america.getOnline_end_time().isEmpty()){%>
													~ <%=new_Online_end_time_america%>
												<!-- 끝나는 시간이 없고 시작시작만 존재할때 -->
												<%}else if(odto_america.getOnline_end_date().isEmpty() && odto_america.getOnline_end_time().isEmpty() && !odto_america.getOnline_start_date().isEmpty() && !odto_america.getOnline_start_time().isEmpty()){%>
													<%=new_Online_start_time_america%> ~
												<!-- 시작시간의 날짜만 있고 시간이 없을경우 -->
												<%}else if(!odto_america.getOnline_start_date().isEmpty() && odto_america.getOnline_start_time().isEmpty()){%>
													<%=new_date_start_time_america%> 시간미정
												<!-- 시작시간은 없고 끝나는 시간의 시간은 없고 날짜만 존재할 경우 -->
												<%}else if(odto_america.getOnline_start_date().isEmpty() && odto_america.getOnline_start_time().isEmpty() && !odto_america.getOnline_end_date().isEmpty() && odto_america.getOnline_end_time().isEmpty()){%>
													~ <%=new_date_end_time_america%> 시간미정
												<%}else if(odto_america.getOnline_start_time().isEmpty() || odto_america.getOnline_end_time().isEmpty()) {%>
													<span> 추후공지예정 </span>
												<%}else{%>
													<span class="start_time"><%=new_Online_start_time_america%></span> ~ <%=new_Online_end_time_america%>
												<%}%>
											<%}%>
										</span>
									</div>
									<!-- 방식 -->
									<div id="wrapper-method">
										<span> 방식 </span>
										<span id="wrapper-content">
											<%if(odto_america.getOnline_method().contains("선착")){%> 
												<span style="color:#ff6600; font-weight: bold;"> <%=odto_america.getOnline_method()%> </span>
											<%}else if(odto_america.getOnline_method().contains("드로우")) {%>
												<span style="color:#006600; font-weight: bold;"> <%=odto_america.getOnline_method()%> </span> 
											<%}else if(odto_america.getOnline_method().contains("-")) {%>
												<span> 미정 </span>
											<%}%>
										</span>
									</div>
									<!-- 구매방식 -->
									<div id="wrapper-bmethod">
										<span> 구매방식 </span>
										<span id="wrapper-content">
											<span> <%=odto_america.getBuy_method()%> </span>
										</span>
									</div>
									<!-- 직배여부 -->
									<div id="wrapper-ship">
										<span> 직배여부 </span>
										<span id="wrapper-content">
											<span> <%=odto_america.getDelivery_method()%> </span>
										</span>
									</div>
									<!-- 응모여부 -->
									<div id="wrapper-check">
										<span> 응모여부 </span>
										<span id="wrapper-content">
											<!-- 온라인 방식이 '드로우'이고  로그인이 안되어있으면 -->
											<%if(odto_america.getOnline_method().contains("드로우") && user.equals("")){%>
												<span id="draw-status_america<%=i%>"> <input id="drawCheckbox_america<%=i%>" type="checkbox" style="width:16px; height:16px; vertical-align: middle;"> </span>
											<!-- 온라인 방식이 '드로우'이고 로그인이 되어있으면 -->
											<%}else if(odto_america.getOnline_method().contains("드로우") && user != null && !userDrawBrandList.contains(odto_america.getBrand_id())){%>
												<span id="draw-status_america<%=i%>"> 
													<input type="hidden" id="america_model_stylecode<%=i%>" value="<%=odto_america.getModel_stylecode()%>">
													<input type="hidden" id="america_brand_id<%=i%>" value="<%=odto_america.getBrand_id()%>">
													<input type="hidden" id="america_country_name<%=i%>" value="<%=odto_america.getCountry_name()%>">
													<input type="checkbox" id="drawCheckbox_america<%=i%>" style="width:16px; height:16px; vertical-align: middle;">
												</span>
											<!-- 온라인 방식이 '드로우'이고  응모완료 했으면 -->
											<%}else if(odto_america.getOnline_method().contains("드로우") && user != null && userDrawBrandList.contains(odto_america.getBrand_id())){%>
												<span id="draw-status_america<%=i%>"> 
													<input type="hidden" id="america_model_stylecode<%=i%>" value="<%=odto_america.getModel_stylecode()%>">
													<input type="hidden" id="america_brand_id<%=i%>" value="<%=odto_america.getBrand_id()%>">
													<input type="hidden" id="america_country_name<%=i%>" value="<%=odto_america.getCountry_name()%>">
													<input type="checkbox" id="drawCheckbox_america<%=i%>" style="width:16px; height:16px; vertical-align: middle;" checked>
												</span>
											<%}else {%>
												<span id="draw-status_america<%=i%>"> - </span>
											<%}%>
										</span>
									</div>
								</div>
								<!-- 남은 시간 -->
								<span id="count_Online_start_time_america<%=i%>" style="display:none;"> <%=count_Online_start_time_america%> </span>
								<span id="count_Online_end_time_america<%=i%>" style="display:none;"> <%=count_Online_end_time_america%> </span>
								<div class="grid-time">
									<div id="remain-time">	
										<%if(odto_america.getOnline_method().contains("선착")){%>
										<span id="remain_time_status_america<%=i%>"> 
											<!-- 시작 시간이 존재할때  -->
											<%if(compare_w_start_result_america == -1 && !odto_america.getOnline_start_date().isEmpty() && !odto_america.getOnline_start_time().isEmpty()) {%>
												
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_america<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_america<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_america<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>	
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_america<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
												
											<!-- 시작시간이 오늘보다 지났을때 -->
											<%}else if(compare_w_start_result_america == 1 && !odto_america.getOnline_start_date().isEmpty()) {%>
												<span id="final_count_Online_start_time_america<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 종료 </span>
												
											<!-- 시작 시간이 미정일때 -->
											<%}else if(odto_america.getOnline_start_date().isEmpty() && odto_america.getOnline_start_time().isEmpty()) {%>
												<span id="final_count_Online_start_time_america<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
											<%}else {%>
												<span id="final_count_Online_start_time_america<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
											<%} %>
										</span>
										<%}else if(odto_america.getOnline_method().contains("드로우") || odto_america.getOnline_method().contains("-")){%>
										<span id="remain_time_status_america<%=i%>">
											<!-- 시작 시간과 끝나는 시간이 아직 미정일때 -->
											<%if(odto_america.getOnline_start_date().isEmpty() && odto_america.getOnline_start_time().isEmpty() && odto_america.getOnline_end_date().isEmpty() && odto_america.getOnline_end_time().isEmpty()) {%>
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
											<!-- 시작 시간 또는 끝나는 시간안에 날짜는 있지만 시간이 없을때 -->
											<%}else if(odto_america.getOnline_start_time().isEmpty() && odto_america.getOnline_end_time().isEmpty()) {%>
												<span id="final_count_Online_start_time_america<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_america<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_america<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_america<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_america<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 오늘이 시작시간 전이고 시작시간과 끝나는 시간이 모두 존재할때-->
											<%}else if(compare_w_start_result_america == -1 && !odto_america.getOnline_start_date().isEmpty() && !odto_america.getOnline_start_time().isEmpty() && !odto_america.getOnline_end_date().isEmpty() && !odto_america.getOnline_end_time().isEmpty()){%>			
												<span id="final_count_Online_start_time_america<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>seconds" style="display:none;"></span>

												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_america<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_america<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_america<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>	
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_america<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
											<!-- 시작시간과 끝나는 시간이 모두 존재하고 지금시간이 응모시간 사이일때 -->
											<%}else if(compare_w_start_result_america == 1 && compare_w_end_result_america == -1 && !odto_america.getOnline_start_date().isEmpty() && !odto_america.getOnline_start_time().isEmpty() && !odto_america.getOnline_end_date().isEmpty() && !odto_america.getOnline_end_time().isEmpty()){%>
												<span id="final_count_Online_start_time_america<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>seconds" style="display:none;"></span>
												
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_america<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_america<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_america<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_america<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>	
												
											<!-- 시작시간이 없고 끝나는 시간만 존재하고 지금시간이 응모 끝나는 시간보다 전일때 -->
											<%}else if(odto_america.getOnline_start_date().isEmpty() && odto_america.getOnline_start_time().isEmpty() && compare_w_end_result_america == -1){%>
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_america<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_america<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_america<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_america<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
											<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 후일때 -->
											<%}else if(!odto_america.getOnline_start_date().isEmpty() && !odto_america.getOnline_start_time().isEmpty() && odto_america.getOnline_end_date().isEmpty() && odto_america.getOnline_end_time().isEmpty() && compare_w_start_result_america == 1){%>
												<span id="final_count_Online_start_time_america<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 전일때 -->
											<%}else if(!odto_america.getOnline_start_date().isEmpty() && !odto_america.getOnline_start_time().isEmpty() && odto_america.getOnline_end_date().isEmpty() && odto_america.getOnline_end_time().isEmpty() && compare_w_start_result_america == -1) {%>
												<span id="final_count_Online_start_time_america<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 시작시간과 끝나는 시간이 모두 존재하고 오늘이 끝나는 시간을 지났을때 -->
											<%}else if(compare_w_end_result_america == 1 && !odto_america.getOnline_end_date().isEmpty() && !odto_america.getOnline_end_time().isEmpty()){%>
												<span id="final_count_Online_start_time_america<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_america<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_america<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_america<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_america<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 응모종료 </span>
												
											<%}else{%>
												<span id="final_count_Online_start_time_america<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_america<%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_america<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_america<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_america<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_america<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
												
											<%}%>
										</span>
										<%}%>
									</div>
								</div>
								
								<!-- 바로가기 버튼 -->
								<div class="grid-link">
									<a href="<%=odto_america.getOnline_link()%>" target="_blank" id="direct-link-america<%=i%>" class="direct-link">
										<span>  바로가기 </span>
									</a>
								</div>
								
								<!-- 관리자 권한 버튼 -->
								<%if(usr_position.equals("admin")){%>
									<div id="wrapper-admin">
										<input type="button" id="adminModiBtn_america<%=i%>" value="수정" onclick="location.href='./UpdateDrawInfo.ad?model_stylecode=<%=odto_america.getModel_stylecode()%>&brand_id=<%=odto_america.getBrand_id()%>'"> 
										<input type="button" id="adminDelBtn_america<%=i%>" value="삭제" onclick="location.href='./DeleteDrawInfo.ad?model_stylecode=<%=odto_america.getModel_stylecode()%>&brand_id=<%=odto_america.getBrand_id()%>'">
									</div>
								<%}%>
							</div>
						</div>
					<% 
							}
						} 
					%>
				</div>

				<!-- 유럽 발매처 -->
				<div id="grid-list">
					<h4> 유럽 발매 리스트 </h4>
					<%
						if(onlineList_europe.isEmpty()){
					%>
						<div id="no-info-wrapper">
							<div id="no-info-label"> 아직 온라인 발매 정보가 없습니다. </div>
						</div> 
					<% } else { 
						for(int i=0; i<onlineList_europe.size(); i++) {
							OnlineDTO odto_europe = (OnlineDTO) onlineList_europe.get(i);
							BrandDTO bdto_europe = (BrandDTO) brandList_europe.get(i);
							
							String online_start_date = "";
							String online_start_time = "";
							String online_end_date = "";
							String online_end_time = "";
							
							if((odto_europe.getOnline_start_date().isEmpty())){
								online_start_date = "0000-00-00";
							} else{
								online_start_date = odto_europe.getOnline_start_date();
							}
							
							if((odto_europe.getOnline_start_time().isEmpty())){
								online_start_time = "24:00";
							} else{
								online_start_time = odto_europe.getOnline_start_time();
							}
							
							if((odto_europe.getOnline_end_date().isEmpty())){
								online_end_date = "0000-00-00";
							} else{
								online_end_date = odto_europe.getOnline_end_date();
							}
							
							if((odto_europe.getOnline_end_time().isEmpty())){
								online_end_time = "24:00";
							} else{
								online_end_time = odto_europe.getOnline_end_time();
							}
							
							//시작시간, 끝나는 시간 새로운 포맷으로 바꾸기
							// 2020-04-18 10:00
							Date original_Online_start_time_europe = original_format.parse(online_start_date + " " + online_start_time);
							Date original_Online_end_time_europe = original_format.parse(online_end_date + " " + online_end_time);
							// 04/18 10:00
							String new_Online_start_time_europe = new_format.format(original_Online_start_time_europe);
							String new_Online_end_time_europe = new_format.format(original_Online_end_time_europe);
							
							// 04/18/2020 10:00
							String count_Online_start_time_europe = count_format.format(original_Online_start_time_europe);
							String count_Online_end_time_europe = count_format.format(original_Online_end_time_europe);
							
							// 04/18
							String[] start_time_Arr = online_start_date.split("-");
							String[] end_time_Arr = online_end_date.split("-");
							int month_start = Integer.parseInt(start_time_Arr[1]);
							int date_start = Integer.parseInt(start_time_Arr[2]);
							int month_end = Integer.parseInt(end_time_Arr[1]);
							int date_end = Integer.parseInt(end_time_Arr[2]);
							
							String new_date_start_time_europe = month_start + "/" + date_start;
							String new_date_end_time_europe = month_end + "/" + date_end;
							
							int compare_w_start_result_europe = today.compareTo(original_Online_start_time_europe);		//응모 시작하는 시간
							int compare_w_end_result_europe = today.compareTo(original_Online_end_time_europe); 		//응모 끝나는 시간
					%>
						<div class="grid-wrapper">
							<div class="grid-item" id="grid-item-europe<%=i%>">
								<!-- 진행중 마크 -->
								<div class="grid-ing">
									<!-- 응모 진행중 여부 -->
									<%if(odto_europe.getOnline_method().contains("선착")){%>
											<span></span>
									<%}else if(odto_europe.getOnline_method().contains("드로우") || odto_europe.getOnline_method().contains("-")){%>
										<%if(compare_w_start_result_europe == 1 && compare_w_end_result_europe == -1 && !odto_europe.getOnline_start_date().isEmpty() && !odto_europe.getOnline_start_time().isEmpty() && !odto_europe.getOnline_end_date().isEmpty() && !odto_europe.getOnline_end_time().isEmpty()){%>
											<span id="draw_count_result_ing">진행중</span>
										<!-- 시작시간이 없고 끝나는 시간만 존재하고 지금시간이 응모 끝나는 시간보다 전일때 -->
										<%}else if(odto_europe.getOnline_start_date().isEmpty() && odto_europe.getOnline_start_time().isEmpty() && compare_w_end_result_europe == -1){%>
											<span id="draw_count_result_ing">진행중</span>
										<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 후일때 -->
										<%}else if(!odto_europe.getOnline_start_date().isEmpty() && !odto_europe.getOnline_start_time().isEmpty() && odto_europe.getOnline_end_date().isEmpty() && odto_europe.getOnline_end_time().isEmpty() && compare_w_start_result_europe == 1){%>
											<span id="draw_count_result_ing">진행중</span>
										<%}else{ %>
											<span></span>
										<%}%>
									<%}%>
								</div>
								
								<!-- 로고 사진 -->
								<div class="grid-logo">
									<a href="<%=odto_europe.getOnline_link()%>" target="_blank" id="onlineLink_europe<%=i%>"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_europe.getBrand_logo()%>" width="100" height="100"> </a>	
								</div>
								
								<!-- 수정 버튼 -->
<%-- 								<div class="grid-edit" id="grid-edit-europe<%=i%>"> --%>
<!-- 									<span> <i class="fas fa-pen"></i> </span> -->
<!-- 								</div> -->
								
								<!-- 발매 정보 작성자 아이콘 -->
								<div class="grid-info">
									<span> <i class="fas fa-user"></i> </span>
								</div>
								
								<!-- 응모 내용 -->
								<div class="grid-content">
									<!-- 이름 & 국기-->
									<div id="wrapper-name">
										<a href="<%=odto_europe.getOnline_link()%>" target="_blank" id="onlineLink_europe<%=i%>"> <span id="brand_name"> <%=bdto_europe.getBrand_name()%> </span> </a>
										<span id="span-flag"> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto_europe.getCountry_flag()%>" width="22" height="15"> </span>
									</div>
									<!-- 기간 -->
									<div id="wrapper-period">
										<span>
											<!-- 선착일시 -->
											<%if(odto_europe.getOnline_method().contains("선착")){%>
												<!-- 시작시간이 아직 미정일때 -->
												<%if(odto_europe.getOnline_start_date().isEmpty() && odto_europe.getOnline_start_time().isEmpty()){%>
													<span> 추후공지예정 </span>
												<!-- 날짜는 존재하고 시간이 미정일때 -->
												<%}else if(!odto_europe.getOnline_start_date().isEmpty() && odto_europe.getOnline_start_time().isEmpty()){%>
													<%=new_date_start_time_europe%> 시간미정
												<%}else{%>
												 	<%=new_Online_start_time_europe%> 
												<%}%>
											<!-- 드로우 또는 미정일시 -->
											<%}else if(odto_europe.getOnline_method().contains("드로우") || odto_europe.getOnline_method().contains("-")){%> 
												<!-- 시간시간에 날짜와 시간, 끝나는 시간 날짜와 시간이 모두 없을때 -->
												<%if(odto_europe.getOnline_start_date().isEmpty() && odto_europe.getOnline_start_time().isEmpty() && odto_europe.getOnline_end_date().isEmpty() && odto_europe.getOnline_end_time().isEmpty()){%>
													<span> 추후공지예정 </span>
												<!-- 시작시간이 없고 끝나는 시간만 존재할때 -->
												<%}else if(odto_europe.getOnline_start_date().isEmpty() && odto_europe.getOnline_start_time().isEmpty() && !odto_europe.getOnline_end_date().isEmpty() && !odto_europe.getOnline_end_time().isEmpty()){%>
													~ <%=new_Online_end_time_europe%>
												<!-- 끝나는 시간이 없고 시작시작만 존재할때 -->
												<%}else if(odto_europe.getOnline_end_date().isEmpty() && odto_europe.getOnline_end_time().isEmpty() && !odto_europe.getOnline_start_date().isEmpty() && !odto_europe.getOnline_start_time().isEmpty()){%>
													<%=new_Online_start_time_europe%> ~
												<!-- 시작시간의 날짜만 있고 시간이 없을경우 -->
												<%}else if(!odto_europe.getOnline_start_date().isEmpty() && odto_europe.getOnline_start_time().isEmpty()){%>
													<%=new_date_start_time_europe%> 시간미정
												<!-- 시작시간은 없고 끝나는 시간의 시간은 없고 날짜만 존재할 경우 -->
												<%}else if(odto_europe.getOnline_start_date().isEmpty() && odto_europe.getOnline_start_time().isEmpty() && !odto_europe.getOnline_end_date().isEmpty() && odto_europe.getOnline_end_time().isEmpty()){%>
													~ <%=new_date_end_time_europe%> 시간미정
												<%}else if(odto_europe.getOnline_start_time().isEmpty() || odto_europe.getOnline_end_time().isEmpty()) {%>
													<span> 추후공지예정 </span>
												<%}else{%>
													<span class="start_time"><%=new_Online_start_time_europe%></span> ~ <%=new_Online_end_time_europe%>
												<%}%>
											<%}%>
										</span>
									</div>
									<!-- 방식 -->
									<div id="wrapper-method">
										<span> 방식 </span>
										<span id="wrapper-content">
											<%if(odto_europe.getOnline_method().contains("선착")){%> 
												<span style="color:#ff6600; font-weight: bold;"> <%=odto_europe.getOnline_method()%> </span>
											<%}else if(odto_europe.getOnline_method().contains("드로우")) {%>
												<span style="color:#006600; font-weight: bold;"> <%=odto_europe.getOnline_method()%> </span> 
											<%}else if(odto_europe.getOnline_method().contains("-")) {%>
												<span> 미정 </span>
											<%}%>
										</span>
									</div>
									<!-- 구매방식 -->
									<div id="wrapper-bmethod">
										<span> 구매방식 </span>
										<span id="wrapper-content">
											<span> <%=odto_europe.getBuy_method()%> </span>
										</span>
									</div>
									<!-- 직배여부 -->
									<div id="wrapper-ship">
										<span> 직배여부 </span>
										<span id="wrapper-content">
											<span> <%=odto_europe.getDelivery_method()%> </span>
										</span>
									</div>
									<!-- 응모여부 -->
									<div id="wrapper-check">
										<span> 응모여부 </span>
										<span id="wrapper-content">
											<!-- 온라인 방식이 '드로우'이고  로그인이 안되어있으면 -->
											<%if(odto_europe.getOnline_method().contains("드로우") && user.equals("")){%>
												<span id="draw-status_europe<%=i%>"> <input id="drawCheckbox_europe<%=i%>" type="checkbox" style="width:16px; height:16px; vertical-align: middle;"> </span>
											<!-- 온라인 방식이 '드로우'이고 로그인이 되어있으면 -->
											<%}else if(odto_europe.getOnline_method().contains("드로우") && user != null && !userDrawBrandList.contains(odto_europe.getBrand_id())){%>
												<span id="draw-status_europe<%=i%>"> 
													<input type="hidden" id="europe_model_stylecode<%=i%>" value="<%=odto_europe.getModel_stylecode()%>">
													<input type="hidden" id="europe_brand_id<%=i%>" value="<%=odto_europe.getBrand_id()%>">
													<input type="hidden" id="europe_country_name<%=i%>" value="<%=odto_europe.getCountry_name()%>">
													<input type="checkbox" id="drawCheckbox_europe<%=i%>" style="width:16px; height:16px; vertical-align: middle;">
												</span>
											<!-- 온라인 방식이 '드로우'이고  응모완료 했으면 -->
											<%}else if(odto_europe.getOnline_method().contains("드로우") && user != null && userDrawBrandList.contains(odto_europe.getBrand_id())){%>
												<span id="draw-status_europe<%=i%>"> 
													<input type="hidden" id="europe_model_stylecode<%=i%>" value="<%=odto_europe.getModel_stylecode()%>">
													<input type="hidden" id="europe_brand_id<%=i%>" value="<%=odto_europe.getBrand_id()%>">
													<input type="hidden" id="europe_country_name<%=i%>" value="<%=odto_europe.getCountry_name()%>">
													<input type="checkbox" id="drawCheckbox_europe<%=i%>" style="width:16px; height:16px; vertical-align: middle;" checked>
												</span>
											<%}else {%>
												<span id="draw-status_europe<%=i%>"> - </span>
											<%}%>
										</span>
									</div>
								</div>
								
								<!-- 남은 시간 -->
								<span id="count_Online_start_time_europe<%=i%>" style="display:none;"> <%=count_Online_start_time_europe%> </span>
								<span id="count_Online_end_time_europe<%=i%>" style="display:none;"> <%=count_Online_end_time_europe%> </span>
								<div class="grid-time">
									<div id="remain-time">	
										<%if(odto_europe.getOnline_method().contains("선착")){%>
										<span id="remain_time_status_europe<%=i%>"> 
											<!-- 시작 시간이 존재할때  -->
											<%if(compare_w_start_result_europe == -1 && !odto_europe.getOnline_start_date().isEmpty() && !odto_europe.getOnline_start_time().isEmpty()) {%>
												
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_europe<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_europe<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_europe<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>	
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_europe<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
												
											<!-- 시작시간이 오늘보다 지났을때 -->
											<%}else if(compare_w_start_result_europe == 1 && !odto_europe.getOnline_start_date().isEmpty()) {%>
												<span id="final_count_Online_start_time_europe<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 종료 </span>
												
											<!-- 시작 시간이 미정일때 -->
											<%}else if(odto_europe.getOnline_start_date().isEmpty() && odto_europe.getOnline_start_time().isEmpty()) {%>
												<span id="final_count_Online_start_time_europe<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
											<%}else {%>
												<span id="final_count_Online_start_time_europe<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
											<%} %>
										</span>
										<%}else if(odto_europe.getOnline_method().contains("드로우") || odto_europe.getOnline_method().contains("-")){%>
										<span id="remain_time_status_europe<%=i%>">
											<!-- 시작 시간과 끝나는 시간이 아직 미정일때 -->
											<%if(odto_europe.getOnline_start_date().isEmpty() && odto_europe.getOnline_start_time().isEmpty() && odto_europe.getOnline_end_date().isEmpty() && odto_europe.getOnline_end_time().isEmpty()) {%>
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
											<!-- 시작 시간 또는 끝나는 시간안에 날짜는 있지만 시간이 없을때 -->
											<%}else if(odto_europe.getOnline_start_time().isEmpty() && odto_europe.getOnline_end_time().isEmpty()) {%>
												<span id="final_count_Online_start_time_europe<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_europe<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_europe<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_europe<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_europe<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 오늘이 시작시간 전이고 시작시간과 끝나는 시간이 모두 존재할때-->
											<%}else if(compare_w_start_result_europe == -1 && !odto_europe.getOnline_start_date().isEmpty() && !odto_europe.getOnline_start_time().isEmpty() && !odto_europe.getOnline_end_date().isEmpty() && !odto_europe.getOnline_end_time().isEmpty()){%>			
												<span id="final_count_Online_start_time_europe<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>seconds" style="display:none;"></span>

												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_europe<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_europe<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_europe<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>	
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_europe<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
											<!-- 시작시간과 끝나는 시간이 모두 존재하고 지금시간이 응모시간 사이일때 -->
											<%}else if(compare_w_start_result_europe == 1 && compare_w_end_result_europe == -1 && !odto_europe.getOnline_start_date().isEmpty() && !odto_europe.getOnline_start_time().isEmpty() && !odto_europe.getOnline_end_date().isEmpty() && !odto_europe.getOnline_end_time().isEmpty()){%>
												<span id="final_count_Online_start_time_europe<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>seconds" style="display:none;"></span>
												
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_europe<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_europe<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_europe<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_europe<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>	
												
											<!-- 시작시간이 없고 끝나는 시간만 존재하고 지금시간이 응모 끝나는 시간보다 전일때 -->
											<%}else if(odto_europe.getOnline_start_date().isEmpty() && odto_europe.getOnline_start_time().isEmpty() && compare_w_end_result_europe == -1){%>
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_europe<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_europe<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_europe<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_europe<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
											<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 후일때 -->
											<%}else if(!odto_europe.getOnline_start_date().isEmpty() && !odto_europe.getOnline_start_time().isEmpty() && odto_europe.getOnline_end_date().isEmpty() && odto_europe.getOnline_end_time().isEmpty() && compare_w_start_result_europe == 1){%>
												<span id="final_count_Online_start_time_europe<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 전일때 -->
											<%}else if(!odto_europe.getOnline_start_date().isEmpty() && !odto_europe.getOnline_start_time().isEmpty() && odto_europe.getOnline_end_date().isEmpty() && odto_europe.getOnline_end_time().isEmpty() && compare_w_start_result_europe == -1) {%>
												<span id="final_count_Online_start_time_europe<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 시작시간과 끝나는 시간이 모두 존재하고 오늘이 끝나는 시간을 지났을때 -->
											<%}else if(compare_w_end_result_europe == 1 && !odto_europe.getOnline_end_date().isEmpty() && !odto_europe.getOnline_end_time().isEmpty()){%>
												<span id="final_count_Online_start_time_europe<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_europe<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_europe<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_europe<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_europe<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 응모종료 </span>
												
											<%}else{%>
												<span id="final_count_Online_start_time_europe<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_europe<%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_europe<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_europe<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_europe<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_europe<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
												
											<%}%>
										</span>
										<%}%>
									</div>
								</div>
								
								<!-- 바로가기 버튼 -->
								<div class="grid-link">
									<a href="<%=odto_europe.getOnline_link()%>" target="_blank" id="direct-link-europe<%=i%>" class="direct-link">
										<span>  바로가기 </span>
									</a>
								</div>
								
								<!-- 관리자 권한 버튼 -->
								<%if(usr_position.equals("admin")){%>
									<div id="wrapper-admin">
										<input type="button" id="adminModiBtn_europe<%=i%>" value="수정" onclick="location.href='./UpdateDrawInfo.ad?model_stylecode=<%=odto_europe.getModel_stylecode()%>&brand_id=<%=odto_europe.getBrand_id()%>'"> 
										<input type="button" id="adminDelBtn_europe<%=i%>" value="삭제" onclick="location.href='./DeleteDrawInfo.ad?model_stylecode=<%=odto_europe.getModel_stylecode()%>&brand_id=<%=odto_europe.getBrand_id()%>'">
									</div>
								<%}%>
							</div>
						</div>
					<% 
							}
						} 
					%>
				</div>

				<!-- 기타 발매처 -->
				<div id="grid-list">
					<h4> 기타 발매 리스트 </h4>
					<%
						if(onlineList_etc.isEmpty()){
					%>
						<div id="no-info-wrapper">
							<div id="no-info-label"> 아직 온라인 발매 정보가 없습니다. </div>
						</div> 
					<% } else { 
						for(int i=0; i<onlineList_etc.size(); i++) {
							OnlineDTO odto_etc = (OnlineDTO) onlineList_etc.get(i);
							BrandDTO bdto_etc = (BrandDTO) brandList_etc.get(i);
							
							String online_start_date = "";
							String online_start_time = "";
							String online_end_date = "";
							String online_end_time = "";
							
							if((odto_etc.getOnline_start_date().isEmpty())){
								online_start_date = "0000-00-00";
							} else{
								online_start_date = odto_etc.getOnline_start_date();
							}
							
							if((odto_etc.getOnline_start_time().isEmpty())){
								online_start_time = "24:00";
							} else{
								online_start_time = odto_etc.getOnline_start_time();
							}
							
							if((odto_etc.getOnline_end_date().isEmpty())){
								online_end_date = "0000-00-00";
							} else{
								online_end_date = odto_etc.getOnline_end_date();
							}
							
							if((odto_etc.getOnline_end_time().isEmpty())){
								online_end_time = "24:00";
							} else{
								online_end_time = odto_etc.getOnline_end_time();
							}
							
							//시작시간, 끝나는 시간 새로운 포맷으로 바꾸기
							// 2020-04-18 10:00
							Date original_Online_start_time_etc = original_format.parse(online_start_date + " " + online_start_time);
							Date original_Online_end_time_etc = original_format.parse(online_end_date + " " + online_end_time);
							// 04/18 10:00
							String new_Online_start_time_etc = new_format.format(original_Online_start_time_etc);
							String new_Online_end_time_etc = new_format.format(original_Online_end_time_etc);
							
							// 04/18/2020 10:00
							String count_Online_start_time_etc = count_format.format(original_Online_start_time_etc);
							String count_Online_end_time_etc = count_format.format(original_Online_end_time_etc);
							
							// 04/18
							String[] start_time_Arr = online_start_date.split("-");
							String[] end_time_Arr = online_end_date.split("-");
							int month_start = Integer.parseInt(start_time_Arr[1]);
							int date_start = Integer.parseInt(start_time_Arr[2]);
							int month_end = Integer.parseInt(end_time_Arr[1]);
							int date_end = Integer.parseInt(end_time_Arr[2]);
							
							String new_date_start_time_etc = month_start + "/" + date_start;
							String new_date_end_time_etc = month_end + "/" + date_end;
							
							int compare_w_start_result_etc = today.compareTo(original_Online_start_time_etc);		//응모 시작하는 시간
							int compare_w_end_result_etc = today.compareTo(original_Online_end_time_etc); 		//응모 끝나는 시간
					%>
						<div class="grid-wrapper">
							<div class="grid-item" id="grid-item-etc<%=i%>">
								<!-- 진행중 마크 -->
								<div class="grid-ing">
									<!-- 응모 진행중 여부 -->
									<%if(odto_etc.getOnline_method().contains("선착")){%>
											<span></span>
									<%}else if(odto_etc.getOnline_method().contains("드로우") || odto_etc.getOnline_method().contains("-")){%>
										<%if(compare_w_start_result_etc == 1 && compare_w_end_result_etc == -1 && !odto_etc.getOnline_start_date().isEmpty() && !odto_etc.getOnline_start_time().isEmpty() && !odto_etc.getOnline_end_date().isEmpty() && !odto_etc.getOnline_end_time().isEmpty()){%>
											<span id="draw_count_result_ing">진행중</span>
										<!-- 시작시간이 없고 끝나는 시간만 존재하고 지금시간이 응모 끝나는 시간보다 전일때 -->
										<%}else if(odto_etc.getOnline_start_date().isEmpty() && odto_etc.getOnline_start_time().isEmpty() && compare_w_end_result_etc == -1){%>
											<span id="draw_count_result_ing">진행중</span>
										<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 후일때 -->
										<%}else if(!odto_etc.getOnline_start_date().isEmpty() && !odto_etc.getOnline_start_time().isEmpty() && odto_etc.getOnline_end_date().isEmpty() && odto_etc.getOnline_end_time().isEmpty() && compare_w_start_result_etc == 1){%>
											<span id="draw_count_result_ing">진행중</span>
										<%}else{ %>
											<span></span>
										<%}%>
									<%}%>
								</div>
								
								<!-- 로고 사진 -->
								<div class="grid-logo">
									<a href="<%=odto_etc.getOnline_link()%>" target="_blank" id="onlineLink_etc<%=i%>"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto_etc.getBrand_logo()%>" width="100" height="100"> </a>	
								</div>
								
								<!-- 수정 버튼 -->
<%-- 								<div class="grid-edit" id="grid-edit-etc<%=i%>"> --%>
<!-- 									<span> <i class="fas fa-pen"></i> </span> -->
<!-- 								</div> -->
								
								<!-- 발매 정보 작성자 아이콘 -->
								<div class="grid-info">
									<span> <i class="fas fa-user"></i> </span>
								</div>
								
								<!-- 응모 내용 -->
								<div class="grid-content">
									<!-- 이름 & 국기-->
									<div id="wrapper-name">
										<a href="<%=odto_etc.getOnline_link()%>" target="_blank" id="onlineLink_etc<%=i%>"> <span id="brand_name"> <%=bdto_etc.getBrand_name()%> </span> </a>
										<span id="span-flag"> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto_etc.getCountry_flag()%>" width="22" height="15"> </span>
									</div>
									<!-- 기간 -->
									<div id="wrapper-period">
										<span>
											<!-- 선착일시 -->
											<%if(odto_etc.getOnline_method().contains("선착")){%>
												<!-- 시작시간이 아직 미정일때 -->
												<%if(odto_etc.getOnline_start_date().isEmpty() && odto_etc.getOnline_start_time().isEmpty()){%>
													<span> 추후공지예정 </span>
												<!-- 날짜는 존재하고 시간이 미정일때 -->
												<%}else if(!odto_etc.getOnline_start_date().isEmpty() && odto_etc.getOnline_start_time().isEmpty()){%>
													<%=new_date_start_time_etc%> 시간미정
												<%}else{%>
												 	<%=new_Online_start_time_etc%> 
												<%}%>
											<!-- 드로우 또는 미정일시 -->
											<%}else if(odto_etc.getOnline_method().contains("드로우") || odto_etc.getOnline_method().contains("-")){%> 
												<!-- 시간시간에 날짜와 시간, 끝나는 시간 날짜와 시간이 모두 없을때 -->
												<%if(odto_etc.getOnline_start_date().isEmpty() && odto_etc.getOnline_start_time().isEmpty() && odto_etc.getOnline_end_date().isEmpty() && odto_etc.getOnline_end_time().isEmpty()){%>
													<span> 추후공지예정 </span>
												<!-- 시작시간이 없고 끝나는 시간만 존재할때 -->
												<%}else if(odto_etc.getOnline_start_date().isEmpty() && odto_etc.getOnline_start_time().isEmpty() && !odto_etc.getOnline_end_date().isEmpty() && !odto_etc.getOnline_end_time().isEmpty()){%>
													~ <%=new_Online_end_time_etc%>
												<!-- 끝나는 시간이 없고 시작시작만 존재할때 -->
												<%}else if(odto_etc.getOnline_end_date().isEmpty() && odto_etc.getOnline_end_time().isEmpty() && !odto_etc.getOnline_start_date().isEmpty() && !odto_etc.getOnline_start_time().isEmpty()){%>
													<%=new_Online_start_time_etc%> ~
												<!-- 시작시간의 날짜만 있고 시간이 없을경우 -->
												<%}else if(!odto_etc.getOnline_start_date().isEmpty() && odto_etc.getOnline_start_time().isEmpty()){%>
													<%=new_date_start_time_etc%> 시간미정
												<!-- 시작시간은 없고 끝나는 시간의 시간은 없고 날짜만 존재할 경우 -->
												<%}else if(odto_etc.getOnline_start_date().isEmpty() && odto_etc.getOnline_start_time().isEmpty() && !odto_etc.getOnline_end_date().isEmpty() && odto_etc.getOnline_end_time().isEmpty()){%>
													~ <%=new_date_end_time_etc%> 시간미정
												<%}else if(odto_etc.getOnline_start_time().isEmpty() || odto_etc.getOnline_end_time().isEmpty()) {%>
													<span> 추후공지예정 </span>
												<%}else{%>
													<span class="start_time"><%=new_Online_start_time_etc%></span> ~ <%=new_Online_end_time_etc%>
												<%}%>
											<%}%>
										</span>
									</div>
									<!-- 방식 -->
									<div id="wrapper-method">
										<span> 방식 </span>
										<span id="wrapper-content">
											<%if(odto_etc.getOnline_method().contains("선착")){%> 
												<span style="color:#ff6600; font-weight: bold;"> <%=odto_etc.getOnline_method()%> </span>
											<%}else if(odto_etc.getOnline_method().contains("드로우")) {%>
												<span style="color:#006600; font-weight: bold;"> <%=odto_etc.getOnline_method()%> </span> 
											<%}else if(odto_etc.getOnline_method().contains("-")) {%>
												<span> 미정 </span>
											<%}%>
										</span>
									</div>
									<!-- 구매방식 -->
									<div id="wrapper-bmethod">
										<span> 구매방식 </span>
										<span id="wrapper-content">
											<span> <%=odto_etc.getBuy_method()%> </span>
										</span>
									</div>
									<!-- 직배여부 -->
									<div id="wrapper-ship">
										<span> 직배여부 </span>
										<span id="wrapper-content">
											<span> <%=odto_etc.getDelivery_method()%> </span>
										</span>
									</div>
									<!-- 응모여부 -->
									<div id="wrapper-check">
										<span> 응모여부 </span>
										<span id="wrapper-content">
											<!-- 온라인 방식이 '드로우'이고  로그인이 안되어있으면 -->
											<%if(odto_etc.getOnline_method().contains("드로우") && user.equals("")){%>
												<span id="draw-status_etc<%=i%>"> <input id="drawCheckbox_etc<%=i%>" type="checkbox" style="width:16px; height:16px; vertical-align: middle;"> </span>
											<!-- 온라인 방식이 '드로우'이고 로그인이 되어있으면 -->
											<%}else if(odto_etc.getOnline_method().contains("드로우") && user != null && !userDrawBrandList.contains(odto_etc.getBrand_id())){%>
												<span id="draw-status_etc<%=i%>"> 
													<input type="hidden" id="etc_model_stylecode<%=i%>" value="<%=odto_etc.getModel_stylecode()%>">
													<input type="hidden" id="etc_brand_id<%=i%>" value="<%=odto_etc.getBrand_id()%>">
													<input type="hidden" id="etc_country_name<%=i%>" value="<%=odto_etc.getCountry_name()%>">
													<input type="checkbox" id="drawCheckbox_etc<%=i%>" style="width:16px; height:16px; vertical-align: middle;">
												</span>
											<!-- 온라인 방식이 '드로우'이고  응모완료 했으면 -->
											<%}else if(odto_etc.getOnline_method().contains("드로우") && user != null && userDrawBrandList.contains(odto_etc.getBrand_id())){%>
												<span id="draw-status_etc<%=i%>"> 
													<input type="hidden" id="etc_model_stylecode<%=i%>" value="<%=odto_etc.getModel_stylecode()%>">
													<input type="hidden" id="etc_brand_id<%=i%>" value="<%=odto_etc.getBrand_id()%>">
													<input type="hidden" id="etc_country_name<%=i%>" value="<%=odto_etc.getCountry_name()%>">
													<input type="checkbox" id="drawCheckbox_etc<%=i%>" style="width:16px; height:16px; vertical-align: middle;" checked>
												</span>
											<%}else {%>
												<span id="draw-status_etc<%=i%>"> - </span>
											<%}%>
										</span>
									</div>
								</div>
								<!-- 남은 시간 -->
								<span id="count_Online_start_time_etc<%=i%>" style="display:none;"> <%=count_Online_start_time_etc%> </span>
								<span id="count_Online_end_time_etc<%=i%>" style="display:none;"> <%=count_Online_end_time_etc%> </span>
								<div class="grid-time">
									<div id="remain-time">	
										<%if(odto_etc.getOnline_method().contains("선착")){%>
										<span id="remain_time_status_etc<%=i%>"> 
											<!-- 시작 시간이 존재할때  -->
											<%if(compare_w_start_result_etc == -1 && !odto_etc.getOnline_start_date().isEmpty() && !odto_etc.getOnline_start_time().isEmpty()) {%>
												
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_etc<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_etc<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_etc<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>	
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_start_time_etc<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
												
											<!-- 시작시간이 오늘보다 지났을때 -->
											<%}else if(compare_w_start_result_etc == 1 && !odto_etc.getOnline_start_date().isEmpty()) {%>
												<span id="final_count_Online_start_time_etc<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 종료 </span>
												
											<!-- 시작 시간이 미정일때 -->
											<%}else if(odto_etc.getOnline_start_date().isEmpty() && odto_etc.getOnline_start_time().isEmpty()) {%>
												<span id="final_count_Online_start_time_etc<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
											<%}else {%>
												<span id="final_count_Online_start_time_etc<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
											<%} %>
										</span>
										<%}else if(odto_etc.getOnline_method().contains("드로우") || odto_etc.getOnline_method().contains("-")){%>
										<span id="remain_time_status_etc<%=i%>">
											<!-- 시작 시간과 끝나는 시간이 아직 미정일때 -->
											<%if(odto_etc.getOnline_start_date().isEmpty() && odto_etc.getOnline_start_time().isEmpty() && odto_etc.getOnline_end_date().isEmpty() && odto_etc.getOnline_end_time().isEmpty()) {%>
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
											<!-- 시작 시간 또는 끝나는 시간안에 날짜는 있지만 시간이 없을때 -->
											<%}else if(odto_etc.getOnline_start_time().isEmpty() && odto_etc.getOnline_end_time().isEmpty()) {%>
												<span id="final_count_Online_start_time_etc<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_etc<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_etc<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_etc<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_etc<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 오늘이 시작시간 전이고 시작시간과 끝나는 시간이 모두 존재할때-->
											<%}else if(compare_w_start_result_etc == -1 && !odto_etc.getOnline_start_date().isEmpty() && !odto_etc.getOnline_start_time().isEmpty() && !odto_etc.getOnline_end_date().isEmpty() && !odto_etc.getOnline_end_time().isEmpty()){%>			
												<span id="final_count_Online_start_time_etc<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>seconds" style="display:none;"></span>

												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_etc<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_etc<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_etc<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>	
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_etc<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
											<!-- 시작시간과 끝나는 시간이 모두 존재하고 지금시간이 응모시간 사이일때 -->
											<%}else if(compare_w_start_result_etc == 1 && compare_w_end_result_etc == -1 && !odto_etc.getOnline_start_date().isEmpty() && !odto_etc.getOnline_start_time().isEmpty() && !odto_etc.getOnline_end_date().isEmpty() && !odto_etc.getOnline_end_time().isEmpty()){%>
												<span id="final_count_Online_start_time_etc<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>seconds" style="display:none;"></span>
												
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_etc<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_etc<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_etc<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_etc<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>	
												
											<!-- 시작시간이 없고 끝나는 시간만 존재하고 지금시간이 응모 끝나는 시간보다 전일때 -->
											<%}else if(odto_etc.getOnline_start_date().isEmpty() && odto_etc.getOnline_start_time().isEmpty() && compare_w_end_result_etc == -1){%>
												<div class="draw_count_result_wrapper">
													<!-- 일 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_etc<%=i%>days"></span>
														<span id="time-label"> days </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 시 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_etc<%=i%>hours"></span>
														<span id="time-label"> hours </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 분 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_etc<%=i%>minutes"></span>
														<span id="time-label"> mins </span>
													</div>
														<!-- : -->
														<div class="draw_count_result">
															<span id="time-colon"> : </span>
															<span id="time-label"> &nbsp; </span>
														</div>
													<!-- 초 -->
													<div class="draw_count_result">
														<span id="final_count_Online_end_time_etc<%=i%>seconds"></span>
														<span id="time-label"> secs </span>
													</div>
												</div>
											<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 후일때 -->
											<%}else if(!odto_etc.getOnline_start_date().isEmpty() && !odto_etc.getOnline_start_time().isEmpty() && odto_etc.getOnline_end_date().isEmpty() && odto_etc.getOnline_end_time().isEmpty() && compare_w_start_result_etc == 1){%>
												<span id="final_count_Online_start_time_etc<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 전일때 -->
											<%}else if(!odto_etc.getOnline_start_date().isEmpty() && !odto_etc.getOnline_start_time().isEmpty() && odto_etc.getOnline_end_date().isEmpty() && odto_etc.getOnline_end_time().isEmpty() && compare_w_start_result_etc == -1) {%>
												<span id="final_count_Online_start_time_etc<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 미정 </span>
												
											<!-- 시작시간과 끝나는 시간이 모두 존재하고 오늘이 끝나는 시간을 지났을때 -->
											<%}else if(compare_w_end_result_etc == 1 && !odto_etc.getOnline_end_date().isEmpty() && !odto_etc.getOnline_end_time().isEmpty()){%>
												<span id="final_count_Online_start_time_etc<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_etc<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_etc<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_etc<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_etc<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> 응모종료 </span>
												
											<%}else{%>
												<span id="final_count_Online_start_time_etc<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_start_time_etc<%=i%>seconds" style="display:none;"></span>
												
												<span id="final_count_Online_end_time_etc<%=i%>days" style="display:none;"></span>
												<span id="final_count_Online_end_time_etc<%=i%>hours" style="display:none;"></span>
												<span id="final_count_Online_end_time_etc<%=i%>minutes" style="display:none;"></span>
												<span id="final_count_Online_end_time_etc<%=i%>seconds" style="display:none;"></span>
												
												<span class="draw_count_result" id="draw_count_result_yet"> - </span>
												
											<%}%>
										</span>
										<%}%>
									</div>
								</div>
								
								<!-- 바로가기 버튼 -->
								<div class="grid-link">
									<a href="<%=odto_etc.getOnline_link()%>" target="_blank" id="direct-link-etc<%=i%>" class="direct-link">
										<span>  바로가기 </span>
									</a>
								</div>
								
								<!-- 관리자 권한 버튼 -->
								<%if(usr_position.equals("admin")){%>
									<div id="wrapper-admin">
										<input type="button" id="adminModiBtn_etc<%=i%>" value="수정" onclick="location.href='./UpdateDrawInfo.ad?model_stylecode=<%=odto_etc.getModel_stylecode()%>&brand_id=<%=odto_etc.getBrand_id()%>'"> 
										<input type="button" id="adminDelBtn_etc<%=i%>" value="삭제" onclick="location.href='./DeleteDrawInfo.ad?model_stylecode=<%=odto_etc.getModel_stylecode()%>&brand_id=<%=odto_etc.getBrand_id()%>'">
									</div>
								<%}%>
							</div>
						</div>
					<% 
							}
						} 
					%>
				</div>
				
			</div>
		</div>	
	</div>

	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>
	
</body>
<script type="text/javascript">

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
// 					document.getElementById(id).textContent = '종료'; 	
	//				document.getElementById(drawstatus_id).textContent = '-';
	
				return; 
			} 
			var days = Math.floor(distDt / _day); 
			var hours = Math.floor((distDt % _day) / _hour); 
			var minutes = Math.floor((distDt % _hour) / _minute); 
			var seconds = Math.floor((distDt % _minute) / _second); 
			
			if(days <= 9) {
				days = '0' + days;
			}
			if(hours <= 9) {
				hours = '0' + hours;
			}
			if(minutes <= 9) {
				minutes = '0' + minutes;
			}
			if(seconds <= 9) {
				seconds = '0' + seconds;
			}
			
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
				location.href="./SearchBrand.me?model_stylecode=" + model_stylecode;
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
	
		
		//image hover 했을시 해당 브랜드의 수정 아이콘 나타내기
		$('.grid-item').hover(function(){
			//grid-kitem-kr1
			var countryi = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = countryi.split('-');
			// 제일 마지막 kr1 만 가지고 오기
			var lastElement = splitArray[splitArray.length - 1];
			
			//수정 버튼 나타내기
			$('#grid-edit-' + lastElement).show();
		}, function(){
			//grid-kitem-kr1
			var countryi = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = countryi.split('-');
			// 제일 마지막 kr1 만 가지고 오기
			var lastElement = splitArray[splitArray.length - 1];
			
			//수정 버튼 사라지게하기
			$('#grid-edit-' + lastElement).hide();
		});
		
		//수정버튼을 클릭했을시 로그인 체크하기
		$(".grid-edit").on('click', function() {
			
			
			
			//로그인 체크
			if($(".login_user").val() == "") {
				var login_confirm = confirm("정보를 수정하시려면 로그인을 해야합니다. \n로그인 페이지로 가시겠습니까?");
				if(login_confirm){
					location.href="./MemberLogin.me";
				}
			}
			else {
// 				alert("수정할 수 있습니다.");
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
				kr_drawRaw.css({"opacity" : "0.3",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
				var grid_info_writer_kr = $('#grid-info-kr' + i);
				grid_info_writer_kr.css({"pointer-events" : "auto"});
				
				var onlineLink_kr = $('a[id=onlineLink_kr' + i + ']');
				onlineLink_kr.css({"pointer-events" : "auto"});
				
				var drawCheckbox_kr = $('#drawCheckbox_kr' + i);
				drawCheckbox_kr.css({"pointer-events" : "auto"});
				
				var directLink_kr = $('#direct-link-kr' + i);
				directLink_kr.css({"pointer-events" : "auto"});
				
				var adminModiBtn = $('#adminModiBtn_kr' + i);
				adminModiBtn.css({"pointer-events" : "auto"});
				
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
				asia_drawRaw.css({"opacity" : "0.3",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
				var grid_info_writer_asia = $('#grid-info-asia' + i);
				grid_info_writer_asia.css({"pointer-events" : "auto"});
				
				var onlineLink_asia = $('a[id=onlineLink_asia' + i + ']');
				onlineLink_asia.css({"pointer-events" : "auto"});
				
				var drawCheckbox_asia = $('#drawCheckbox_asia' + i);
				drawCheckbox_asia.css({"pointer-events" : "auto"});
				
				var directLink_asia = $('#direct-link-asia' + i);
				directLink_asia.css({"pointer-events" : "auto"});
				
				var adminModiBtn = $('#adminModiBtn_asia' + i);
				adminModiBtn.css({"pointer-events" : "auto"});
				
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
				america_drawRaw.css({"opacity" : "0.3",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
				var grid_info_writer_america = $('#grid-info-america' + i);
				grid_info_writer_america.css({"pointer-events" : "auto"});
				
				var onlineLink_america = $('a[id=onlineLink_america' + i + ']');
				onlineLink_america.css({"pointer-events" : "auto"});
				
				var drawCheckbox_america = $('#drawCheckbox_america' + i);
				drawCheckbox_america.css({"pointer-events" : "auto"});
				
				var directLink_america = $('#direct-link-america' + i);
				directLink_america.css({"pointer-events" : "auto"});
				
				var adminModiBtn = $('#adminModiBtn_america' + i);
				adminModiBtn.css({"pointer-events" : "auto"});
				
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
				europe_drawRaw.css({"opacity" : "0.3",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
				var grid_info_writer_europe = $('#grid-info-europe' + i);
				grid_info_writer_europe.css({"pointer-events" : "auto"});
				
				var onlineLink_europe = $('a[id=onlineLink_europe' + i + ']');
				onlineLink_europe.css({"pointer-events" : "auto"});
				
				var drawCheckbox_europe = $('#drawCheckbox_europe' + i);
				drawCheckbox_europe.css({"pointer-events" : "auto"});
				
				var directLink_europe = $('#direct-link-europe' + i);
				directLink_europe.css({"pointer-events" : "auto"});
				
				var adminModiBtn = $('#adminModiBtn_europe' + i);
				adminModiBtn.css({"pointer-events" : "auto"});
				
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
				etc_drawRaw.css({"opacity" : "0.3",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
				var grid_info_writer_etc = $('#grid-info-etc' + i);
				grid_info_writer_etc.css({"pointer-events" : "auto"});
				
				var onlineLink_etc = $('a[id=onlineLink_etc' + i + ']');
				onlineLink_etc.css({"pointer-events" : "auto"});
				
				var drawCheckbox_etc = $('#drawCheckbox_etc' + i);
				drawCheckbox_etc.css({"pointer-events" : "auto"});
				
				var directLink_etc = $('#direct-link-etc' + i);
				directLink_etc.css({"pointer-events" : "auto"});
				
				var adminModiBtn = $('#adminModiBtn_etc' + i);
				adminModiBtn.css({"pointer-events" : "auto"});
				
				var adminModiBtn = $('#adminDelBtn_etc' + i);
				adminModiBtn.css({"pointer-events" : "auto"});
			}
		}

		
		// 응모 여부 체크박스 클릭했을시 -----------------------------------------------
		$("input:checkbox").on('click', function() {
			
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
			}

			
		});
		
	});
	
	

</script>
</html>