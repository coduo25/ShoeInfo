<%@page import="net.online.db.OnlineDTO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sneaker.db.SneakerDTO"%>
<%@page import="net.brand.db.BrandDTO"%>
<%@page import="net.member.db.MemberDrawDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>SHOE INFO.</title>
<link href="./css/board/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:600&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Oxanium&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body> <!-- oncontextmenu='return false' onselectstart='return fasle' ondragstart='return false' -->
	<%
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		if(user == null){
			response.sendRedirect("./SneakerList.go");
		}
		
		//인기상품
		ArrayList<SneakerDTO> popularList = (ArrayList<SneakerDTO>) request.getAttribute("popularList");
		//응모한 신발리스트
		ArrayList<MemberDrawDTO> userDrawStylecodeList = (ArrayList<MemberDrawDTO>) request.getAttribute("userDrawStylecodeList");
		ArrayList<SneakerDTO> sneakerInfoList = (ArrayList<SneakerDTO>) request.getAttribute("sneakerInfoList");
		//응모 횟수 리스트
		ArrayList<Integer> countDrawKrList = (ArrayList<Integer>) request.getAttribute("countDrawKrList");
		ArrayList<Integer> countDrawEtcList = (ArrayList<Integer>) request.getAttribute("countDrawEtcList");
		//총 응모 횟수
		int totalcount = (Integer) request.getAttribute("totalcount");
		
		SimpleDateFormat original_format = new SimpleDateFormat("yyyy-MM-dd");
		
		//오늘날짜
		Date currentTime = new Date();
		String current = original_format.format(currentTime);
		Date today = original_format.parse(current);
	%>

	<!-- Header -->	
	<header> <jsp:include page="/include/header.jsp" /> </header>
	
	<input type="hidden" class="login_user" id="login_user" value="<%=user%>">
	
	<!-- Main Content -->
	<div id="wrapper" class="container">
	
		<!-- 좌측 사이드 바 -->
		<jsp:include page="/include/leftSideBar.jsp" />
	
		<!-- 나의 응모내역 리스트 -->
		<div class="myDrawList-container" style="margin-top:30px !important; padding-top:0 !important;">
			<div class="sub-title" style="border-bottom:1px solid black;">
				<h4> 응모 참여 내역 <span style="font-weight:normal; font-size:16px; color:#666;">총 <%=totalcount%>건</span> </h4> 
			</div>
			<div class="myDraw-table-container">
				<% if(userDrawStylecodeList.isEmpty()) { %>
					<div>
						<div style="padding:10%;">
							<span style="text-align:center; display:block;">응모내역이 없습니다.</span>
						</div>
					</div>
				<%} else {
					//응모한 신발 리스트
					for(int i=0; i<userDrawStylecodeList.size(); i++) {
						SneakerDTO mydraw_sdto = sneakerInfoList.get(i);
						int countNum_kr = countDrawKrList.get(i);
						int countNum_etc = countDrawEtcList.get(i);
				%>
					<div class="myDraw-container" id="myDraw-container<%=i%>">
						<div class="myDraw-shoeInfo">	
							<!-- 신발이미지 -->
							<div class="myDraw-image">
								<a href="./SneakerDetail.go?model_stylecode=<%=mydraw_sdto.getModel_stylecode()%>&num=<%=mydraw_sdto.getNum()%>">
									<img src="./sneaker_img_upload/<%=mydraw_sdto.getImage()%>">
								</a>
							</div>
							<!-- 신발 이름 + 해당 신발 응모 횟수 -->
							<div class="myDrawShoeInfo-container">
								<!-- 이름 -->
								<div class="myDrawShoeInfo-name" onclick="location.href='./SneakerDetail.go?model_stylecode=<%=mydraw_sdto.getModel_stylecode()%>&num=<%=mydraw_sdto.getNum()%>';">
									<span><%=mydraw_sdto.getModel_name_kr()%></span>
								</div>
								<!-- 응모 횟수 -->
								<div class="myDrawShoeInfo-countNum">
									<span>국내 응모 : <%=countNum_kr%></span>
									&nbsp;
									/
									&nbsp;
									<span>해외 응모 : <%=countNum_etc%></span>
								</div>
							</div>
						</div>
						
					</div>
				<%} } %>
			</div>
		</div>
		
		<!-- 중간 광고 970x250 -->
		<div class="betweenAds2-container" style="padding-bottom:40px;">
			<div class="betweenAds2-box">
				
			</div>
		</div>
		
		<!-- 우측 사이드바 -->
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
		
		//리스트 DrowDown 버튼 눌렸을시
		$('.myDrawDropDown-container').click(function(){
			$(this).css('display', 'none');
			
			//아이다 값 가져오기
			var divID = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = divID.split('-');
			//맨 마지막 = 번호
			var number = splitArray[splitArray.length - 1];
			
			//DrowUp버튼 활성화
			$('#myDrawDropUp-container-'+number).css('display','block');
			
			//리스트 열기
			$('#brandList-container'+number).slideDown('fast');
		});
		
		//리스트 DrowUp 버튼 눌렸을시
		$('.myDrawDropUp-container').click(function(){
			$(this).css('display', 'none');
			
			//아이다 값 가져오기
			var divID = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = divID.split('-');
			//맨 마지막 = 번호
			var number = splitArray[splitArray.length - 1];
			
			//DrowUp버튼 활성화
			$('#myDrawDropDown-container-'+number).css('display','block');
			
			//리스트 열기
			$('#brandList-container'+number).slideUp('fast');
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

</script>
</html>