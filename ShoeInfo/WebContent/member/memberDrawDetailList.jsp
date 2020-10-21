<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.online.db.OnlineDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="net.brand.db.BrandDTO"%>
<%@page import="java.util.List"%>
<%@page import="net.member.db.MemberDrawDTO"%>
<%@page import="net.sneaker.db.SneakerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>SHOE INFO.</title>
<link href="./css/board/memberDraw.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:600&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<!-- Header -->	
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<%
		request.setCharacterEncoding("UTF-8");
		
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		if(user == null){
			response.sendRedirect("./SneakerList.go");
		}
	
		//신발 기본 정보 리스트
		SneakerDTO sdto = (SneakerDTO) request.getAttribute("sneakerDetail");
		
		//국내 응모 정보
		List<MemberDrawDTO> drawInfoList_kr = (List<MemberDrawDTO>) request.getAttribute("drawInfoList_kr");
		List<BrandDTO> brandList_kr = (List<BrandDTO>) request.getAttribute("brandList_kr");
		List<OnlineDTO> onlineinfoList_kr = (List<OnlineDTO>) request.getAttribute("onlineinfoList_kr");
		
		//해외 응모 정보
		List<MemberDrawDTO> drawInfoList_etc = (List<MemberDrawDTO>) request.getAttribute("drawInfoList_etc");
		List<BrandDTO> brandList_etc = (List<BrandDTO>) request.getAttribute("brandList_etc");
		List<OnlineDTO> onlineinfoList_etc = (List<OnlineDTO>) request.getAttribute("onlineinfoList_etc");

		DecimalFormat formatter = new DecimalFormat("#,###,###");
		SimpleDateFormat date_format = new SimpleDateFormat("yyyy년 M월 d일");
		SimpleDateFormat original_format2 = new SimpleDateFormat("yyyy-MM-dd");
		
		String ty_str_date = sdto.getRelease_date();
		Date date_type = original_format2.parse(ty_str_date);
	%>
	<div id="wrapper" class="container">
	
		<!-- 카테고리 -->
		<div id="cate_Detail">
			<a href="./SneakerList.go"> <span> HOME </span> </a>
			<span class="arrow"> <i class="fas fa-angle-right"></i> </span>
			<a href="./MemberDrawInfo.me"> <span> MY DRAW </span></a>
			<span class="arrow"> <i class="fas fa-angle-right"></i> </span>
			<span> <%=sdto.getModel_name() %></span>
		</div>

		<!-- content -->
		<div id="content_sneakerDetail_D">
		
			<!-- 제목 -->
			<div id="title">
				<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>"> <span> <%=sdto.getModel_name()%></span> </a>
			</div>

			<!-- 신발 기본 정보 -->
			<div id="sneaker_Detail_D">
				<div class="sneaker_image_wrapper"> 
					<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>">
						<div class="sneaker_image"> 
							<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>">
						</div>
					</a>
					<!-- 신발 이름 -->
					<div class="sneaker_name" style="display:none;">
						<span><%=sdto.getModel_name() %></span>
					</div>
				</div>
			</div>
			
			<div class="detail_wrapper_D">
				<!-- 세부사항 -->					
				<div class="desc_wrapper_D">
					<div class="sneaker_option_wrapper">
						<div class="sneaker_cate_D">
							<label> <strong> STYLECODE </strong> </label>
							<span id="model_stylecode"><%=sdto.getModel_stylecode()%></span>
						</div>
						<div class="sneaker_cate_D">
							<label> <strong> COLORWAY </strong> </label>
							<span> <%=sdto.getModel_colorway() %> </span>
						</div>
						<div class="sneaker_cate_D">
							<label> <strong> PRICE </strong> </label>
							 
							<%if(sdto.getPrice() == 0){%> 
							<span> 미정 </span>
							<%}else{%> 
							<span> ₩ <%=formatter.format(sdto.getPrice())%> </span>
							<%}%>
						</div>
						<div class="sneaker_cate_D">
							<label> <strong> RELEASE DATE </strong> </label>
							<span> 
							<%if(sdto.getRelease_date().contains("99")){%>
								미정
							<%}else{%>
								<%=date_format.format(date_type)%>
							<%}%>	
							</span>
						</div>
					</div>
				</div>
			</div>
			
		</div>

		<!-- content -->
		<div id="content_sneakerInfo_D">
			
			<!-- 응모한 브랜드 정보 보여주는 영역 -->
			<div id="content_userDrawInfo">
				<!-- 국내 응모 한 테이블 -->
				<div id="dome-draw-wrapper">
					<span> <h4> 국내 응모내역 <i class="fas fa-caret-down"></i> </h4> </span>
					<%
						if(drawInfoList_kr.isEmpty()){
					%>
						<div id="no-draw-wrapper">
							<span> 응모한 곳이 없습니다. </span>
						</div>
					<% } else {
						for(int i=0; i<drawInfoList_kr.size(); i++){
							MemberDrawDTO mddto = (MemberDrawDTO) drawInfoList_kr.get(i);
							BrandDTO bdto = (BrandDTO) brandList_kr.get(i);
							OnlineDTO odto = (OnlineDTO) onlineinfoList_kr.get(i);
					%>
						<div class="grid-wrapper_D">
							<div class="grid-item_D" onclick="window.open('<%=odto.getOnline_link()%>');">
								<!-- 로고 -->
								<div class="grid-logo">
									<a href="<%=odto.getOnline_link()%>" target="_blank"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto.getBrand_logo()%>"> </a>
								</div>
								<!-- 브랜드 내용 -->
								<div class="grid-content">
								
									<!-- 브랜드 이름 & 국기 -->
									<div id="wrapper-name">
										<span id="brand_name_D"><%=bdto.getBrand_name()%> </span>
									</div>
									
									<!-- 구매방식 -->
									<div id="wrapper-bmethod_D">
										<span id="wrapper-content_D">
											<span id="method" <%if(odto.getBuy_method().equals("당첨후 선착구매")){%> style="color: #ff6600;" <%}%>><%=odto.getBuy_method()%></span><span id="sep">|</span><span id="winner_time">발표<span id="time">시간</span> : <%if(odto.getWinner_time().equals("-")){%>-<%} else {%> <%=odto.getWinner_time()%> <%}%></span>
										</span>
									</div>
									
								</div>
							</div>
						</div>
					<%
						}
					}
					%>
				</div>
			
				<!-- 해외 응모 한 테이블 -->
				<div id="inter-draw-wrapper">
					<span> <h4> 해외 응모내역 <i class="fas fa-caret-down"></i> </h4></span>
					<%
						if(drawInfoList_etc.isEmpty()){
					%>
						<div id="no-draw-wrapper">
							<span> 응모한 곳이 없습니다. </span>
						</div>
					<% } else {
						for(int i=0; i<drawInfoList_etc.size(); i++){
							MemberDrawDTO mddto = (MemberDrawDTO) drawInfoList_etc.get(i);
							BrandDTO bdto = (BrandDTO) brandList_etc.get(i);
							OnlineDTO odto = (OnlineDTO) onlineinfoList_etc.get(i);
					%>
						<div class="grid-wrapper_D">
							<div class="grid-item_D" onclick="window.open('<%=odto.getOnline_link()%>');">
								<!-- 로고 -->
								<div class="grid-logo">
									<a href="<%=odto.getOnline_link()%>" target="_blank"> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto.getBrand_logo()%>"> </a>
								</div>
								<!-- 브랜드 내용 -->
								<div class="grid-content">
								
									<!-- 브랜드 이름 & 국기 -->
									<div id="wrapper-name">
										<span id="brand_name_D"><%=bdto.getBrand_name()%> </span>
									</div>
									
									<!-- 구매방식 -->
									<div id="wrapper-bmethod_D">
										<span id="wrapper-content_D">
											<span id="method" <%if(odto.getBuy_method().equals("당첨후 선착구매")){%> style="color: #ff6600;" <%}%>><%=odto.getBuy_method()%></span><span id="sep">|</span><span id="winner_time">발표<span id="time">시간</span> : <%if(odto.getWinner_time().equals("-")){%>-<%} else {%> <%=odto.getWinner_time()%> <%}%></span>
										</span>
									</div>
									
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
	</div>

	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>

</body>
</html>