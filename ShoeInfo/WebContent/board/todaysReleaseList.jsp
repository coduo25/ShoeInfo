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
<link href="./css/board/todaysReleaseList.css" rel="stylesheet">
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

		SimpleDateFormat original_format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		SimpleDateFormat monthDay_format = new SimpleDateFormat("M/d일(E)");
		SimpleDateFormat time_format = new SimpleDateFormat("HH:mm");
		
		SimpleDateFormat newList_format = new SimpleDateFormat("M/d(E) HH:mm");
		SimpleDateFormat count_format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">

		<!-- 모든 오늘의 응모 리스트 -->
		<div class="todaysDraw-container">
			<div class="sub-title">
				<h4> 오늘의 발매 마감 리스트 </h4>
			</div>
			
			<div class="desc-container">
				<p> 현재 시간을 기준으로 금일 자정까지 마감하는 모든 발매처를 보여주는 도표입니다. </p>
			</div>
			
			<div class="todays-table-container">
				<table id="onlineList_todays_table">
					<tr>
						<th style="width:5%"> 번호 </th>
						<th style="width:12%; border-right: 0.5px dotted #dcdcdc; border-left: 0.5px dotted #dcdcdc;"> 발매모델 </th>
						<th style="width:30%;"> 발매처 </th>
						<th style="width:19%;"> 시간 </th>
						<th style="width:13%;"> 결제방식 </th>
						<th style="width:10%; border-right: 0.5px dotted #dcdcdc;"> 직배송 <i class="far fa-question-circle"></i> </th>
						<th style="width:11%;"> 링크 </th>
					</tr>
					<% if(onlineList_todays.isEmpty() || brandList_todays.isEmpty()){ %>
						<tr>
							<td colspan="7" style="height: 200px;"> 발매 정보가 없습니다. </td>
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
							
							//O월 OO일 24시
							String newlist_Online_start_time = newList_format.format(original_Online_start_time);
							String newlist_Online_end_time = newList_format.format(original_Online_end_time);
							
							//남은시간 계산하기 위한 날짜데이터 (02/16/2021 10:00)
							String count_todays_start_time = count_format.format(original_Online_start_time);
							String count_todays_end_time = count_format.format(original_Online_end_time);
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
							<td style="text-align: left; padding-left: 40px;">
								<!--  발매처 이미지 --> 
								<div class="brand-info-image-container">
									<a href="<%=odto_todays.getOnline_link()%>" target="_blank"> 
										<img src="./brand_img_upload/<%=bdto_todays.getBrand_logo()%>" width="80" height="80" style="border:1px solid #d4d4d4; position:relative;">
										<div style="position:absolute; right:0; bottom:0;">
											<img src="./countryflag_img_upload/<%=bdto_todays.getCountry_flag()%>" style="border:1px solid #efefef; width: 26px; height: 17px;">
										</div> 
									</a>
								</div>
								<!-- 발매처 정보 -->
								<div class="brand-info-container">
									<!-- 응모처 이름 -->
									<div style="margin-bottom: 10px;">
										<p class="brand-info-name-p">
<%-- 											<img src="./countryflag_img_upload/<%=bdto_todays.getCountry_flag()%>" style="width: 22px; border: 1px solid #efefef; vertical-align: middle; margin-bottom:2px;"> --%>
											<a href="<%=odto_todays.getOnline_link()%>" target="_blank"> 
												<span> <%=bdto_todays.getBrand_name()%></span>
											</a>
										</p>
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
								<div style="margin-bottom:7px;">
									<%if(odto_todays.getOnline_method().contains("선착")){%>
									<!-- 선착순 구매 -->
									<span> 
										<!-- 최종 시작 시간이 정확하지 않으면 -->
										<%if(odto_todays.getOnline_start_date().isEmpty() || odto_todays.getOnline_start_time().isEmpty()) {%>
											공지예정
										<%} else {%>
											<%=newlist_Online_start_time%> 구매
										<%} %>
									</span>
									<%}else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")){%>
									<!-- 응모 -->
									<span>
										<!-- 최종 끝나는 시간이 정확하지 않으면 -->
										<%if(odto_todays.getOnline_end_date().isEmpty() || odto_todays.getOnline_end_time().isEmpty()) {%>
											공지예정
										<%} else {%>
											<%=newlist_Online_end_time%> 마감
										<%} %>
									</span>
									<%}%>
								</div>
								
								<!-- 남은시간 -->
								<span id="count_todays_start_time<%=i%>" style="display:none;"> <%=count_todays_start_time%> </span>
								<span id="count_todays_end_time<%=i%>" style="display:none;"> <%=count_todays_end_time%> </span>
								<!-- 남은시간 상태 -->
								<span id="count_todays_status<%=i%>" style="display:none;"></span>
									
								<!-- 선착일때 -->
								<%if(odto_todays.getOnline_method().contains("선착")){%>
									<div>
										<% if(!odto_todays.getOnline_start_date().isEmpty() && !odto_todays.getOnline_start_time().isEmpty()) {%>
											<span style="font-size: 10px; font-weight: bold; color:#3e3e3e;">
												<!-- 남은시간 -->
												<span id="count_todays_status<%=i%>span" style="border: 1px solid #dcdcdc; padding: 10px 10px 6px 10px; color:#25752b;">
<%-- 													<span class="remain-time" id="final_count_start_time<%=i%>days"></span>일  --%>
													<span class="remain-time" id="final_count_start_time<%=i%>hours"></span>시간
													<span class="remain-time" id="final_count_start_time<%=i%>minutes"></span>분
													<span class="remain-time" id="final_count_start_time<%=i%>seconds"></span>초
													<span>남음</span>
												</span>
											</span>
										<%} else {%>
											<div style="font-size: 13px; font-weight: bold; color:#3e3e3e;">
												<span style="border: 1px solid #3e3e3e; padding: 4px 12px;"> 
												-
												</span>
											</div>
										<%}%>
									</div>
								<!-- 드로우일때 -->
								<%} else if( odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) {%>
									<div>
										<% if(!odto_todays.getOnline_end_date().isEmpty() && !odto_todays.getOnline_end_time().isEmpty()) {%>
											<span style="font-size: 10px; font-weight: bold; color:#3e3e3e;"> 
												<!-- 남은시간 -->
												<span id="count_todays_status<%=i%>span" style="border: 1px solid #dcdcdc; padding: 10px 10px 6px 10px; color:#25752b;">
<%-- 													<span class="remain-time" id="final_count_end_time<%=i%>days"></span>일  --%>
													<span class="remain-time" id="final_count_end_time<%=i%>hours"></span>시간
													<span class="remain-time" id="final_count_end_time<%=i%>minutes"></span>분
													<span class="remain-time" id="final_count_end_time<%=i%>seconds"></span>초
													<span>남음</span>
												</span>
											</span>
										<%} else {%>
											<div style="font-size: 13px; font-weight: bold; color: #3e3e3e;">
												<span style="border: 1px solid #3e3e3e; padding: 4px 12px;"> 
												-
												</span>
											</div>
										<%}%>
									</div>
								<%} %>
									<div style="position:relative;">
										<!-- 마감임박 문구-->
										<span id="count_todays_status<%=i%>label" style="display:none; font-weight: bold; font-size: 13px; position: absolute; width:100%;"></span>
									</div>
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
							<td style="border-right: 0.5px dotted #dcdcdc;">
								<%if(odto_todays.getOnline_method().contains("선착")) {%>
									<%=odto_todays.getDelivery_method()%>
								<%} else if(odto_todays.getOnline_method().contains("드로우") || odto_todays.getOnline_method().contains("라플")) {%>
									<%=odto_todays.getDelivery_method()%>
								<%}%>
							</td>
							
							<!-- 바로가기 버튼 -->
							<td> <a href="<%=odto_todays.getOnline_link()%>" target="_blank" class="direct-link"> <span class="direct-link-text">바로가기</span> <i class="fas fa-caret-right"></i> </a> </td>
						</tr>
					<% } } %>
				</table>

			</div>
		</div>

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
// 				document.getElementById(id + 'days').textContent = days; 
				document.getElementById(id + 'hours').textContent = hours; 
				document.getElementById(id + 'minutes').textContent = minutes; 
				document.getElementById(id + 'seconds').textContent = seconds;
			}
			
			//임박시간 표시 하기
			//남은시간에서 시간:분:초 = 00:19:59 부터 남은시간 붉은색으로 나타내기, 선착이면 '선착임박', 드로우면 '마감임박' 문구 나타내기
			
			//숫자 형태를 문자 형태로 바꾸끼 (편법)
			hours += "";
			minutes += "";
			seconds += "";
			
			//문자 형태의 시간 합체
			var finalTime = hours + minutes + seconds;
			
			//문자 형태의 최종시간을 다시 숫자 형태로 바꾸기
			finalTime *= 1;
			
			//20분 남았을때
			if(finalTime >= 000001 && finalTime <= 001959){
				//시간 붉은색으로
				$('#'+statusId+'span').css("color", "#da010a");
				//임박글자 넣기 (선착이면 선착임박, 드로우면 마감임박)
				if(id.match('start')){
					document.getElementById(statusId+'label').textContent = '선착시간임박!';	
				}
				if(id.match('end')){
					document.getElementById(statusId+'label').textContent = '마감임박!';	
				}
				//임박표시 ON
				$('#'+statusId+'label').css("display", "block");
			}
			//종료되었을때
			else if(finalTime == 000000){
				document.getElementById(statusId).textContent = '종료';
				document.getElementById(statusId+'span').textContent = '종료';
				//종료 네모칸 없애고 글자 크게 학
				$('#'+statusId+'span').css("border", "none");
				$('#'+statusId+'span').css("font-size", "16px");
				$('#'+statusId+'span').css("color", "black");
				$('#'+statusId+'span').css("font-weight", "normal");
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
		
		//오늘 발매 리스트
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

	});
	
	document.onmousedown=disableclick;
	//status="Right click is not availble";
	
	function disableclick(event){
		if(event.button==2){
			//alert(status);
			return false;
		}
	}
	
</script>
</html>