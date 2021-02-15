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
<meta property="og:url" content="http://www.shoeinfo.co.kr">

<meta content="width=device-width, initial-scale=1" name="viewport" />
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>SHOE INFO.</title>
<link href="./css/board/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@700&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body>	 <!-- oncontextmenu='return false' onselectstart='return fasle' ondragstart='return false'  -->
	<%
		String user = (String) session.getAttribute("email");
		if(user == null){
			user="";
		}
	
		//오늘의 응모 리스트(5개)
		ArrayList<OnlineDTO> onlineList_todays = (ArrayList<OnlineDTO>) request.getAttribute("onlineList_todays");
		ArrayList<BrandDTO> brandList_todays = (ArrayList<BrandDTO>) request.getAttribute("brandList_todays");
		ArrayList<SneakerDTO> sneakerList_todays = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList_todays");
		
		//발매중 신발들, 발매예정 신발들, 발매완료 신발들
		ArrayList<SneakerDTO> releaseSneakerList = (ArrayList<SneakerDTO>) request.getAttribute("releaseSneakerList");
		ArrayList<SneakerDTO> releasingSneakerList = (ArrayList<SneakerDTO>) request.getAttribute("releasingSneakerList");
		ArrayList<SneakerDTO> releasedSneakerList = (ArrayList<SneakerDTO>) request.getAttribute("releasedSneakerList");
		
		//이번주 snkrs 리스트
		ArrayList<OnlineDTO> onlineList_snkrs = (ArrayList<OnlineDTO>) request.getAttribute("onlineList_snkrs");
		ArrayList<SneakerDTO> sneakerList_snkrs = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList_snkrs");
		
		
		// 구 리스트들
		ArrayList<SneakerDTO> sneakerList1 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList1");
		ArrayList<SneakerDTO> sneakerList2 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList2");
		ArrayList<SneakerDTO> sneakerList3 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList3");
		ArrayList<SneakerDTO> sneakerList4 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList4");
		ArrayList<SneakerDTO> sneakerList5 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList5");
		ArrayList<SneakerDTO> sneakerList6 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList6");
		ArrayList<SneakerDTO> sneakerList7 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList7");
		ArrayList<SneakerDTO> sneakerList8 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList8");
		ArrayList<SneakerDTO> sneakerList9 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList9");
		ArrayList<SneakerDTO> sneakerList10 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList10");
		ArrayList<SneakerDTO> sneakerList11 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList11");
		ArrayList<SneakerDTO> sneakerList12 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList12");
		
		ArrayList<SneakerDTO> sneakerList2021 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList2021");
		
		SimpleDateFormat original_format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		SimpleDateFormat new_format = new SimpleDateFormat("M월 d일");
		
		SimpleDateFormat month_format = new SimpleDateFormat("M월");
		
		SimpleDateFormat newList_format = new SimpleDateFormat("M/d(E) HH:mm");
		SimpleDateFormat snkrs_format = new SimpleDateFormat("M/d일(E) a hh:mm");
		
		//오늘날짜
		Date currentTime = new Date();
		String current = original_format.format(currentTime);
		
		String compare_Today = format.format(currentTime);
		
		Date today = original_format.parse(current);
		Date compareToday = format.parse(compare_Today);
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
	
		<!-- 발매 중 리스트 -->
		<div class="releasing-container" style="margin-top: 35px !important;">
			<div class="sub-title">	
<!-- 			<div class="sub-title-wline"> -->
				<h4> 현재 발매 중인 라인업 </h4>
				<div class="allButton" onclick="location.href='#'">
					<span> 전체보기 </span>
				</div>
			</div>
			
			<div class="desc-container">
				<p> 각 신발들의 발매처가 <span style="color:green">응모 중</span>이거나 <span style="color:#ff5722">선착순 구매</span>가 예정인 상품 라인업입니다. 클릭시, 해당 상품의 발매처들을 볼 수 있습니다. </p>
			</div>
			
			<div class="releasing-table-container">
				<% if(releasingSneakerList.isEmpty()){ %>
					<div>
						발매 중인 신발이 없습니다.
					</div>
				<% } else {
					for(int i=releasingSneakerList.size()-1; i>=0; i--){
						SneakerDTO releasing_sdto = releasingSneakerList.get(i);	
				%>
					<div class="mainSneaker-container">
						<a href="./SneakerDetail.go?model_stylecode=<%=releasing_sdto.getModel_stylecode()%>&num=<%=releasing_sdto.getNum()%>">
							<img src="./sneaker_img_upload/<%=releasing_sdto.getImage()%>">
						</a>
						
						<!-- hover 칸  -->
						<div class="mainSneaker-container-hover">
							&nbsp;
						</div>
						
						<!-- 이름 칸 -->
						<div class="mainSneaker-container-hover-Name" onclick="location.href='./SneakerDetail.go?model_stylecode=<%=releasing_sdto.getModel_stylecode()%>&num=<%=releasing_sdto.getNum()%>';">
							<p> <%=releasing_sdto.getModel_name_kr()%> </p>
						</div>
					</div>
					
				<% } } %>
			</div>
		</div>
		
		<!-- 오늘의 발매 리스트 6개 -->
		<div class="todaysDraw-container">
			<div class="sub-title">
				<h4> 오늘의 발매 마감 리스트 </h4>
				<div class="allButton" onclick="location.href='./TodaysReleaseList.go'">
					<span> 전체보기 </span>
				</div>
			</div>
			
			<div class="desc-container">
				<p> 현재 시간을 기준으로 금일 자정까지 마감하는 모든 발매처를 보여주는 도표입니다. </p>
			</div>
			
			<div class="todays-table-container">
				<table id="onlineList_todays_table">
					<tr>
						<th style="width:5%"> 번호 </th>
						<th style="width:15%; border-right: 0.5px dotted #dcdcdc; border-left: 0.5px dotted #dcdcdc;"> 발매모델 </th>
						<th style="width:25%;"> 발매처 </th>
						<th style="width:20%;"> 시간 </th>
						<th style="width:12%;"> 결제방식 </th>
						<th style="width:8%;"> 직배송 <i class="far fa-question-circle"></i> </th>
						<th style="width:10%;"> 링크 </th>
					</tr>
					<% if(onlineList_todays.isEmpty() || brandList_todays.isEmpty()){ %>
						<tr>
							<td colspan="7"> 발매 정보가 없습니다. </td>
						</tr>
					<% } else { 
						for(int i=0; i<onlineList_todays.size(); i++){
							if(i==5){
								break;
							}
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
							
							//O월 OO일 24시
							String newlist_Online_start_time = newList_format.format(original_Online_start_time);
							String newlist_Online_end_time = newList_format.format(original_Online_end_time);
					%>
						<tr>
							<!-- 번호 -->
							<td>
								<%=i+1%>
							</td>
							
							<!-- 상태 -->
<!-- 							<td> -->
<!-- 								<div> -->
<%-- 									<%if(odto_todays.getOnline_method().contains("선착")) {%> --%>
<!-- 										<span style="color:#ff5722;">선착예정</span> -->
<%-- 									<%} else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) {%> --%>
<!-- 										<span style="color:green;">진행중</span> -->
<%-- 									<%}%> --%>
									
<!-- 								</div> -->
<!-- 							</td> -->
													
							<!-- 발매신발 -->
							<td style="border-left: 0.5px dotted #dcdcdc; border-right: 0.5px dotted #dcdcdc;">
								<!-- 신발이미지 -->
								<div onclick="location.href='./SneakerDetail.go?model_stylecode=<%=odto_todays.getModel_stylecode()%>&num=<%=odto_todays.getModel_num()%>'" style="cursor:pointer;" class="todaysRelease-mainSneaker-container">
									<img src="./sneaker_img_upload/<%=sdto_todays.getImage()%>" class="sneaker_img">
									
									<!-- hover 칸  -->
									<div class="todaysRelease-mainSneaker-container-hover">
										&nbsp;
									</div>
									
									<!-- 이름 칸 -->
									<div class="todaysRelease-mainSneaker-container-hover-Name" onclick="location.href='./SneakerDetail.go?model_stylecode=<%=sdto_todays.getModel_stylecode()%>&num=<%=sdto_todays.getNum()%>';">
										<p> <%=sdto_todays.getModel_name_kr()%> </p>
									</div>
									
								</div>
							</td>
							
							<!-- 발매처 -->
							<td style="text-align: left; padding-left: 20px;">
								<!--  발매처 이미지 --> 
								<div class="brand-info-image-container">
									<a href="<%=odto_todays.getOnline_link()%>" target="_blank"> 
										<img src="./brand_img_upload/<%=bdto_todays.getBrand_logo()%>" width="60" height="60" style="border:1px solid #efefef;"> 
									</a>
								</div>
								<!-- 발매처 정보 -->
								<div class="brand-info-container">
									<!-- 응모처 이름 -->
									<div>
										<div class="brand-info-name-div">
											<a href="<%=odto_todays.getOnline_link()%>" target="_blank"> 
												<span> <%=bdto_todays.getBrand_name()%></span>
											</a>
										</div>
										<img src="./countryflag_img_upload/<%=bdto_todays.getCountry_flag()%>" style="width: 22px; border: 1px solid #efefef; vertical-align: middle; margin-bottom:2px;">
									</div>		
									
									<!-- 발매 방식 -->
									<div>
										<%if(odto_todays.getOnline_method().contains("선착")) {%>
											<span style="color:#ff5722;"> 선착순구매 </span>
										<%} else if(odto_todays.getOnline_method().contains("드로우")) {%>
											<span> 온라인응모 </span>
										<%} else if(odto_todays.getOnline_method().contains("이메일라플")) {%>
											<span> 이메일응모 </span>
										<%} %>
									</div>
								</div>
							</td>
	
							<!-- 시간정보 -->
							<td class="drawTime-todays-td">
								<div style="margin-bottom:10px;">
									<%if(odto_todays.getOnline_method().contains("선착")){%>
									<!-- 선착순 구매 -->
									<span> 
										<!-- 최종 시작 시간이 정확하지 않으면 -->
										<%if(odto_todays.getOnline_start_date().isEmpty() || odto_todays.getOnline_start_time().isEmpty()) {%>
											공지예정
										<%} else {%>
											<%=newlist_Online_start_time%> 선착구매
										<%} %>
									</span>
									<%}else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")){%>
									<!-- 응모 -->
									<span>
										<!-- 최종 끝나는 시간이 정확하지 않으면 -->
										<%if(odto_todays.getOnline_end_date().isEmpty() || odto_todays.getOnline_end_time().isEmpty()) {%>
											공지예정
										<%} else {%>
											<%=newlist_Online_end_time%> 응모마감
										<%} %>
									</span>
									<%}%>
								</div>
								
								<!-- 남은시간 -->
								<%if(odto_todays.getOnline_method().contains("선착")){%>
									<div style="font-size: 13px; font-weight: bold;  color: #ff5722;">
										<span style="border: 1px solid black; padding: 4px 12px;"> 1일 10:12:34 남음 </span>
									</div>
								<%}else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")){%>
									<div style="font-size: 13px; font-weight: bold; color: green;">
										<span style="border: 1px solid black; padding: 4px 12px;"> 1일 10:12:34 남음 </span>
									</div>
								<%}%>
							</td>
							
							<!-- 결제방식 -->
							<td>
								<%if(odto_todays.getOnline_method().contains("선착")) {%>
									-
								<%} else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) {%>
									<%=odto_todays.getBuy_method()%>
								<%}%>
							</td>
							
							<!-- 직배송여부  -->
							<td>
								<%if(odto_todays.getOnline_method().contains("선착")) {%>
									<%=odto_todays.getDelivery_method()%>
								<%} else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) {%>
									<%=odto_todays.getDelivery_method()%>
								<%}%>
							</td>
							
							<!-- 바로가기 버튼 -->
							<td> <a href="<%=odto_todays.getOnline_link()%>" target="_blank" class="direct-link"> <span class="direct-link-text">바로가기</span> <i class="fas fa-caret-right"></i> </a> </td>
							
						</tr>
					<% } } 
						if(onlineList_todays.size() > 5) {
					%>
						<tr>
							<td colspan="7" style="height: 60px !important;"> <a href="./TodaysReleaseList.go"> 더보기  <i class="far fa-plus-square"></i> </a> </td>
						</tr>
					<% } %>
				</table>
			</div>
		</div>
		
		<!-- 이번주 모든 발매 리스트 -->
		<div class="thisWeek-container">
			<div class="sub-title">
				<h4> 금주의 모든 발매 리스트 </h4>
				<div class="allButton" onclick="location.href='#'">
					<span> 전체보기 </span>
				</div>
			</div>
			
			<div class="desc-container">
				<p> 이번 주 월요일~일요일까지 발매하는 모든 리스트입니다. </p>
			</div>
			
		</div>
		
		<!-- 이번주 나코 snkrs 리스트 -->
		<div class="snkrsWeek-container">
			<div class="sub-title">
				<h4> 나이키 코리아 프리미엄 라인업 </h4>
				<div class="allButton" onclick="location.href='#'">
					<span> 전체보기 </span>
				</div>
			</div>
			
			<div class="desc-container">
				<p> 나이키 코리아(<a href="https://www.nike.com/kr/launch/?type=upcoming&activeDate=date-filter:AFTER" target="_blank" style="text-decoration:underline; color: #fe0016;">SNKRS</a>)에서 금주 월요일~일요일까지 발매하는 프리미엄 신발 라인업입니다. </p>
			</div>
			
			<div class="snkrsWeek-table-container">
				<% if(onlineList_snkrs.isEmpty()){%>
					<div style="padding-top: 30px;">
						이번 주 발매 라인업이 없습니다.
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
						
						//O월 OO일 24시
						String newlist_Online_start_time = snkrs_format.format(original_Online_start_time);
				%>
					<div class="snkrsSneaker-container">
						<a href="<%=snkrs_odto.getOnline_link()%>" target="_blank">
							<img src="./sneaker_img_upload/<%=snkrs_sdto.getImage()%>">
						</a>
						<div class="snkrs_startTime">
							<a href="<%=snkrs_odto.getOnline_link()%>" target="_blank">
								<%=newlist_Online_start_time%> 
								<%if(snkrs_odto.getOnline_method().contains("선착")) {%>
									선착
								<%}else if(snkrs_odto.getOnline_method().contains("드로우")) {%>
									응모 시작
								<%}else if(snkrs_odto.getOnline_method().contains("-")) {%>
									(발매방식 미정)
								<%}%>
							</a>
						</div>
						<div class="snkrs_modelName">
							<a href="<%=snkrs_odto.getOnline_link()%>" target="_blank">
								<%=snkrs_sdto.getModel_name_kr()%>
							</a>
						</div>
					</div>
				<% } } %>
			</div>
		</div>
		
		<!-- 발매 예정 리스트 -->
		<div class="release-container">
			<div class="sub-title">	
<!-- 			<div class="sub-title-wline"> -->
				<h4> 2021년 발매 예정 라인업 </h4>
				<div class="allButton" onclick="location.href='#'">
					<span> 전체보기 </span>
				</div>
			</div>
			
			<div class="desc-container">
				<p> 해당 신발들은 아직 발매처가 없습니다. </p>
			</div>
			
			<div class="releasing-table-container">
				<% if(releasingSneakerList.isEmpty()){ %>
					<div>
						발매 예정인 신발이 없습니다.
					</div>
				<% } else {
					for(int i=0; i<releaseSneakerList.size(); i++){
						SneakerDTO release_sdto = releaseSneakerList.get(i);	
				%>
					<div class="mainSneaker-container">
						<a href="./SneakerDetail.go?model_stylecode=<%=release_sdto.getModel_stylecode()%>&num=<%=release_sdto.getNum()%>">
							<img src="./sneaker_img_upload/<%=release_sdto.getImage()%>">
						</a>
						
						<!-- hover 칸  -->
						<div class="mainSneaker-container-hover">
							 &nbsp;					
						</div>
						
						<!-- 이름 칸 -->
						<div class="mainSneaker-container-hover-Name" onclick="location.href='./SneakerDetail.go?model_stylecode=<%=release_sdto.getModel_stylecode()%>&num=<%=release_sdto.getNum()%>';">
							<p> <%=release_sdto.getModel_name_kr()%> </p>				
						</div>
						
					</div>
				<% } } %>
			</div>
		</div>
		
		<!-- 발매 완료 리스트 -->
		<div class="released-container">
			<div class="sub-title">	
<!-- 			<div class="sub-title-wline"> -->
				<h4> 발매 완료 라인업 </h4>
				<div class="allButton" onclick="location.href='#'">
					<span> 전체보기 </span>
				</div>
			</div>
			
			<div class="desc-container">
				<p> 각 신발들의 발매처 기간이 종료되었거나 진행 중인 발매처가 없는 상품 라인업입니다. </p>
			</div>
			
			<div class="released-table-container">
				<% if(releasedSneakerList.isEmpty()){ %>
					<div>
						발매 완료된 신발이 없습니다.
					</div>
				<% } else {
					for(int i=releasedSneakerList.size()-1; i>=0; i--){
						SneakerDTO released_sdto = releasedSneakerList.get(i);	
				%>
					<div class="mainSneaker-container">
						<a href="./SneakerDetail.go?model_stylecode=<%=released_sdto.getModel_stylecode()%>&num=<%=released_sdto.getNum()%>">
							<img src="./sneaker_img_upload/<%=released_sdto.getImage()%>">
						</a>
						
						<!-- hover 칸  -->
						<div class="mainSneaker-container-hover">
							 &nbsp;					
						</div>
						
						<!-- 이름 칸 -->
						<div class="mainSneaker-container-hover-Name" onclick="location.href='./SneakerDetail.go?model_stylecode=<%=released_sdto.getModel_stylecode()%>&num=<%=released_sdto.getNum()%>';">
							<p> <%=released_sdto.getModel_name_kr()%> </p>				
						</div>
					</div>
				<% } } %>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		<!-- 구 컨테이너들 -->
		<div id="showAllChk" style="display:none">
			<span id="before">발매예정</span>
			<span id="after">발매완료</span>
		</div>
	
		<div id="content_sneakerList" style="display:none">
			<%
				Calendar cal = Calendar.getInstance();
				int month = cal.get(Calendar.MONTH);
				
				for(int z=1; z<13; z++){
					ArrayList<SneakerDTO> new_sneakerList = new ArrayList<SneakerDTO>();
					String month_label = "";
					if(z==1){ new_sneakerList = sneakerList1; month_label = "Jan."; }
					if(z==2){ new_sneakerList = sneakerList2; month_label = "Feb."; }
					if(z==3){ new_sneakerList = sneakerList3; month_label = "Mar."; }
					if(z==4){ new_sneakerList = sneakerList4; month_label = "Apr."; }
					if(z==5){ new_sneakerList = sneakerList5; month_label = "May."; }
					if(z==6){ new_sneakerList = sneakerList6; month_label = "June."; }
					if(z==7){ new_sneakerList = sneakerList7; month_label = "July."; }
					if(z==8){ new_sneakerList = sneakerList8; month_label = "Aug."; }
					if(z==9){ new_sneakerList = sneakerList9; month_label = "Sept."; }
					if(z==10){ new_sneakerList = sneakerList10; month_label = "Oct."; }
					if(z==11){ new_sneakerList = sneakerList11; month_label = "Nov."; }
					if(z==12){ new_sneakerList = sneakerList12; month_label = "Dec."; }
			%>
				<!-- <%=z%>월 발매 테이블 -->
				<p id="month<%=z%>" class="month"> 
<%-- 					<%=z%>월 <%=month_label%> --%>
					<span id="slide-down_<%=z%>"> <i class="fas fa-caret-down"></i> </span>
					<span id="slide-up_<%=z%>"> <i class="fas fa-caret-up"></i> </span>
				</p>
				
				<div id="div_month_<%=z%>" class="div_month">
					<%
						if(new_sneakerList.size() == 0){
					%>
						<div class="no_info" id="no_info<%=z%>">
							<span> <%=z%>월 발매 정보가 없습니다. </span>
						</div>
					<%
						}else{
					%> 
						<div class="shoelist_content_month">
							<p><span><%=z%></span>&nbsp;<%=month_label%> </p>
							<p> 발매리스트  </p>
							<p> <i class="far fa-arrow-alt-circle-right"></i> </p>
						</div>
					<%
					
						for (int i = 0; i <new_sneakerList.size(); i++) {
							SneakerDTO sdto = new_sneakerList.get(i);
							
							Date month_date_type = null;
							
							if(sdto.getRelease_date().contains("99")){
								String month_str_date = sdto.getRelease_date();
								month_str_date = month_str_date.replace("99", "01");
								month_date_type = original_format.parse(month_str_date);
							}
							
							String ty_str_date = sdto.getRelease_date();
							Date date_type = original_format.parse(ty_str_date);
							
							Date original_rel = original_format.parse(sdto.getRelease_date());
							int compare_w_rel;
							
							//현재와 발매날짜와 비교하기 (1이면 발매후, 0이면 오늘 발매일, -1이면  발매전)
							if(sdto.getRelease_date().contains("99")){
								compare_w_rel = -1; 
							}else {
								compare_w_rel = today.compareTo(original_rel);	
							}
							
							//오늘 날짜와 최신 온라인 등록 날짜와 비교해서 이틀 안에 등록 된거면 빨간색 점 나타내기, 등록하고 이틀이 지나거나 아예 등록정보가 없다면 빨간색 점 나타내기
							// diffDay가 -2보다 적으면 빨간색 사라지게 하고 -2보다 크면 빨간색 띄우기
							int recentChk = -1;
							
							if(sdto.getReg_date() != null){
								//Timestamp -> date
								Date recent_RegDate = new Date(sdto.getReg_date().getTime());
								//recent_RegDate - Today 
								long diffDay = (recent_RegDate.getTime() - today.getTime()) / (24*60*60*1000);
								if(diffDay <= -1){
									recentChk = -1;
								}else if(diffDay > -1) {
									recentChk = 1;
								}
							}else if(sdto.getReg_date() == null){
								recentChk = -1;
							}
							
							//오늘 날짜와 발매날짜와 비교해서 D-Day ~ D-7 이면 디데이 라벨 나타내기, 만약 발매일에 일이 없으면 -1
							int ddayCount = -1;
							
							if(sdto.getRelease_date().contains("99")){
								ddayCount = -1;
							} else {
								if((original_rel.getTime() - today.getTime()) / (24*60*60*1000) >= 0 && (original_rel.getTime() - today.getTime()) / (24*60*60*1000) <= 7){
									long count = (original_rel.getTime() - today.getTime()) / (24*60*60*1000);
									ddayCount = (int) count;
								} else{
									ddayCount = -1;
								}
							}
							
							int openChk = -1;
							
							if(sdto.getMaxDate().contains("1234-12-34 12:34")){
								openChk = -1;
							} else {
								Date maxDate = format.parse(sdto.getMaxDate());
								//maxDate 랑 compareToday 비교
								int compare = maxDate.compareTo(compareToday);
								
								if(compare > 0){
									openChk = 1;
								}
								else if(compare < 0){
									openChk = -1;
								}
								else {
									openChk = 1;
								}
							}
					%>
						<div class="shoelist_content" <%if(compare_w_rel > 0 && openChk == -1){%> id="content_after" style="display:none;"<%}%> id="content_before">
							<%if(compare_w_rel > 0 && openChk == -1) {%>
								<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>">
									<div class="opac_background">
										<span> &nbsp; </span>
									</div>
									<div class="rel_finish">
										<div class="rel_finish_label"> 발매완료 </div>
									</div>
								</a>
							<%}%>
							<!-- 발매일 -->
							<div class="release_date">
								<span>
									<i class="far fa-calendar"></i>
									&nbsp;
									<% if(sdto.getRelease_date().contains("99")){%>
										<%=month_format.format(month_date_type)%> &nbsp;–&nbsp;일
									<%} else {%>
										<%=new_format.format(date_type)%>
									<%}%>
								</span>
							</div>
							<div class="content_wrapper">
								
								<!-- 이미지 -->
								<div class="content_img">
									<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>">
				  						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" id="shoeList_<%=z%><%=i%>_img" >
				  						<%if(ddayCount>=0 && ddayCount<=7){%> 
											<!-- dday label -->
											<div id="dd-label-wrapper">
												<span id="dd-label">D–<%if(ddayCount==0){%>day<%}else if(ddayCount>0 && ddayCount<=7){%><%=ddayCount%><%}%></span>
											</div>								
										<%}%>	
									</a>
									
									<div id="alarm-wrapper">
										<!-- 응모중 리본 -->
										<%if(openChk == 1){%>
											<div id="ing_status_wrapper">
												<p id="ing_status">응모중</p>
											</div>
										<%}%>
										
										<%if(recentChk == 1){ %>
											<div id="recent-dot-wrapper">
												<p id="recent-dot">업데이트</p>
											</div>
										<%}%>
									</div>
	
								</div>
								
								<!-- links -->
								<div class="content_links">
									<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>">	
										<div id="link-wrapper" style="pointer-events: auto;">
											<%=sdto.getModel_name_kr()%>
										</div>
									</a>
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
			
			<!-- 2021 Sneaker Release -->
			<p class="month" id="month_2021">
<!-- 				2021 발매예정. -->
				&nbsp;
			</p>
			<div class="div_month" id="div_month_2021" style="margin-bottom: 50px;">
				<%
					if(sneakerList2021.size() == 0){
				%>
					<div class="no_info">
						<span> 2021년 발매예정 제품이 없습니다. </span>
					</div>
				<%
					} else {
						
					
				%>
					<div class="shoelist_content_month">
							<p> <span id="release_2021">2021</span> </p>
							<p style="position: relative !important; top: 5px !important;"> 발매예정작 </p>
							<p style="position: relative !important; top: 5px !important;"> <i class="far fa-arrow-alt-circle-right"></i> </p>
					</div>
				<%
					for(int j=0; j<sneakerList2021.size(); j++) {
						SneakerDTO sdto = sneakerList2021.get(j);
				%>
					<div class="shoelist_content" id="shoelist_content_2021">
						<!-- 발매일 -->
						<div class="release_date">
							<span>
								<i class="far fa-calendar"></i>
								&nbsp;
								&nbsp;–&nbsp;월
								&nbsp;–&nbsp;일
							</span>
						</div>
						
						<div class="content_wrapper">
								<!-- 이미지 -->
								<div class="content_img">
									<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>">
				  						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>">	
									</a>

								</div>
								
								<!-- links -->
								<div class="content_links">
									<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>">	
										<div id="link-wrapper" style="pointer-events: auto;">
											<%=sdto.getModel_name_kr()%>
										</div>
									</a>
								</div>
							</div>
					</div>
				<%
						} 
					}
				%>
			</div>
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>

</body>

<script type="text/javascript">

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
		
		//발매전을 눌렸을시
		$('#before').click(function(){
			$('[id=content_before]').show();
			$('[id=content_after]').hide();
			$('#month_2021').show();
			$('#month_div_2021').show();
			$('[id=div_month_2021]').show();
			$('#before').css({"background-color" : "#bfbfbf"});
			$('#after').css({"background-color" : "#f2f2f2"});
			
			for(var i=1; i<13; i++){
				if(i < month) {
					$("#slide-up_" + i).hide();
					$("#slide-down_" + i).show();
					
					$("#month_" + i).hide();
					$("#div_month_" + i).hide();
				}
			}
		});
		
		//발매완료를 눌렸을시
		$('#after').click(function(){
			$('[id=content_before]').hide();
			$('[id=content_after]').show();
			$('#month_2021').hide();
			$('#month_div_2021').hide();
			$('[id=div_month_2021]').hide();
			$('#before').css({"background-color" : "#f2f2f2"});
			$('#after').css({"background-color" : "#bfbfbf"});
			
			for(var i=1; i<13; i++){
				if(i < month){
					$("#slide-up_" + i).show();
					$("#slide-down_" + i).hide();
					
					$("#month_" + i).show();
					$("#div_month_" + i).show();	
				}
			}
		});

		var today = new Date();
		// 2
		var month = today.getMonth() + 1; //오늘의 달은 + 1 해야한다
		
		for(var i=1; i<13; i++){
			//지금 달 보다 전전달들 ex.현재 8월, 1~6월 사라지고 7월 slideDown 만 나타내기
			// 1월 < 2월
			if(i < month) {
				$("#slide-up_" + i).hide();
				$("#slide-down_" + i).show();
				
				$("#month" + (i-1)).hide(); 
				$("#div_month_" + i).hide();
			}
			//지금 달부터 미래의 달부터 나타내기 2~4월
			else if(i >= month) {
				//4개월 후까지만 나타내기
				var monthPlus4 = month + 2; //4
				
				if((i-1) >= monthPlus4) {
					$("#no_info" + i).hide();
					
					$("#month" + i).hide();
					$("#div_month_" + i).hide();
				}
				else {
					$("#slide-up_" + i).show();
					$("#slide-down_" + i).hide();
					
					$("#div_month_" + i).show();
				}
			}
		}

		//각 달별로 slide down 버튼을 눌렸을시
		$(".month").click(function(){
			var month = $(this).attr('id').replace(/[^0-9]/g,''); //숫자만 추출
			
			if(month == '2020' || month == '2021'){
				return false;
			}
			else {
				//만약 신발 리스트가 닫혀있으면
				if($("#div_month_" + month).css("display") == "none"){
					$("#slide-up_" + month).show();
					$("#slide-down_" + month).hide();
				}
				//신발 리스트가 열려있으면
				else {
					$("#slide-up_" + month).hide();
					$("#slide-down_" + month).show();
				}
				$("#div_month_" + month).slideToggle("slow");
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