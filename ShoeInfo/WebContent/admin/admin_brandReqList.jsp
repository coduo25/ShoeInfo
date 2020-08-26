<%@page import="net.brand.db.BrandReqDTO"%>
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
		
		List<BrandReqDTO> brandReqList = (List<BrandReqDTO>) request.getAttribute("brandReqList");
	%>
	
	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_admin_brandList">
			
			<!-- 전체 브랜드 리스트 -->
			<div>
				<h3> 전체 요청 브랜드 리스트 </h3>
				<table>
					<thead>
						<tr>
							<th style="width:10%;"> 요청 번호 </th>
							<th style="width:15%;"> 브랜드 이름 </th>
							<th style="width:35%;"> 브랜드 URL </th>
							<th style="width:10%;"> 요청 상태 </th>
							<th style="width:20%;"> 요청자 </th>
							<th style="width:10%;"> 추가하기 </th>
						</tr>
					</thead>
					<%
						for( int i=0; i<brandReqList.size(); i++){
							BrandReqDTO brdto = brandReqList.get(i);
					%>
					<tbody>
						<tr>
							<td> <%=brdto.getReq_num()%> </td>
							<td> <%=brdto.getReq_brandName()%> </td>
							<td> <%=brdto.getReq_brandURL()%> </td>
							<td> <%=brdto.getReq_status()%> </td>
							<td> <%=brdto.getReq_member()%> </td>
							<td> <a href="./AddReqBrand.ad?req_num=<%=brdto.getReq_num()%>" target="_blank" style="border: 1px solid #c0c0c0; padding: 5%;"> 추가하기 </a> </td>
						</tr>
					</tbody>
					<%}%>
				</table>
			</div>
			
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>
		

</body>
</html>