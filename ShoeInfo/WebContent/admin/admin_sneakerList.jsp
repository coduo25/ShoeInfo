<%@page import="net.sneaker.db.SneakerDTO"%>
<%@page import="java.util.List"%>
<%@page import="net.board.action.PageMaker"%>
<%@page import="net.board.action.Criteria"%>
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
		
		List<SneakerDTO> admin_sneakerList = (List<SneakerDTO>) request.getAttribute("admin_sneakerList");
		
		PageMaker pageMaker = (PageMaker) request.getAttribute("pageMaker");
		Criteria cri = (Criteria) request.getAttribute("cri");
		int pageNum = (int) request.getAttribute("pageNum");
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_admin_sneakerList">
			
			<!-- 전체 신발 리스트 -->
			<div>
				<h3> 전체 신발 리스트 </h3>
				
				<!-- 검색하는 input 창 -->
				<div class="search_wrapper">
					<div class="input_wrapper">
						<input class="search_input" type="text" size="20">
					</div>
					<div class="btn_wrapper">
						<button class="search_btn"> 검색 </button>
					</div>
				</div>
				
				<table>
					<thead>
						<tr>
							<th style="width:10%;"> 이미지 </th>
							<th style="width:35%;"> 이름 </th>
							<th style="width:13%;"> 스타일 코드 </th>
							<th style="width:11%;"> 가격 </th>
							<th style="width:11%;"> 출시일 </th>
							<th style="width:9%;"> 발매방식 </th>
							<th style="width:11%;"> 수정/삭제 </th>
						</tr>
					</thead>
					<%
						for( int i=0; i<admin_sneakerList.size(); i++){
							SneakerDTO sdto = admin_sneakerList.get(i);
					%>
					<tbody>
						<tr>
							<td> <a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>"> <img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>"> </a> </td>
							<td> <%=sdto.getModel_name() %> </td>
							<td> <%=sdto.getModel_stylecode() %>  </td>
							<td> <%=sdto.getPrice() %> 원  </td>
							<td> <%=sdto.getRelease_date() %>  </td>
							<td> 
								<%if(sdto.getRelease_status().equals("planned")){ %>
									정식발매
								<%} else if(sdto.getRelease_status().equals("planned")){%>
									기습발매
								<%}%>
							</td>
							<td> <input type="button" id="modi_btn" onclick="location.href='./UpdateSneakerInfo.ad?model_stylecode=<%=sdto.getModel_stylecode()%>'" value="수정"> / <input type="button" id="modi_btn" value="삭제"> </td>
						</tr>
					</tbody>
					<%}%>
				</table>
			</div>
			
			<!-- 페이징 처리 영역 -->
			<div class="page_Area">
				<ul id="pageList">
					<%if(pageMaker.isPrev()) {%>
						<li onclick="location.href='./SneakerList.ad?pageNum=<%=pageMaker.getStartPage()-1 %> '">
							<i class="fas fa-angle-double-left"></i>
						</li>
					<%} if(pageNum != 1) {%>
						<li onclick="location.href='./SneakerList.ad?pageNum=<%=pageNum-1%>'">
							<i class="fas fa-angle-left"></i>
						</li>
					<%} for(int i = pageMaker.getStartPage(); i<=pageMaker.getEndPage(); i++){ %>
						<li onclick="location.href='./SneakerList.ad?pageNum=<%=i%>'" <%if(pageNum == i) {%> style="font-weight: bold" <%}%>>
							<%=i%>
						</li>
					<%} if(pageNum != pageMaker.getEndPage()) {
					%>
						<li onclick="location.href='./SneakerList.ad?pageNum=<%=pageNum+1%>'">
							<i class="fas fa-angle-right"></i>
						</li>
					<%} if(pageMaker.isNext() && pageMaker.getEndPage() > 0){ %>
						<li onclick="location.href='./SneakerList.ad?&pageNum=<%=pageMaker.getEndPage()+1%>'">
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