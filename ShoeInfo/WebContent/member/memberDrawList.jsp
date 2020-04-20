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
<title>Insert title here</title>
<link href="./css/board/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:600&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<%
		ArrayList<MemberDrawDTO> userDrawStylecodeList = (ArrayList<MemberDrawDTO>) request.getAttribute("userDrawStylecodeList");
		ArrayList<SneakerDTO> sneakerInfoList = (ArrayList<SneakerDTO>) request.getAttribute("sneakerInfoList");	
		
		SimpleDateFormat original_format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat new_format = new SimpleDateFormat("M/d");
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
			<table id="sneaker_List">
				<%
			        int size = userDrawStylecodeList.size();
				    int col = 5;
				    int row = (size / col) + (size%col>0? 1:0);
				    int num = 0;
					for (int a = 0; a < row; a++) {
				%>
				<tr>
					<%
						for (int i = 0; i <col; i++) {
							SneakerDTO sdto = (SneakerDTO) sneakerInfoList.get(i);

							Date original_release_date = original_format.parse(sdto.getRelease_date());
							String new_release_date = new_format.format(original_release_date);
					%>
					<td colspan="2">
						<div class="shoelist_image">
							<a href="./MemberDrawDetailInfo.me?model_stylecode=<%=sdto.getModel_stylecode()%>">
			  					<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" width="180" height="130"> <br>
								<div class="popup_date">
									<%= new_release_date %> <br>
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