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
		
		List<MemberDrawDTO> memberDrawList = (List<MemberDrawDTO>) request.getAttribute("memberDrawList");
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
			
			<!-- 전체 멤버 리스트 -->
			<div>
				<h3> 전체 멤버 응모 리스트 </h3>
				<table>
					<thead>
						<tr>
							<th style="width:5%;"> 번호 </th>
							<th style="width:5%;"> 신발 </th>
							<th style="width:15%;"> 멤버 </th>
							<th style="width:8%;"> 브랜드이미지 </th>
							<th style="width:15%;"> 브랜드 </th>
						</tr>
					</thead>
					<%
						for( int i=0; i<memberDrawList.size(); i++){
							MemberDrawDTO mddto = memberDrawList.get(i);
							SneakerDTO sdto = sneakerInfoList.get(i);
							BrandDTO bdto = brandInfoList.get(i);
					%>
					<tbody>
						<tr>
							<td> <%=mddto.getUserDraw_num()%> </td>
							<td> 
								<a href="./MemberDrawDetailInfo.me?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>">
		  							<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" width="50"> <br>
								</a>
							</td>
							<td> <%=mddto.getMember_email()%> </td>
							<td> 
								<img src="./brand_img_upload/<%=bdto.getBrand_logo().split(",")[0]%>" width="30">
							</td>
							<td> <%=bdto.getBrand_name()%> </td>
						</tr>
					</tbody>
					<%}%>
				</table>
			</div>
			
			<!-- 페이징 처리 영역 -->
			<div class="page_Area">
				<ul id="pageList">
					<%if(pageNum > 1) {%>
						<li onclick="location.href='./MemberDrawList.ad?pageNum=<%=pageMaker.getStartPage()-1 %> '">
							<i class="fas fa-angle-double-left"></i>
						</li>
					<%} if(pageMaker.isPrev()) {%>
						<li onclick="location.href='./MemberDrawList.ad?pageNum=<%=pageNum-1%>'">
							<i class="fas fa-angle-left"></i>
						</li>
					<%} for(int i = pageMaker.getStartPage(); i<=pageMaker.getEndPage(); i++){ %>
						<li onclick="location.href='./MemberDrawList.ad?pageNum=<%=i%>'" <%if(pageNum == i) {%> style="font-weight: bold" <%}%>>
							<%=i%>
						</li>
					<%} if(pageMaker.isNext() && pageMaker.getEndPage() > 0) {
					%>
						<li onclick="location.href='./MemberDrawList.ad?pageNum=<%=pageNum+1%>'">
							<i class="fas fa-angle-right"></i>
						</li>
					<%} if(pageNum != pageMaker.getEndPage()+1 && pageMaker.getEndPage() > 0){ %>
						<li onclick="location.href='./MemberDrawList.ad?&pageNum=<%=pageMaker.getEndPage()+1%>'">
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