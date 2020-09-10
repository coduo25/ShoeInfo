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
		
		List<MemberDTO> admin_memberList = (List<MemberDTO>) request.getAttribute("admin_memberList");
		
		PageMaker pageMaker = (PageMaker) request.getAttribute("pageMaker");
		Criteria cri = (Criteria) request.getAttribute("cri");
		int pageNum = (int) request.getAttribute("pageNum");
		
		SimpleDateFormat new_format = new SimpleDateFormat ( "yyyy년 MM월 dd일");
	%>

	<!-- Header -->	
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_admin_memberList">
			
			<!-- 전체 멤버 리스트 -->
			<div>
				<h3> 전체 멤버 리스트 </h3>
				<table>
					<thead>
						<tr>
							<th style="width:8%;"> 번호 </th>
							<th style="width:21%;"> 이메일 </th>
							<th style="width:13%;"> 이름 </th>
							<th style="width:10%;"> 휴대폰번호 </th>
							<th style="width:17%;"> 가입날짜 </th>
							<th style="width:7%;"> 포지션 </th>
							<th style="width:10%;"> 수정/삭제 </th>
						</tr>
					</thead>
					<%
						for( int i=0; i<admin_memberList.size(); i++){
							MemberDTO mdto = admin_memberList.get(i);
							String reg_date = new_format.format(mdto.getReg_date());
					%>
					<tbody>
						<tr>
							<td> <%=mdto.getCount()%> </td>
							<td> <%=mdto.getEmail()%> </td>
							<td> <%=mdto.getName()%> </td>
							<td> <%=mdto.getPhone()%> </td>
							<td> <%=reg_date%> </td>
							<td> <%=mdto.getPosition()%> </td>
							<td> <input type="button" id="modi_btn" onclick="location.href='./UpdateSneakerInfo.ad?model_stylecode='" value="수정"> / <input type="button" id="modi_btn" value="삭제"> </td>
						</tr>
					</tbody>
					<%}%>
				</table>
			</div>
			
			<!-- 페이징 처리 영역 -->
			<div class="page_Area">
				<ul id="pageList">
					<%if(pageMaker.isPrev()) {%>
						<li onclick="location.href='./MemberList.ad?pageNum=<%=pageMaker.getStartPage()-1 %> '">
							<i class="fas fa-angle-double-left"></i>
						</li>
					<%} if(pageNum != 1) {%>
						<li onclick="location.href='./MemberList.ad?pageNum=<%=pageNum-1%>'">
							<i class="fas fa-angle-left"></i>
						</li>
					<%} for(int i = pageMaker.getStartPage(); i<=pageMaker.getEndPage(); i++){ %>
						<li onclick="location.href='./MemberList.ad?pageNum=<%=i%>'" <%if(pageNum == i) {%> style="font-weight: bold" <%}%>>
							<%=i%>
						</li>
					<%} if(pageNum != pageMaker.getEndPage()) {
					%>
						<li onclick="location.href='./MemberList.ad?pageNum=<%=pageNum+1%>'">
							<i class="fas fa-angle-right"></i>
						</li>
					<%} if(pageMaker.isNext() && pageMaker.getEndPage() > 0){ %>
						<li onclick="location.href='./MemberList.ad?&pageNum=<%=pageMaker.getEndPage()+1%>'">
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