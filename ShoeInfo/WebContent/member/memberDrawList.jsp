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
<body> <!-- oncontextmenu='return false' onselectstart='return false' ondragstart='return false' -->
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
			<div class="sub-title">
				<h4> 응모 참여 내역 <span style="font-weight:normal; font-size:16px; color:#666;">총 <%=totalcount%>건</span> </h4> 
			</div>
			
			<!-- pc 버전 -------------------------------------------------------------------- -->
			<div class="myDraw-table-container" style="margin-top:15px;">
				<% if(userDrawStylecodeList.isEmpty()) { %>
					<div>
						<div style="padding:10%; border-top:1px solid #222; border-bottom:1px solid #222; margin-top:10px;">
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
					<div class="myDraw-container">	
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
				<%} } %>
			</div>

			<!-- 모바일 버전 -------------------------------------------------------------------- -->
			<div class="myDraw-table-container-mobile" style="display:none; margin-top:5px;">
				<% if(userDrawStylecodeList.isEmpty()) { %>
					<div>
						<div style="padding:10%; border-top:1px solid #222; border-bottom:1px solid #222; margin-top:10px;">
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
					<div class="myDraw-container-mobile">
						<div class="myDraw-shoeInfo-mobile">	
							<!-- 신발이미지 -->
							<div class="myDraw-image-mobile">
								<a href="./SneakerDetail.go?model_stylecode=<%=mydraw_sdto.getModel_stylecode()%>&num=<%=mydraw_sdto.getNum()%>">
									<img src="./sneaker_img_upload/<%=mydraw_sdto.getImage()%>">
								</a>
							</div>
							<!-- 신발 이름 + 해당 신발 응모 횟수 -->
							<div class="myDrawShoeInfo-container-mobile">
								<!-- 이름 -->
								<div class="myDrawShoeInfo-name-mobile" onclick="location.href='./SneakerDetail.go?model_stylecode=<%=mydraw_sdto.getModel_stylecode()%>&num=<%=mydraw_sdto.getNum()%>';">
									<span><%=mydraw_sdto.getModel_name_kr()%></span>
								</div>
								<!-- 응모 횟수 -->
								<div class="myDrawShoeInfo-countNum-mobile">
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

</script>
</html>