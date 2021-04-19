<%@page import="java.util.Vector"%>
<%@page import="net.sneaker.db.SneakerDAO"%>
<%@page import="net.brand.db.BrandDTO"%>
<%@page import="net.online.db.OnlineDTO"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sneaker.db.SneakerDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="naver-site-verification" content="1f84b34b248bbb6ede2e4bc541314b75b85ad622" />
<meta name="google-site-verification" content="uyV__fKW-YmjcHKhP2X068ZRP_lGPkqQrOP_hHaopq0" />
<meta name="description" content="국내/해외 프리미엄 스니커즈 발매처 정리 사이트, 국내 발매 정보 응모하기, 해외 발매 정보 응모하기, 나의 응모 현황 정리" />

<meta property="og:type" content="website">
<meta property="og:description" content="국내/해외 프리미엄 스니커즈 발매처 정리 사이트, 국내 발매 정보 응모하기, 해외 발매 정보 응모하기, 나의 응모 현황 정리">
<meta property="og:url" content="https://www.shoeinfo.co.kr">

<meta name="viewport" content="initial-scale=1.0, user-scalable=0, maximum-scale=1.0, width=device-width" />
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>Main | SHOE INFO.</title>
<link href="./css/board/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:400&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kelly+Slab&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Oxanium&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>	 <!--  -->
	<%
		String user = (String) session.getAttribute("email");
		if(user == null){
			user="";
		}
		
		//인기상품
		ArrayList<SneakerDTO> popularList = (ArrayList<SneakerDTO>) request.getAttribute("popularList");
		
		//사용자 응모한 브랜드 리스트
		List<String> userDrawBrandList = (List<String>) request.getAttribute("userDrawBrandList");
	
		//오늘의 발매 리스트(4개)
		ArrayList<OnlineDTO> onlineList_todays = (ArrayList<OnlineDTO>) request.getAttribute("onlineList_todays");
		ArrayList<BrandDTO> brandList_todays = (ArrayList<BrandDTO>) request.getAttribute("brandList_todays");
		ArrayList<SneakerDTO> sneakerList_todays = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList_todays");
		
		//발매중 신발들, 발매예정 신발들, 발매완료 신발들
		ArrayList<SneakerDTO> releaseSneakerList = (ArrayList<SneakerDTO>) request.getAttribute("releaseSneakerList");
		ArrayList<SneakerDTO> releasingSneakerList = (ArrayList<SneakerDTO>) request.getAttribute("releasingSneakerList");
		//발매중인 산발들의 진행중인 브랜드 갯수
		ArrayList<Integer> countReleasingBrandList = (ArrayList<Integer>) request.getAttribute("countReleasingBrandList");
		
		//이번주 snkrs 리스트
		ArrayList<OnlineDTO> onlineList_snkrs = (ArrayList<OnlineDTO>) request.getAttribute("onlineList_snkrs");
		ArrayList<SneakerDTO> sneakerList_snkrs = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList_snkrs");
		
		SimpleDateFormat original_format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		SimpleDateFormat date_format = new SimpleDateFormat("M월 d일(E)");
		SimpleDateFormat time_format = new SimpleDateFormat("a hh:mm");
		
		SimpleDateFormat month_format = new SimpleDateFormat("M월");
		
		SimpleDateFormat newList_format = new SimpleDateFormat("M/d(E) HH:mm");

		SimpleDateFormat snkrs_format = new SimpleDateFormat("M/d일(E) a hh:mm");
		
		SimpleDateFormat count_format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
		
		//오늘날짜
		Date currentTime = new Date();
		String current = format.format(currentTime);
		Date today = format.parse(current);
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<input type="hidden" class="login_user" id="login_user" value="<%=user%>">

	<!-- Main Content -->
	<div id="wrapper" class="container">
	
		<!-- 좌측 사이드 바 -->
		<jsp:include page="/include/leftSideBar.jsp" />

		<!-- Pad - 중간 광고 728x90 -->
		<div class="betweenAdsPad-container" style="display:none; margin-top:20px;">
			<div class="betweenAdsPad-box">
				<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- Pad - 중간 가로 728x90 -->
				<ins class="adsbygoogle"
				     style="display:inline-block;width:728px;height:90px"
				     data-ad-client="ca-pub-8228533393025739"
				     data-ad-slot="1478795480"></ins>
				<script>
				     (adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>
		</div>
		
		<!-- Phone - 중간 광고 320x50 -->
		<div class="betweenAdsPhone-container" style="display:none; margin-top:20px;">
			<div class="betweenAdsPhone-box">
				<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- Phone - 중간 가로 320x50 -->
				<ins class="adsbygoogle"
				     style="display:inline-block;width:320px;height:50px"
				     data-ad-client="ca-pub-8228533393025739"
				     data-ad-slot="7050400956"></ins>
				<script>
				     (adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>
		</div>

		<!-- 발매 중 리스트 -->
		<div class="releasing-container" style="margin-top:40px; padding-top:0 !important;">
		
			<div class="sub-title">	
<!-- 			<div class="sub-title-wline"> -->
				<h4> 발매 중 라인업 </h4>
				<div class="allReleasingButton" onclick="location.href='./AllReleasingList.go'">
					<span> 전체보기 </span>
				</div>
			</div>
			
			<div class="desc-container">
				<span> 진행 중인 발매처가 있는 제품들 </span>
			</div>
			
			<div class="releasing-table-container">
				<% if(releasingSneakerList.isEmpty()){ %>
					<div>
						발매 중인 신발이 없습니다.
					</div>
				<% } else {
					for(int i=releasingSneakerList.size()-1; i>=0; i--){
						SneakerDTO releasing_sdto = releasingSneakerList.get(i);	
						int countBrand = countReleasingBrandList.get(i);
				%>
					<div class="mainSneaker-container">
						<a href="./SneakerDetail.go?model_stylecode=<%=releasing_sdto.getModel_stylecode()%>&num=<%=releasing_sdto.getNum()%>">
							<!-- 신발이미지 -->
							<div class="mainSneaker-image">
								<img src="./sneaker_img_upload/<%=releasing_sdto.getImage()%>">
							</div>
							<!-- 신발 이름 + 해당 신발 발매처 횟수 -->
							<div class="mainSneakerShoeInfo-container">
								<!-- 이름 칸 -->
								<div class="mainSneakerShoeInfo-name">
									<span> <%=releasing_sdto.getModel_name_kr()%> </span>
								</div>
								<!-- 발매처 횟수 -->
								<div class="mainSneaker-brandCount">
									<span class="mainSneaker-brandCountTxt">	
										발매처 <%=countBrand%>+
									</span>
								</div>
							</div>
						</a>
					</div>
				<% } } %>
			</div>
		</div>
		
		<!-- 광고 970x250 -->
		<div class="betweenAds2-container">
			<div class="betweenAds2-box">
				<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- PC - 가로하단 970x250 -->
				<ins class="adsbygoogle"
				     style="display:inline-block;width:970px;height:250px"
				     data-ad-client="ca-pub-8228533393025739"
				     data-ad-slot="4591758574"></ins>
				<script>
				     (adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>
		</div>

		<!-- Pad - 중간 광고 728x300 -->
		<div class="betweenAdsPad2-container" style="display:none;">
			<div class="betweenAdsPad2-box">
				<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- Pad - 중간 가로 728x300 광고 -->
				<ins class="adsbygoogle"
				     style="display:inline-block;width:728px;height:300px"
				     data-ad-client="ca-pub-8228533393025739"
				     data-ad-slot="5581692023"></ins>
				<script>
				     (adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>
		</div>
		
		<!-- Phone - 중간 광고 320x100 -->
		<div class="betweenAdsPhone-container" style="display:none;">
			<div class="betweenAdsPhone-box">
				<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- Phone - 중간 광고 320x100 -->
				<ins class="adsbygoogle"
				     style="display:inline-block;width:320px;height:100px"
				     data-ad-client="ca-pub-8228533393025739"
				     data-ad-slot="6612536818"></ins>
				<script>
				     (adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>
		</div>
		
		<!-- 인기제품 -->
		<div class="popular-container" style="display:none;">
			<div class="sub-title">	
				<h4> 인기 제품 </h4>
			</div>
			<div class="popular-table-container">
				<% if(popularList.isEmpty()) {%>
					<div>
						인기상품 업데이트 중
					</div>
				<% } else { 
					for (int i=0; i<popularList.size(); i++) {
						SneakerDTO popular_sdto = popularList.get(i);
				%>
					<div class="popular-product" onclick="location.href='./SneakerDetail.go?model_stylecode=<%=popular_sdto.getModel_stylecode()%>&num=<%=popular_sdto.getNum()%>'" style="cursor:pointer;">
						<!-- 순위 -->
						<div class="popular-rank">
							<span><%=i+1%>위</span>
						</div>
						<!-- 이미지 -->
						<div class="popular-imgBox">
							<img src="./sneaker_img_upload/<%=popular_sdto.getImage()%>" width="50" height="38">
						</div>
					</div>
				<% } } %>
			</div>
		</div>
		
		<!-- 오늘의 모든 발매 리스트 -->
		<div class="todaysRelease-container">
			<div class="sub-title">
				<h4> 오늘의 발매처 </h4>
				<div class="allButton" onclick="location.href='./TodaysReleaseList.go'">
					<span> 전체보기 </span>
				</div>
			</div>
			
			<div class="desc-container">
				<span> 오늘 마감 예정이거나 진행 중인 발매처 </span>
			</div>
			
			<div class="todays-table-container">
				<table id="onlineList_todays_table">
					<tr>
						<th style="width:7%;"> 번호 </th>
						<th style="width:65%;"> 발매처 정보 </th>
						<th style="width:28%;"> 발매제품 </th>
					</tr>
					<% if(onlineList_todays.isEmpty() || brandList_todays.isEmpty()){ %>
						<tr>
							<td colspan="4"> 발매 정보가 없습니다. </td>
						</tr>
					<% } else { 
						for(int i=0; i<onlineList_todays.size(); i++){
							OnlineDTO odto_todays = (OnlineDTO) onlineList_todays.get(i);
							BrandDTO bdto_todays = (BrandDTO) brandList_todays.get(i);
							SneakerDTO sdto_todays = (SneakerDTO) sneakerList_todays.get(i);
							
							String online_start_date = "";
							String online_start_time = "";
							String online_end_date = "";
							String online_end_time = "";
							
							if((odto_todays.getOnline_start_date().isEmpty())){
								online_start_date = "0000-00-00";
							} else{
								online_start_date = odto_todays.getOnline_start_date();
							}
							
							if((odto_todays.getOnline_start_time().isEmpty())){
								online_start_time = "24:00";
							} else{
								online_start_time = odto_todays.getOnline_start_time();
							}
							
							if((odto_todays.getOnline_end_date().isEmpty())){
								online_end_date = "0000-00-00";
							} else{
								online_end_date = odto_todays.getOnline_end_date();
							}
							
							if((odto_todays.getOnline_end_time().isEmpty())){
								online_end_time = "24:00";
							} else{
								online_end_time = odto_todays.getOnline_end_time();
							}
							
							Date original_Online_start_time = format.parse(online_start_date + " " + online_start_time);
							Date original_Online_end_time = format.parse(online_end_date + " " + online_end_time);
							
							//O월 OO일 오전/오후 12시
							String newlist_Online_start_time = newList_format.format(original_Online_start_time);
							String newlist_Online_end_time = newList_format.format(original_Online_end_time);
							
							//남은시간 계산하기 위한 날짜데이터 (02/16/2021 10:00)
							String count_todays_start_time = count_format.format(original_Online_start_time);
							String count_todays_end_time = count_format.format(original_Online_end_time);
							
							//비교하기 위한 날짜포멧들 
							//현재 시간과 시작 시간 비교	(현재시간이 시작시간보다 지났으면  1)
							//현재 시간과 끝나는 시간 비교	(현재시간이 끝나는시간보다 지났으면  1)
							int compare_w_start_result = today.compareTo(original_Online_start_time);	//응모 시작하는 시간
							int compare_w_end_result = today.compareTo(original_Online_end_time); 		//응모 끝나는 시간
					%>
						<tr class="release<%=odto_todays.getCountry_name()%>"
						<%if((odto_todays.getOnline_method().contains("선착") && compare_w_start_result >= 0) || (((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && compare_w_end_result >= 0))){%>
							id="releaseEnd<%=i%>tr" style="display:none;"
						<%} else {%> 
							id="release<%=i%>tr"
						<%}%>>
							<!-- 번호 -->
							<td class="num-container">
								<div><%=i+1%>.</div>
							</td>
							
							<!-- 발매처 정보-->
							<td id="release-info<%=i%>" class="release-info">
							<input type="hidden" id="brand_id<%=i%>" value="<%=bdto_todays.getBrand_id()%>">
							<input type="hidden" id="country_name<%=i%>" value="<%=bdto_todays.getCountry_name()%>">
							
								<!-- 발매처 기본정보 -->
								<div class="todaysRelease-content1"  id="count_todays_status<%=i%>releaseInfo" style="<%if(userDrawBrandList.contains(bdto_todays.getBrand_id()+sdto_todays.getModel_stylecode())){%>opacity: 0.3;<%}%>">
									<!-- 발매처 이미지 --> 
									<div class="brand-info-image-container">
										<a href="<%=odto_todays.getOnline_link()%>" target="_blank"> 
											<img src="./brand_img_upload/<%=bdto_todays.getBrand_logo()%>" class="brandImg">
											<span style="position:absolute; right:0; bottom:0;">
												<img src="./countryflag_img_upload/<%=bdto_todays.getCountry_flag()%>" class="countryflag">
											</span> 
										</a>
									</div>
									
									<!-- 모바일 버전 브랜드이름 + 방식 + 결제 + 배송 -->
									<div class="phone-brand-info-container">
										<!-- 응모처 이름 -->
										<div class="phone-brandName" id="phone-count_todays_status<%=i%>brandName">
											<a href="<%=odto_todays.getOnline_link()%>" target="_blank"> 
												<span id="count_todays_status<%=i%>brandNameTxt" class="todays-brandName" style="<%if((odto_todays.getOnline_method().contains("선착") && compare_w_start_result >= 0) || (((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && compare_w_end_result >= 0))){%>text-decoration:line-through; text-decoration-thickness:2px;<%}%>"><%=bdto_todays.getBrand_name()%> <i class="fas fa-external-link-alt"></i></span>
											</a>
										</div>
										<!-- 발매방식 -->
										<div class="phone-releaseMethod">
											<span>
												<%if(odto_todays.getOnline_method().contains("선착")) {%>
													선착순 구매  <!-- color:#ff5722; -->
												<%} else if(odto_todays.getOnline_method().contains("드로우")) {%>
													온라인응모
												<%} else if(odto_todays.getOnline_method().contains("이메일라플")) {%>
													이메일응모
												<%} else if(odto_todays.getOnline_method().contains("인스타라플")) {%>
													인스타그램 응모
												<%} else if(odto_todays.getOnline_method().contains("미정")) {%>
													미정
												<%} %>
											</span>
										</div>
										<!-- 결제 배송 -->
										<div class="phone-payDel">
											<!-- 결제방식 -->
											<%if(odto_todays.getOnline_method().contains("선착")) {%>
												선착순 구매
											<%} else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) {%>
												<%=odto_todays.getBuy_method()%>
											<%}%>
											·
											<!-- 배송방식 -->
											<%if(odto_todays.getOnline_method().contains("선착")) {%>
												<%=odto_todays.getDelivery_method()%>
											<%} else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) {%>
												<%=odto_todays.getDelivery_method()%>
											<%}%>
										</div>
									</div>				
								</div>
								
								<!-- 발매처 세부정보 -->
								<div class="todaysRelease-content2">
									<!-- 발매처 정보 -->
									<div class="brand-info-container" id="brand-info-container<%=i%>" style="margin-bottom: 17px; <%if(userDrawBrandList.contains(bdto_todays.getBrand_id()+sdto_todays.getModel_stylecode())){%>opacity: 0.3;<%}%>">
										<!-- 응모처 이름 -->
										<div id="count_todays_status<%=i%>brandName">
											<a href="<%=odto_todays.getOnline_link()%>" target="_blank"> 
												<span id="count_todays_status<%=i%>brandNameTxt" class="todays-brandName" style="<%if((odto_todays.getOnline_method().contains("선착") && compare_w_start_result >= 0) || (((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && compare_w_end_result >= 0))){%>text-decoration:line-through; text-decoration-thickness:2px;<%}%>"><%=bdto_todays.getBrand_name()%> <i class="fas fa-external-link-alt"></i></span>
											</a>
											
											<!-- 진행 상태 -->
											
											<!-- 선착인데 지금시간이 시작시간보다 전일때 -->
											<%if(odto_todays.getOnline_method().contains("선착") && compare_w_start_result == -1) {%>
												<span id="count_todays_status<%=i%>release-status" class="release-status" style="background-color:black;">선착</span>
											<!-- 응모인데 지금시간이 시작시간보다 전일때 -->
											<%}else if(((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && !odto_todays.getOnline_start_date().isEmpty()) && (((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && compare_w_start_result == -1))){%>
												<span id="count_todays_status<%=i%>release-status" class="release-status" style="background-color:black;">응모 전</span>
												<input type="hidden" id="hidden_ing<%=i%>" value="-1">
											<!-- 응모인데 지금시간이 시작시간과 끝나는 시간 사이일때(시작시간이 존재할때)  -->
											<%}else if(((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && !odto_todays.getOnline_start_date().isEmpty()) && (((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && compare_w_start_result >= 0)) && ((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && compare_w_end_result == -1)){%>
												<span id="count_todays_status<%=i%>release-status" class="release-status" style="background-color:#58af58;">응모 중</span>
												<input type="hidden" id="hidden_ing<%=i%>" value="1">
											<!-- 응모인데 지금시간이 시작시간과 끝나는 시간 사이일때(시작시간이 존재하지 않을때)  -->
											<%}else if((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && compare_w_end_result == -1) {%>
												<span id="count_todays_status<%=i%>release-status" class="release-status" style="background-color:#58af58;">응모 중</span>
												<input type="hidden" id="hidden_ing<%=i%>" value="1">
											<!-- 선착이든 응모이든 지금시간이 끝나는 시간보다 뒤일때 -->
											<%} else if((odto_todays.getOnline_method().contains("선착") && compare_w_start_result >= 0) || (((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && compare_w_end_result >= 0))){%>
												<span id="count_todays_status<%=i%>release-status" class="release-status" style="background-color:white; border:none; color:black; font-weight:normal;">종료</span>
												<input type="hidden" id="hidden_ing<%=i%>" value="1">
											<%}%>
										</div>
									</div>
								
									<!-- 발매 방식  -->
									<div class="brand-info-container" id="brand-info-container<%=i%>" style="<%if(userDrawBrandList.contains(bdto_todays.getBrand_id()+sdto_todays.getModel_stylecode())){%>opacity: 0.3;<%}%>">
										<span class="info-subTitle">발매 방식</span>
										<span class="info-content">
											<%if(odto_todays.getOnline_method().contains("선착")) {%>
												선착순 구매  <!-- color:#ff5722; -->
											<%} else if(odto_todays.getOnline_method().contains("드로우")) {%>
												온라인응모
											<%} else if(odto_todays.getOnline_method().contains("이메일라플")) {%>
												이메일응모
											<%} else if(odto_todays.getOnline_method().contains("인스타라플")) {%>
												인스타그램 응모
											<%} else if(odto_todays.getOnline_method().contains("미정")) {%>
												미정
											<%} %>
										
											<span class="mob-moreDetail">
												<!-- 결제방식 -->
												<%if(odto_todays.getOnline_method().contains("선착")) {%>
													선착순 구매
												<%} else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) {%>
													<%=odto_todays.getBuy_method()%>
												<%}%>
												·
												<!-- 배송방식 -->
												<%if(odto_todays.getOnline_method().contains("선착")) {%>
													<%=odto_todays.getDelivery_method()%>
												<%} else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) {%>
													<%=odto_todays.getDelivery_method()%>
												<%}%>
											</span>
										
										</span>
									</div>
									
									<!-- 모바일 진행 상태 -->
									<div class="phone-brand-info-container-releaseStatus" id="phone-brand-info-container<%=i%>" style="<%if(userDrawBrandList.contains(bdto_todays.getBrand_id()+sdto_todays.getModel_stylecode())){%>opacity: 0.3;<%}%>">
										<span class="info-content">
											- 상태 : 
											<%if(odto_todays.getOnline_method().contains("선착") && compare_w_start_result == -1) {%>
												<span id="phone-count_todays_status<%=i%>release-status" class="release-status" style="color:black;">선착</span>
											<!-- 응모인데 지금시간이 시작시간보다 전일때 -->
											<%}else if(((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && !odto_todays.getOnline_start_date().isEmpty()) && (((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && compare_w_start_result == -1))){%>
												<span id="phone-count_todays_status<%=i%>release-status" class="release-status" style="color:black;">응모 전</span>
												<input type="hidden" id="hidden_ing<%=i%>" value="-1">
											<!-- 응모인데 지금시간이 시작시간과 끝나는 시간 사이일때(시작시간이 존재할때)  -->
											<%}else if(((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && !odto_todays.getOnline_start_date().isEmpty()) && (((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && compare_w_start_result >= 0)) && ((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && compare_w_end_result == -1)){%>
												<span id="phone-count_todays_status<%=i%>release-status" class="release-status" style="color:#58af58;">응모 중</span>
												<input type="hidden" id="hidden_ing<%=i%>" value="1">
											<!-- 응모인데 지금시간이 시작시간과 끝나는 시간 사이일때(시작시간이 존재하지 않을때)  -->
											<%}else if((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && compare_w_end_result == -1) {%>
												<span id="phone-count_todays_status<%=i%>release-status" class="release-status" style="color:#58af58;">응모 중</span>
												<input type="hidden" id="hidden_ing<%=i%>" value="1">
											<!-- 선착이든 응모이든 지금시간이 끝나는 시간보다 뒤일때 -->
											<%} else if((odto_todays.getOnline_method().contains("선착") && compare_w_start_result >= 0) || (((odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && compare_w_end_result >= 0))){%>
												<span id="phone-count_todays_status<%=i%>release-status" class="release-status" style="color:black;">종료</span>
												<input type="hidden" id="hidden_ing<%=i%>" value="1">
											<%}%>
										</span>
									</div>

									<!-- 시간 -->
									<div class="brand-info-container" id="brand-info-container<%=i%>" style="<%if(userDrawBrandList.contains(bdto_todays.getBrand_id()+sdto_todays.getModel_stylecode())){%>opacity: 0.3;<%}%>">
										
										<span class="info-subTitle">
											<%if(odto_todays.getOnline_method().contains("선착")){%>
												선착 시간
											<%}else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")){%>
												응모 시간
											<%}%>
										</span>
										<span class="info-content">
											<%if(odto_todays.getOnline_method().contains("선착")){%>
												<span class="phone-timeLabel"> - 선착시간 : </span>
											<%}else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")){%>
												<span class="phone-timeLabel"> - 응모시간 : </span>
											<%}%>
											<%if(odto_todays.getOnline_method().contains("선착")){%>
											<!-- 선착순 구매 -->
											<span> 
												<!-- 최종 시작 시간이 정확하지 않으면 -->
												<%if(odto_todays.getOnline_start_date().isEmpty() || odto_todays.getOnline_start_time().isEmpty()) {%>
													공지예정
												<%} else {%>
													<%=newlist_Online_start_time%>
												<%} %>
											</span>
											<%}else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")){%>
											<!-- 응모 -->
											<span>
												<!-- 최종 끝나는 시간이 정확하지 않으면 -->
												<%if(odto_todays.getOnline_end_date().isEmpty() || odto_todays.getOnline_end_time().isEmpty()) {%>
													공지예정
												<%} else {%>
													<%if(!odto_todays.getOnline_start_date().isEmpty()) {%>
														<%=newlist_Online_start_time%>
													 <%}%>
													<%=" ~ " + newlist_Online_end_time%>
												<%} %>
											</span>
											<%}%>
										</span>
									</div>
	
									<!-- 결제·배송 -->
									<div class="brand-info-container" id="brand-info-container<%=i%>" style="<%if(userDrawBrandList.contains(bdto_todays.getBrand_id()+sdto_todays.getModel_stylecode())){%>opacity: 0.3;<%}%>">
										<span class="info-subTitle">결제·배송</span>
										<span class="info-content">
											<!-- 결제방식 -->
											<%if(odto_todays.getOnline_method().contains("선착")) {%>
												선착순 구매
											<%} else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) {%>
												<%=odto_todays.getBuy_method()%>
											<%}%>
											·
											<!-- 배송방식 -->
											<%if(odto_todays.getOnline_method().contains("선착")) {%>
												<%=odto_todays.getDelivery_method()%>
											<%} else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) {%>
												<%=odto_todays.getDelivery_method()%>
											<%}%>
										</span>
									</div>
									
									<!-- 모바일 버전 발매 신발 및 응모 체크 버튼 -->
									<!-- 발매신발 -->
									<div class="mob-brand-info-container" id="mob-brand-info-container<%=i%>" style="text-align:center !important; <%if(userDrawBrandList.contains(bdto_todays.getBrand_id()+sdto_todays.getModel_stylecode())){%>opacity: 0.3;<%}%>">
										<span class="info-content">
											<a href="./SneakerDetail.go?model_stylecode=<%=sdto_todays.getModel_stylecode()%>&num=<%=odto_todays.getModel_num()%>"> 
												<img src="./sneaker_img_upload/<%=sdto_todays.getImage()%>" class="sneaker_img">
											</a>
										</span>
									</div>
									
									<!-- 남은시간 -->
									<div class="brand-info-container" id="brand-info-container<%=i%>" style="margin-bottom: 0 !important; <%if(userDrawBrandList.contains(bdto_todays.getBrand_id()+sdto_todays.getModel_stylecode())){%>opacity: 0.3;<%}%>">
										<!-- 남은시간 -->
										<span id="count_todays_start_time<%=i%>" style="display:none;"> <%=count_todays_start_time%> </span>
										<span id="count_todays_end_time<%=i%>" style="display:none;"> <%=count_todays_end_time%> </span>
										<!-- 남은시간 상태 -->
										<span id="count_todays_status<%=i%>" style="display:none;">
											<!-- 선착일때 -->
											<%if(odto_todays.getOnline_method().contains("선착")){%>
												<%if(compare_w_start_result >= 0) {%>
												종료
												<%} %>
											<!-- 드로우일때 -->
											<%} else if( odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) {%>
												<%if(compare_w_end_result >= 0 ){ %>
												종료
												<%} %>
											<%}%>
										</span>
										
										<span class="info-subTitle">남은 시간</span>
										<span class="info-content">
											<!-- 선착일때 -->
											<%if(odto_todays.getOnline_method().contains("선착") && compare_w_start_result < 0){%>
												<span id="count_todays_status<%=i%>border">
													<span>
														<% if(!odto_todays.getOnline_start_date().isEmpty() && !odto_todays.getOnline_start_time().isEmpty()) {%>
															<span class="remainTime-container">
																<!-- 남은시간 -->
																<span id="count_todays_status<%=i%>span" style="color:#313131;">
																	<span class="mob_count_label"><i class="far fa-clock"></i></span>
																	<span class="remain-time" id="final_count_start_time<%=i%>days"></span>
																		<span class="pc_count_label">일</span>
																		<span class="mob_count_label">:</span> 
																	<span class="remain-time" id="final_count_start_time<%=i%>hours" style="padding-left: 4px;"></span>
																		<span class="pc_count_label">시간</span>
																		<span class="mob_count_label">:</span>
																	<span class="remain-time" id="final_count_start_time<%=i%>minutes"></span>
																		<span class="pc_count_label">분</span>
																		<span class="mob_count_label">:</span>
																	<span class="remain-time" id="final_count_start_time<%=i%>seconds"></span>
																		<span class="pc_count_label">초</span>
																		
																	<span class="pc_count_label">남음</span>	
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
											<%} else if(odto_todays.getOnline_method().contains("선착") && compare_w_start_result >= 0){%>
												<span>-</span>
											
											<!-- 드로우일때 -->
											<%} else if( (odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && compare_w_end_result < 0) {%>
												<span id="count_todays_status<%=i%>border">
													<span>
														<% if(!odto_todays.getOnline_end_date().isEmpty() && !odto_todays.getOnline_end_time().isEmpty()) {%>
															<span class="remainTime-container"> 
																<!-- 남은시간 -->
																<span id="count_todays_status<%=i%>span" style="color:#313131;">
																	<span class="mob_count_label"><i class="far fa-clock"></i></span>
																	<span class="remain-time" id="final_count_end_time<%=i%>days"></span>
																		<span class="pc_count_label">일</span>
																		<span class="mob_count_label">:</span> 
																	<span class="remain-time" id="final_count_end_time<%=i%>hours" style="padding-left: 4px;"></span>
																		<span class="pc_count_label">시간</span>
																		<span class="mob_count_label">:</span>
																	<span class="remain-time" id="final_count_end_time<%=i%>minutes"></span>
																		<span class="pc_count_label">분</span>
																		<span class="mob_count_label">:</span>
																	<span class="remain-time" id="final_count_end_time<%=i%>seconds"></span>
																		<span class="pc_count_label">초</span>
																		
																	<span class="pc_count_label">남음</span>
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
											<%} else if( (odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) && compare_w_end_result >= 0) {%>
												<span>-</span>
											<%} %>
											
												<!-- 마감임박 문구-->
												<div class="remainWarning-container">
													<span id="count_todays_status<%=i%>label"></span>			
												</div>
										</span>
									</div>
									
									<!--  응모 체크 버튼 -->
									<div class="mob-brand-info-container" id="mob-brand-info-container<%=i%>" style="text-align:center;">
										<input type="hidden" id="model_num<%=i%>" value="<%=odto_todays.getModel_num()%>">
										<input type="hidden" id="model_stylecode<%=i%>" value="<%=sdto_todays.getModel_stylecode()%>">
										<span class="info-content">
											<!-- 참여체크박스 -->
											<%if(odto_todays.getOnline_method().contains("선착")) {%>
											
											<%} else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) {%>
												<%if(!userDrawBrandList.contains(bdto_todays.getBrand_id()+sdto_todays.getModel_stylecode())){%>
													<input type="hidden" id="mob-drawCheck_status<%=i%>" value="참여전">
													<!-- 참여체크박스 -->
													<div class="mob-draw_checkBox" id="mob-draw_checkBox<%=i%>" style="background-color:white; color:#b3b3b3;">
														<span><i class="fas fa-check"></i> <span id="mob-drawCheck_statusTxt<%=i%>"></span></span>
													</div> 
												<%}else{%>
													<input type="hidden" id="mob-drawCheck_status<%=i%>" value="참여완료">
													<!-- 참여체크박스 -->
													<div class="mob-draw_checkBox" id="mob-draw_checkBox<%=i%>" style="background-color:#1f1f1f; color:white; border-color:#1f1f1f;">
														<span><i class="fas fa-check"></i> <span id="mob-drawCheck_statusTxt<%=i%>">응모함</span></span>
													</div> 
												<%}%>
											<%}%>
										</span>
									</div>
									
								</div>
								
							</td>
				
							<!-- 발매신발 -->
							<td id="releaseModel-info<%=i%>" style="padding-left:50px; padding-right:50px;" class="releaseModel-container">
							<input type="hidden" id="model_num<%=i%>" value="<%=odto_todays.getModel_num()%>">
							<input type="hidden" id="model_stylecode<%=i%>" value="<%=sdto_todays.getModel_stylecode()%>">
								
								<!-- 발매제품 이미지 -->
								<div class="releaseModel-image" id="releaseModel-image<%=i%>" style="<%if(userDrawBrandList.contains(bdto_todays.getBrand_id()+sdto_todays.getModel_stylecode())){%>opacity: 0.3;<%}%>">
									<a href="./SneakerDetail.go?model_stylecode=<%=sdto_todays.getModel_stylecode()%>&num=<%=odto_todays.getModel_num()%>"> 
										<img src="./sneaker_img_upload/<%=sdto_todays.getImage()%>" class="sneaker_img">
									</a>
								</div>
								
								<!-- 응모체크  -->
								<div class="drawCheckBtn">
									<!-- 참여체크박스 -->
									<%if(odto_todays.getOnline_method().contains("선착")) {%>
									
									<%} else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) {%>
										<%if(!userDrawBrandList.contains(bdto_todays.getBrand_id()+sdto_todays.getModel_stylecode())){%>
											<input type="hidden" id="drawCheck_status<%=i%>" value="참여전">
											<!-- 참여체크박스 -->
											<div class="draw_checkBox" id="draw_checkBox<%=i%>" style="background-color:white; color:#b3b3b3;">
												<span><i class="fas fa-check"></i> <span id="drawCheck_statusTxt<%=i%>"></span></span>
											</div> 
										<%}else{%>
											<input type="hidden" id="drawCheck_status<%=i%>" value="참여완료">
											<!-- 참여체크박스 -->
											<div class="draw_checkBox" id="draw_checkBox<%=i%>" style="background-color:#1f1f1f; color:white; border-color:#1f1f1f;">
												<span><i class="fas fa-check"></i> <span id="drawCheck_statusTxt<%=i%>">응모함</span></span>
											</div> 
										<%}%>
									<%}%>
								</div>

							</td>
							
						</tr>
					<% } } 
						if(onlineList_todays.size() >= 4) {
					%>
						<tr>
							<td colspan="4" class="todays_moretd" style="padding:0 !important; background-color:#f9f9f9;">
								<a href="./TodaysReleaseList.go"><span style="display:block; padding:15px 0;">더보기 <i class="far fa-plus-square"></i></span></a>
							</td>
						</tr>
					<% } %>
				</table>
			</div>
		</div>
		
		<!-- 광고 970x250 -->
		<div class="betweenAds2-container">
			<div class="betweenAds2-box">
				<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- PC - 가로하단 970x250 -->
				<ins class="adsbygoogle"
				     style="display:inline-block;width:970px;height:250px"
				     data-ad-client="ca-pub-8228533393025739"
				     data-ad-slot="4591758574"></ins>
				<script>
				     (adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>
		</div>

		<!-- Pad - 중간 광고 728x300 -->
		<div class="betweenAdsPad2-container" style="display:none;">
			<div class="betweenAdsPad2-box">
				<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- Pad - 중간 가로 728x300 광고 -->
				<ins class="adsbygoogle"
				     style="display:inline-block;width:728px;height:300px"
				     data-ad-client="ca-pub-8228533393025739"
				     data-ad-slot="5581692023"></ins>
				<script>
				     (adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>
		</div>
		
		<!-- Phone - 중간 광고 320x100 -->
		<div class="betweenAdsPhone-container" style="display:none;">
			<div class="betweenAdsPhone-box">
				<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- Phone - 중간 광고 320x100 -->
				<ins class="adsbygoogle"
				     style="display:inline-block;width:320px;height:100px"
				     data-ad-client="ca-pub-8228533393025739"
				     data-ad-slot="6612536818"></ins>
				<script>
				     (adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>
		</div>

		<!-- 이번주 나코 snkrs 리스트 -->
		<div class="snkrsWeek-container">
			<div class="sub-title">
				<h4><img src="./brand_img_upload/nikelogo.png" width="50" height="30" style="vertical-align:bottom;">나이키 코리아 라인업</h4>
				<div class="allButton" onclick="location.href='./SnkrsKRList.go'">
					<span> 전체보기 </span>
				</div>
			</div>
			
			<div class="desc-container">
				<span>나이키 코리아(<a href="https://www.nike.com/kr/launch/?type=upcoming&activeDate=date-filter:AFTER" target="_blank" style="border-bottom:1px dotted #fe0016; color:#fe0016;">SNKRS</a>)에서 발매하는 프리미엄 신발 라인업 </span>
			</div>
			
			<div class="snkrsWeek-table-container">
				<% if(onlineList_snkrs.isEmpty()){%>
					<div class="snkrs_noRelease">
						이번 달 발매 라인업이 없습니다.
					</div>
				<% } else { 
					for(int i=0; i<onlineList_snkrs.size(); i++) {
						OnlineDTO snkrs_odto = onlineList_snkrs.get(i);
						SneakerDTO snkrs_sdto = sneakerList_snkrs.get(i);
						
						String online_start_date = "";
						String online_start_time = "";
						
						if((snkrs_odto.getOnline_start_date().isEmpty())){
							online_start_date = "0000-00-00";
						} else{
							online_start_date = snkrs_odto.getOnline_start_date();
						}
						
						if((snkrs_odto.getOnline_start_time().isEmpty())){
							online_start_time = "24:00";
						} else{
							online_start_time = snkrs_odto.getOnline_start_time();
						}
						
						Date original_Online_start_time = format.parse(online_start_date + " " + online_start_time);
						Date original_Online_start_date = original_format.parse(online_start_date);
						
						//yyyy-MM-dd
						String dateFormat2 = original_format.format(original_Online_start_time);

						//O월 OO일(수)
						String dateFormat = date_format.format(original_Online_start_time);
						//오전 10:00
						String timeFormat = time_format.format(original_Online_start_time);
						
						//발매 날짜와 현재 날짜 차이 계산해서 D-O일 나타내기						
						Calendar cal = Calendar.getInstance();
						String todayDate_instance = original_format.format(cal.getTime());
						
						Date todayDate = original_format.parse(todayDate_instance);
						Date releaseDate = original_format.parse(dateFormat2);
						
						long calDate = releaseDate.getTime()-todayDate.getTime();
						
						long calDateDays = calDate/(24*60*60*1000);
						
						calDateDays = Math.abs(calDateDays);
				%>
					<div class="snkrsSneaker-container">
						<div>
							<div class="dDay-status">
								<span <%if(calDateDays <=2){%>style="border:1px solid #e0575c; background-color:#e0575c;"<%}else{%>style="border:1px solid black; background-color:black;"<%}%>>
									<%if(calDateDays==0){ %>
										오늘발매
									<%}else if(calDateDays==1){ %>
										내일발매
									<%}else { %>
										<%=calDateDays%>일 남음
									<%} %>
								</span>
							</div>
							<a href="<%=snkrs_odto.getOnline_link()%>" target="_blank">
								<img src="./sneaker_img_upload/<%=snkrs_sdto.getImage()%>">
							</a>
						</div>
						<div>
							<!-- 시작날짜 -->
							<div class="snkrs_date">
								<a href="<%=snkrs_odto.getOnline_link()%>" target="_blank">
									<%=dateFormat%>
								</a>
							</div>
							<!-- 시작시간 -->
							<div class="snkrs_time">
								<a href="<%=snkrs_odto.getOnline_link()%>" target="_blank">
								<%=timeFormat%>
								<%if(snkrs_odto.getOnline_method().contains("선착")) {%>
									선착
								<%}else if(snkrs_odto.getOnline_method().contains("드로우")) {%>
									응모 시작
								<%}else if(snkrs_odto.getOnline_method().contains("-")) {%>
									(발매방식 미정)
								<%}%>
								</a>
							</div>
						</div>
						
						
						<div class="snkrs_modelName" style="display:none;">
							<a href="<%=snkrs_odto.getOnline_link()%>" target="_blank">
								<%=snkrs_sdto.getModel_name_kr()%>
							</a>
						</div>
					</div>
				<% } } %>
			</div>
		</div>
		
		<!-- 발매 예정 리스트 -->
		<div class="release-container" style="margin-bottom:50px !important; padding-bottom:0 !important;">
			<div class="sub-title">	
<!-- 			<div class="sub-title-wline"> -->
				<h4> 발매 예정 라인업 </h4>
				<div class="allButton" onclick="location.href='./AllReleaseList.go'">
					<span> 전체보기 </span>
				</div>
			</div>
			
			<div class="desc-container">
				<span> 진행 중인 발매처가 없는 제품들 </span>
			</div>
			
			<div class="releasing-table-container">
				<% if(releasingSneakerList.isEmpty()){ %>
					<div>
						발매 예정인 신발이 없습니다.
					</div>
				<% } else {
					for(int i=0; i<releaseSneakerList.size(); i++){
						SneakerDTO release_sdto = releaseSneakerList.get(i);
						if(i==12){
							break;
						}
				%>
					<div class="mainSneaker-container">
						<a href="./SneakerDetail.go?model_stylecode=<%=release_sdto.getModel_stylecode()%>&num=<%=release_sdto.getNum()%>">
							<!-- 신발이미지 -->
							<div class="mainSneaker-image">
								<img src="./sneaker_img_upload/<%=release_sdto.getImage()%>">
							</div>
							<!-- 신발 이름 + 해당 신발 발매처 횟수 -->
							<div class="mainSneakerShoeInfo-container">
								<!-- 이름 칸 -->
								<div class="mainSneakerShoeInfo-name">
									<span> <%=release_sdto.getModel_name_kr()%> </span>
								</div>
								<!-- 발매처 횟수 -->
								<div class="mainSneaker-brandCount2">
									<span class="mainSneaker-brandCountTxt" style="border:1px solid #3e3e3e; background-color:#3e3e3e;">	
										발매처 0
									</span>
								</div>
							</div>
						</a>
					</div>
				<% } } %>
			</div>	
		</div>
		
		<jsp:include page="/include/rightSideBar.jsp" />

	</div>
	
	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>

</body>

<script type="text/javascript">

	//남은 시간 계산하는 함수
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
					document.getElementById(statusId+'label').textContent = '선착시간임박!';	
				}
				if(id.match('end')){
					document.getElementById(statusId+'label').textContent = '응모마감임박!';	
				}
				//임박표시 ON
				$('#'+statusId+'label').css("display", "block");
			}
			//종료되었을때
			else if(finalTime == 0000000){
				document.getElementById(statusId).textContent = '종료';		
			
				//응모 status 종료 표시
				document.getElementById(statusId+'release-status').textContent = '종료';
				$('#'+statusId+'release-status').css({"background-color":"white", "border":"none", "font-weight":"normal", "color":"black"});
				document.getElementById('phone-'+statusId+'release-status').textContent = '종료';
				$('#phone-'+statusId+'release-status').css({"color":"black"});
				
				//브랜드이름 줄 긋기
				$('#'+statusId+'brandNameTxt').css({"text-decoration":"line-through", "text-decoration-thickness":"2px"})
				//남은시간 '-' 으로 바꾸기
				document.getElementById(statusId+'span').textContent = '-';
				$('#'+statusId+'span').css("color", "#949494");
				//임박표시 OFF
				$('#'+statusId+'label').css("display", "none");
				//응모링크 클릭 못하게+disable 디자인
				$('#'+statusId+'linkBtn').css({"border":"none", "background-color":"#f1f1f1", "color":"rgb(196 196 196)"});
				$('#'+statusId+'linkBtn').removeAttr('onclick');
				
				//임박표시 OFF
				$('#'+statusId+'label').css("display", "none");
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


	var sticky = $(".left-sideBar").offsetTop;

	$(window).scroll(function(event){
		//화면을 200정도만 내렸을때 좌측 메뉴 고정
		if(document.body.scrollTop > 200 || document.documentElement.scrollTop > 200){
			$(".left-sideBar").css('position','fixed');
			$(".left-sideBar").css('top','40px');
		} else {
			$(".left-sideBar").css('position','absolute');
			$(".left-sideBar").css('top','0');
		}
	});

	
	$(document).ready(function(){
		
		//방지
		$(document).bind('keydown', function(e){
			if(e.keyCode == 123 /* F12 */){
				e.preventDefault();
				e.returnVale = false;
			}
		});
		
		var filter = "win16|win32|win64|mac|macintel";
		if(navigator.platform) {
			//모바일로 접속했을시
			if (filter.indexOf( navigator.platform.toLowerCase() ) < 0) {	
			}
			//데스크탑으로 접속했을시
			else { 
			}
		}
		
		
		///오늘 발매 리스트
		var todaysReleaseAll_list = [];
		<c:forEach items="${onlineList_todays}" var="onlineList_todays">
			todaysReleaseAll_list.push("${onlineList_todays}");
		</c:forEach>

		for(var i=0; i<todaysReleaseAll_list.length; i++) {
			//list
			var count_span_start = document.getElementById("count_todays_start_time"+i).innerText;
			var count_span_end = document.getElementById("count_todays_end_time"+i).innerText;

			var noTimeData = '0002';
			//시작시간에 0002가 포함 = 무조건 끝나느시간이다 = 엔드로만 가지고 놀기
			if(count_span_start.match(noTimeData)){
				countDownTimer('final_count_end_time'+i, count_span_end, 'count_todays_status'+i);
			}
			//끝나는시간에 0002가 포함 = 무조건 시작시간(선착) = 시작으로만 가지고 놀기
			if(count_span_end.match(noTimeData)) {
				countDownTimer('final_count_start_time'+i, count_span_start, 'count_todays_status'+i);
			}
			//둘다 포함이 안되어있다 = 드로우밖에 없음 = 끝나는 시간으로만 가지고 놀기
			if(!count_span_start.match(noTimeData) && !count_span_end.match(noTimeData)){
				countDownTimer('final_count_end_time'+i, count_span_end, 'count_todays_status'+i);	
			}
		}
		
		//응모 여부 체크박스 클릭했을시 -----------------------------------------------------------------------
		$('.draw_checkBox').on('click', function(){
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
			//로그인시
			else {
				var checkbox_id = $(this).attr("id");
				var id_num = checkbox_id.replace(/[^0-9]/g,'');
				
				//응모참여 status
				var draw_status = $('#drawCheck_status'+id_num).val();

				//응모시간이 아니면 alert 띄우기
				var hidden_ing = $('#hidden_ing'+id_num).val();
				if(hidden_ing < 0){
					alert("응모 전입니다. \n응모기간에 응모여부를 체크 할 수 있습니다.");
					return false;
				}
				else {
					//신발모델 번호
					var model_num = $('#model_num'+id_num).val();
					//신발모델 스타이코드
					var model_stylecode = $('#model_stylecode'+id_num).val();
					//브랜드 아이디
					var brand_id = $('#brand_id'+id_num).val();
					//국가 이름
					var country_name = $('#country_name'+id_num).val();
					
					//참여전인데 체크박스 눌릴시 -> 참여완료
					if(draw_status == '참여전'){
						//status 참여완료로 바꾸기
						$('#drawCheck_status'+id_num).val('참여완료');
						$.ajax({
				   			type:'get',
				   			url:'./addUserDrawInfoAction.me',
				   			data: 'model_num='+model_num+'&model_stylecode='+model_stylecode+'&brand_id='+brand_id+'&country_name='+country_name,
				   			dataType: 'html',
				   			success:function(data) {

				   			},error:function(request,status,error){
							 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
							}
				   		});
						//참여전 표시 -> 참여완료로 바꾸기
						$('#count_todays_status'+id_num+'releaseInfo').css("opacity", "0.3");
						$('div#brand-info-container'+id_num).css("opacity", "0.3");
						$('#releaseModel-image'+id_num).css("opacity", "0.3");
						$('#draw_checkBox'+id_num).css("background-color","#1f1f1f");
						$('#draw_checkBox'+id_num).css("border-color","#1f1f1f");
						$('#draw_checkBox'+id_num).css("color","white");
						$('#drawCheck_statusTxt'+id_num).text("응모함");
					} 
					//참여완료인데 체크박스 눌릴시 -> 참여전
					else if(draw_status == '참여완료'){
						//status 참여전으로 바꾸기
						$('#drawCheck_status'+id_num).val('참여전');
						$.ajax({
				   			type:'get',
				   			url:'./deleteUserDrawInfoAction.me',
				   			data: 'model_num='+model_num+'&model_stylecode='+model_stylecode+'&brand_id='+brand_id+'&country_name='+country_name,
				   			dataType: 'html',
				   			success:function(data) {
				   				
				   			},error:function(request,status,error){
							 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
							}
				   		});
						//참여완료 표시 -> 참여전으로 바꾸기
						$('#count_todays_status'+id_num+'releaseInfo').css("opacity", "1");
						$('div#brand-info-container'+id_num).css("opacity", "1");
						$('#releaseModel-image'+id_num).css("opacity", "1");
						$('#draw_checkBox'+id_num).css("background-color","white");
						$('#draw_checkBox'+id_num).css("border-color","#b3b3b3");
						$('#draw_checkBox'+id_num).css("color","#b3b3b3");
						$('#drawCheck_statusTxt'+id_num).text("");
					}
				}
			}
		});
		
		//(모바일) 응모 여부 체크박스 클릭했을시 -----------------------------------------------------------------------
		$('.mob-draw_checkBox').on('click', function(){
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
			//로그인시
			else {
				var checkbox_id = $(this).attr("id");
				var id_num = checkbox_id.replace(/[^0-9]/g,'');
				
				//응모참여 status
				var mob_draw_status = $('#mob-drawCheck_status'+id_num).val();

				//응모시간이 아니면 alert 띄우기
				var hidden_ing = $('#hidden_ing'+id_num).val();
				if(hidden_ing < 0){
					alert("응모 전입니다. \n응모기간에 응모여부를 체크 할 수 있습니다.");
					return false;
				}
				else {
					//신발모델 번호
					var model_num = $('#model_num'+id_num).val();
					//신발모델 스타일코드
					var model_stylecode = $('#model_stylecode'+id_num).val();
					//브랜드 아이디
					var brand_id = $('#brand_id'+id_num).val();
					//국가 이름
					var country_name = $('#country_name'+id_num).val();
					
					//참여전인데 체크박스 눌릴시 -> 참여완료
					if(mob_draw_status == '참여전'){
						//status 참여완료로 바꾸기
						$('#mob-drawCheck_status'+id_num).val('참여완료');
						$.ajax({
				   			type:'get',
				   			url:'./addUserDrawInfoAction.me',
				   			data: 'model_num='+model_num+'&model_stylecode='+model_stylecode+'&brand_id='+brand_id+'&country_name='+country_name,
				   			dataType: 'html',
				   			success:function(data) {

				   			},error:function(request,status,error){
							 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
							}
				   		});
						//참여전 표시 -> 참여완료로 바꾸기
						$('#count_todays_status'+id_num+'releaseInfo').css("opacity", "0.3");
						$('div#brand-info-container'+id_num).css("opacity", "0.3");
						$('#mob-brand-info-container'+id_num).css("opacity", "0.3");
						$('#phone-brand-info-container'+id_num).css("opacity", "0.3");
						
						$('#mob-draw_checkBox'+id_num).css("background-color","#1f1f1f");
						$('#mob-draw_checkBox'+id_num).css("border-color","#1f1f1f");
						$('#mob-draw_checkBox'+id_num).css("color","white");
						$('#mob-drawCheck_statusTxt'+id_num).text("응모함");
					} 
					//참여완료인데 체크박스 눌릴시 -> 참여전
					else if(mob_draw_status == '참여완료'){
						//status 참여전으로 바꾸기
						$('#mob-drawCheck_status'+id_num).val('참여전');
						$.ajax({
				   			type:'get',
				   			url:'./deleteUserDrawInfoAction.me',
				   			data: 'model_num='+model_num+'&model_stylecode='+model_stylecode+'&brand_id='+brand_id+'&country_name='+country_name,
				   			dataType: 'html',
				   			success:function(data) {
				   				
				   			},error:function(request,status,error){
							 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
							}
				   		});

						//참여완료 표시 -> 참여전으로 바꾸기
						$('#count_todays_status'+id_num+'releaseInfo').css("opacity", "1");
						$('div#brand-info-container'+id_num).css("opacity", "1");
						$('#mob-brand-info-container'+id_num).css("opacity", "1");
						$('#phone-brand-info-container'+id_num).css("opacity", "1");
						
						$('#mob-draw_checkBox'+id_num).css("background-color","white");
						$('#mob-draw_checkBox'+id_num).css("border-color","#b3b3b3");
						$('#mob-draw_checkBox'+id_num).css("color","#b3b3b3");
						$('#mob-drawCheck_statusTxt'+id_num).text("");
					}
				}
			}
		});

	});
	
	document.onmousedown=disableclick;
	//status="Right click is not availble";
	
	function disableclick(event){
		if(event.button==2){
			//alert(status);
			return false;
		}
	}

	var sTime = new Date().getTime();
	(function(i,s,o,g,r,a,m){i['webObject']=g;i['webUid']=r;a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})
	(window,document,'script','//coduo25.weblog.cafe24.com/weblog.js?v='+sTime,'coduo25_1');

</script>
</html>