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
		
		//인기상품
		ArrayList<SneakerDTO> popularList = (ArrayList<SneakerDTO>) request.getAttribute("popularList");
		
		//발매중 신발들, 발매예정 신발들, 발매완료 신발들
// 		ArrayList<SneakerDTO> releaseSneakerList = (ArrayList<SneakerDTO>) request.getAttribute("releaseSneakerList");
		ArrayList<SneakerDTO> releasingSneakerList = (ArrayList<SneakerDTO>) request.getAttribute("releasingSneakerList");

		//발매중인 산발들의 진행중인 브랜드 갯수
		ArrayList<Integer> countReleasingBrandList = (ArrayList<Integer>) request.getAttribute("countReleasingBrandList");
		
		List<List<SneakerDTO>> splitedList = (List<List<SneakerDTO>>) request.getAttribute("splitedList");
		
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
	
		<!-- 발매 중 리스트 -->
		<div class="releasing-container" style="margin-top:30px !important; padding-top:0 !important;">
			<div class="sub-title">	
<!-- 			<div class="sub-title-wline"> -->
				<h4> 현재 발매 중인 라인업 </h4>
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
						<!-- 신발이미지 -->
						<div class="mainSneaker-image">
							<a href="./SneakerDetail.go?model_stylecode=<%=releasing_sdto.getModel_stylecode()%>&num=<%=releasing_sdto.getNum()%>">
								<img src="./sneaker_img_upload/<%=releasing_sdto.getImage()%>">
							</a>
						</div>
						<!-- 신발 이름 + 해당 신발 발매처 횟수 -->
						<div class="mainSneakerShoeInfo-container">
							<!-- 이름 칸 -->
							<div class="mainSneakerShoeInfo-name" onclick="location.href='./SneakerDetail.go?model_stylecode=<%=releasing_sdto.getModel_stylecode()%>&num=<%=releasing_sdto.getNum()%>';">
								<span> <%=releasing_sdto.getModel_name_kr()%> </span>
							</div>
							<!-- 발매처 횟수 -->
							<div class="mainSneaker-brandCount">
								<span>	
									발매처 : <%=countBrand%>+
								</span>
							</div>
						</div>
					</div>
				<% } } %>
			</div>
		</div>
		
		<!-- 중간 광고 970x90 -->
		<div class="betweenAds-container">
			<div class="betweenAds-box">
				
			</div>
		</div>

		<!-- 발매 예정 리스트 -->
		<div class="release-container" style="margin-bottom:0px !important; padding-bottom:0 !important;">
			<div class="sub-title">	
<!-- 			<div class="sub-title-wline"> -->
				<h4> 2021년 발매 예정 라인업 </h4>
			</div>
			
			<div class="desc-container">
				<span> 발매처가 아직 없는 제품들 </span>
			</div>
			
				<% if(splitedList.isEmpty()){ %>
					<div class="releasing-table-container">
						<div>
							발매 예정인 신발이 없습니다.
						</div>
					</div>
				<% } else {
					// 0의 리스트 중에 마지막부터
					// 1의 리스트 중에 마지막부터
					// 2의 리스트 중에 마지막부터
					for(int j=0; j<2; j++){
				%>
					<div class="releasing-table-container" id="releasing-table-container<%=j%>" <%if(j>=1){%>style="display:none;"<%}%>>
						<%
						for(int i=0; i<splitedList.get(j).size(); i++){
							SneakerDTO release_sdto = splitedList.get(j).get(i);	
						%>
							<div class="mainSneaker-container">
								<!-- 신발이미지 -->
								<div class="mainSneaker-image">
									<a href="./SneakerDetail.go?model_stylecode=<%=release_sdto.getModel_stylecode()%>&num=<%=release_sdto.getNum()%>">
										<img src="./sneaker_img_upload/<%=release_sdto.getImage()%>">
									</a>
								</div>
								<!-- 신발 이름 + 해당 신발 발매처 횟수 -->
								<div class="mainSneakerShoeInfo-container">
									<!-- 이름 칸 -->
									<div class="mainSneakerShoeInfo-name" onclick="location.href='./SneakerDetail.go?model_stylecode=<%=release_sdto.getModel_stylecode()%>&num=<%=release_sdto.getNum()%>';">
										<span> <%=release_sdto.getModel_name_kr()%> </span>
									</div>
								</div>
							</div>
						<% 
							} 
						%>
					</div>
				<%	} %>
				<%	} %>
			</div>
			
			<div class="moreBtn-container">
				<span class="moreBtn">더보기</span>
			</div>
			
			<!-- 하단 광고 970x250 -->
			<div class="betweenAds2-container" style="padding:50px 0 40px 0;">
				<div class="betweenAds2-box">
					
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
	
	/////////////////////////////////////////////////////////
	//Calendar date 객체 생성 
	var Calendar = new Date();
	var day_of_week = ['일', '월', '화', '수', '목', '금', '토'];
	var month_of_year = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
	
	var year = Calendar.getFullYear();
	var month = Calendar.getMonth();
	var today = Calendar.getDate();
	var weekday = Calendar.getDay();
	
	Calendar.setDate(1); //1일
	
	var DAYS_OF_WEEK = 7;
	var DAYS_OF_MONTH = 31;
	var str;
	
	//tr
	var TR_start = "<tr>";
	var TR_end = "</tr>";
	
	var TD_week_start = "<td class='week'>";
	var TD_blank_start = "<td class='blank'>";
	var TD_today_start = "<td class='today'>";
	var TD_day_start = "<td class='day'>";
	var TD_saturday_start = "<td class='saturday'>";
	var TD_sunday_start = "<td class='sunday'>";
	var TD_end = "</td>";
	
	str = "<table width=100% border:1 cellspacing=0 cellpadding=0><tr><td style='text-align:center;'>";
	str += "<strong class='cal-title'>" + year + "." + month_of_year[month] + "</strong>";
	str += "<table class='calendar' border=0 cellspacing=0 celpadding=2>";
	
	//tr 시간
	str += TR_start;
	
	for(var i=0; i<DAYS_OF_WEEK; ++i){
		str += TD_week_start + day_of_week[i] + TD_end;
	}
	
	str += TR_end;
	
	for(var i=0; i<Calendar.getDay(); ++i){
		str += TD_blank_start + TD_end;
	}
	
	//1일부터 시작
	for(i=0; i<DAYS_OF_MONTH; ++i){
		if(Calendar.getDate() >i){
			var day = Calendar.getDate();
			var week_day = Calendar.getDay();
			if(week_day ==0){
				str += TR_start;
			}
			if(day == today){
				str += TD_today_start + day + TD_end;
			}
			else {
				switch(week_day){
					case 0 :
						str += TD_sunday_start + day + TD_end;
						break;
					case 6 :
						str += TD_saturday_start + day + TD_end;
						str += TR_end
						break;
					default :
						str += TD_day_start + day + TD_end;
					break;
				}
			}
		}
		
		Calendar.setDate(Calendar.getDate() + 1);
	} //for end
	str += "</table></td></tr></table>";
	
	//calendar 태그에 넣기
	$('.calendar-box').html(str);
	
	/////////////////////////////////////////////////////////
	//실시간 현재 시간
	function getTime(){
			
		//현재 시간 계산
		var date = new Date();
		//요일
		var week = new Array('일', '월', '화', '수', '목', '금', '토'); 	
		var currentDate = (date.getMonth() + 1) + "월 " +  date.getDate() + "일" + "(" + week[date.getDay()] +")"; 
		var hours = date.getHours();
		var minutes = date.getMinutes();
		var seconds = date.getSeconds();
		//오전/오후 표시하기
		var AMorPM = date.getHours() < 12 ? "AM" : "PM";
		//오후시간일때 12시간 빼기
	//		if(hours > 12) {
	//			hours -= 12;
	//		}
		
		//시간, 분, 초 앞에 한자리수이면 앞자리수에 0 붙이기
		if(hours < 10){ hours = "0" + hours; }
		if(minutes < 10){ minutes = "0" + minutes; }
		if(seconds < 10){ seconds = "0" + seconds; }
	
		var currentTime = hours + ":" + minutes + ":" + seconds;
	
		var monthDate_div = document.getElementById("month_date");
		var time_div = document.getElementById("time_zone");
		var ampm_zone = document.getElementById("ampm_zone");
	
		//월 + 일 넣기
		monthDate_div.innerHTML = currentDate;
		//시간 넣기
		time_div.innerHTML = currentTime;
		//am pm 넣기
		ampm_zone.innerHTML = AMorPM;
	}
	
	//실시간 갱신시켜주는 함수
	function init(){
	    setInterval(getTime, 1000);
	}
	
	init();

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
		
		//더보기 눌렸을시 j+1값 나타내기
		var showNum = 0;
		$('.moreBtn').click(function(){
			showNum += 1;
			$('#releasing-table-container'+showNum).fadeIn();
			if(showNum>=2){
				$('.moreBtn-container').css('display','none');
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