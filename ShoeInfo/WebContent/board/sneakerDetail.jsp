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
<link href="https://fonts.googleapis.com/css2?family=Kelly+Slab&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Oxanium&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body> <!-- oncontextmenu='return false' onselectstart='return false' ondragstart='return false' -->

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
		
		//인기상품
		ArrayList<SneakerDTO> popularList = (ArrayList<SneakerDTO>) request.getAttribute("popularList");

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
		
		//북미
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
		SimpleDateFormat dot_format = new SimpleDateFormat("yyyy.MM.dd");

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
	<input type="hidden" class="model_stylecode" id="model_stylecode" value="<%=sdto.getModel_stylecode()%>">
	
	<div id="wrapper" class="container">
	
		<!-- 좌측 사이드 바 -->
		<jsp:include page="/include/leftSideBar.jsp" />
	
		<!-- 신발 정보 container -->
		<div class="shoeinfo-container" style="margin-top:30px !important; padding-top:0 !important;">
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
								<%=dot_format.format(date_type)%>
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
				<span class="countryCate-span" id="countryCateSpan-전체" style="color:black; font-weight:bold;">전체(<%=onlineList_kr.size()+onlineList_asia.size()+onlineList_america.size()+onlineList_europe.size()+onlineList_etc.size()%>)</span>
			</div>
			<div class="countryCate-div" id="countryCate-한국">
				<span class="countryCate-span" id="countryCateSpan-한국">한국(<%=onlineList_kr.size()%>)</span>
			</div>
			<div class="countryCate-div" id="countryCate-아시아">
				<span class="countryCate-span" id="countryCateSpan-아시아">아시아(<%=onlineList_asia.size()%>)</span>
			</div>
			<div class="countryCate-div" id="countryCate-북미">
				<span class="countryCate-span" id="countryCateSpan-북미">북미(<%=onlineList_america.size()%>)</span>
			</div>
			<div class="countryCate-div" id="countryCate-유럽">
				<span class="countryCate-span" id="countryCateSpan-유럽">유럽(<%=onlineList_europe.size()%>)</span>
			</div>
			<div class="countryCate-div" id="countryCate-기타">
				<span class="countryCate-span" id="countryCateSpan-기타">기타(<%=onlineList_etc.size()%>)</span>
			</div>
		</div>
		
		<!-- 중간 광고 970x90 -->
		<div class="betweenAds-container">
			<div class="betweenAds-box">
				
			</div>
		</div>
	
		<!-- 국가별 발매처 -->
		<div class="releaseList-container" style='margin-bottom:40px !important;'>
			<%
				for(int z=0; z<=4; z++){
					ArrayList<OnlineDTO> new_onlineList = new ArrayList<OnlineDTO>();
					ArrayList<BrandDTO> new_brandList = new ArrayList<BrandDTO>();
					String countryName_eng = "";
					String countryName_kr = "";
					int countBrand = 0;
					//kr
					if(z==0) { new_onlineList = onlineList_kr; new_brandList = brandList_kr; countryName_eng="kr"; countryName_kr="한국"; countBrand = onlineList_kr.size(); }
					//asia
					if(z==1) { new_onlineList = onlineList_asia; new_brandList = brandList_asia; countryName_eng="asia"; countryName_kr = "아시아"; countBrand = onlineList_asia.size(); }
					//na
					if(z==2) { new_onlineList = onlineList_america; new_brandList = brandList_america; countryName_eng="na"; countryName_kr = "북미"; countBrand = onlineList_america.size(); }
					//eu
					if(z==3) { new_onlineList = onlineList_europe; new_brandList = brandList_europe; countryName_eng="eu"; countryName_kr = "유럽"; countBrand = onlineList_europe.size(); }
					//etc
					if(z==4) { new_onlineList = onlineList_etc; new_brandList = brandList_etc; countryName_eng="etc"; countryName_kr = "기타"; countBrand = onlineList_etc.size(); }
			%>
				<div class="releaseList-countryDiv" id="releaseList-countryDiv-<%=countryName_kr%>">
					<div class="sub-title">
						<h4> <%=countryName_kr%> 발매처 <span style="font-weight:normal; font-size:16px; color:#666;">총 <%=countBrand%>건</span> </h4>
					</div>
					
					<!-- 국가별 테이블 -->
					<div class="country-table">
						<table>
							<tr>
								<th style="width:6%"> 번호 </th>
								<th style="width:8%"> 진행상태 </th>
								<th style="width:25%"> 발매처 </th>
								<th style="width:35%"> 응모시간 </th>
								<th> 결제·배송 </th>
								<th> 링크 </th>
							</tr>
							<%if(new_onlineList.isEmpty()) {%>
							<tr>
								<td colspan="6" style="padding:50px; border-bottom:1px solid #c1c1c1;">온라인 발매 정보가 없습니다.</td>
							<tr>
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
							<tr>
								<!-- 번호 -->
								<td><%=i+1%></td>
								
								<!-- 진행상태 -->
								<td>
									<!-- 선착인데 지금시간이 시작시간보다 전일때 -->
									<%if(odto.getOnline_method().contains("선착") && compare_w_start_result == -1) {%>
										<span id="count_todays_status<%=countryName_eng%><%=i%>release-status" class="release-status" style="background-color:black;">선착</span>
									<!-- 응모인데 지금시간이 시작시간보다 전일때 -->
									<%}else if(((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && !odto.getOnline_start_date().isEmpty()) && (((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_start_result == -1))){%>
										<span id="count_todays_status<%=countryName_eng%><%=i%>release-status" class="release-status" style="background-color:black;">응모예정</span>
										<input type="hidden" id="hidden_ing<%=countryName_eng%><%=i%>" value="-1">
									<!-- 응모인데 지금시간이 시작시간과 끝나는 시간 사이일때(시작시간이 존재할때)  -->
									<%}else if(((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && !odto.getOnline_start_date().isEmpty()) && (((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_start_result >= 0)) && ((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_end_result == -1)){%>
										<span id="count_todays_status<%=countryName_eng%><%=i%>release-status" class="release-status" style="background-color:#58af58;">응모 중</span>
										<input type="hidden" id="hidden_ing<%=countryName_eng%><%=i%>" value="1">
									<!-- 응모인데 지금시간이 시작시간과 끝나는 시간 사이일때(시작시간이 존재하지 않을때)  -->
									<%}else if((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_end_result == -1) {%>
										<span id="count_todays_status<%=countryName_eng%><%=i%>release-status" class="release-status" style="background-color:#58af58;">응모 중</span>
										<input type="hidden" id="hidden_ing<%=countryName_eng%><%=i%>" value="1">
									<!-- 선착이든 응모이든 지금시간이 끝나는 시간보다 뒤일때 -->
									<%} else if((odto.getOnline_method().contains("선착") && compare_w_start_result >= 0) || (((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_end_result >= 0))){%>
										<span id="count_todays_status<%=countryName_eng%><%=i%>release-status" class="release-status" style="display:none;">종료</span>
										<input type="hidden" id="hidden_ing<%=countryName_eng%><%=i%>" value="1">
									<%}%>
								</td>
								
								<!-- 발매처 -->
								<td class="brandLogoName">
									<div style="display:flex; align-items:center;">
										<div class="sneakerDetail-logo">
											<a href="<%=odto.getOnline_link()%>" target="_blank"> 
												<img id="brandlogo_img" src="./brand_img_upload/<%=bdto.getBrand_logo()%>">
											</a>
										</div>
										<div class="sneakerDetail-brandName">
											<div class="sneakerDetail-brandNameTxt">
												<span><%=bdto.getBrand_name()%> </span>
											</div>
											<div class="sneakerDetail-releaseMethod">
												<span>
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
										</div>
									</div>
								</td>
								
								<!-- 응모시간 -->
								<td>
									<!-- 시간 -->
									<div class="sneakerDetail-releaseTime">
										<span class="info-content" style="width:50% !important;">
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
									<div class="sneakerDetail-remainTime">
										<span>00일 00시간 00분 00초 남음</span>
									</div>
								</td>
								
								<!-- 결제 배송 -->
								<td>
									<!-- 결제 -->
									<div class="sneakerDetail-payMethod">
										<%if(odto.getOnline_method().contains("선착")) {%>
											선착순 구매
										<%} else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) {%>
											<%=odto.getBuy_method()%>
										<%}%>
									</div>
									·
									<!-- 배송 -->
									<div class="sneakerDetail-deliveryMethod">
										<%if(odto.getOnline_method().contains("선착")) {%>
											<%=odto.getDelivery_method()%>
										<%} else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) {%>
											<%=odto.getDelivery_method()%>
										<%}%>
									</div>
								
								</td>
								
								<!-- 링크 -->
								<td>
									<!-- 응모참여 버튼 -->
									<div class="links-container" id="links-container-<%=countryName_eng%>-<%=i%>">	
										<!-- 참여체크박스 -->
										<%if(odto.getOnline_method().contains("선착")) {%>
												<div class="draw_checkBox" style="border:0 !important;">
													<span>-</span>
												</div>
										<%} else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) {%>
											<%if(!userDrawBrandList.contains(bdto.getBrand_id())){%>
												<input type="hidden" id="drawCheck_status<%=countryName_eng%><%=i%>" value="참여전">
												<!-- 참여전 체크박스 -->
												<div class="draw_checkBox" id="draw_checkBox<%=countryName_eng%><%=i%>" style="background-color:white; color:#1f1f1f;">
													<span><i class="fas fa-check"></i> <span id="drawCheck_statusTxt<%=countryName_eng%><%=i%>"></span></span>
												</div> 
											<%}else{%>
												<input type="hidden" id="drawCheck_status<%=countryName_eng%><%=i%>" value="참여완료">
												<!-- 참여완료 체크박스 -->
												<div class="draw_checkBox" id="draw_checkBox<%=countryName_eng%><%=i%>" style="background-color:#1f1f1f; color:white;">
													<span><i class="fas fa-check"></i> <span id="drawCheck_statusTxt<%=countryName_eng%><%=i%>">응모함</span></span>
												</div> 
											<%}%>
										<%}%>
									</div>
								</td>
								
							</tr>
							<%} }%>
						</table>
					</div>
					
				</div>
			
			
			
				<div class="releaseList-countryDiv" id="releaseList-countryDiv-<%=countryName_kr%>" style="display:none;">
					<div class="release-subtitle">
						<h4>
							<span style="padding-right:15px;"><%=countryName_kr%> 발매처</span>
						</h4>
					</div>
					<!-- 발매리스트 -->
					<div class="releaseList-detail" id="releaseList-detail<%=countryName_eng%>">
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
								<div class="releaseBox" id="count_todays_status<%=countryName_eng%><%=i%>releaseBox">
								
									<input type="hidden" id="brand_id<%=countryName_eng%><%=i%>" value="<%=bdto.getBrand_id()%>">
									<input type="hidden" id="country_name<%=countryName_eng%><%=i%>" value="<%=bdto.getCountry_name()%>">
								
									<!-- 발매처 세부정보 -->
									<div class="Release-content">
									
										<!-- 진행 상태 표시 -->
										<div class="brandInfo-status-container" id="brandInfo-status-container<%=countryName_eng%><%=i%>" style="<%if(userDrawBrandList.contains(bdto.getBrand_id())){%>opacity: 0.3;<%}%>">
											<!-- 선착인데 지금시간이 시작시간보다 전일때 -->
											<%if(odto.getOnline_method().contains("선착") && compare_w_start_result == -1) {%>
												<span id="count_todays_status<%=countryName_eng%><%=i%>release-status" class="release-status" style="background-color:black;">선착</span>
											<!-- 응모인데 지금시간이 시작시간보다 전일때 -->
											<%}else if(((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && !odto.getOnline_start_date().isEmpty()) && (((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_start_result == -1))){%>
												<span id="count_todays_status<%=countryName_eng%><%=i%>release-status" class="release-status" style="background-color:black;">응모예정</span>
												<input type="hidden" id="hidden_ing<%=countryName_eng%><%=i%>" value="-1">
											<!-- 응모인데 지금시간이 시작시간과 끝나는 시간 사이일때(시작시간이 존재할때)  -->
											<%}else if(((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && !odto.getOnline_start_date().isEmpty()) && (((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_start_result >= 0)) && ((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_end_result == -1)){%>
												<span id="count_todays_status<%=countryName_eng%><%=i%>release-status" class="release-status" style="background-color:#58af58;">응모 중</span>
												<input type="hidden" id="hidden_ing<%=countryName_eng%><%=i%>" value="1">
											<!-- 응모인데 지금시간이 시작시간과 끝나는 시간 사이일때(시작시간이 존재하지 않을때)  -->
											<%}else if((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_end_result == -1) {%>
												<span id="count_todays_status<%=countryName_eng%><%=i%>release-status" class="release-status" style="background-color:#58af58;">응모 중</span>
												<input type="hidden" id="hidden_ing<%=countryName_eng%><%=i%>" value="1">
											<!-- 선착이든 응모이든 지금시간이 끝나는 시간보다 뒤일때 -->
											<%} else if((odto.getOnline_method().contains("선착") && compare_w_start_result >= 0) || (((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_end_result >= 0))){%>
												<span id="count_todays_status<%=countryName_eng%><%=i%>release-status" class="release-status" style="display:none;">종료</span>
												<input type="hidden" id="hidden_ing<%=countryName_eng%><%=i%>" value="1">
											<%}%>
										</div>

										<div class="brand-box" id="brand-box<%=countryName_eng%><%=i%>" style="<%if(userDrawBrandList.contains(bdto.getBrand_id())){%>background-color:#b7b7b7;<%}%>">
											<!--  발매처 이미지 --> 
											<div class="brandInfo-image-container" id="brandInfo-image-container<%=countryName_eng%><%=i%>" style="<%if(userDrawBrandList.contains(bdto.getBrand_id())){%>opacity: 0.3;<%}%>">
												<div style="display:inline-block; position:relative; margin-bottom:0 !important;">
													<a href="<%=odto.getOnline_link()%>" target="_blank"> 
														<img src="./brand_img_upload/<%=bdto.getBrand_logo()%>" width="120" height="120" style="border:1px solid #b3b3b3; position:relative; border-radius:8px;">
														<span style="position:absolute; right:0; bottom:0;">
															<img src="./countryflag_img_upload/<%=bdto.getCountry_flag()%>" style="border:0.5px solid #d4d4d4; width:29px; height:19px;">
														</span>
													</a> 
												</div>
											</div>
											
											<!-- 발매처 이름  -->
											<div class="brandInfo-name-container" id="brandInfo-name-container<%=countryName_eng%><%=i%>" style="<%if(userDrawBrandList.contains(bdto.getBrand_id())){%>opacity: 0.3;<%}%>">
												<!-- 발매처 이름 -->
												<div id="count_todays_status<%=countryName_eng%><%=i%>brandName">
													<a href="<%=odto.getOnline_link()%>" target="_blank"> 
														<span id="count_todays_status<%=countryName_eng%><%=i%>brandNameTxt" style="font-weight:bold; font-size:20px; color: #1f1f1f; <%if((odto.getOnline_method().contains("선착") && compare_w_start_result >= 0) || (((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_end_result >= 0))) {%>text-decoration:line-through; text-decoration-thickness:2px;<%}%>"> 
															<%=bdto.getBrand_name()%>
														</span>
													</a>
												</div>
											</div>
											
											<!-- 응모참여 버튼 -->
											<div class="links-container" id="links-container-<%=countryName_eng%>-<%=i%>">	
												<!-- 참여체크박스 -->
												<%if(odto.getOnline_method().contains("선착")) {%>
														<div class="draw_checkBox" style="border:0 !important;">
															<span>-</span>
														</div>
												<%} else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) {%>
													<%if(!userDrawBrandList.contains(bdto.getBrand_id())){%>
														<input type="hidden" id="drawCheck_status<%=countryName_eng%><%=i%>" value="참여전">
														<!-- 참여전 체크박스 -->
														<div class="draw_checkBox" id="draw_checkBox<%=countryName_eng%><%=i%>" style="background-color:white; color:#1f1f1f;">
															<span><i class="fas fa-check"></i> <span id="drawCheck_statusTxt<%=countryName_eng%><%=i%>"></span></span>
														</div> 
													<%}else{%>
														<input type="hidden" id="drawCheck_status<%=countryName_eng%><%=i%>" value="참여완료">
														<!-- 참여완료 체크박스 -->
														<div class="draw_checkBox" id="draw_checkBox<%=countryName_eng%><%=i%>" style="background-color:#1f1f1f; color:white;">
															<span><i class="fas fa-check"></i> <span id="drawCheck_statusTxt<%=countryName_eng%><%=i%>">응모함</span></span>
														</div> 
													<%}%>
												<%}%>
											</div>
										</div>
										
										<!-- 응모 종료 되었을때 나타나는 drop down/up 버튼 -->
										<div class="releasedDropDown-container" id="count_todays_status<%=countryName_eng%><%=i%>releasedDropDown" 
										<%if((odto.getOnline_method().contains("선착") && compare_w_start_result >= 0) || (((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_end_result >= 0))) {%>
											style="display:flex !important;"
										<%}%>
										>
											<div class="releasedDropDown" id="releasedDropDown-<%=countryName_eng%>-<%=i%>">
												<span>자세히 <i class="fas fa-caret-down"></i></span>
											</div>
											<div class="releasedDropUp" id="releasedDropUp-<%=countryName_eng%>-<%=i%>" style="display:none;">
												<span>자세히 <i class="fas fa-caret-up"></i></span>
											</div>
										</div>
									
										<!-- 디테일 박스 -->
										<div class="detail-box" id="count_todays_status<%=countryName_eng%><%=i%>detail-box" style="<%if(userDrawBrandList.contains(bdto.getBrand_id())){%>opacity: 0.3;<%}%><%if((odto.getOnline_method().contains("선착") && compare_w_start_result >= 0) || (((odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_end_result >= 0))) {%>display:none !important;<%}%>">
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
											
											<!-- 시간 -->
											<div class="brandInfo-detail-container" style="height:38px; margin-bottom:15px !important;">
												<span class="info-subTitle">
													<%if(odto.getOnline_method().contains("선착")){%>
														선착 시간
													<%}else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")){%>
														응모 시간
													<%}%>
												</span>
												<span class="info-content" style="width:50% !important;">
													<%if(odto.getOnline_method().contains("선착")){%>
													<!-- 선착순 구매 -->
													<span style="display:-webkit-box; text-overflow:ellipsis; word-wrap:break-word; overflow:hidden; -webkit-line-clamp:2; -webkit-box-orient:vertical; min-height:38px;"> 
														<!-- 최종 시작 시간이 정확하지 않으면 -->
														<%if(odto.getOnline_start_date().isEmpty() || odto.getOnline_start_time().isEmpty()) {%>
															공지예정
														<%} else {%>
															<%=newlist_Online_start_time%>
														<%} %>
													</span>
													<%}else if(odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")){%>
													<!-- 응모 -->
													<span style="display:-webkit-box; text-overflow:ellipsis; word-wrap:break-word; overflow:hidden; -webkit-line-clamp:2; -webkit-box-orient:vertical; min-height:38px;">
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
											<div class="brandInfo-detail-container" style="border-bottom:0px !important;">
												<!-- 남은시간 -->
												<span id="count_todays_start_time<%=countryName_eng%><%=i%>" style="display:none;"> <%=count_todays_start_time%> </span>
												<span id="count_todays_end_time<%=countryName_eng%><%=i%>" style="display:none;"> <%=count_todays_end_time%> </span>
												<!-- 남은시간 상태 -->
												<span id="count_todays_status<%=countryName_eng%><%=i%>" style="display:none;">
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
																		<span id="count_todays_status<%=countryName_eng%><%=i%>span" style="color:#313131;">
			<!-- 																<span style="padding-right: 1px;">선착까지</span> -->
																			<span class="remain-time" id="final_count_start_time<%=countryName_eng%><%=i%>days"></span>일 
																			<span class="remain-time" id="final_count_start_time<%=countryName_eng%><%=i%>hours" style="padding-left: 4px;"></span>시간
																			<span class="remain-time" id="final_count_start_time<%=countryName_eng%><%=i%>minutes"></span>분
																			<span class="remain-time" id="final_count_start_time<%=countryName_eng%><%=i%>seconds"></span>초
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
														<span>-</span>
													
													<!-- 드로우일때 -->
													<%} else if( (odto.getOnline_method().contains("드로우") || odto.getOnline_method().contains("라플")) && compare_w_end_result < 0) {%>
														<span id="count_todays_status<%=i%>border">
															<span>
																<% if(!odto.getOnline_end_date().isEmpty() && !odto.getOnline_end_time().isEmpty()) {%>
																	<span class="remainTime-container"> 
																		<!-- 남은시간 -->
																		<span id="count_todays_status<%=countryName_eng%><%=i%>span" style="color:#313131;">
			<!-- 																<span style="padding-right: 1px;">마감까지</span> -->
																			<span class="remain-time" id="final_count_end_time<%=countryName_eng%><%=i%>days"></span>일 
																			<span class="remain-time" id="final_count_end_time<%=countryName_eng%><%=i%>hours" style="padding-left: 4px;"></span>시간
																			<span class="remain-time" id="final_count_end_time<%=countryName_eng%><%=i%>minutes"></span>분
																			<span class="remain-time" id="final_count_end_time<%=countryName_eng%><%=i%>seconds"></span>초
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
														<span>-</span>
													<%} %>
													<!-- 마감임박 문구-->
													<div class="remainWarning-container">
														<span id="count_todays_status<%=countryName_eng%><%=i%>label"></span>			
													</div>
												</span>
											</div>
											
											<!-- 발매 가격 -->
											<div class="brandInfo-detail-container">
												<span class="info-subTitle">발매 가격</span>
												<span class="info-content">-</span>
											</div>
			
											<!-- 결제·배송 -->
											<div class="brandInfo-detail-container" style="margin-bottom:0px !important;">
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

										</div>

									</div>

								
								</div>
								
								
								

							<%}}%>
						</div>
					</div>
					
					<!-- 종료된 리스트들 -->
					<div class="released-part" id="count_todays_status<%=countryName_eng%>released-part" style="display:none;">
						
					</div>
					
				</div>
			<%} %>
		</div>
		
		<!-- 중간 광고 970x250 -->
		<div class="betweenAds2-container" style="padding-bottom:40px;">
			<div class="betweenAds2-box">
				
			</div>
		</div>
		
		<jsp:include page="/include/rightSideBar.jsp" />
		
		
	</div>

	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>
	
</body>
<script type="text/javascript">

	const countDownTimer = function (id, date, statusId) { 
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
			
			if(hours <= 9) { hours = '0' + hours; }
			if(minutes <= 9) { minutes = '0' + minutes; }
			if(seconds <= 9) { seconds = '0' + seconds; }

			if(days || hours || minutes || seconds){
				document.getElementById(id + 'days').textContent = days; 
				document.getElementById(id + 'hours').textContent = hours; 
				document.getElementById(id + 'minutes').textContent = minutes; 
				document.getElementById(id + 'seconds').textContent = seconds;
			}
			
			//임박시간 표시 하기
			//남은시간에서 시간:분:초 = 00:19:59 부터 남은시간 붉은색으로 나타내기, 선착이면 '선착임박', 드로우면 '마감임박' 문구 나타내기
			
			//숫자 형태를 문자 형태로 바꾸끼 (편법)
			days += "";
			hours += "";
			minutes += "";
			seconds += "";
			
			//문자 형태의 시간 합체
			var finalTime = days + hours + minutes + seconds;
			
			//문자 형태의 최종시간을 다시 숫자 형태로 바꾸기
			finalTime *= 1;
			
			//20분 남았을때
			if(finalTime >= 0000001 && finalTime <= 0001459){
				//시간 붉은색으로
				$('#'+statusId+'span').css("color", "#da010a");
				//임박글자 넣기 (선착이면 선착임박, 드로우면 마감임박)
				if(id.match('start')){
					document.getElementById(statusId+'label').textContent = '(임박!)';	
				}
				if(id.match('end')){
					document.getElementById(statusId+'label').textContent = '(임박!)';	
				}
				//임박표시 ON
				$('#'+statusId+'label').css("display", "block");
			}
			//종료되었을때
			else if(finalTime == 0000000){
				document.getElementById(statusId).textContent = '종료';
				document.getElementById(statusId+'span').textContent = '종료';
				
				//브랜드이름 줄 긋기
				$('#'+statusId+'brandNameTxt').css({"text-decoration":"line-through", "text-decoration-thickness":"2px"})
				//응모 status (응모중,응모예정) 없애기
				$('#'+statusId+'release-status').css("display", "none");
				//남은시간 '종료'원래 회색으로 바꾸끼
				$('#'+statusId+'span').css("color", "#949494");
				//임박표시 OFF
				$('#'+statusId+'label').css("display", "none");
				//상세정보 자세히 보는 버튼 활성화
				$('#'+statusId+'releasedDropDown').slideDown('fast');
				//상세정보 박스 사라지게하기
				$('#'+statusId+'detail-box').slideUp('fast');
				
				//statusId에서 숫자만 뺀 문자열
				var statusIdTxt = statusId.replace(/\d+/g, '');
				//종료된 발매처 모으는 div 키기
				$('#'+statusIdTxt+'released-part').css('display','block');
				//종료된 박스 밑으로 보내기
				$('#'+statusId+'releaseBox').appendTo('#'+statusIdTxt+'released-part');
			}
			//임박하지 않고 계속 진행중일때
			else {
				document.getElementById(statusId).textContent = '진행중';	
				//임박표시 OFF
				$('#'+statusId+'label').css("display", "none");
			}
		} 
		timer = setInterval(showRemaining, 1000); 
	}
	
	
	$(document).ready(function(){
		
		//방지
		$(document).bind('keydown', function(e){
			if(e.keyCode == 123 /* F12 */){
				e.preventDefault();
				e.returnVale = false;
			}
		});
		
		//온라인 한국 리스트
		var onlineList_kr = [];
		<c:forEach items="${onlineList_kr}" var="onlineList_kr">
			onlineList_kr.push("${onlineList_kr}");
		</c:forEach>
		
		for(var i=0; i<onlineList_kr.length; i++){
			var release_status = $('#count_todays_statuskr'+i+'release-status').text();
			if(release_status == '종료'){
				$('#count_todays_statuskrreleased-part').css('display','block');
				//kr과 i를 가지고 해당 브랜드박스 전체 이동시키기
				$('#count_todays_statuskr'+i+'releaseBox').appendTo('#count_todays_statuskrreleased-part');
			}
			
			//남은시간 계산하기
			var count_span_start = document.getElementById("count_todays_start_timekr"+i).innerText;
			var count_span_end = document.getElementById("count_todays_end_timekr"+i).innerText;
			
			var noTimeData = '0002';
			//시작시간에 0002가 포함 = 무조건 끝나느시간이다 = 엔드로만 가지고 놀기
			if(count_span_start.match(noTimeData)){
				countDownTimer('final_count_end_timekr'+i, count_span_end, 'count_todays_statuskr'+i);
			}
			//끝나는시간에 0002가 포함 = 무조건 시작시간(선착) = 시작으로만 가지고 놀기
			if(count_span_end.match(noTimeData)) {
				countDownTimer('final_count_start_timekr'+i, count_span_start, 'count_todays_statuskr'+i);
			}
			//둘다 포함이 안되어있다 = 드로우밖에 없음 = 끝나는 시간으로만 가지고 놀기
			if(!count_span_start.match(noTimeData) && !count_span_end.match(noTimeData)){
				countDownTimer('final_count_end_timekr'+i, count_span_end, 'count_todays_statuskr'+i);	
			}
		}
		
		//온라인 아시아 리스트
		var onlineList_asia = [];
		<c:forEach items="${onlineList_asia}" var="onlineList_asia">
			onlineList_asia.push("${onlineList_asia}");
		</c:forEach>
		
		for(var i=0; i<onlineList_asia.length; i++){
			var release_status = $('#count_todays_statusasia'+i+'release-status').text();
			if(release_status == '종료'){
				$('#count_todays_statusasiareleased-part').css('display','block');
				//kr과 i를 가지고 해당 브랜드박스 전체 이동시키기
				$('#count_todays_statusasia'+i+'releaseBox').appendTo('#count_todays_statusasiareleased-part');
			}
			
			//남은시간 계산하기
			var count_span_start = document.getElementById("count_todays_start_timeasia"+i).innerText;
			var count_span_end = document.getElementById("count_todays_end_timeasia"+i).innerText;
			
			var noTimeData = '0002';
			//시작시간에 0002가 포함 = 무조건 끝나느시간이다 = 엔드로만 가지고 놀기
			if(count_span_start.match(noTimeData)){
				countDownTimer('final_count_end_timeasia'+i, count_span_end, 'count_todays_statusasia'+i);
			}
			//끝나는시간에 0002가 포함 = 무조건 시작시간(선착) = 시작으로만 가지고 놀기
			if(count_span_end.match(noTimeData)) {
				countDownTimer('final_count_start_timeaisa'+i, count_span_start, 'count_todays_statusasia'+i);
			}
			//둘다 포함이 안되어있다 = 드로우밖에 없음 = 끝나는 시간으로만 가지고 놀기
			if(!count_span_start.match(noTimeData) && !count_span_end.match(noTimeData)){
				countDownTimer('final_count_end_timeasia'+i, count_span_end, 'count_todays_statusasia'+i);	
			}
		}
		
		//온라인 북미 리스트
		var onlineList_america = [];
		<c:forEach items="${onlineList_america}" var="onlineList_america">
			onlineList_america.push("${onlineList_america}");
		</c:forEach>
		
		for(var i=0; i<onlineList_america.length; i++){
			var release_status = $('#count_todays_statusna'+i+'release-status').text();
			if(release_status == '종료'){
				$('#count_todays_statusnareleased-part').css('display','block');
				//kr과 i를 가지고 해당 브랜드박스 전체 이동시키기
				$('#count_todays_statusna'+i+'releaseBox').appendTo('#count_todays_statusnareleased-part');
			}
			
			//남은시간 계산하기
			var count_span_start = document.getElementById("count_todays_start_timena"+i).innerText;
			var count_span_end = document.getElementById("count_todays_end_timena"+i).innerText;
			
			var noTimeData = '0002';
			//시작시간에 0002가 포함 = 무조건 끝나느시간이다 = 엔드로만 가지고 놀기
			if(count_span_start.match(noTimeData)){
				countDownTimer('final_count_end_timena'+i, count_span_end, 'count_todays_statusna'+i);
			}
			//끝나는시간에 0002가 포함 = 무조건 시작시간(선착) = 시작으로만 가지고 놀기
			if(count_span_end.match(noTimeData)) {
				countDownTimer('final_count_start_timena'+i, count_span_start, 'count_todays_statusna'+i);
			}
			//둘다 포함이 안되어있다 = 드로우밖에 없음 = 끝나는 시간으로만 가지고 놀기
			if(!count_span_start.match(noTimeData) && !count_span_end.match(noTimeData)){
				countDownTimer('final_count_end_timena'+i, count_span_end, 'count_todays_statusna'+i);	
			}
		}
		
		//온라인 유럽 리스트
		var onlineList_europe = [];
		<c:forEach items="${onlineList_europe}" var="onlineList_europe">
			onlineList_europe.push("${onlineList_europe}");
		</c:forEach>
		
		for(var i=0; i<onlineList_europe.length; i++){
			var release_status = $('#count_todays_statuseu'+i+'release-status').text();
			if(release_status == '종료'){
				$('#count_todays_statuseureleased-part').css('display','block');
				//kr과 i를 가지고 해당 브랜드박스 전체 이동시키기
				$('#count_todays_statuseu'+i+'releaseBox').appendTo('#count_todays_statuseureleased-part');
			}
			
			//남은시간 계산하기
			var count_span_start = document.getElementById("count_todays_start_timeeu"+i).innerText;
			var count_span_end = document.getElementById("count_todays_end_timeeu"+i).innerText;
			
			var noTimeData = '0002';
			//시작시간에 0002가 포함 = 무조건 끝나느시간이다 = 엔드로만 가지고 놀기
			if(count_span_start.match(noTimeData)){
				countDownTimer('final_count_end_timeeu'+i, count_span_end, 'count_todays_statuseu'+i);
			}
			//끝나는시간에 0002가 포함 = 무조건 시작시간(선착) = 시작으로만 가지고 놀기
			if(count_span_end.match(noTimeData)) {
				countDownTimer('final_count_start_timeeu'+i, count_span_start, 'count_todays_statuseu'+i);
			}
			//둘다 포함이 안되어있다 = 드로우밖에 없음 = 끝나는 시간으로만 가지고 놀기
			if(!count_span_start.match(noTimeData) && !count_span_end.match(noTimeData)){
				countDownTimer('final_count_end_timeeu'+i, count_span_end, 'count_todays_statuseu'+i);	
			}
		}
		
		//온라인 기타 리스트
		var onlineList_etc = [];
		<c:forEach items="${onlineList_etc}" var="onlineList_etc">
		onlineList_etc.push("${onlineList_etc}");
		</c:forEach>
		
		for(var i=0; i<onlineList_etc.length; i++){
			var release_status = $('#count_todays_statusetc'+i+'release-status').text();
			if(release_status == '종료'){
				$('#count_todays_statusetcreleased-part').css('display','block');
				//kr과 i를 가지고 해당 브랜드박스 전체 이동시키기
				$('#count_todays_statusetc'+i+'releaseBox').appendTo('#count_todays_statusetcreleased-part');
			}
			
			//남은시간 계산하기
			var count_span_start = document.getElementById("count_todays_start_timeetc"+i).innerText;
			var count_span_end = document.getElementById("count_todays_end_timeetc"+i).innerText;
			
			var noTimeData = '0002';
			//시작시간에 0002가 포함 = 무조건 끝나느시간이다 = 엔드로만 가지고 놀기
			if(count_span_start.match(noTimeData)){
				countDownTimer('final_count_end_timeetc'+i, count_span_end, 'count_todays_statusetc'+i);
			}
			//끝나는시간에 0002가 포함 = 무조건 시작시간(선착) = 시작으로만 가지고 놀기
			if(count_span_end.match(noTimeData)) {
				countDownTimer('final_count_start_timeetc'+i, count_span_start, 'count_todays_statusetc'+i);
			}
			//둘다 포함이 안되어있다 = 드로우밖에 없음 = 끝나는 시간으로만 가지고 놀기
			if(!count_span_start.match(noTimeData) && !count_span_end.match(noTimeData)){
				countDownTimer('final_count_end_timeetc'+i, count_span_end, 'count_todays_statusetc'+i);	
			}
		}
		
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
		
		//종료된 발매처 정보 Down 버튼 눌렸을시
		$('.releasedDropDown').click(function(){
			$(this).css('display','none');
			
			//아이디 값 가져오기
			var divID = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = divID.split('-');
			//뒤에서 두번째 = 국가
			var country = splitArray[splitArray.length - 2];
			//맨 마지막 = 번호
			var number = splitArray[splitArray.length - 1];
			
			//DropUp 버튼 나타내기
			$('#releasedDropUp-'+country+'-'+number).css('display','block');
			
			$('#count_todays_status'+country+number+'detail-box').slideDown('fast');
			$('#infoDropDown-'+country+'-'+number).slideDown('fast');
		});
		
		//종료된 발매처 정보 Up 버튼 눌렸을시
		$('.releasedDropUp').click(function(){
			$(this).css('display','none');
			
			//아이디 값 가져오기
			var divID = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = divID.split('-');
			//뒤에서 두번째 = 국가
			var country = splitArray[splitArray.length - 2];
			//맨 마지막 = 번호
			var number = splitArray[splitArray.length - 1];
			
			//DropUp 버튼 나타내기
			$('#releasedDropDown-'+country+'-'+number).css('display','block');
			
			$('#count_todays_status'+country+number+'detail-box').slideUp('fast');
			$('#infoDropDown-'+country+'-'+number).slideUp('fast');
			$('#infoDropUp-'+country+'-'+number).css('display','none');
		});
		
		//응모 여부 체크박스 클릭했을시 -----------------------------------------------------------
		$('.links-container').click(function(){
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
				//아이디 값 가져오기
				var divID = $(this).attr('id');
				// - 기준으로 자르기
				var splitArray = divID.split('-');
				//뒤에서 두번째 = 국가
				var country = splitArray[splitArray.length - 2];
				//맨 마지막 = 번호
				var number = splitArray[splitArray.length - 1];
				
				//응모시간 전이면 alert 띄우기
				var hidden_ing = $('#hidden_ing' + country + number).val();
				if(hidden_ing < 0){
					alert("아직 응모 전입니다. \n응모기간에 응모여부를 체크 할 수 있습니다.");
					return false;
				}
				else {
					//응모참여 status
					var draw_status = $('#drawCheck_status'+country+number).val();
					//신발모델 번호
					var model_num = $('.num').val();
					//신발 스타일코드
					var model_stylecode = $('.model_stylecode').val();
					//브랜드 아이디
					var brand_id = $('#brand_id'+country+number).val();
					//국가 이름
					var country_name = $('#country_name'+country+number).val();

					//참여전인데 체크박스 눌릴시 -> 참여완료
					if(draw_status == '참여전'){
						
						//status 참여완료로 바꾸기
						$('#drawCheck_status'+country+number).val('참여완료');
						$.ajax({
				   			type:'get',
				   			url:'./addUserDrawInfoAction.me',
				   			data: 'model_num='+model_num+ '&model_stylecode='+model_stylecode+'&brand_id='+brand_id+'&country_name='+country_name,
				   			dataType: 'html',
				   			success:function(data) {
								
				   			},error:function(request,status,error){
							 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
							}
				   		});
						//참여전 표시 -> 참여완료로 바꾸기
				   		$('#brand-box'+country+number).css('background-color','#b7b7b7');
						$('#brandInfo-status-container'+country+number).css('opacity','0.3');
						$('#brandInfo-image-container'+country+number).css('opacity','0.3');
						$('#brandInfo-name-container'+country+number).css('opacity','0.3');
						
						$('#draw_checkBox'+country+number).css('color','white');
						$('#draw_checkBox'+country+number).css('background-color','#1f1f1f');
				   		$('#drawCheck_statusTxt'+country+number).text("응모함");
						
						$('#count_todays_status'+country+number+'detail-box').css('opacity','0.3');
					}
					//참여완료인데 체크박스 눌릴시 -> 참여전
					else if(draw_status == '참여완료'){
						//status 참여전으로 바꾸기
						$('#drawCheck_status'+country+number).val('참여전');
						$.ajax({
				   			type:'get',
				   			url:'./deleteUserDrawInfoAction.me',
				   			data: 'model_num='+model_num+ '&model_stylecode='+model_stylecode+'&brand_id='+brand_id+'&country_name='+country_name,
				   			dataType: 'html',
				   			success:function(data) {
				   				
				   			},error:function(request,status,error){
							 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
							}
				   		});
						//참여완료 표시 -> 참여전으로 바꾸기
						$('#brand-box'+country+number).css('background-color','#e0e0e0');
						$('#brandInfo-status-container'+country+number).css('opacity','1');
						$('#brandInfo-image-container'+country+number).css('opacity','1');
						$('#brandInfo-name-container'+country+number).css('opacity','1');
						
						$('#draw_checkBox'+country+number).css('color','#1f1f1f');
						$('#draw_checkBox'+country+number).css('background-color','white');
						$('#drawCheck_statusTxt'+country+number).text("");

						$('#count_todays_status'+country+number+'detail-box').css('opacity','1');
					}
				}
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