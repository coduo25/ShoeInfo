<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
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
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<%
	//신발 기본 정보 리스트
	SneakerDTO sdto = (SneakerDTO) request.getAttribute("sneakerDetail");
%>
<title><%=sdto.getModel_name_kr()%> | SHOE INFO.</title>
<link href="./css/board/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:600&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Kelly+Slab&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Oxanium&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body> <!-- oncontextmenu='return false' onselectstart='return false' ondragstart='return false' -->

	<!-- Main Content -->
	<%
		request.setCharacterEncoding("UTF-8");
		
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		if(user == null){
			response.sendRedirect("./MemberLogin.me");
		}
	
		//국내 응모 정보
		List<MemberDrawDTO> drawInfoList_kr = (List<MemberDrawDTO>) request.getAttribute("drawInfoList_kr");
		List<BrandDTO> brandList_kr = (List<BrandDTO>) request.getAttribute("brandList_kr");
		List<OnlineDTO> onlineinfoList_kr = (List<OnlineDTO>) request.getAttribute("onlineinfoList_kr");
		int countDraw_kr = (Integer) request.getAttribute("countDraw_kr");
		
		//해외 응모 정보
		List<MemberDrawDTO> drawInfoList_etc = (List<MemberDrawDTO>) request.getAttribute("drawInfoList_etc");
		List<BrandDTO> brandList_etc = (List<BrandDTO>) request.getAttribute("brandList_etc");
		List<OnlineDTO> onlineinfoList_etc = (List<OnlineDTO>) request.getAttribute("onlineinfoList_etc");
		int countDraw_etc = (Integer) request.getAttribute("countDraw_etc");

		DecimalFormat formatter = new DecimalFormat("#,###,###");
		SimpleDateFormat date_format = new SimpleDateFormat("yyyy년 M월 d일");
		SimpleDateFormat original_format2 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dot_format = new SimpleDateFormat("yyyy.MM.dd");
		
		String ty_str_date = sdto.getRelease_date();
		Date date_type = original_format2.parse(ty_str_date);
	%>
	
	<!-- Header -->	
	<header> <jsp:include page="/include/header.jsp" /> </header>
	
	<div id="wrapper" class="container">
	
		<!-- 좌측 사이드 바 -->
		<jsp:include page="/include/leftSideBar.jsp" />

		<!-- 신발 정보 container -->
		<div class="shoeinfo-container" style="margin-top:30px; padding-top:0 !important; padding-bottom:25px;">
			<!-- 신발 이미지 -->
			<div class="shoeImg-container">
				<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>">
			</div>
			
			<!-- 신발 상세정보 -->
			<div class="shoeDetailInfo-container">
				<div class="shoeDetailInfo-name">
					<!-- 영문 이름 -->
					<div class="shoeFullName_eng">
						<span> <%=sdto.getModel_name()%></span>
					</div>
					<!-- 한글 이름 -->
					<div class="shoeFullName_kr">
						<span> <%=sdto.getModel_name_kr()%> </span>
					</div>
					
					<!-- 상세 정보 -->
					<div class="shoeDetailInfo">
						<!-- 제품 상제 정보 -->
						<div class="shoeDetailInfo-content">
							<span class="shoeinfo-cateAns">
								<%=sdto.getModel_stylecode()%>
									<span class="dividePipe">|</span>
								<div class="shoeDetailInfo-modelColorWay">
									<%=sdto.getModel_colorway()%>
								</div>
									<span class="dividePipe">|</span>
								<%if(sdto.getRelease_date().contains("99")){%>
									미정
								<%}else{%>
									<%=dot_format.format(date_type)%>
								<%}%>
							</span>
						</div>
					</div>
				</div>
				
				<!-- 발매처 보러가기 버튼 -->
				<div class="shoeDetailInfo-directlinks">
					<span onclick="location.href='./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>'"><i class="fab fa-sistrix"></i> 발매처 보러가기</span>
				</div>
			</div>
		</div>
			
		<!-- 중간 광고 970x90 -->
		<div class="betweenAds-container">
			<div class="betweenAds-box">
				
			</div>
		</div>
		
		<!-- Pad - 중간 광고 728x90 -->
		<div class="betweenAdsPad-container" style="display:none;">
			<div class="betweenAdsPad-box">
				
			</div>
		</div>
		
		<!-- Phone - 중간 광고 320x50 -->
		<div class="betweenAdsPhone-container" style="display:none;">
			<div class="betweenAdsPhone-box">
			</div>
		</div>
		
		<!-- phone일때 국내/해외 카테고리 박스 -->
		<div class="phone-regionCate-container">
			<!-- 국내 -->
			<div class="regionCate-div" id="regionCate-국내" style="color:white; border:1px solid black; background-color:black; font-weight:bold; margin-right:3px;">
				<span>국내(<%=countDraw_kr%>)</span>
			</div>
			<!-- 해외 -->
			<div class="regionCate-div" id="regionCate-해외" style="margin-left:3px;">
				<span>해외(<%=countDraw_etc%>)</span>
			</div>
		</div>
		
		<div class="myDrawListDetail-container" style="margin-top:30px; padding-top:0 !important;">
		
			<!-- 응모 브랜드 리스트 -->
			<div class="brandList-container">
				<div class="brandList-table">
				
					<div class="sub-title" id="sub-title국내">
						<h4> 국내 참여 내역 <span style="font-weight:normal; font-size:16px; color:#666;">총 <%=countDraw_kr%>건</span> </h4>
					</div>
					
					<!-- 국내 테이블 -->
					<div class="kr-table" id="table국내">
						<table>
							<tr>
								<th style="width:8%"> 번호 </th>
								<th style="width:30%;"> 응모처 </th>
								<th style="width:25%;"> 응모발표일 </th>
								<th style="width:12%;"> 수신방식 </th>
								<th style="width:25%;"> 구매기간 </th>
							</tr>
							<%
								if(drawInfoList_kr.isEmpty()){
							%>
								<tr id="no-draw-wrapper">
									<td colspan="5"> 응모한 곳이 없습니다. </td>
								</tr>
							<% } else {
								for(int i=0; i<drawInfoList_kr.size(); i++){
									MemberDrawDTO mddto = (MemberDrawDTO) drawInfoList_kr.get(i);
									BrandDTO bdto = (BrandDTO) brandList_kr.get(i);
									OnlineDTO odto = (OnlineDTO) onlineinfoList_kr.get(i);
							%>
							<tr>
								<!-- 번호 -->
								<td>
									<span><%=i+1%>.</span>
								</td>
								<!-- 브랜드 이미지 + 이름-->
								<td class="brandLogoName">
									<div style="display:flex; align-items: center;">
										<div class="myDraw-logo">
											<a href="<%=odto.getOnline_link()%>" target="_blank"> 
												<img id="brandlogo_img" src="./brand_img_upload/<%=bdto.getBrand_logo()%>">
											</a>
										</div>
										<div class="myDraw-brandName">
											<div class="myDraw-brandNameTxt">
												<span><%=bdto.getBrand_name()%> </span>
											</div>
										</div>
									</div>
									
									<!-- phone 추가 정보 -->
									<div class="phone-drawDetail">
										<!-- 발표일 -->
										<div>
											<span>발표 : </span>
											<span>
												<%if(odto.getWinner_time().equals("-")){%>-<%} else {%> <%=odto.getWinner_time()%> <%}%>
											</span>	
										</div>
										<!-- 수신방식 -->
										<div>
											<span>수신 : </span>
											<span><i class="fas fa-sms"></i></span>
										</div>
										<!-- 구매기간 -->
										<div>
											<span>구매 : </span>
											<span>2021.00.00 ~ 2021.00.00</span>
										</div>
									</div>
									
								</td>
								<!-- 발표일 -->
								<td>
									<div style="padding-bottom:5px;">
<%-- 									<%if(odto.getWinner_time().equals("-")){%>-<%} else {%> <%=odto.getWinner_time()%> <%}%> --%>
										0.00 00:00
									</div>
									<div>
										--:--:--
									</div>
								</td>
								<!-- 수신방식 -->
								<td>
									<div style="font-size:22px; color:#121212;">
										<span><i class="fas fa-sms"></i></span>
									</div>
								</td>
								<!-- 구매기간 -->
								<td>
									<div>
										<span>2021.00.00 ~ 2021.00.00</span>
									</div>
								</td>
							</tr>
							<% } }%>
						</table>
					</div>
					
					<div class="sub-title" style="padding-top:50px;" id="sub-title해외">
						<h4> 해외 참여 내역 <span style="font-weight:normal; font-size:16px; color:#666;">총 <%=countDraw_etc%>건</span> </h4>
					</div>
					
					<!-- 해외 테이블 -->
					<div class="etc-table" id="table해외">
						<table>
							<tr>
								<th style="width:8%"> 번호 </th>
								<th style="width:30%;"> 응모처 </th>
								<th style="width:25%;"> 응모발표일 </th>
								<th style="width:12%;"> 수신방식 </th>
								<th style="width:25%;"> 구매기간 </th>
							</tr>
							<%
								if(drawInfoList_etc.isEmpty()){
							%>
								<tr id="no-draw-wrapper">
									<td colspan="5"> 응모한 곳이 없습니다. </td>
								</tr>
							<% } else {
								for(int i=0; i<drawInfoList_etc.size(); i++){
									MemberDrawDTO mddto = (MemberDrawDTO) drawInfoList_etc.get(i);
									BrandDTO bdto = (BrandDTO) brandList_etc.get(i);
									OnlineDTO odto = (OnlineDTO) onlineinfoList_etc.get(i);
							%>
							<tr>
								<!-- 번호 -->
								<td>
									<span><%=i+1%></span>
								</td>
								<!-- 브랜드 이미지 + 이름-->
								<td class="brandLogoName">
									<div style="display:flex; align-items: center;">
										<div class="myDraw-logo">
											<a href="<%=odto.getOnline_link()%>" target="_blank"> 
												<img id="brandlogo_img" src="./brand_img_upload/<%=bdto.getBrand_logo()%>">
											</a>
										</div>
										<div class="myDraw-brandName">
											<div class="myDraw-brandNameTxt">
												<span><%=bdto.getBrand_name()%> </span>
											</div>
										</div>
									</div>
									
									<!-- phone 추가 정보 -->
									<div class="phone-drawDetail">
										<!-- 발표일 -->
										<div>
											<span>발표 : </span>
											<span>
												<%if(odto.getWinner_time().equals("-")){%>-<%} else {%> <%=odto.getWinner_time()%> <%}%>
											</span>	
										</div>
										<!-- 수신방식 -->
										<div>
											<span>수신 : </span>
											<span><i class="fas fa-sms"></i></span>
										</div>
										<!-- 구매기간 -->
										<div>
											<span>구매 : </span>
											<span>2021.00.00 ~ 2021.00.00</span>
										</div>
									</div>
									
								</td>
								<!-- 발표일 -->
								<td>
									<div style="padding-bottom:5px;">
<%-- 														<%if(odto.getWinner_time().equals("-")){%>-<%} else {%> <%=odto.getWinner_time()%> <%}%> --%>
										0.00 00:00
									</div>
									<div>
										--:--:--
									</div>
								</td>
								<!-- 수신방식 -->
								<td>
									<div style="font-size:22px; color:#121212;">
										<span><i class="far fa-envelope"></i></span>
									</div>
								</td>
								<!-- 구매기간 -->
								<td>
									<div>
										<span>2021.00.00 ~ 2021.00.00</span>
									</div>
								</td>
							</tr>
							<%} }%>
						</table>
					</div>

				</div>
			</div>
		
		</div>
		
		<!-- 중간 광고 970x250 -->
		<div class="betweenAds2-container">
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
		
		//phone일때 국내/해외 카테고리 박스 클릭했을시
		$('.regionCate-div').click(function(){
			//국내/해외 카테고리 css 없애고
			$('.regionCate-div').css('border','1px solid #f1f1f1');
			$('.regionCate-div').css('background-color', 'white');
			$('.regionCate-div').css('color', '#777777');
			$('.regionCate-div').css('font-weight', 'normal');
			//모든 발매리스트 없애고
			$('.sub-title').css('display','none');
			$('.kr-table, .etc-table').css('display','none');
			
			//아이디 값 가져오기
			var divID = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = divID.split('-');
			// 제일 마지막 '국내' '해외' 만 가지고 오기
			var cateRegion = splitArray[splitArray.length - 1];
			
			$('#regionCate-'+cateRegion).css('border','1px solid black');
			$('#regionCate-'+cateRegion).css('background-color', 'black');
			$('#regionCate-'+cateRegion).css('color', 'white');
			$('#regionCate-'+cateRegion).css('font-weight', 'bold');
			
			$('#sub-title'+cateRegion).fadeIn();
			$('#table'+cateRegion).fadeIn();
			
			
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