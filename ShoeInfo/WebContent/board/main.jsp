<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sneaker.db.SneakerDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" />
<title>Insert title here</title>
<link href="./css/board/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>	
	<%
		String user = (String) session.getAttribute("id");
		if(user == null){
			user="";
		}
	
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
		SimpleDateFormat new_format = new SimpleDateFormat("M/d");
		SimpleDateFormat new_month_format = new SimpleDateFormat("M");
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
	
		<div id="content_sneakerList">
			
			<!-- 3월 발매 테이블 -->
			<div id="div_month_3"> 
				<p id="month"> 3월 March. </p>
				<table id="sneaker_List">
					<%
				        int size = sneakerList3.size();
					    int col = 5;
					    int row = (size / col) + (size%col>0? 1:0);
					    int num = 0;
						for (int a = 0; a < row; a++) {
					%>
					<tr>
						<%
							for (int i = 0; i <col; i++) {
								SneakerDTO sdto = sneakerList3.get(num);
								Date original_release_date = original_format.parse(sdto.getRelease_date());
								String new_release_date = new_format.format(original_release_date);
								
								//오늘날짜
								Date currentTime = new Date();
								String current = original_format.format(currentTime);
								Date today = original_format.parse(current);
								
								int compare_releaseTime_3 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
								
								
						%>
						<td colspan="2">
							<div class="shoelist_image">
								<div id="shoeList_3<%=i%>">
									<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
				  					<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" width="180" height="130"> <br>
									<div class="popup_date">
										<%= new_release_date %> 발매 <br>
									</div>
									</a>
									<%if(compare_releaseTime_3 == 1){%>
										<span id="release_status<%=i%>" style="display:none"> 발매후 </span>
									<%}else if(compare_releaseTime_3 == -1){%>
										<span id="release_status<%=i%>" style="display:none"> 발매전 </span>
									<%}%>
								</div>
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

			<!-- 4월 발매 테이블 -->
			<div id="div_month_4"> 
				<p id="month"> 4월 April. </p>
				<table id="sneaker_List">
					<%
				        size = sneakerList4.size();
					    col = 5;
					    row = (size / col) + (size%col>0? 1:0);
					    num = 0;
						for (int a = 0; a < row; a++) {
					%>
					<tr>
						<%
							for (int i = 0; i <col; i++) {
								SneakerDTO sdto = sneakerList4.get(num);
								Date original_release_date = original_format.parse(sdto.getRelease_date());
								String new_release_date = new_format.format(original_release_date);
								
								//오늘날짜
								Date currentTime = new Date();
								String current = original_format.format(currentTime);
								Date today = original_format.parse(current);
								
								int compare_releaseTime_4 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
						%>
						<td colspan="2">
							<div class="shoelist_image">
								<div id="shoeList_4<%=i%>">
									<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
				  					<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" width="180" height="130"> <br>
									<div class="popup_date">
										<%= new_release_date %> 발매 <br>
									</div>
									</a>
									<%if(compare_releaseTime_4 == 1){%>
										<span id="release_status<%=i%>" style="display:none"> 발매후 </span>
									<%}else if(compare_releaseTime_4 == -1){%>
										<span id="release_status<%=i%>" style="display:none"> 발매전 </span>
									<%}%>
								</div>
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
			
			<!-- 5월 발매 테이블 -->
			<div id="div_month_5"> 
				<p id="month"> 5월 May. </p>
				<table id="sneaker_List">	
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
								
								//오늘날짜
								Date currentTime = new Date();
								String current = original_format.format(currentTime);
								Date today = original_format.parse(current);
								
								int compare_releaseTime_5 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
						%>
						<td colspan="2">
							<div class="shoelist_image">
								<div id="shoeList_5<%=i%>">
									<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
					  					<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" width="180" height="130"> <br>
										<div class="popup_date">
											<%= new_release_date %> 발매 <br>
										</div>
									</a>
									<%if(compare_releaseTime_5 == 1){%>
										<span id="release_status<%=i%>" style="display:none"> 발매후 </span>
									<%}else if(compare_releaseTime_5 == -1){%>
										<span id="release_status<%=i%>" style="display:none"> 발매전 </span>
									<%}%>
								</div>
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

			<!-- 6월 발매 테이블 -->
			<div id="div_month_6"> 
				<p id="month"> 6월 June. </p>
				<table id="sneaker_List" border = "0">
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
								
								//오늘날짜
								Date currentTime = new Date();
								String current = original_format.format(currentTime);
								Date today = original_format.parse(current);
								
								int compare_releaseTime_6 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
						%>
						<td colspan="2">
							<div class="shoelist_image">
								<div id="shoeList_6<%=i%>">
									<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
					  					<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" width="180" height="130"> <br>
										<div class="popup_date">
											<%= new_release_date %> 발매 <br>
										</div>
									</a>
									<%if(compare_releaseTime_6 == 1){%>
										<span id="release_status<%=i%>" style="display:none"> 발매후 </span>
									<%}else if(compare_releaseTime_6 == -1){%>
										<span id="release_status<%=i%>" style="display:none"> 발매전 </span>
									<%}%>
								</div>
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

			<!-- 7월 발매 테이블 -->
			<div id="div_month_7"> 
				<p id="month"> 7월 July. </p>
				<table id="sneaker_List">
					<%    
				        size = sneakerList7.size();
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
								
								//오늘날짜
								Date currentTime = new Date();
								String current = original_format.format(currentTime);
								Date today = original_format.parse(current);
								
								int compare_releaseTime_7 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
						%>
						<td colspan="2">
							<div class="shoelist_image">
								<div id="shoeList_7<%=i%>">
									<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
					  					<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" width="180" height="130"> <br>
										<div class="popup_date">
											<%= new_release_date %> 발매 <br>
										</div>
										<%if(compare_releaseTime_7 == 1){%>
											<span id="release_status<%=i%>" style="display:none"> 발매후 </span>
										<%}else if(compare_releaseTime_7 == -1){%>
											<span id="release_status<%=i%>" style="display:none"> 발매전 </span>
										<%}%>
									</a>
								</div>
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

			<!-- 8월 발매 테이블 -->
			<div id="div_month_8"> 
				<p id="month"> 8월 August. </p>
				<table id="sneaker_List">
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
								
								//오늘날짜
								Date currentTime = new Date();
								String current = original_format.format(currentTime);
								Date today = original_format.parse(current);
								
								int compare_releaseTime_8 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
						%>
						<td colspan="2">
							<div class="shoelist_image">
								<div id="shoeList_8<%=i%>">
									<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
					  					<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" width="180" height="130"> <br>
										<div class="popup_date">
											<%= new_release_date %> 발매 <br>
										</div>
										<%if(compare_releaseTime_8 == 1){%>
											<span id="release_status<%=i%>" style="display:none"> 발매후 </span>
										<%}else if(compare_releaseTime_8 == -1){%>
											<span id="release_status<%=i%>" style="display:none"> 발매전 </span>
										<%}%>
									</a>
								</div>
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
			
			<!-- 9월 발매 테이블 -->
			<div id="div_month_9"> 
				<p id="month"> 9월 Sep. </p>
				<table id="sneaker_List">
					<%    
				        size = sneakerList9.size();
					    col = 5;
					    row = (size / col) + (size%col>0? 1:0);
					    num = 0;
						for (int a = 0; a < row; a++) {
					%>
					<tr>
						<%
							for (int i = 0; i <col; i++) {
								SneakerDTO sdto = sneakerList9.get(num);
								Date original_release_date = original_format.parse(sdto.getRelease_date());
								String new_release_date = new_format.format(original_release_date);
								
								//오늘날짜
								Date currentTime = new Date();
								String current = original_format.format(currentTime);
								Date today = original_format.parse(current);
								
								int compare_releaseTime_9 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
						%>
						<td colspan="2">
							<div class="shoelist_image">
								<div id="shoeList_9<%=i%>">
									<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
					  					<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" width="180" height="130"> <br>
										<div class="popup_date">
											<%= new_release_date %> 발매 <br>
										</div>
										<%if(compare_releaseTime_9 == 1){%>
											<span id="release_status<%=i%>" style="display:none"> 발매후 </span>
										<%}else if(compare_releaseTime_9 == -1){%>
											<span id="release_status<%=i%>" style="display:none"> 발매전 </span>
										<%}%>
									</a>
								</div>
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
	</div>

	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>

</body>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		//4월의 신발 리스트
// 		var sneakerList4 = [];
// 		<c:forEach items="${sneakerList4}" var="sneakerList4">
// 			sneakerList4.push("${sneakerList4}");
// 		</c:forEach>
// 		for(var i=0; i<sneakerList4.length; i++){
// 			//현재 발매 status가 발매후이면 blur 처리 발매전이면 그대로 유지
// 			var release_status = document.getElementById('release_status'+i).innerText;
// 			if(release_status.match("발매후")){
// 				var shoeList_4 = $('#shoeList_4'+i);
// 				shoeList_4.css({"opacity" : "0.3"} /*, {"pointer-events" : "none"}*/);	
// 			}
// 		}
		
	});

</script>
</html>