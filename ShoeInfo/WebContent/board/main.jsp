<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sneaker.db.SneakerDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/board/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
</head>
<body>
	<%
		List<SneakerDTO> sneakerList1 = (List<SneakerDTO>) request.getAttribute("sneakerList1");
		List<SneakerDTO> sneakerList2 = (List<SneakerDTO>) request.getAttribute("sneakerList2");
		List<SneakerDTO> sneakerList3 = (List<SneakerDTO>) request.getAttribute("sneakerList3");
		List<SneakerDTO> sneakerList4 = (List<SneakerDTO>) request.getAttribute("sneakerList4");
		List<SneakerDTO> sneakerList5 = (List<SneakerDTO>) request.getAttribute("sneakerList5");
		List<SneakerDTO> sneakerList6 = (List<SneakerDTO>) request.getAttribute("sneakerList6");
		List<SneakerDTO> sneakerList7 = (List<SneakerDTO>) request.getAttribute("sneakerList7");
		List<SneakerDTO> sneakerList8 = (List<SneakerDTO>) request.getAttribute("sneakerList8");
		List<SneakerDTO> sneakerList9 = (List<SneakerDTO>) request.getAttribute("sneakerList9");
		List<SneakerDTO> sneakerList10 = (List<SneakerDTO>) request.getAttribute("sneakerList10");
		List<SneakerDTO> sneakerList11 = (List<SneakerDTO>) request.getAttribute("sneakerList11");
		List<SneakerDTO> sneakerList12 = (List<SneakerDTO>) request.getAttribute("sneakerList12");
		
		SimpleDateFormat original_format = new SimpleDateFormat("yyyy-MM-dd");
		
		SimpleDateFormat new_format = new SimpleDateFormat("MM/dd");
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- side bar -->
		<div id="main-nav">
			<a href="./SneakerList.go" class="menu-link">런칭 캘린더</a>
			<a href="" class="menu-link">발매 정보</a>
		</div>
		<!-- content -->
		<div id="content_sneakerList">
			<table id="sneaker_List" border = "0">
				<tr>
					<td colspan="6"> 4월 April.</td>
				</tr>
				<%    
			        int size = sneakerList4.size();
				    int col = 5;
				    int row = (size / col) + (size%col>0? 1:0);
				    int num = 0;
					for (int a = 0; a < row; a++) {
				%>
				<tr>
					<%
						for (int i = 0; i <col; i++) {
							SneakerDTO sdto = sneakerList4.get(num);
							Date original_release_date = original_format.parse(sdto.getRelease_date());
							String new_release_date = new_format.format(original_release_date);
					%>
					<td colspan="2" style="padding: 15px;">
						<div class="shoelist_image">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
			  					<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" width="180" height="130"> <br>
								<div class="popup_date">
									<%= new_release_date %> 발매 <br>
								</div>
							</a>
						</div>
					</td>
					<%
						   num++;  
						   if(size <= num) break;		
						}
					%>
				</tr>
				<%
					} 
				%>
			</table>
			<!-- 5월 발매 테이블 -->
			<table id="sneaker_List" border = "0">
				<tr>
					<td colspan="6"> 5월 April.</td>
				</tr>
				<%    
			        size = sneakerList5.size();
				    col = 5;
				    row = (size / col) + (size%col>0? 1:0);
				    num = 0;
					for (int a = 0; a < row; a++) {
				%>
				<tr>
					<%
						for (int i = 0; i <col; i++) {
							SneakerDTO sdto = sneakerList5.get(num);
							Date original_release_date = original_format.parse(sdto.getRelease_date());
							String new_release_date = new_format.format(original_release_date);
					%>
					<td colspan="2" style="padding: 15px;">
						<div class="shoelist_image">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
			  					<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" width="180" height="130"> <br>
								<div class="popup_date">
									<%= new_release_date %> 발매 <br>
								</div>
							</a>
						</div>
					</td>
					<%
						   num++;  
						   if(size <= num) break;		
						}
					%>
				</tr>
				<%
					} 
				%>
			</table>
			<!-- 6월 발매 테이블 -->
			<table id="sneaker_List" border = "0">
				<tr>
					<td colspan="6"> 6월 June.</td>
				</tr>
				<%    
			        size = sneakerList6.size();
				    col = 5;
				    row = (size / col) + (size%col>0? 1:0);
				    num = 0;
					for (int a = 0; a < row; a++) {
				%>
				<tr>
					<%
						for (int i = 0; i <col; i++) {
							SneakerDTO sdto = sneakerList6.get(num);
							Date original_release_date = original_format.parse(sdto.getRelease_date());
							String new_release_date = new_format.format(original_release_date);
					%>
					<td colspan="2" style="padding: 15px;">
						<div class="shoelist_image">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
			  					<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" width="180" height="130"> <br>
								<div class="popup_date">
									<%= new_release_date %> 발매 <br>
								</div>
							</a>
						</div>
					</td>
					<%
						   num++;  
						   if(size <= num) break;		
						}
					%>
				</tr>
				<%
					} 
				%>
			</table>
			<!-- 7월 발매 테이블 -->
			<table id="sneaker_List" border = "0">
				<tr>
					<td colspan="6"> 7월 July.</td>
				</tr>
				<%    
			        size = sneakerList6.size();
				    col = 5;
				    row = (size / col) + (size%col>0? 1:0);
				    num = 0;
					for (int a = 0; a < row; a++) {
				%>
				<tr>
					<%
						for (int i = 0; i <col; i++) {
							SneakerDTO sdto = sneakerList7.get(num);
							Date original_release_date = original_format.parse(sdto.getRelease_date());
							String new_release_date = new_format.format(original_release_date);
					%>
					<td colspan="2" style="padding: 15px;">
						<div class="shoelist_image">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
			  					<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" width="180" height="130"> <br>
								<div class="popup_date">
									<%= new_release_date %> 발매 <br>
								</div>
							</a>
						</div>
					</td>
					<%
						   num++;  
						   if(size <= num) break;		
						}
					%>
				</tr>
				<%
					} 
				%>
			</table>
			<!-- 8월 발매 테이블 -->
			<table id="sneaker_List" border = "0">
				<tr>
					<td colspan="6"> 8월 August.</td>
				</tr>
				<%    
			        size = sneakerList8.size();
				    col = 5;
				    row = (size / col) + (size%col>0? 1:0);
				    num = 0;
					for (int a = 0; a < row; a++) {
				%>
				<tr>
					<%
						for (int i = 0; i <col; i++) {
							SneakerDTO sdto = sneakerList8.get(num);
							Date original_release_date = original_format.parse(sdto.getRelease_date());
							String new_release_date = new_format.format(original_release_date);
					%>
					<td colspan="2" style="padding: 15px;">
						<div class="shoelist_image">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
			  					<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" width="180" height="130"> <br>
								<div class="popup_date">
									<%= new_release_date %> 발매 <br>
								</div>
							</a>
						</div>
					</td>
					<%
						   num++;  
						   if(size <= num) break;		
						}
					%>
				</tr>
				<%
					} 
				%>
			</table>
		</div>
	</div>

	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>

</body>
</html>