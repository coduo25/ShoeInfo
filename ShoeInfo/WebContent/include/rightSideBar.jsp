<%@page import="net.sneaker.db.SneakerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/include/sideBar.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Oxanium&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
	<%
		//인기상품
		ArrayList<SneakerDTO> popularList = (ArrayList<SneakerDTO>) request.getAttribute("popularList");
	%>
<body>
	<!-- 우측 사이드바 -->
	<div class="right-sideBar" id="right-sideBar">
		<!-- 인기제품 -->
		<div class="popular-chart">
			<table>
				<tr class="popular-subtitle">
					<th colspan="3">인기제품</th>
				</tr>
				<%
					if(popularList.isEmpty()) {
				%>
					<tr>
						<td>
							<span>업데이트 예정</span>
						</td>
					</tr>
				<%	} else {
					for(int i=0; i<popularList.size(); i++){
						SneakerDTO sdto = popularList.get(i);
				%>
					<tr class="popular-row">
						<!-- 순번 -->
						<td class="popularNum-td">
							<span><%=i+1%></span>
						</td>
						<!-- 신발이미지 -->
						<td class="popularImg-td">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>">
								<img src="./sneaker_img_upload/<%=sdto.getImage()%>" width="50" height="38">
							</a>
						</td>
						<!-- 신발이름 -->
						<td class="popularName-td">
							<div>
								<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>"><%=sdto.getModel_name_kr()%></a>
							</div>
						</td>
					</tr>
				<%
					} }
				%>
			</table>
		</div>
		
		<!-- 구글 우측 사이드바 광고 -->
		<div class="googleAd-rightSideBar">
			<div class="ad-rightSideBar-box">
				
			</div>
		</div>
		
		<!-- 나의 응모내역 보러가기 box -->
		<div>
			<div>
				<span> 나의 응모내역 보러가기</span>
			</div>
		</div>
		
	</div>
</body>

</html>