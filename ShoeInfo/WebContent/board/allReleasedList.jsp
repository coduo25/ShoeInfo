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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body>	 <!-- oncontextmenu='return false' onselectstart='return fasle' ondragstart='return false'  -->
	<%
		String user = (String) session.getAttribute("email");
		if(user == null){
			user="";
		}
		
		//사용자 응모한 브랜드 리스트
		List<String> userDrawBrandList = (List<String>) request.getAttribute("userDrawBrandList");
	
		//오늘의 발매 리스트(4개)
		ArrayList<OnlineDTO> onlineList_todays = (ArrayList<OnlineDTO>) request.getAttribute("onlineList_todays");
		ArrayList<BrandDTO> brandList_todays = (ArrayList<BrandDTO>) request.getAttribute("brandList_todays");
		ArrayList<SneakerDTO> sneakerList_todays = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList_todays");
		
		//발매중 신발들, 발매예정 신발들, 발매완료 신발들
		ArrayList<SneakerDTO> releaseSneakerList = (ArrayList<SneakerDTO>) request.getAttribute("releaseSneakerList");
		ArrayList<SneakerDTO> releasingSneakerList = (ArrayList<SneakerDTO>) request.getAttribute("releasingSneakerList");
		ArrayList<SneakerDTO> releasedSneakerList = (ArrayList<SneakerDTO>) request.getAttribute("releasedSneakerList");
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

		String compare_Today = format.format(currentTime);
		Date compareToday = format.parse(compare_Today);
		
		
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<input type="hidden" class="login_user" id="login_user" value="<%=user%>">

	<!-- Main Content -->
	<div id="wrapper" class="container">

		<!-- 발매 완료 리스트 -->
		<div class="released-container" style="margin-top:40px !important;">
			<div class="sub-title">	
<!-- 			<div class="sub-title-wline"> -->
				<h4> 발매 완료 라인업 </h4>
			</div>
			
			<div class="desc-container">
				<span> 모든 발매가 종료된 제품들 </span>
			</div>
			
			<div class="released-table-container">
				<% if(releasedSneakerList.isEmpty()){ %>
					<div>
						발매 완료된 신발이 없습니다.
					</div>
				<% } else {
					for(int i=releasedSneakerList.size()-1, countNum=0; i>=0; i--, countNum++){
						SneakerDTO released_sdto = releasedSneakerList.get(i);
						if(countNum==12){
							break;
						}
				%>
					<div class="mainSneaker-container">
						<div class="mainSneaker-image">
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
					</div>		
				<%
					} }
				%>
			</div>
			<%
				if(releasedSneakerList.size()>=11){
			%>
				<div>
					<span>더보기</span>
				</div>
			<%
				}
			%>	
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