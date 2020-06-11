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
<title>Launching Calendar</title>
<link href="./css/board/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
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
		
		//오늘날짜
		Date currentTime = new Date();
		String current = original_format.format(currentTime);
		Date today = original_format.parse(current);
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
	
		<div id="content_sneakerList">
			
			<!-- 4월 발매 테이블 -->
			<p id="month4" class="month"> 
				4월 April. 
				<span> <i class="fas fa-caret-down"></i> </span>  
			</p>
			
			<div id="div_month_4" class="div_month">
				<%
					for (int i = 0; i <sneakerList4.size(); i++) {
						SneakerDTO sdto = sneakerList4.get(i);
						Date original_release_date = original_format.parse(sdto.getRelease_date());
						String new_release_date = new_format.format(original_release_date);

						int compare_releaseTime_4 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
				%>
					<div id="shoeList_image_4" class="shoelist_image">
						<div id="shoeList_4<%=i%>">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  					<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
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
				<%	
					}
				%>
			</div>			
			
			<!-- 5월 발매 테이블 -->
			<p id="month5" class="month"> 
				5월 May. 
				<span> <i class="fas fa-caret-down"></i> </span>  
			</p>
			
			<div id="div_month_5" class="div_month">
				<%
					for (int i = 0; i <sneakerList5.size(); i++) {
						SneakerDTO sdto = sneakerList5.get(i);
						Date original_release_date = original_format.parse(sdto.getRelease_date());
						String new_release_date = new_format.format(original_release_date);

						int compare_releaseTime_5 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
				%>
					<div id="shoeList_image_5" class="shoelist_image">
						<div id="shoeList_5<%=i%>">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  					<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
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
				<%	
					}
				%>
			</div>		

			<!-- 6월 발매 테이블 -->
			<p id="month6" class="month"> 
				6월 June.
				<span> <i class="fas fa-caret-down"></i> </span>  
			</p>
			
			<div id="div_month_6" class="div_month">
				<%
					for (int i = 0; i <sneakerList6.size(); i++) {
						SneakerDTO sdto = sneakerList6.get(i);
						Date original_release_date = original_format.parse(sdto.getRelease_date());
						String new_release_date = new_format.format(original_release_date);

						int compare_releaseTime_6 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
				%>
					<div id="shoeList_image_6" class="shoelist_image">
						<div id="shoeList_6<%=i%>">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  					<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
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
				<%	
					}
				%>
			</div>		
			
			
			
			
			
			
			
		</div>
	</div>

	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>

</body>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		//각 달별로 slide down 버튼을 눌렸을시
		$(".month").click(function(){
			$("#div_month_" + $(this).attr('id').charAt($(this).attr('id').length - 1)).slideToggle("slow");
		});
		
		
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