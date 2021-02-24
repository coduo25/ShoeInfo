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
<link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body> <!-- oncontextmenu='return false' onselectstart='return fasle' ondragstart='return false' -->

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
		
		//발매중인 산발들의 진행중인 브랜드 갯수
		int countReleasingBrand = (Integer) request.getAttribute("countReleasingBrand");

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
		SimpleDateFormat original_format2 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat original_format3 = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat date_format = new SimpleDateFormat("yyyy년 M월 d일");

		SimpleDateFormat new_format = new SimpleDateFormat("M/d HH:mm");
		SimpleDateFormat newList_format = new SimpleDateFormat("M월 d일(E) HH:mm");
		SimpleDateFormat count_format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
		
		DecimalFormat formatter = new DecimalFormat("#,###,###");
		
		// 오늘 날짜
		Date currentTime = new Date();
		String current = original_format.format(currentTime);
		Date today = original_format.parse(current);
		
		String ty_str_date = sdto.getRelease_date();
		Date date_type = original_format2.parse(ty_str_date);
		
	%>
	<input type="hidden" class="login_user" id="login_user" value="<%=user%>">
	<input type="hidden" class="login_user_position" id="login_user_position" value="<%=usr_position%>">
	<input type="hidden" class="num" id="num" value="<%=sdto.getNum()%>">
	
	<div id="wrapper" class="container">
	
		<!-- 신발 정보 container -->
		<div class="shoeinfo-container">
			<!-- 신발 이미지 -->
			<div class="shoeImg-container">
				<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>">
			</div>
			
			<!-- 신발 상세정보 -->
			<div class="shoeDetailInfo-container">
				<div class="shoeDetailInfo-name">
					<!-- 영문 이름 -->
					<div class="shoeFullName_eng">
						<span> <%=sdto.getModel_name()%></span>
					</div>
					<!-- 한글 이름 -->
					<div class="shoeFullName_kr">
						<span> <%=sdto.getModel_name_kr()%> </span>
					</div>
				</div>
				
				<!-- 상세 정보 -->
				<div class="shoeDetailInfo">
					<div class="shoeDetailInfo-subtitle">
						<p>제품 정보</p>
					</div>
					<!-- 제품 상제 정보 -->
					<div class="shoeDetailInfo-content">
						<span class="shoeinfo-cate">브랜드</span>
						<span class="shoeinfo-cateAns"><%=sdto.getBrand()%></span>
					</div>
					<div class="shoeDetailInfo-content">
						<span class="shoeinfo-cate">스타일코드</span>
						<span class="shoeinfo-cateAns"><%=sdto.getModel_stylecode()%></span>
					</div>
					<div class="shoeDetailInfo-content">
						<span class="shoeinfo-cate">컬러웨이</span>
						<span class="shoeinfo-cateAns"><%=sdto.getModel_colorway()%></span>
					</div>
					<div class="shoeDetailInfo-content">
						<span class="shoeinfo-cate">발매일(글로벌)</span>
						<span class="shoeinfo-cateAns">
							<%if(sdto.getRelease_date().contains("99")){%>
								미정
							<%}else{%>
								<%=date_format.format(date_type)%>
							<%}%>
						</span>
					</div>
					<div class="shoeDetailInfo-content" style="border-bottom:1px solid #e8e8e8; padding-bottom:20px !important;">
						<span class="shoeinfo-cate">발매가</span>
						<span class="shoeinfo-cateAns">₩ <%=formatter.format(sdto.getPrice())%></span>
					</div>
					
					<div class="shoeDetailInfo-content">
						<span class="shoeinfo-cate">조회</span>
						<span class="shoeinfo-cateAns"><i style="vertical-align:bottom;" class="fas fa-eye"></i>&nbsp;&nbsp;<%=formatter.format(sdto.getViews())%> views</span>
					</div>					
					<div class="shoeDetailInfo-content">
						<span class="shoeinfo-cate">진행 중인 발매처</span>
						<span class="shoeinfo-cateAns"><%=countReleasingBrand%>개</span>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 발매처 카테고리 -->
		<div class="countryCate-container">
			<div class="countryCate-div" id="countryCate-전체" style="color:black; border:1px solid black;">
				<span class="countryCate-span" id="countryCateSpan-전체" style="color:black; font-weight:bold;">전체</span>
			</div>
			<div class="countryCate-div" id="countryCate-한국">
				<span class="countryCate-span" id="countryCateSpan-한국">한국</span>
			</div>
			<div class="countryCate-div" id="countryCate-아시아">
				<span class="countryCate-span" id="countryCateSpan-아시아">아시아</span>
			</div>
			<div class="countryCate-div" id="countryCate-북미">
				<span class="countryCate-span" id="countryCateSpan-북미">북미</span>
			</div>
			<div class="countryCate-div" id="countryCate-유럽">
				<span class="countryCate-span" id="countryCateSpan-유럽">유럽</span>
			</div>
			<div class="countryCate-div" id="countryCate-기타">
				<span class="countryCate-span" id="countryCateSpan-기타">기타</span>
			</div>
		</div>
	
		<!-- 국가별 발매처 -->
		<div class="releaseList-container">
			<%
				for(int z=0; z<=4; z++){
					ArrayList<OnlineDTO> new_onlineList = new ArrayList<OnlineDTO>();
					ArrayList<BrandDTO> new_brandList = new ArrayList<BrandDTO>();
					String countryName_eng = "";
					String countryName_kr = "";
					//kr
					if(z==0) { new_onlineList = onlineList_kr; new_brandList = brandList_kr; countryName_eng="kr"; countryName_kr="한국"; }
					//asia
					if(z==1) { new_onlineList = onlineList_asia; new_brandList = brandList_asia; countryName_eng="asia"; countryName_kr = "아시아"; }
					//na
					if(z==2) { new_onlineList = onlineList_america; new_brandList = brandList_america; countryName_eng="na"; countryName_kr = "북미"; }
					//eu
					if(z==3) { new_onlineList = onlineList_europe; new_brandList = brandList_europe; countryName_eng="eu"; countryName_kr = "유럽"; }
					//etc
					if(z==4) { new_onlineList = onlineList_etc; new_brandList = brandList_etc; countryName_eng="etc"; countryName_kr = "기타"; }
			%>
				<div class="releaseList-countryDiv" id="releaseList-countryDiv-<%=countryName_kr%>">
					<div class="release-subtitle">
						<span><%=countryName_kr%> 발매처</span>
					</div>
					<!-- 발매리스트 -->
					<div class="releaseList-detail">
						<!-- 진행중인 리스트들 -->
						<div class="releaing-part">
							<%if(new_onlineList.isEmpty()) {%>
							<div class="noReleaseInfo">
								<span>온라인 발매 정보가 없습니다.</span>
							</div>
							<%} else {
								for(int i=0; i<new_onlineList.size(); i++){
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
									
									//4월 18일 오전 10시
									String newlist_Online_start_time = newList_format.format(original_Online_start_time);
									String newlist_Online_end_time = newList_format.format(original_Online_end_time);
									
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
									
									//남은시간 계산하기 위한 날짜데이터 (02/16/2021 10:00)
									String count_todays_start_time = count_format.format(original_Online_start_time);
									String count_todays_end_time = count_format.format(original_Online_end_time);
							%>
					
								<!-- 발매처 박스 -->
								<div class="releaseBox">
							
									<!-- 발매처 세부정보 -->
									<div class="Release-content">
									
										<!-- 진행 상태 표시 -->
										<div class="brandInfo-status-container">
											<!-- 선착인데 지금시간이 시작시간보다 전일때 -->
											<%if(odto.getOnline_method().contains("선착") && compare_w_start_result == -1) {%>
												<span id="count_todays_status<%=i%>release-status" class="release-status" style="background-color:black;">선착</span>
											<!-- 응모인데 지금시간이 시작시간보다 전일때 -->
											<%}else if(((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && !odto.getOnline_start_date().isEmpty()) && (((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_start_result == -1))){%>
												<span id="count_todays_status<%=i%>release-status" class="release-status" style="background-color:black;">응모예정</span>
												<input type="hidden" id="hidden_ing<%=i%>" value="-1">
											<!-- 응모인데 지금시간이 시작시간과 끝나는 시간 사이일때(시작시간이 존재할때)  -->
											<%}else if(((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && !odto.getOnline_start_date().isEmpty()) && (((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_start_result >= 0)) && ((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_end_result == -1)){%>
												<span id="count_todays_status<%=i%>release-status" class="release-status" style="background-color:#58af58;">응모 중</span>
												<input type="hidden" id="hidden_ing<%=i%>" value="1">
											<!-- 응모인데 지금시간이 시작시간과 끝나는 시간 사이일때(시작시간이 존재하지 않을때)  -->
											<%}else if((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_end_result == -1) {%>
												<span id="count_todays_status<%=i%>release-status" class="release-status" style="background-color:#58af58;">응모 중</span>
												<input type="hidden" id="hidden_ing<%=i%>" value="1">
											<!-- 선착이든 응모이든 지금시간이 끝나는 시간보다 뒤일때 -->
											<%} else if((odto.getOnline_method().contains("선착") && compare_w_start_result >= 0) || (((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_end_result >= 0))){%>
												<input type="hidden" id="hidden_ing<%=i%>" value="1">
											<%}%>
										</div>

										<div class="brand-box">
											<!--  발매처 이미지 --> 
											<div class="brandInfo-image-container">
												<div style="display:inline-block; position:relative; margin-bottom:0 !important;">
													<a href="<%=odto.getOnline_link()%>" target="_blank"> 
														<img src="./brand_img_upload/<%=bdto.getBrand_logo()%>" width="120" height="120" style="border:1px solid #b3b3b3; position:relative; border-radius:8px;">
														<span style="position:absolute; right:0; bottom:0;">
															<img src="./countryflag_img_upload/<%=bdto.getCountry_flag()%>" style="border:0.5px solid #d4d4d4; width:27px; height:18px;">
														</span>
													</a> 
												</div>
											</div>
											
											<!-- 발매처 이름  -->
											<div class="brandInfo-name-container">
												<!-- 발매처 이름 -->
												<div id="count_todays_status<%=i%>brandName">
													<a href="<%=odto.getOnline_link()%>" target="_blank"> 
														<span style="font-weight:bold; font-size:22px; color: #1f1f1f;"> <%=bdto.getBrand_name()%></span>
													</a>
												</div>
											</div>
										</div>

										<div class="detail-box">
											<!-- 발매 방식  -->
											<div class="brandInfo-detail-container">
												<span class="info-subTitle">발매 방식</span>
												<span class="info-content">
												<%if(odto.getOnline_method().contains("선착")) {%>
													선착순 구매  <!-- color:#ff5722; -->
												<%} else if(odto.getOnline_method().contains("드로우")) {%>
													온라인응모
												<%} else if(odto.getOnline_method().contains("이메일라플")) {%>
													이메일응모
												<%} else if(odto.getOnline_method().contains("인스타라플")) {%>
													인스타그램 응모
												<%} else if(odto.getOnline_method().contains("미정")) {%>
													미정
												<%} %>
												</span>
											</div>
			
											<!-- 결제·배송 -->
											<div class="brandInfo-detail-container">
												<span class="info-subTitle">결제·배송</span>
												<span class="info-content">
													<!-- 결제방식 -->
													<%if(odto.getOnline_method().contains("선착")) {%>
														선착순 구매
													<%} else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) {%>
														<%=odto.getBuy_method()%>
													<%}%>
													·
													<!-- 배송방식 -->
													<%if(odto.getOnline_method().contains("선착")) {%>
														<%=odto.getDelivery_method()%>
													<%} else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) {%>
														<%=odto.getDelivery_method()%>
													<%}%>
												</span>
											</div>
											
											<!-- 발매 가격 -->
											<div class="brandInfo-detail-container">
												<span class="info-subTitle">발매 가격</span>
												<span class="info-content">$190</span>
											</div>
											
											<!-- 시간 -->
											<div class="brandInfo-detail-container" style="height:38px;">
												<span class="info-subTitle">
													<%if(odto.getOnline_method().contains("선착")){%>
														선착 시간
													<%}else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")){%>
														응모 시간
													<%}%>
												</span>
												<span class="info-content" style="width:55% !important;">
													<%if(odto.getOnline_method().contains("선착")){%>
													<!-- 선착순 구매 -->
													<span> 
														<!-- 최종 시작 시간이 정확하지 않으면 -->
														<%if(odto.getOnline_start_date().isEmpty() || odto.getOnline_start_time().isEmpty()) {%>
															공지예정
														<%} else {%>
															<%=newlist_Online_start_time%>
														<%} %>
													</span>
													<%}else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")){%>
													<!-- 응모 -->
													<span>
														<!-- 최종 끝나는 시간이 정확하지 않으면 -->
														<%if(odto.getOnline_end_date().isEmpty() || odto.getOnline_end_time().isEmpty()) {%>
															공지예정
														<%} else {%>
															<%if(!odto.getOnline_start_date().isEmpty()) {%>
																<%=newlist_Online_start_time%>
															 <%}%>
															<%=" ~ " + newlist_Online_end_time%>
														<%} %>
													</span>
													<%}%>
												</span>
											</div>
											
											<!-- 남은시간 -->
											<div>
												<!-- 남은시간 -->
												<span id="count_todays_start_time<%=i%>" style="display:none;"> <%=count_todays_start_time%> </span>
												<span id="count_todays_end_time<%=i%>" style="display:none;"> <%=count_todays_end_time%> </span>
												<!-- 남은시간 상태 -->
												<span id="count_todays_status<%=i%>" style="display:none;">
													<!-- 선착일때 -->
													<%if(odto.getOnline_method().contains("선착")){%>
														<%if(compare_w_start_result >= 0) {%>
														종료
														<%} %>
													<!-- 드로우일때 -->
													<%} else if( odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) {%>
														<%if(compare_w_end_result >= 0 ){ %>
														종료
														<%} %>
													<%}%>
												</span>
												
												<span class="info-subTitle">
													남은 시간
												</span>
												<span class="info-content">
													<!-- 선착일때 -->
													<%if(odto.getOnline_method().contains("선착") && compare_w_start_result < 0){%>
														<span id="count_todays_status<%=i%>border">
															<span>
																<% if(!odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty()) {%>
																	<span class="remainTime-container">
																		<!-- 남은시간 -->
																		<span id="count_todays_status<%=i%>span" style="color:#313131;">
			<!-- 																<span style="padding-right: 1px;">선착까지</span> -->
																			<span class="remain-time" id="final_count_start_time<%=i%>days"></span>일 
																			<span class="remain-time" id="final_count_start_time<%=i%>hours" style="padding-left: 4px;"></span>시간
																			<span class="remain-time" id="final_count_start_time<%=i%>minutes"></span>분
																			<span class="remain-time" id="final_count_start_time<%=i%>seconds"></span>초
																			<span> 남음</span>
																		</span>
																	</span>
																<%} else {%>
																	<span style="font-size: 13px; font-weight: bold; color:#3e3e3e;">
																		<span style="border: 1px solid #3e3e3e; padding: 4px 12px;"> 
																		-
																		</span>
																	</span>
																<%}%>
															</span>
														</span>
													<%} else if(odto.getOnline_method().contains("선착") && compare_w_start_result >= 0){%>
														<span>
															<span style="color:rgb(218, 1, 10);">
																종료
															</span>
														</span>
													
													<!-- 드로우일때 -->
													<%} else if( (odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_end_result < 0) {%>
														<span id="count_todays_status<%=i%>border">
															<span>
																<% if(!odto.getOnline_end_date().isEmpty() && !odto.getOnline_end_time().isEmpty()) {%>
																	<span class="remainTime-container"> 
																		<!-- 남은시간 -->
																		<span id="count_todays_status<%=i%>span" style="color:#313131;">
			<!-- 																<span style="padding-right: 1px;">마감까지</span> -->
																			<span class="remain-time" id="final_count_end_time<%=i%>days"></span>일 
																			<span class="remain-time" id="final_count_end_time<%=i%>hours" style="padding-left: 4px;"></span>시간
																			<span class="remain-time" id="final_count_end_time<%=i%>minutes"></span>분
																			<span class="remain-time" id="final_count_end_time<%=i%>seconds"></span>초
																			<span> 남음</span>
																		</span>
																	</span>
																<%} else {%>
																	<span style="font-size: 13px; font-weight: bold; color: #3e3e3e;">
																		<span style="border: 1px solid #3e3e3e; padding: 4px 12px;"> 
																		-
																		</span>
																	</span>
																<%}%>
															</span>
														</span>
													<%} else if( (odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_end_result >= 0) {%>
														<span>
															<span style="color:rgb(218, 1, 10);">
																종료
															</span>
														</span>
													<%} %>
													
													<!-- 마감임박 문구-->
													<div class="remainWarning-container">
														<span id="count_todays_status<%=i%>label"></span>			
													</div>
												</span>
											</div>
										</div>
		
									</div>
								
								
								</div>
								
								
								
								
							
							
							<%}}%>
						</div>

					</div>
				</div>
			<%} %>
		</div>
	
	
	
	
	
	
		<!-- 여기부터 구리스트 -->
		<!-- 여기부터 구리스트 -->
		<!-- 여기부터 구리스트 -->
		<div style="display:none;">
			
		<!-- content -->
		<div id="content_sneakerDetail">
		
			<!-- 카테고리 -->
			<div id="cate_Detail" style="margin-top:200px;">
				<a href="./SneakerList.go"> <span> HOME </span> </a>
				<span class="arrow"> <i class="fas fa-angle-right"></i> </span>
				<span> <%=sdto.getModel_name() %></span>
			</div>
			
			<%	//관리자 권한일때 제품 기본정보 수정하는 페이지로 가는 버튼
				if(usr_position.equals("admin")){
			%>
				<a href="./UpdateSneakerInfo.ad?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>"><input type="button" value="기본정보 수정하기" style="position:absolute; right: 0; "></a>
			<%}%>
			
			<!-- 제목 -->
			<div id="title">
				<span> <%=sdto.getModel_name()%></span>
			</div>
			
			<!-- 제목(한국어) -->
			<div id="title_kr">
				<span> <%=sdto.getModel_name_kr() %> </span>
			</div>
			
			<!-- 신발 기본 정보 -->
			<div id="sneaker_Detail">
				
				<div class="sneaker_image_wrapper"> 
					<div class="sneaker_image"> 
						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>">
					</div>
				</div>
				
				<div class="draw_status" style="display:none;">
					<div onclick="fnMove('0')">
						<span id="dome_label">국내 발매처</span> <span id="divide">|</span> <span id="countDome"></span>
					</div>
					<div onclick="fnMove('1')">
						<span id="inter_label">해외 발매처</span> <span id="divide">|</span> <span id="countInte"></span>
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
								<span> - </span>
								<%}else{%> 
								<span> ₩ <%=formatter.format(sdto.getPrice())%> </span>
								<%}%>
								
							</div>
							<div class="sneaker_cate">
								<label> <strong> RELEASE DATE </strong> </label>
								<input type="hidden" id="release_date_val" value="<%=sdto.getRelease_date()%>">
								<span> 
								<%if(sdto.getRelease_date().contains("99")){%>
									미정
								<%}else{%>
									<%=date_format.format(date_type)%>
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
			<div>
				<span id="reload" style="font-size: 1.3em;"> <i class="fas fa-sync-alt"></i> </span>
				<span style="font-size: 1.3em; vertical-align: top; color: #e6e6e6;"> | </span>
				<span id="list-icon" style="color: #00cc00;"> <i class="fas fa-th-list"></i> </span>
				<span id="large-icon"> <i class="fas fa-th-large"></i> </span>
			</div>
		</div>
		
		<!-- 밟매 정보 리스트 (List Ui) -->
		<div id="content_sneakerInfo_list">
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
				<div id="grid-list-list">
					<h4 id="h4title<%=z%>"> <%=country_name_kr%> 발매처  </h4>
					
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
							
							//4월 18일 오전 10시
							String newlist_Online_start_time = newList_format.format(original_Online_start_time);
							String newlist_Online_end_time = newList_format.format(original_Online_end_time);
							
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
							
							//오늘 날짜와 최신 온라인 등록 날짜와 비교해서 이틀 안에 등록 된거면 빨간색 점 나타내기, 등록하고 이틀이 지나거나 아예 등록정보가 없다면 빨간색 점 나타내기
							// diffDay가 -2보다 적으면 빨간색 사라지게 하고 -2보다 크면 빨간색 띄우기
							int recentChk = -1;
							
							if(odto.getReg_date() != null){
								//Timestamp -> date
								Date recent_RegDate = new Date(odto.getReg_date().getTime());
								//recent_RegDate - Today 
								long diffDay = (recent_RegDate.getTime() - today.getTime()) / (24*60*60*1000);
								if(diffDay <= -1){
									recentChk = -1;
								}else if(diffDay > -1) {
									recentChk = 1;
								}
							}else if(odto.getReg_date() == null){
								recentChk = -1;
							}
					%>
						<div class="grid-wrapper-list">
							<div class="grid-item-list" id="grid-item-list-<%=country_name_eng%><%=i%>">
							
								<!-- 로고 -->
								<div class="grid-logo-list">

									<a href="<%=odto.getOnline_link()%>" target="_blank" id="onlineLink_<%=country_name_eng%><%=i%>">
										
										<div class="md-status-wrapper-list" id="md-status-wrapper-list-<%=country_name_eng%><%=i%>" <%if((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("오프라인라플") || odto.getOnline_method().contains("인스타라플") || odto.getOnline_method().contains("이메일라플")) && user != null && userDrawBrandList.contains(odto.getBrand_id())){%> style="display:table;" <%} else {%> style="display:none;" <%}%>>
											<div class="checkbg_list"> <span> &nbsp; </span> </div>
											<div class="checkicon_list"><i class="fas fa-check-circle"></i></div>
										</div>					
										
										<img id="brandlogo_img_list" src="./brand_img_upload/<%=bdto.getBrand_logo()%>" width="80" height="80">
									
										<% if(recentChk == 1){ %>
											<div class="ribbon-wrapper">
												<div class="ribbon">NEW</div>
											</div>
										<%} %>
									</a>
								</div>
								
								<!-- 응모내용 -->
								<div class="grid-content-list">
									<!-- 이름 & 국가 -->
									<div id="wrapper-name">
										<a href="<%=odto.getOnline_link()%>" target="_blank" id="onlineLink_<%=country_name_eng%><%=i%>">
											<span id="brand_name-list"> <%=bdto.getBrand_name()%> <span id="link_icon"><i class="fas fa-external-link-alt"></i></span> </span> 
										</a>		
										
										<div class="span-flag-list" id="span-flag-<%=country_name_eng%><%=i%>"> <img id="country_flag_img-list" src="./countryflag_img_upload/<%=bdto.getCountry_flag()%>" width="22" height="15"> </div>
										
										<span class="country_name_label_list" id="country-name-label-list-<%=country_name_eng%><%=i%>"><%=bdto.getCountry_name()%></span>
										
										<div class="grid-ing-list"> 
											<!-- 응모 진행중 여부 -->
											<%if(odto.getOnline_method().contains("선착")){%>
													<span></span>
											<%}else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("오프라인라플") || odto.getOnline_method().contains("인스타라플") || odto.getOnline_method().contains("이메일라플") ){%>
												<%if(compare_w_start_result == 1 && compare_w_end_result == -1 && !odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty() && !odto.getOnline_end_date().isEmpty() && !odto.getOnline_end_time().isEmpty()){%>
													<span id="draw_count_result_ing_list">응모중</span>
													<input type="hidden" id="hidden_ing_<%=country_name_eng%><%=i%>" value="1">
												<!-- 시작시간이 없고 끝나는 시간만 존재하고 지금시간이 응모 끝나는 시간보다 전일때 -->
												<%}else if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty() && compare_w_end_result == -1){%>
													<span id="draw_count_result_ing_list">응모중</span>
													<input type="hidden" id="hidden_ing_<%=country_name_eng%><%=i%>" value="1">
												<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 후일때 -->
												<%}else if(!odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty() && odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty() && compare_w_start_result == 1){%>
													<span id="draw_count_result_ing_list">응모중</span>
													<input type="hidden" id="hidden_ing_<%=country_name_eng%><%=i%>" value="1">
												<!-- 시작시간은 있고 지금시간이 시작시간 전일때 -->
												<%}else if(!odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty() && compare_w_start_result == -1){%>
													<span id="draw_count_result_before_list">응모전</span>
													<input type="hidden" id="hidden_ing_<%=country_name_eng%><%=i%>" value="-1">
												<%}else{ %>
													<span></span>
													<input type="hidden" id="hidden_ing_<%=country_name_eng%><%=i%>" value="0">
												<%}%>
											<%}else if(odto.getOnline_method().contains("-")){%>
												<span></span>
											<%}%>
										</div>
									</div>
									<!-- 기간 -->
									<div id="wrapper-period-list">
										<span>
											<!-- 선착일시 -->
											<%if(odto.getOnline_method().contains("선착")){%>
												<!-- 시작시간이 아직 미정일때 -->
												<%if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty()){%>
													<span> 추후공지예정 </span>
												<!-- 날짜는 존재하고 시간이 미정일때 -->
												<%}else if(!odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty()){%>
													<span class="start_time"> <%=new_date_start_time%> </span> 시간미정 
												<%}else{%>
												 	<span class="start_time"> <%=newlist_Online_start_time%> </span> 
												<%}%>
											<!-- 드로우 또는 미정일시 -->
											<%}else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("오프라인라플") || odto.getOnline_method().contains("인스타라플") || odto.getOnline_method().contains("이메일라플") || odto.getOnline_method().contains("-")){%> 
												<!-- 시간시간에 날짜와 시간, 끝나는 시간 날짜와 시간이 모두 없을때 -->
												<%if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty() && odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty()){%>
													<span> 추후공지예정 </span>
												<!-- 시작시간이 없고 끝나는 시간만 존재할때 -->
												<%}else if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty() && !odto.getOnline_end_date().isEmpty() && !odto.getOnline_end_time().isEmpty()){%>
													<span class="end_time"> ~ <%=newlist_Online_end_time%> 까지 </span>
												<!-- 끝나는 시간이 없고 시작시작만 존재할때 -->
												<%}else if(odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty() && !odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty()){%>
													<span class="start_time" id="start_time2"> <%=newlist_Online_start_time%> </span> ~ 추후공지
												<!-- 시작시간의 날짜만 있고 시간이 없을경우 -->
												<%}else if(!odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty()){%>
													<span class="start_time" id="start_time2"> <%=new_date_start_time%> </span> 시간미정
												<!-- 시작시간은 없고 끝나는 시간의 시간은 없고 날짜만 존재할 경우 -->
												<%}else if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty() && !odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty()){%>
													<span class="end_time"> ~ <%=new_date_end_time%> </span> 시간미정
												<%}else if(odto.getOnline_start_time().isEmpty() || odto.getOnline_end_time().isEmpty()) {%>
													<span> 추후공지예정 </span>
												<%}else{%>
													<span class="start_time" id="start_time2"><%=newlist_Online_start_time%></span> ~ <span class="end_time"><%=newlist_Online_end_time%> 까지 </span>
												<%}%>
											<%}%>
										</span>
									</div>
									
									<!-- 기타 설명들 -->
									<div id="wrapper-desc">
										<%if(odto.getOnline_method().contains("선착")){%> 
											<span style="color:#ff6600; font-weight: bold;"> <%=odto.getOnline_method()%> </span>
										<%}else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("오프라인라플") || odto.getOnline_method().contains("인스타라플") || odto.getOnline_method().contains("이메일라플")) {%>
											<span style="color:#006600; font-weight: bold;"> <%=odto.getOnline_method()%> </span> 
										<%}else if(odto.getOnline_method().contains("-")) {%>
											<span> 미정 </span>
										<%}%>
										
										<span id="slide"> | </span>
										
										<span> <%=odto.getBuy_method()%> </span>
										
										<span id="slide"> | </span>
										
										<span <%if(odto.getDelivery_method().equals("매장수령")){%> style="color: #ff7600;" <%}%>> <%=odto.getDelivery_method()%> </span>
											
										<span id="slide"> | </span>
										
										<!-- 온라인 방식이 '드로우'이고  로그인이 안되어있으면 -->
										<%if((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("오프라인라플") || odto.getOnline_method().contains("인스타라플") || odto.getOnline_method().contains("이메일라플")) && user.equals("")){%>
											<span class="draw_chkBtn" id="draw-status_list_<%=country_name_eng%><%=i%>"> 
												<input id="drawCheckbox_<%=country_name_eng%><%=i%>" type="checkbox" class="draw_checkbox"> 
											</span>
										<!-- 온라인 방식이 '드로우'이고 로그인이 되어있으면 -->
										<%}else if((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("오프라인라플") || odto.getOnline_method().contains("인스타라플") || odto.getOnline_method().contains("이메일라플")) && user != null && !userDrawBrandList.contains(odto.getBrand_id())){%>
											<span class="draw_chkBtn" id="draw-status_<%=country_name_eng%><%=i%>">
												<input type="hidden" id="<%=country_name_eng%>_model_stylecode<%=i%>" value="<%=odto.getModel_stylecode()%>">
												<input type="hidden" id="<%=country_name_eng%>_brand_id<%=i%>" value="<%=odto.getBrand_id()%>">
												<input type="hidden" id="<%=country_name_eng%>_country_name<%=i%>" value="<%=odto.getCountry_name()%>">
												<input type="checkbox" class="draw_checkbox" id="drawCheckbox_<%=country_name_eng%><%=i%>">
											</span>
										<!-- 온라인 방식이 '드로우'이고  응모완료 했으면 -->
										<%}else if((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("오프라인라플") || odto.getOnline_method().contains("인스타라플") || odto.getOnline_method().contains("이메일라플")) && user != null && userDrawBrandList.contains(odto.getBrand_id())){%>
											<span class="draw_chkBtn" id="draw-status_list_<%=country_name_eng%><%=i%>"> 
												<input type="hidden" id="<%=country_name_eng%>_model_stylecode<%=i%>" value="<%=odto.getModel_stylecode()%>">
												<input type="hidden" id="<%=country_name_eng%>_brand_id<%=i%>" value="<%=odto.getBrand_id()%>">
												<input type="hidden" id="<%=country_name_eng%>_country_name<%=i%>" value="<%=odto.getCountry_name()%>">
												<input type="checkbox" class="draw_checkbox" id="drawCheckbox_<%=country_name_eng%><%=i%>" checked>
											</span>
										<%}else {%>
											<span class="draw_chkBtn" id="draw-status_list_<%=country_name_eng%><%=i%>"> - </span>
										<%}%>
										
										<!-- 남은시간 -->
										<span id="count_Online_start_time_list_<%=country_name_eng%><%=i%>" style="display:none;"> <%=count_Online_start_time%> </span>
										<span id="count_Online_end_time_list_<%=country_name_eng%><%=i%>" style="display:none;"> <%=count_Online_end_time%> </span>
											<div id="remain-time-list">	
												<%if(odto.getOnline_method().contains("선착")){%>
												<span id="remain_time_status_<%=country_name_eng%><%=i%>"> 
													<!-- 시작 시간이 존재할때  -->
													<%if(compare_w_start_result == -1 && !odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty()) {%>
														
														<div class="draw_count_result_wrapper_list">
															<!-- 일 -->
															<div class="draw_count_result_list">
																<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>days"></span>
															</div>
															<!-- 시 -->
															<div class="draw_count_result_list">
																<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>hours"></span>
															</div>
															<!-- 분 -->
															<div class="draw_count_result_list">
																<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>minutes"></span>
															</div>	
															<!-- 초 -->
															<div class="draw_count_result_list">
																<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>seconds"></span>
															</div>
														</div>		
													
													<%}else if(compare_w_start_result == 1 && !odto.getOnline_start_date().isEmpty()) {%>
														<!-- 시작시간이 오늘보다 지났을때 -->
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
														
														<span class="draw_count_result_list" id="draw_count_result_yet"> 종료 </span>
														
													<%}else if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty()) {%>
														<!-- 시작 시간이 미정일때 -->
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
														
														<span class="draw_count_result_list" id="draw_count_result_yet"> 미정 </span>
													<%}else {%>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
														
														<span class="draw_count_result_list" id="draw_count_result_yet"> - </span>
													<%} %>
												</span>
												<%}else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("오프라인라플") || odto.getOnline_method().contains("인스타라플") || odto.getOnline_method().contains("이메일라플") || odto.getOnline_method().contains("-")){%>
												<span id="remain_time_status_<%=country_name_eng%><%=i%>">
													<!-- 시작 시간과 끝나는 시간이 아직 미정일때 -->
													<%if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty() && odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty()) {%>
														<span class="draw_count_result_list" id="draw_count_result_yet"> - </span>
													<!-- 시작 시간 또는 끝나는 시간안에 날짜는 있지만 시간이 없을때 -->
													<%}else if(odto.getOnline_start_time().isEmpty() && odto.getOnline_end_time().isEmpty()) {%>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
														
														<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
														<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
														<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
														<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
														
														<span class="draw_count_result_list" id="draw_count_result_yet"> 미정 </span>
														
													<!-- 오늘이 시작시간 전이고 시작시간과 끝나는 시간이 모두 존재할때-->
													<%}else if(compare_w_start_result == -1 && !odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty() && !odto.getOnline_end_date().isEmpty() && !odto.getOnline_end_time().isEmpty()){%>			
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
		
														<div class="draw_count_result_wrapper_list">
															<!-- 일 -->
															<div class="draw_count_result_list">
																<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>days"></span>
															</div>
															<!-- 시 -->
															<div class="draw_count_result_list">
																<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>hours"></span>
															</div>
															<!-- 분 -->
															<div class="draw_count_result_list">
																<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>minutes"></span>
															</div>	
															<!-- 초 -->
															<div class="draw_count_result_list">
																<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>seconds"></span>
															</div>
														</div>
													<!-- 시작시간과 끝나는 시간이 모두 존재하고 지금시간이 응모시간 사이일때 -->
													<%}else if(compare_w_start_result == 1 && compare_w_end_result == -1 && !odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty() && !odto.getOnline_end_date().isEmpty() && !odto.getOnline_end_time().isEmpty()){%>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
														
														<div class="draw_count_result_wrapper_list">
															<!-- 일 -->
															<div class="draw_count_result_list">
																<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>days"></span>
															</div>
															<!-- 시 -->
															<div class="draw_count_result_list">
																<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>hours"></span>
															</div>
															<!-- 분 -->
															<div class="draw_count_result_list">
																<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>minutes"></span>
															</div>
															<!-- 초 -->
															<div class="draw_count_result_list">
																<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>seconds"></span>
															</div>
														</div>	
														
													<!-- 시작시간이 없고 끝나는 시간만 존재하고 지금시간이 응모 끝나는 시간보다 전일때 -->
													<%}else if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty() && compare_w_end_result == -1){%>
														<div class="draw_count_result_wrapper_list">
															<!-- 일 -->
															<div class="draw_count_result_list">
																<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>days"></span>
															</div>
															<!-- 시 -->
															<div class="draw_count_result_list">
																<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>hours"></span>
															</div>
															<!-- 분 -->
															<div class="draw_count_result_list">
																<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>minutes"></span>
															</div>
															<!-- 초 -->
															<div class="draw_count_result_list">
																<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>seconds"></span>
															</div>
														</div>
													<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 후일때 -->
													<%}else if(!odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty() && odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty() && compare_w_start_result == 1){%>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
														
														<span class="draw_count_result_list" id="draw_count_result_yet"> 미정 </span>
														
													<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 전일때 -->
													<%}else if(!odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty() && odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty() && compare_w_start_result == -1) {%>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
														
														<span class="draw_count_result_list" id="draw_count_result_yet"> 미정 </span>
														
													<!-- 시작시간과 끝나는 시간이 모두 존재하고 오늘이 끝나는 시간을 지났을때 -->
													<%}else if(compare_w_end_result == 1 && !odto.getOnline_end_date().isEmpty() && !odto.getOnline_end_time().isEmpty()){%>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
														
														<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
														<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
														<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
														<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
														
														<span class="draw_count_result_list" id="draw_count_result_yet"> 응모종료 </span>
														
													<%}else{%>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
														<span id="final_count_Online_start_time_list_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
														
														<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>days" style="display:none;"></span>
														<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>hours" style="display:none;"></span>
														<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>minutes" style="display:none;"></span>
														<span id="final_count_Online_end_time_list_<%=country_name_eng%><%=i%>seconds" style="display:none;"></span>
														
														<span class="draw_count_result_list" id="draw_count_result_yet"> - </span>
														
													<%}%>
												</span>
												<%}%>
											</div>
										
									</div>
								</div>
							
							</div>
						</div>
					<%
							}
						}
					%>
				</div>			
			<%}%>
		</div>

		<!-- 발매 정보 리스트 (Large UI) -->
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
					<h4> <%=country_name_kr%> 발매처 </h4>
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
							//odto.setOnline_writer(rs.getString("online_writer").substring(0, rs.getString("online_writer").indexOf("@")));
							
							//coduo25
							String writer = odto.getOnline_writer().substring(0, odto.getOnline_writer().indexOf("@"));
							
							//coxxxxxxx
							String splitWriter = writer.substring(0, 4);
							String X = "";
							for(int j=0; j<(writer.length()-4); j++){
								X = X + "*";
							}
							String f_splitWriter = splitWriter.concat(X);
							
							//오늘 날짜와 최신 온라인 등록 날짜와 비교해서 이틀 안에 등록 된거면 빨간색 점 나타내기, 등록하고 이틀이 지나거나 아예 등록정보가 없다면 빨간색 점 나타내기
							// diffDay가 -2보다 적으면 빨간색 사라지게 하고 -2보다 크면 빨간색 띄우기
							int recentChk = -1;
							
							if(odto.getReg_date() != null){
								//Timestamp -> date
								Date recent_RegDate = new Date(odto.getReg_date().getTime());
								//recent_RegDate - Today 
								long diffDay = (recent_RegDate.getTime() - today.getTime()) / (24*60*60*1000);
								if(diffDay <= -1){
									recentChk = -1;
								}else if(diffDay > -1) {
									recentChk = 1;
								}
							}else if(odto.getReg_date() == null){
								recentChk = -1;
							}
					%>
						<div class="grid-wrapper">
							<div class="grid-item" id="grid-item-<%=country_name_eng%><%=i%>">
							
								<!-- 로고 사진 -->
								<div class="grid-logo">
									<a href="<%=odto.getOnline_link()%>" target="_blank" id="onlineLink_<%=country_name_eng%><%=i%>"> 
									
										<div class="md-status-wrapper" id="md-status-wrapper-<%=country_name_eng%><%=i%>" <%if((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("오프라인라플") || odto.getOnline_method().contains("인스타라플") || odto.getOnline_method().contains("이메일라플")) && user != null && userDrawBrandList.contains(odto.getBrand_id())){%> style="display:table;" <%} else {%> style="display:none;" <%}%>>
											<div class="checkbg"> <span> &nbsp; </span> </div>
											<div class="checkicon"><i class="fas fa-check-circle"></i></div>
										</div>
									
										<img id="brandlogo_img" src="./brand_img_upload/<%=bdto.getBrand_logo()%>" width="100" height="100">
									
										<% if(recentChk == 1){ %>
											<div class="ribbon-wrapper">
												<div class="ribbon">NEW</div>
											</div>
										<%} %>
										
									</a>
									<!-- 진행중 마크 -->
									<div class="grid-ing">
										<!-- 응모 진행중 여부 -->
										<%if(odto.getOnline_method().contains("선착")){%>
												<span></span>
										<%}else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("오프라인라플") || odto.getOnline_method().contains("인스타라플") || odto.getOnline_method().contains("이메일라플")){%>
											<%if(compare_w_start_result == 1 && compare_w_end_result == -1 && !odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty() && !odto.getOnline_end_date().isEmpty() && !odto.getOnline_end_time().isEmpty()){%>
												<span id="draw_count_result_ing">응모중</span>
											<!-- 시작시간이 없고 끝나는 시간만 존재하고 지금시간이 응모 끝나는 시간보다 전일때 -->
											<%}else if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty() && compare_w_end_result == -1){%>
												<span id="draw_count_result_ing">응모중</span>
											<!-- 시작시간은 있고 끝나는 시간이 없고 오늘이 시작시간 후일때 -->
											<%}else if(!odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty() && odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty() && compare_w_start_result == 1){%>
												<span id="draw_count_result_ing">응모중</span>
											<!-- 시작시간은 있고 지금시간이 시작시간 전일때 -->
											<%}else if(!odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty() && compare_w_start_result == -1){%>
												<span id="draw_count_result_before">응모전</span>
											<%}else{ %>
												<span></span>
											<%}%>
										<%}else if(odto.getOnline_method().contains("-")){%>
											<span></span>
										<%}%>
									</div>
									
									<span class="country_name_label" id="country-name-label-<%=country_name_eng%><%=i%>"><%=bdto.getCountry_name()%></span>
									
									<!-- 발매 정보 작성자 아이콘 -->
									<input type="hidden" id="logined" value="<%=user%>">
									<input type="hidden" id="writer-<%=country_name_eng%><%=i%>" value="<%=odto.getOnline_writer()%>"> 
									<div class="grid-info-writer" id="grid-info-writer-<%=country_name_eng%><%=i%>"> 작성자: <%=f_splitWriter%> </div>
									<div class="grid-info" id="grid-info-<%=country_name_eng%><%=i%>">
										<span> <i class="fas fa-user"></i> </span>
									</div>	
									
								</div>
					
								<!-- 응모 내용 -->
								<div class="grid-content">
									<!-- 이름 & 국기-->
									<div id="wrapper-name">
										<a href="<%=odto.getOnline_link()%>" target="_blank" id="onlineLink_<%=country_name_eng%><%=i%>"> <span id="brand_name"> <%=bdto.getBrand_name()%> </span> </a>		
										<span class="span-flag" id="span-flag-<%=country_name_eng%><%=i%>"> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto.getCountry_flag()%>" width="22" height="15"> </span>
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
													<span class="start_time"> <%=new_date_start_time%> </span> 시간미정
												<%}else{%>
												 	<span class="start_time"> <%=new_Online_start_time%> </span> 
												<%}%>
											<!-- 드로우 또는 미정일시 -->
											<%}else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("오프라인라플") || odto.getOnline_method().contains("인스타라플") || odto.getOnline_method().contains("이메일라플") || odto.getOnline_method().contains("-")){%> 
												<!-- 시간시간에 날짜와 시간, 끝나는 시간 날짜와 시간이 모두 없을때 -->
												<%if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty() && odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty()){%>
													<span> 추후공지예정 </span>
												<!-- 시작시간이 없고 끝나는 시간만 존재할때 -->
												<%}else if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty() && !odto.getOnline_end_date().isEmpty() && !odto.getOnline_end_time().isEmpty()){%>
													<span class="end_time"> ~ <%=new_Online_end_time%> </span>
												<!-- 끝나는 시간이 없고 시작시작만 존재할때 -->
												<%}else if(odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty() && !odto.getOnline_start_date().isEmpty() && !odto.getOnline_start_time().isEmpty()){%>
													<span class="start_time" id="start_time2"> <%=new_Online_start_time%> </span> ~ 추후공지
												<!-- 시작시간의 날짜만 있고 시간이 없을경우 -->
												<%}else if(!odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty()){%>
													<span class="start_time" id="start_time2"> <%=new_date_start_time%> </span> 시간미정
												<!-- 시작시간은 없고 끝나는 시간의 시간은 없고 날짜만 존재할 경우 -->
												<%}else if(odto.getOnline_start_date().isEmpty() && odto.getOnline_start_time().isEmpty() && !odto.getOnline_end_date().isEmpty() && odto.getOnline_end_time().isEmpty()){%>
													<span class="end_time"> ~ <%=new_date_end_time%> </span> 시간미정
												<%}else if(odto.getOnline_start_time().isEmpty() || odto.getOnline_end_time().isEmpty()) {%>
													<span> 추후공지예정 </span>
												<%}else{%>
													<span class="start_time" id="start_time2"><%=new_Online_start_time%></span> ~ <span class="end_time"><%=new_Online_end_time%></span>
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
											<%}else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("오프라인라플") || odto.getOnline_method().contains("인스타라플") || odto.getOnline_method().contains("이메일라플")) {%>
												<span style="color:#006600; font-weight: bold;"> <%=odto.getOnline_method()%> </span> 
											<%}else if(odto.getOnline_method().contains("-")) {%>
												<span> 미정 </span>
											<%}%>
										</div>
									</div>
									<!-- 구매방식 -->
									<div class="wrapper-content">
										<div> <span> 구매 </span> </div>
										<div> <span> <%=odto.getBuy_method()%> </span> </div>
									</div>
									<!-- 배송여부 -->
									<div class="wrapper-content">
										<div> <span> 배송 </span> </div>
										<div> <span <%if(odto.getDelivery_method().equals("매장수령")){%> style="color: #ff7600;" <%}%>> <%=odto.getDelivery_method()%> </span> </div>
									</div>
									<!-- 응모여부 -->
									<div class="wrapper-content" id="last-wrapper-content" >
										<div> <span> 응모 </span> </div>
										<div>
											<!-- 온라인 방식이 '드로우'이고  로그인이 안되어있으면 -->
											<%if((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("오프라인라플") || odto.getOnline_method().contains("인스타라플") || odto.getOnline_method().contains("이메일라플")) && user.equals("")){%>
												<span id="draw-status_<%=country_name_eng%><%=i%>"> <input id="drawCheckbox_<%=country_name_eng%><%=i%>" type="checkbox" class="draw_checkbox"> </span>
											<!-- 온라인 방식이 '드로우'이고 로그인이 되어있으면 -->
											<%}else if((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("오프라인라플") || odto.getOnline_method().contains("인스타라플") || odto.getOnline_method().contains("이메일라플")) && user != null && !userDrawBrandList.contains(odto.getBrand_id())){%>
												<span id="draw-status_<%=country_name_eng%><%=i%>">
													<input type="hidden" id="<%=country_name_eng%>_model_stylecode<%=i%>" value="<%=odto.getModel_stylecode()%>">
													<input type="hidden" id="<%=country_name_eng%>_brand_id<%=i%>" value="<%=odto.getBrand_id()%>">
													<input type="hidden" id="<%=country_name_eng%>_country_name<%=i%>" value="<%=odto.getCountry_name()%>">
													<input type="checkbox" class="draw_checkbox" id="drawCheckbox_<%=country_name_eng%><%=i%>">
												</span>
											<!-- 온라인 방식이 '드로우'이고  응모완료 했으면 -->
											<%}else if((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("오프라인라플") || odto.getOnline_method().contains("인스타라플") || odto.getOnline_method().contains("이메일라플")) && user != null && userDrawBrandList.contains(odto.getBrand_id())){%>
												<span id="draw-status_<%=country_name_eng%><%=i%>"> 
													<input type="hidden" id="<%=country_name_eng%>_model_stylecode<%=i%>" value="<%=odto.getModel_stylecode()%>">
													<input type="hidden" id="<%=country_name_eng%>_brand_id<%=i%>" value="<%=odto.getBrand_id()%>">
													<input type="hidden" id="<%=country_name_eng%>_country_name<%=i%>" value="<%=odto.getCountry_name()%>">
													<input type="checkbox" class="draw_checkbox" id="drawCheckbox_<%=country_name_eng%><%=i%>" checked>
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
										<%}else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("오프라인라플") || odto.getOnline_method().contains("인스타라플") || odto.getOnline_method().contains("이메일라플") || odto.getOnline_method().contains("-")){%>
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
									<!-- 관리자 권한 버튼 -->
									<%if(usr_position.equals("admin")){%>
									<span class="admin_btn">
										<a id="adminDelBtn_<%=country_name_eng%><%=i%>" href="./DeleteDrawInfo.ad?model_stylecode=<%=odto.getModel_stylecode()%>&brand_id=<%=odto.getBrand_id()%>&model_num=<%=sdto.getNum()%>">삭제</a>
									</span>
									<%}%>
									<input type="hidden" id="modi_modelStylecode-<%=country_name_eng%><%=i%>" value="<%=odto.getModel_stylecode()%>">
									<input type="hidden" id="modi_brandId-<%=country_name_eng%><%=i%>" value="<%=odto.getBrand_id()%>">
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

	
	</div>
	<!-- 여기까지 구 리스트 -->

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
			
			if(!id.includes('list')){
				if(days <= 9) { days = '0' + days; }
				if(hours <= 9) { hours = '0' + hours; }
				if(minutes <= 9) { minutes = '0' + minutes; }
				if(seconds <= 9) { seconds = '0' + seconds; }
			}else {
				days = days + 'd';
				hours = hours + 'h';
				minutes = minutes + 'm';
				seconds = seconds + 's';
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
	
	function fnMove(seq){
		var offset = $("#h4title" + seq).offset();
        $('html, body').animate({scrollTop : offset.top-100}, 400);
	}

	$(document).ready(function(){
		
		//방지
		$(document).bind('keydown', function(e){
			if(e.keyCode == 123 /* F12 */){
				e.preventDefault();
				e.returnVale = false;
			}
		});
		
		//국가별 카테고리 클릭되었을시
		$('.countryCate-div').click(function(){
			//모든 카테고리 css 없애고
			$('.countryCate-div').css('border','1px solid #f1f1f1');
			$('.countryCate-span').css({'color':'#777777','font-weight':'normal'});
			//모든 발매리스트 없애고
			$('.releaseList-countryDiv').css('display','none');
			$('.releaseList-countryDiv').fadeOut();
			
			//아이디 값 가져오기
			var divID = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = divID.split('-');
			// 제일 마지막 '한국','아시아','기타' 만 가지고 오기
			var cateCountry = splitArray[splitArray.length - 1];
			
			$('#countryCate-'+cateCountry).css('border','1px solid black');
			$('#countryCateSpan-'+cateCountry).css({'color':'black','font-weight':'bold'});
			if(cateCountry=='전체'){
				$('.releaseList-countryDiv').fadeIn();
			}else{
				$('#releaseList-countryDiv-'+cateCountry).fadeIn();
			}
		});
		
		
		
		
		//국내진행중 해외진행중
		var countDome = 0;
		var countInte = 0;
		
		$('#reload').click(function(){
			location.reload();
		});
		
		$('#list-icon').click(function(){
			$('#content_sneakerInfo').hide();
			$('#content_sneakerInfo_list').show();
			$('#list-icon').css("color","#00cc00");
			$('#large-icon').css("color","#d4d4d4");
		});
		
		$('#large-icon').click(function(){
			$('#content_sneakerInfo_list').hide();
			$('#content_sneakerInfo').show();
			$('#list-icon').css("color","#d4d4d4");
			$('#large-icon').css("color","#00cc00");
		});
		
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
			if($(".login_user").val() == "" || $(".login_user").val() == "undefined") {
				location.href="./MemberLogin.me";
			}
			//열심회원 체크
			else if($("#login_user_position").val() == "general"){
				alert("현재 등업 시스템 점검중입니다. \n서비스 이용에 불편을 드려 죄송합니다.");
// 				var upPosition_confirm = confirm("발매정보는 열심회원원만 추가할 수 있습니다. \n등업신청 페이지로 가시겠습니까?");
// 				if(upPosition_confirm){
// 					location.href="./RequestUpPos.me?email="+$("#login_user").val();
// 				}
			}
			else {
				var release_date_val = $('#release_date_val').val();
				var null_date = '99-99';
				
				if(release_date_val.indexOf(null_date) > -1){
					alert("발매일이 미정인 제품입니다.");
					return false;
				}else {
					location.href="./SearchBrand.me?model_stylecode=" + model_stylecode + "&num=" + num;
				}
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
		
		//국기를 클릭했을시
		$('.span-flag').click(function(){
			//아이디 값 가져오기
			var flagID = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = flagID.split('-');
			// 제일 마지막 kr1 만 가지고 오기
			var lastElement = splitArray[splitArray.length - 1];
			
			//국가 이름 나타내기
			$('#country-name-label-' + lastElement).slideDown(300);
			setTimeout(function() {
				$('#country-name-label-' + lastElement).slideUp(300);
			}, 4000);
		});
		$('.span-flag-list').click(function(){
			//아이디 값 가져오기
			var flagID = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = flagID.split('-');
			// 제일 마지막 kr1 만 가지고 오기
			var lastElement = splitArray[splitArray.length - 1];
			
			//국가 이름 나타내기
			$('#country-name-label-list-' + lastElement).slideDown(300);
			setTimeout(function() {
				$('#country-name-label-list-' + lastElement).slideUp(300);
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
 			
 			var writer = $('#writer-' + lastElement).val();
 			
			//로그인 체크
			if($(".login_user").val() == "" || $(".login_user").val() == "undefined") {
				location.href="./MemberLogin.me";
			}
			else if($('#login_user_position').val() == 'admin'){
				var model_num = $('#num').val()
				var model_stylecode = $('#modi_modelStylecode-' + lastElement).val();
				var brand_id = $('#modi_brandId-' + lastElement).val();
		
				location.href="./UpdateDrawInfo.me?model_stylecode=" + model_stylecode + "&brand_id=" + brand_id + "&num=" + model_num;
			}
			//작성자와 같은지 체크
			else if($('#logined').val() != writer || $('#login_user_position').val() == 'general'){
				alert("해당 발매정보는 작성자만 수정할 수 있습니다.");
				return false;
			}
			else if($('#login_user_position').val() == 'admin' || ($('#login_user_position').val() == 'prime' && $('#logined').val() == writer)){
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
			
			countDome = countDome + 1;
			
			//list
			var count_span_start_list = document.getElementById("count_Online_start_time_list_kr"+i).innerText;
			var count_span_list = document.getElementById("count_Online_end_time_list_kr"+i).innerText;
			
			countDownTimer('final_count_Online_start_time_list_kr'+i, count_span_start_list, 'draw-status_list_kr'+i);
			countDownTimer('final_count_Online_end_time_list_kr'+i, count_span_list, 'draw-status_list_kr'+i);
	
			//grid
			var count_span_start = document.getElementById("count_Online_start_time_kr"+i).innerText;
			var count_span = document.getElementById("count_Online_end_time_kr"+i).innerText;
			
			countDownTimer('final_count_Online_start_time_kr'+i, count_span_start, 'draw-status_kr'+i);
			countDownTimer('final_count_Online_end_time_kr'+i, count_span, 'draw-status_kr'+i);
			
			//남은시간란이 '응모종료'이면 해당 브랜드 줄 투명, 클릭x 바꾸기
			var remain_time_status_kr = document.getElementById('remain_time_status_kr'+i).innerText;
			if(remain_time_status_kr.match("종료") || remain_time_status_kr.match("응모종료")){
				var kr_drawRaw_list = $('#grid-item-list-kr'+i);
				kr_drawRaw_list.css({"opacity" : "0.2",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
				var kr_drawRaw = $('#grid-item-kr'+i);
				kr_drawRaw.css({"opacity" : "0.2",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
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
			
			countInte = countInte + 1;
			
			//list
			var count_span_start_list = document.getElementById("count_Online_start_time_list_asia"+i).innerText;
			var count_span_list = document.getElementById("count_Online_end_time_list_asia"+i).innerText;
			
			countDownTimer('final_count_Online_start_time_list_asia'+i, count_span_start_list, 'draw-status_list_asia'+i);
			countDownTimer('final_count_Online_end_time_list_asia'+i, count_span_list, 'draw-status_list_asia'+i);
	
			//grid
			var count_span_start = document.getElementById("count_Online_start_time_asia"+i).innerText;
			var count_span = document.getElementById("count_Online_end_time_asia"+i).innerText;
			
			countDownTimer('final_count_Online_start_time_asia'+i, count_span_start, 'draw-status_asia'+i);
			countDownTimer('final_count_Online_end_time_asia'+i, count_span, 'draw-status_asia'+i);
			
			//남은시간란이 '응모종료'이면 해당 브랜드 줄 투명, 클릭x 바꾸기
			var remain_time_status_asia = document.getElementById('remain_time_status_asia'+i).innerText;
			if(remain_time_status_asia.match("종료") || remain_time_status_asia.match("응모종료")){
				var asia_drawRaw_list = $('#grid-item-list-asia'+i);
				asia_drawRaw_list.css({"opacity" : "0.2",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
				var asia_drawRaw = $('#grid-item-asia'+i);
				asia_drawRaw.css({"opacity" : "0.2",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
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
			
			countInte = countInte + 1;
			
			//list
			var count_span_start_list = document.getElementById("count_Online_start_time_list_america"+i).innerText;
			var count_span_list = document.getElementById("count_Online_end_time_list_america"+i).innerText;
			
			countDownTimer('final_count_Online_start_time_list_america'+i, count_span_start_list, 'draw-status_list_america'+i);
			countDownTimer('final_count_Online_end_time_list_america'+i, count_span_list, 'draw-status_list_america'+i);
	
			//grid
			var count_span_start = document.getElementById("count_Online_start_time_america"+i).innerText;
			var count_span = document.getElementById("count_Online_end_time_america"+i).innerText;
			
			countDownTimer('final_count_Online_start_time_america'+i, count_span_start, 'draw-status_america'+i);
			countDownTimer('final_count_Online_end_time_america'+i, count_span, 'draw-status_america'+i);
			
			//남은시간란이 '응모종료'이면 해당 브랜드 줄 투명, 클릭x 바꾸기
			var remain_time_status_america = document.getElementById('remain_time_status_america'+i).innerText;
			if(remain_time_status_america.match("종료") || remain_time_status_america.match("응모종료")){
				var america_drawRaw_list = $('#grid-item-list-america'+i);
				america_drawRaw_list.css({"opacity" : "0.2",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
				var america_drawRaw = $('#grid-item-america'+i);
				america_drawRaw.css({"opacity" : "0.2",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
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
			
			countInte = countInte + 1;
			
			//list
			var count_span_start_list = document.getElementById("count_Online_start_time_list_europe"+i).innerText;
			var count_span_list = document.getElementById("count_Online_end_time_list_europe"+i).innerText;
			
			countDownTimer('final_count_Online_start_time_list_europe'+i, count_span_start_list, 'draw-status_list_europe'+i);
			countDownTimer('final_count_Online_end_time_list_europe'+i, count_span_list, 'draw-status_list_europe'+i);
			
			//grid
			var count_span_start = document.getElementById("count_Online_start_time_europe"+i).innerText;
			var count_span = document.getElementById("count_Online_end_time_europe"+i).innerText;
			
			countDownTimer('final_count_Online_start_time_europe'+i, count_span_start, 'draw-status_europe'+i);
			countDownTimer('final_count_Online_end_time_europe'+i, count_span, 'draw-status_europe'+i);
			
			//남은시간란이 '응모종료'이면 해당 브랜드 줄 투명, 클릭x 바꾸기
			var remain_time_status_europe = document.getElementById('remain_time_status_europe'+i).innerText;
			//alert(remain_time_status_europe);
			if(remain_time_status_europe.match("종료") || remain_time_status_europe.match("응모종료")){
				var europe_drawRaw_list = $('#grid-item-list-europe'+i);
				europe_drawRaw_list.css({"opacity" : "0.2",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
				var europe_drawRaw = $('#grid-item-europe'+i);
				europe_drawRaw.css({"opacity" : "0.2",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
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
			
			countInte = countInte + 1;
			
			//list
			var count_span_start_list = document.getElementById("count_Online_start_time_list_etc"+i).innerText;
			var count_span_list = document.getElementById("count_Online_end_time_list_etc"+i).innerText;
			
			countDownTimer('final_count_Online_start_time_list_etc'+i, count_span_start_list, 'draw-status_list_etc'+i);
			countDownTimer('final_count_Online_end_time_list_etc'+i, count_span_list, 'draw-status_list_etc'+i);
	
			//grid
			var count_span_start = document.getElementById("count_Online_start_time_etc"+i).innerText;
			var count_span = document.getElementById("count_Online_end_time_etc"+i).innerText;
			
			countDownTimer('final_count_Online_start_time_etc'+i, count_span_start, 'draw-status_etc'+i);
			countDownTimer('final_count_Online_end_time_etc'+i, count_span, 'draw-status_etc'+i);
			
			//남은시간란이 '응모종료'이면 해당 브랜드 줄 투명, 클릭x 바꾸기
			var remain_time_status_etc = document.getElementById('remain_time_status_etc'+i).innerText;
			if(remain_time_status_etc.match("종료") || remain_time_status_etc.match("응모종료")){
				var etc_drawRaw_list = $('#grid-item-list-etc'+i);
				etc_drawRaw_list.css({"opacity" : "0.2",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
				var etc_drawRaw = $('#grid-item-etc'+i);
				etc_drawRaw.css({"opacity" : "0.2",  "border" : "1px solid rgb(212 212 212)", "pointer-events" : "none"});
				
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
		
		//countDome
		//countInte
		if(countDome > 0){
			$('#countDome').css('color', '#08a05c');
		}
		if(countInte > 0){
			$('#countInte').css('color', '#08a05c');
		}
		$('#countDome').text(countDome);
		$('#countInte').text(countInte);
		
		// 응모 여부 체크박스 클릭했을시 -----------------------------------------------
		$(".draw_checkbox").on('click', function() {
			
			//로그인 체크
			if($(".login_user").val() == "") {
				var login_confirm = confirm("응모여부를 체크할려면 로그인을 해야합니다. \n로그인 페이지로 가시겠습니까?");
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
				
				//응모시간 전이면 alert 띄우기
				var hidden_ing = $('#hidden_ing_' + checkbox_country + checkbox_id_num).val();
				if(hidden_ing < 0){
					alert("아직 응모 전입니다. \n응모기간에 응모여부를 체크 할 수 있습니다.");
					return false;
				}
				else {
					var num = $('.num').val();
					
					var brand_id = $('#'+checkbox_country +'_brand_id'+checkbox_id_num).val();
					
					var idx2 = brand_id.indexOf("_");
					var brand = brand_id.substring(idx2+1);

					if($(this).is(":checked")==true){
						//체크가 안된 상태에서 응모여부 물어보기
						$(this).prop("checked", false);
						var draw_confirm_yes = confirm("<응모여부체크>\n- " + brand + " 사이트에서 신발을 응모 했습니까?");
					   	if(draw_confirm_yes){
					   		$.ajax({
					   			type:'get',
					   			url:'./addUserDrawInfoAction.me',
					   			data: 'model_num=' + num + '&model_stylecode='+$('#'+checkbox_country +'_model_stylecode'+checkbox_id_num).val()+'&brand_id='+$('#'+checkbox_country +'_brand_id'+checkbox_id_num).val()+'&country_name='+$('#'+checkbox_country +'_country_name'+checkbox_id_num).val(),
					   			dataType: 'html',
					   			success:function(data) {
									
					   			},error:function(request,status,error){
								 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
								}
					   		});
					   		$('#md-status-wrapper-list-'+ checkbox_country + checkbox_id_num).fadeIn(400);
							$('#md-status-wrapper-'+ checkbox_country + checkbox_id_num).fadeIn(400);
							
					   		$(this).prop("checked", true);
					   		$(this).css({'color':'green', 'font-size':16});
					   	}else {
					   		$(this).prop("checked", false);
					   	}
					}
					else if($(this).is(":not(:checked)")==true){
						//체크가 된 상태에서 응모여부 물어보기
						$(this).prop("checked", true);
						var draw_confirm_no = confirm("해당 사이트 응모를 취소했습니까?");
					   	if(draw_confirm_no){
					   		$.ajax({
					   			type:'get',
					   			url:'./deleteUserDrawInfoAction.me',
					   			data: 'model_num=' + num + '&model_stylecode='+$('#'+checkbox_country +'_model_stylecode'+checkbox_id_num).val()+'&brand_id='+$('#'+checkbox_country +'_brand_id'+checkbox_id_num).val()+'&country_name='+$('#'+checkbox_country +'_country_name'+checkbox_id_num).val(),
					   			dataType: 'html',
					   			success:function(data) {
					   				
					   			},error:function(request,status,error){
								 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
								}
					   		});
					   		$(this).prop("checked", false);	
					   		$('#md-status-wrapper-list-'+ checkbox_country + checkbox_id_num).fadeOut(400);
			   				$('#md-status-wrapper-'+ checkbox_country + checkbox_id_num).fadeOut(400);
					   	}else {
					   		$(this).prop("checked", true);
					   	}
					}
					
				}
				
			}

		});	
		
	});
	
	document.onmousedown=disableclick;
// 	status="Right click is not availble";
	
	function disableclick(event){
		if(event.button==2){
// 			alert(status);
			return false;
		}
	}
	
	

</script>
</html>