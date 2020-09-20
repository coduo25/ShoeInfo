<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>SHOE INFO.</title>
<link href="./css/board/adminForm.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
	
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
	
		if(user == null || !usr_position.equals("admin")){
			response.sendRedirect("./SneakerList.go");
		}
	
		int memberNum = (int) request.getAttribute("memberNum");
		int memberPosReqNum = (int) request.getAttribute("memberPosReqNum");
		int brandNum = (int) request.getAttribute("brandNum");
		int sneakerNum = (int) request.getAttribute("sneakerNum");
		int memberDrawNum = (int) request.getAttribute("memberDrawNum");
		int memberReqBrandNum = (int) request.getAttribute("memberReqBrandNum");
		int onlineInfoNum = (int) request.getAttribute("onlineInfoNum");
		
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
	
		<!-- 제목 -->
		<div>
			<h3> 관리자 페이지 </h3>
		</div>
	
		<!-- content -->
		<div id="content_adminMain">
		
			<!-- 모든 정보 보여주는 표 -->
			<div id="total_infoTable">
				<ul>
					<li>
						<span class="total_subTit"> 총 회원 </span>
						<span class="total_main"> <a href="./MemberList.ad"> <%=memberNum%> 명 </a> </span>
					</li>
					<li>
						<span class="total_subTit"> 등업신청 </span>
						<span class="total_main"> <a href="#"> <%=memberPosReqNum%> 명 </a> </span>
					</li>
					<li>
						<span class="total_subTit"> 응모등록 </span>
						<span class="total_main"> <a href="./OnlineInfoList.ad"> <%=onlineInfoNum%> 개 </a> </span>
					</li>
					<li>
						<span class="total_subTit"> 브랜드 수 </span>
						<span class="total_main"> <a href="./BrandList.ad"> <%=brandNum%> 개 </a></span>
					</li>
					<li>
						<span class="total_subTit"> 신발 수 </span>
						<span class="total_main"> <a href="./SneakerList.ad"> <%=sneakerNum%> 개 </a></span>
					</li>
					<li>
						<span class="total_subTit"> 회원 응모 횟수 </span>
						<span class="total_main"> <a href="./MemberDrawList.ad"> <%=memberDrawNum%> 개 </a> </span>
					</li>
					<li>
						<span class="total_subTit"> 브랜드 요청 </span>
						<span class="total_main"> <a href="./BrandRequest.ad" style="color:red"> <%=memberReqBrandNum%> 개 </a></span>
					</li>
				</ul>
			</div>
			
			<!-- 신발 관리 영역 -->
			<h4> 신발 <i class="fas fa-shoe-prints"></i> </h4>
			<div id="Sneaker_wrapper">
				<div id="add_Sneaker_menu"> 
					<h5> 신발 관리하기 </h5>
					<ul>
						<li>
							<span> <a href="./AddSneaker.ad"> 새로운 신발 추가하기 <i class="fas fa-exclamation-circle"></i> </a> </span>
						</li>
						<li>
							<span> <a href="./SneakerList.ad"> 전체 목록보기 </a> </span>
						</li>
					</ul>
				</div>
				<div id="add_brand_menu">
					<h5> 브랜드 관리하기 </h5>
					<ul>
						<li>
							<span> <a href="./AddBrand.ad"> 새로운 브랜드 추가하기 <i class="fas fa-exclamation-circle"></i> </a> </span>
						</li>
						<li>
							<span> <a href="./BrandList.ad"> 전체 목록보기 </a> </span>
						</li>
						<li>
							<span> <a href="./BrandRequest.ad"> 브랜드 요청 목록보기  <i class="fas fa-exclamation-triangle"></i> </a> </span>
						</li>
					</ul>
				</div>
				<div id="add_country_menu">
					<h5> 국가 관리하기 </h5>
					<ul>
						<li>
							<span> <a href="./AddCountry.ad"> 새로운 국가 추가하기 <i class="fas fa-exclamation-circle"></i> </a> </span>
						</li>
						<li>
							<span> <a href="./CountryList.ad"> 전체 목록보기 </a> </span>
						</li>
					</ul>
				</div>
			</div>
		
			<!-- 회원 관리 영역 -->
			<h4> 회원 <i class="fas fa-user-friends"></i> </h4>
			<div id="Member_wrapper" style=" margin-bottom: 50px; ">
				<div id="Member_menu"> 
					<ul>
						<li>
							<span> <a href="./MemberList.ad"> 전체 회원 보기 </a> </span>
						</li>
					</ul>
				</div>
			</div>

		</div>
		
		
	</div>

	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>
</body>
</html>