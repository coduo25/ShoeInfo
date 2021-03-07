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
	
		//로그인한 사용자가 체크
		String user = (String) session.getAttribute("email");
		//로그인 된 사용자의 position 가져오기
		String usr_position = (String) session.getAttribute("usr_position");
		if(user == null){
			user = "";
		}
		if(usr_position == null){
			usr_position = "";
		}	
	
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
		<div class="myDrawPopUp" id="myDrawPopUp">
		
			<div class="myDrawPopUpIcon" style="display:inline-block;">
				<i class="fas fa-user-check"></i>
			</div>
			
			<div style="display:inline-block;">
				<div class="myDrawPopUpTxt1">
					<span>나의 응모내역</span>
				</div>
				<div class="myDrawPopUpTxt2">
					<span>보러가기</span>
				</div>
			</div>
			
		</div>
		
	</div>
</body>
<script type="text/javascript">

$(document).ready(function(){

	//마이드로우 눌렸을시
	$('#myDrawPopUp').click(function(){
		//로그인 체크
		if($(".user").val() == "" || $(".user").val() == "undefined" || $(".user").val() == null) {
			location.href="./MemberLogin.me";
		}else {
			location.href="./MemberDrawInfo.me";
		}
	});
	
});

</script>
</html>