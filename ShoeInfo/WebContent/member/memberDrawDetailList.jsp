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
<title>SHOE INFO.</title>
<link href="./css/board/sneakerDetail.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:600&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<!-- Header -->	
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<%
		request.setCharacterEncoding("UTF-8");
		
		//로그인한 사용자가 체크
		String user = (String) session.getAttribute("email");
		if(user == null){
			user = "";
		}
	
		//신발 기본 정보 리스트
		SneakerDTO sdto = (SneakerDTO) request.getAttribute("sneakerDetail");
		
		//국내 응모 정보
		List<MemberDrawDTO> drawInfoList_kr = (List<MemberDrawDTO>) request.getAttribute("drawInfoList_kr");
		List<BrandDTO> brandList_kr = (List<BrandDTO>) request.getAttribute("brandList_kr");
		
		//해외 응모 정보
		List<MemberDrawDTO> drawInfoList_etc = (List<MemberDrawDTO>) request.getAttribute("drawInfoList_etc");
		List<BrandDTO> brandList_etc = (List<BrandDTO>) request.getAttribute("brandList_etc");

		DecimalFormat formatter = new DecimalFormat("#,###,###");
		
	%>
	<div id="wrapper" class="container">

		<!-- content -->
		<div id="content_sneakerDetail">
			<!-- 신발 기본 정보 -->
			<table id="sneaker_Detail" style="border-bottom: 1px solid #c3c3c3;">
				<tr>
					<td class="sneaker_image_table"> 
						<div class="sneaker_image_draw"> 
							<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>">
						</div>
					</td>
					<td class="detail_table">
						<!-- 신발 이름 -->
						<div class="sneaker_name">
							<span> <%=sdto.getModel_name() %></span>
						</div>
						
						<div class="sneaker_option_wrapper">
							<!-- relase_date -->
							<div class="sneaker_option_info">
								발매일(한국기준) : <span> <%=sdto.getRelease_date() %></span>
							</div>
							<!-- price -->
							<div class="sneaker_option_info">
								가격 : 
								<%if(sdto.getPrice() == 0){%> <span>미정</span>
								<%}else{%> <span> $<%=formatter.format(sdto.getPrice()) %></span> <%}%>
							</div>
						</div>
						
					</td>
				</tr>
			</table>
			<!-- 응모한 브랜드 정보 보여주는 영역 -->
			<div id="content_userDrawInfo">
				<!-- 국내 응모 한 테이블 -->
				<table id="drawInfoTable_kr">
					<tr>
						<th colspan="3"> [국내 응모 한 곳] </th>
					</tr>
					<%
						for(int i=0; i<drawInfoList_kr.size(); i++){
							MemberDrawDTO mddto = (MemberDrawDTO) drawInfoList_kr.get(i);
							BrandDTO bdto = (BrandDTO) brandList_kr.get(i);
					%>
						<tr>
							<td> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto.getBrand_logo()%>" width="50" height="50"> </td>
							<td> <%=bdto.getBrand_name()%></td>
							<td> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto.getCountry_flag()%>" width="22" height="15"> </td>
						</tr>
					<%
						}
					%>
				</table>
				<!-- 해외 응모 한 테이블 -->
				<table id="drawInfoTable_etc">
					<tr>
						<th colspan="3"> [해외 응모 한 곳] </th>
					</tr>
					<%
						for(int i=0; i<drawInfoList_etc.size(); i++){
							MemberDrawDTO mddto = (MemberDrawDTO) drawInfoList_etc.get(i);
							BrandDTO bdto = (BrandDTO) brandList_etc.get(i);
					%>
						<tr>
							<td> <img id="brandlogo_img" src="./brand_img_upload/<%=bdto.getBrand_logo()%>" width="50" height="50"> </td>
							<td> <%=bdto.getBrand_name()%></td>
							<td> <img id="country_flag_img" src="./countryflag_img_upload/<%=bdto.getCountry_flag()%>" width="22" height="15"> </td>
						</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>	
	</div>

	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>

</body>
</html>