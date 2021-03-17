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
<link href="./css/board/snkrsKRList.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:400&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kelly+Slab&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Oxanium&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body>	 <!-- oncontextmenu='return false' onselectstart='return false' ondragstart='return false' -->
	<%
		String user = (String) session.getAttribute("email");
		if(user == null){
			user="";
		}

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
				
			</div>
		</div>
		
		<!-- Phone - 중간 광고 320x50 -->
		<div class="betweenAdsPhone-container" style="display:none; margin-top:20px;">
			<div class="betweenAdsPhone-box">
			</div>
		</div>

		<!-- 이번주 나코 snkrs 리스트 -->
		<div class="snkrsWeek-container" style="margin-top:40px; padding-top:0 !important; margin-bottom:100px !important;">
			<div class="sub-title">
				<h4><img src="./brand_img_upload/nikelogo.png" width="50" height="30" style="vertical-align:bottom;">나이키 코리아 프리미엄 라인업</h4>
			</div>
			
			<div class="desc-container">
				<span>나이키 코리아(<a href="https://www.nike.com/kr/launch/?type=upcoming&activeDate=date-filter:AFTER" target="_blank" style="border-bottom:1px dotted #fe0016; color:#fe0016;">SNKRS</a>)에서 발매하는 프리미엄 신발 라인업 </span>
			</div>
			
			<div class="snkrsWeek-table-container">
				<% if(onlineList_snkrs.isEmpty()){%>
					<div class="snkrs_noRelease">
						<span style=""><i class="far fa-calendar-times"></i> 이번 달 발매 라인업이 없습니다.</span>
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
		
		<!-- 중간 광고 970x250 -->
		<div class="betweenAds2-container" style="padding-bottom:40px;">
			<div class="betweenAds2-box">
				
			</div>
		</div>
		
		<!-- Pad - 중간 광고 728x300 -->
		<div class="betweenAdsPad2-container" style="display:none;">
			<div class="betweenAdsPad2-box">
			</div>
		</div>
		
		<!-- Phone - 중간 광고 320x50 -->
		<div class="betweenAdsPhone-container" style="display:none;">
			<div class="betweenAdsPhone-box">
			</div>
		</div>
		
		<jsp:include page="/include/rightSideBar.jsp" />
		
	</div>
	
	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>

</body>

<script type="text/javascript">

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