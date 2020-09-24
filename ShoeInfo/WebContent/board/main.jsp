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

<meta content="width=device-width, initial-scale=1" name="viewport" />
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>SHOE INFO.</title>
<link href="./css/board/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body>	
	<%
		String user = (String) session.getAttribute("email");
		if(user == null){
			user="";
		}
	
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
		
		ArrayList<SneakerDTO> sneakerList2020 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList2020");
		
		SimpleDateFormat original_format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		SimpleDateFormat new_format = new SimpleDateFormat("M월 d일");
		
		SimpleDateFormat month_format = new SimpleDateFormat("M월");
		
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
		
		<div id="showAllChk">
			<span id="before">발매전</span>
			<span id="after">발매완료</span>
		</div>
	
		<div id="content_sneakerList">
			<%
				Calendar cal = Calendar.getInstance();
				int month = cal.get(Calendar.MONTH);
				
				for(int z=month; z<(month+3); z++){
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
					<%=z%>월 <%=month_label%>
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
						}
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
												<span id="dd-label">D–<%if(ddayCount==0){%>DAY<%}else if(ddayCount>0 && ddayCount<=7){%><%=ddayCount%><%}%></span>
											</div>								
										<%}%>	
									</a>
								</div>
								<!-- brand & name -->
								<div class="content_name">
									<!-- model_name -->
									<div class="model_name">
										<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>"> <span> <%=sdto.getModel_name()%></span> </a>
									</div>
								</div>
								
								<!-- links -->
								<div class="content_links">
									<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>">	
										
										<!-- 링크 wrapper -->
										<div id="link-wrapper" style="pointer-events: auto;">
											<% if(recentChk == 1){ %>
												<div id="recent-dot">
													NEW
												</div>
											<%} %>
<%-- 											<%=sdto.getCountLinks()%> --%>
											응모하기
										</div>							
									</a>
								</div>
							</div>

						</div>

					<%	
						}
					%>
				</div>
			<%
				}
			%>
			
			<!-- 2020 Sneaker Release -->
			<p class="month">
				2020 발매예정.
			</p>
			<div class="div_month" style="margin-bottom: 50px;">
				<%
					if(sneakerList2020.size() == 0){
				%>
					<div class="no_info">
						<span> 2020년 발매예정 제품이 없습니다. </span>
					</div>
				<%
					} 
					for(int j=0; j<sneakerList2020.size(); j++) {
						SneakerDTO sdto = sneakerList2020.get(j);
				%>
					<div class="shoelist_content">
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
								<!-- brand & name -->
								<div class="content_name">
									<!-- model_name -->
									<div class="model_name">
										<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>"> <span> <%=sdto.getModel_name()%></span> </a>
									</div>
								</div>
								
								<!-- links -->
								<div class="content_links">
									<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>">	
<!-- 										링크 wrapper -->
										<div id="link-wrapper">
<%-- 											<%=sdto.getCountLinks()%> --%>
											응모하기
										</div>
									</a>
								</div>
							</div>
					</div>
				<%} %>
			</div>
			
		</div>
	</div>
	
	
	
	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>

</body>

<script type="text/javascript">

	$(document).ready(function(){
		
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
			$('[id=content_after]').hide();
			$('#before').css({"background-color" : "#08a05c", "color" : "white", "font-weight" : "bold"});
			$('#after').css({"background-color" : "white", "color" : "#868686", "font-weight" : "normal"});
		});
		
		//발매완료를 눌렸을시
		$('#after').click(function(){
			$('[id=content_after]').show();
			$('#before').css({"background-color" : "white", "color" : "#868686", "font-weight" : "normal"});
			$('#after').css({"background-color" : "#868686", "color" : "white", "font-weight" : "bold"});
		});

		var today = new Date();
		var month = today.getMonth() + 1; //오늘의 달은 + 1 해야한다
		
		for(var i=1; i<13; i++){
			//지금 달 보다 전전달들 ex.현재 8월, 1~6월 사라지고 7월 slideDown 만 나타내기
			if(i < month) {
				$("#month" + (i-1)).hide(); //2달 지나간 월들은 없애기
				
				$("#slide-up_" + i).hide();
				$("#slide-down_" + i).show();
				
				$("#div_month_" + i).hide();
			}
			//지금 달부터 미래의 달부터 나타내기 8~12월
			else if(i >= month) {
				//4개월 후까지만 나타내기
				var monthPlus4 = month + 4;

				if(i >= monthPlus4) {
					$("#month" + i).hide(); //4달 후 월들은 없애기
					$("#no_info" + i).hide();
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
		});

	});

	var sTime = new Date().getTime();
	(function(i,s,o,g,r,a,m){i['webObject']=g;i['webUid']=r;a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})
	(window,document,'script','//coduo25.weblog.cafe24.com/weblog.js?v='+sTime,'coduo25_1');

</script>
</html>