<%@page import="net.board.action.Criteria"%>
<%@page import="net.board.action.PageMaker"%>
<%@page import="net.brand.db.BrandDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		if(user == null){
			response.sendRedirect("./SneakerList.go");
		}
		
		List<BrandDTO> admin_brandList = (List<BrandDTO>) request.getAttribute("admin_brandList");
		
		PageMaker pageMaker = (PageMaker) request.getAttribute("pageMaker");
		Criteria cri = (Criteria) request.getAttribute("cri");
		int pageNum = (int) request.getAttribute("pageNum");
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_admin_brandList">
			
			<!-- 전체 브랜드 리스트 -->
			<div>
				<h3> 전체 브랜드 리스트 </h3>
				<table>
					<thead>
						<tr>
							<th style="width:10%;"> 이미지 </th>
							<th style="width:10%;"> 국가 </th>
							<th style="width:20%;"> 브랜드 이름 </th>
							<th style="width:40%;"> 브랜드 아이디 </th>
							<th style="width:20%;"> 수정/삭제 </th>
						</tr>
					</thead>
					<%
						for( int i=0; i<admin_brandList.size(); i++){
							BrandDTO bdto = admin_brandList.get(i);
					%>
					<tbody>
						<tr>
							<td> <img src="./brand_img_upload/<%=bdto.getBrand_logo().split(",")[0]%>"> </td>
							<td> <%=bdto.getCountry_name()%> </td>
							<td> <%=bdto.getBrand_name()%> </td>
							<td> <%=bdto.getBrand_id()%> </td>
							<td> <input type="button" id="modi_btn" onclick="location.href='./UpdateBrandInfo.ad?brand_id=<%=bdto.getBrand_id()%>'" value="수정"> / <input type="button" id="modi_btn" value="삭제"> </td>
						</tr>
					</tbody>
					<%}%>
				</table>
			</div>
			
			<!-- 페이징 처리 영역 -->
			<div class="page_Area">
				<ul id="pageList">
					<%if(pageMaker.isPrev()) {%>
						<li onclick="location.href='./BrandList.ad?pageNum=<%=pageMaker.getStartPage()-1 %> '">
							<i class="fas fa-angle-double-left"></i>
						</li>
					<%} if(pageNum != 1) {%>
						<li onclick="location.href='./BrandList.ad?pageNum=<%=pageNum-1%>'">
							<i class="fas fa-angle-left"></i>
						</li>
					<%} for(int i = pageMaker.getStartPage(); i<=pageMaker.getEndPage(); i++){ %>
						<li onclick="location.href='./BrandList.ad?pageNum=<%=i%>'" <%if(pageNum == i) {%> style="font-weight: bold" <%}%>>
							<%=i%>
						</li>
					<%} if(pageNum != pageMaker.getEndPage()) {
					%>
						<li onclick="location.href='./BrandList.ad?pageNum=<%=pageNum+1%>'">
							<i class="fas fa-angle-right"></i>
						</li>
					<%} if(pageMaker.isNext() && pageMaker.getEndPage() > 0){ %>
						<li onclick="location.href='./BrandList.ad?&pageNum=<%=pageMaker.getEndPage()+1%>'">
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