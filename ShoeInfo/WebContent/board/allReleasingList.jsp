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
<meta name="description" content="진행 중인 발매처가 있는 제품들" />

<meta property="og:type" content="website">
<meta property="og:description" content="진행 중인 발매처가 있는 제품들">
<meta property="og:url" content="https://www.shoeinfo.co.kr">

<meta content="width=device-width, initial-scale=1" name="viewport" />
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>발매 중 | SHOE INFO.</title>
<link href="./css/board/releaseSep.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:400&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kelly+Slab&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Oxanium&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
	<%
		String user = (String) session.getAttribute("email");
		if(user == null){
			user="";
		}
		
		//발매중 신발들, 발매예정 신발들, 발매완료 신발들
		ArrayList<SneakerDTO> releasingSneakerList = (ArrayList<SneakerDTO>) request.getAttribute("releasingSneakerList");

		//발매중인 산발들의 진행중인 브랜드 갯수
		ArrayList<Integer> countReleasingBrandList = (ArrayList<Integer>) request.getAttribute("countReleasingBrandList");
		
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
		<div class="betweenAdsPad-container" style="display:none; margin-top:30px;">
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
		
		<!-- Phone - 중간 광고 320x100 -->
		<div class="betweenAdsPhone-container" style="display:none; margin-top:30px;">
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
	
		<!-- 발매 중 리스트 -->
		<div class="releasing-container" style="margin-top:40px; padding-top:0 !important;">
			<div class="sub-title">	
<!-- 			<div class="sub-title-wline"> -->
				<h4> 발매 중 라인업 </h4>
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
			
		<!-- 중간 광고 970x250 -->
		<div class="betweenAds2-container" style="padding:50px 0 40px 0;">
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
		<div class="betweenAdsPad2-container" style="display:none; margin-bottom:50px;">
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
		<div class="betweenAdsPhone-container" style="display:none; margin-bottom:50px;">
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

		<jsp:include page="/include/rightSideBar.jsp" />
			
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