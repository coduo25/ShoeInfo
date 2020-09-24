<%@page import="net.online.db.OnlineDTO"%>
<%@page import="net.brand.db.BrandDTO"%>
<%@page import="net.sneaker.db.SneakerDTO"%>
<%@page import="net.member.db.MemberDrawDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.board.action.Criteria"%>
<%@page import="net.board.action.PageMaker"%>
<%@page import="java.util.List"%>
<%@page import="net.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>SHOE INFO.</title>
<link href="./css/board/adminForm.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<%
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
	
		if(user == null || !usr_position.equals("admin")){
			response.sendRedirect("./SneakerList.go");
		}
		
		List<OnlineDTO> onlineInfoList = (List<OnlineDTO>) request.getAttribute("onlineInfoList");
		List<SneakerDTO> sneakerInfoList = (List<SneakerDTO>) request.getAttribute("sneakerInfoList");
		List<BrandDTO> brandInfoList = (List<BrandDTO>) request.getAttribute("brandInfoList");
		
		PageMaker pageMaker = (PageMaker) request.getAttribute("pageMaker");
		Criteria cri = (Criteria) request.getAttribute("cri");
		int pageNum = (int) request.getAttribute("pageNum");
	%>
	
	<!-- Header -->	
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_admin_memberList">
			
			<!-- 회원 응모등록 리스트 -->
			<div>
				<h3> 회원 응모등록 리스트 </h3>
				<table>
					<thead>
						<tr>
							<th style="width:5%;"> 번호 </th>
							<th style="width:5%;"> 신발 </th>
							<th style="width:10%;"> 등록자 </th>
							<th style="width:5%;"> 브랜드이미지 </th>
							<th style="width:10%;"> 브랜드 </th>
							<th style="width:10%;"> 등록날짜 </th>
							<th style="width:5%;"> 수정/삭제 </th>
						</tr>
					</thead>
					<%
						for( int i=0; i<onlineInfoList.size(); i++){
							OnlineDTO odto = onlineInfoList.get(i);
							SneakerDTO sdto = sneakerInfoList.get(i);
							BrandDTO bdto = brandInfoList.get(i);
					%>
					<tbody>
						<tr>
							<td> <%=odto.getOnline_num()%> </td> 
							<td> 
								<a href="./SneakerDetail.go?model_stylecode=<%=odto.getModel_stylecode()%>&num=<%=odto.getModel_num()%>">
		  								<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" width="50"> <br>
								</a>
							</td>
							<td> <%=odto.getOnline_writer()%> </td>
							<td> 
								<img src="./brand_img_upload/<%=bdto.getBrand_logo().split(",")[0]%>" width="30">
							</td>
							<td> <%=bdto.getBrand_name()%> </td>
							<td> <%=odto.getReg_date()%> </td>
							<td>
								<a href="./UpdateDrawInfo.me?model_stylecode=<%=odto.getModel_stylecode()%>&brand_id=<%=bdto.getBrand_id()%>&num=<%=odto.getModel_num()%>">수정</a>
								/
								<a href="./DeleteDrawInfo.ad?model_stylecode=<%=odto.getModel_stylecode()%>&brand_id=<%=odto.getBrand_id()%>&model_num=<%=sdto.getNum()%>">삭제</a>
							</td>
						</tr>
					</tbody>
					<%}%>
				</table>
			</div>
			
			<!-- 페이징 처리 영역 -->
			<div class="page_Area">
				<ul id="pageList">
					<%if(pageNum > 1) {%>
						<li onclick="location.href='./OnlineInfoList.ad?pageNum=<%=pageMaker.getStartPage()-1 %> '">
							<i class="fas fa-angle-double-left"></i>
						</li>
					<%} if(pageMaker.isPrev()) {%>
						<li onclick="location.href='./OnlineInfoList.ad?pageNum=<%=pageNum-1%>'">
							<i class="fas fa-angle-left"></i>
						</li>
					<%} for(int i = pageMaker.getStartPage(); i<=pageMaker.getEndPage(); i++){ %>
						<li onclick="location.href='./OnlineInfoList.ad?pageNum=<%=i%>'" <%if(pageNum == i) {%> style="font-weight: bold" <%}%>>
							<%=i%>
						</li>
					<%} if(pageMaker.isNext() && pageMaker.getEndPage() > 0) {
					%>
						<li onclick="location.href='./OnlineInfoList.ad?pageNum=<%=pageNum+1%>'">
							<i class="fas fa-angle-right"></i>
						</li>
					<%} if(pageNum != pageMaker.getEndPage()+1 && pageMaker.getEndPage() > 0){ %>
						<li onclick="location.href='./OnlineInfoList.ad?&pageNum=<%=pageMaker.getEndPage()+1%>'">
							<i class="fas fa-angle-double-right"></i>
						</li>
					<%} %>
				</ul>
			</div>
			
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>

</body>
</html>