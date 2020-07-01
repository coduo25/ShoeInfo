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
<meta content="width=device-width, initial-scale=1" name="viewport" />
<title>SHOE INFO.</title>
<link href="./css/board/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body>	
	<%
		String user = (String) session.getAttribute("email");
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
		
			<!-- 1월 발매 테이블 -->
			<p id="month1" class="month"> 
				1월 Jan. 
				<span id="slide-down_1"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_1"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_1" class="div_month">
				<%
					if(sneakerList1.size() == 0){
				%>
					<div class="no_info" id="no_info1">
						<span> 1월 발매 정보가 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <sneakerList1.size(); i++) {
						SneakerDTO sdto = sneakerList1.get(i);
						Date original_release_date = original_format.parse(sdto.getRelease_date());

						int compare_releaseTime_1 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
				%>
					<div id="shoeList_image_1" class="shoelist_image">
						<div id="shoeList_1<%=i%>">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage_thumb().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>
		
			<!-- 2월 발매 테이블 -->
			<p id="month2" class="month"> 
				2월 Feb. 
				<span id="slide-down_3"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_3"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_2" class="div_month">
				<%
					if(sneakerList3.size() == 0){
				%>
					<div class="no_info" id="no_info2">
						<span> 2월 발매 정보가 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <sneakerList2.size(); i++) {
						SneakerDTO sdto = sneakerList2.get(i);
						Date original_release_date = original_format.parse(sdto.getRelease_date());

						int compare_releaseTime_2 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
				%>
					<div id="shoeList_image_2" class="shoelist_image">
						<div id="shoeList_2<%=i%>">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage_thumb().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>
		
			<!-- 3월 발매 테이블 -->
			<p id="month3" class="month"> 
				3월 Mar. 
				<span id="slide-down_3"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_3"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_3" class="div_month">
				<%
					if(sneakerList3.size() == 0){
				%>
					<div class="no_info" id="no_info3">
						<span> 3월 발매 정보가 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <sneakerList3.size(); i++) {
						SneakerDTO sdto = sneakerList3.get(i);
						Date original_release_date = original_format.parse(sdto.getRelease_date());

						int compare_releaseTime_3 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
				%>
					<div id="shoeList_image_3" class="shoelist_image">
						<div id="shoeList_3<%=i%>">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage_thumb().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>
			
			<!-- 4월 발매 테이블 -->
			<p id="month4" class="month"> 
				4월 Apr. 
				<span id="slide-down_4"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_4"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_4" class="div_month">
				<%
					if(sneakerList4.size() == 0){
				%>
					<div class="no_info" id="no_info4">
						<span> 4월 발매 정보가 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <sneakerList4.size(); i++) {
						SneakerDTO sdto = sneakerList4.get(i);
						Date original_release_date = original_format.parse(sdto.getRelease_date());

						int compare_releaseTime_4 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
				%>
					<div id="shoeList_image_4" class="shoelist_image">
						<div id="shoeList_4<%=i%>">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage_thumb().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>			
			
			<!-- 5월 발매 테이블 -->
			<p id="month5" class="month"> 
				5월 May. 
				<span id="slide-down_5"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_5"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_5" class="div_month">
				<%
					if(sneakerList5.size() == 0){
				%>
					<div class="no_info" id="no_info5">
						<span> 5월 발매 정보가 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <sneakerList5.size(); i++) {
						SneakerDTO sdto = sneakerList5.get(i);
						Date original_release_date = original_format.parse(sdto.getRelease_date());

						int compare_releaseTime_5 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
				%>
					<div id="shoeList_image_5" class="shoelist_image">
						<div id="shoeList_5<%=i%>">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage_thumb().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>		

			<!-- 6월 발매 테이블 -->
			<p id="month6" class="month"> 
				6월 June.
				<span id="slide-down_6"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_6"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_6" class="div_month">
				<%
					if(sneakerList6.size() == 0){
				%>
					<div class="no_info" id="no_info6">
						<span> 6월 발매 정보가 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <sneakerList6.size(); i++) {
						SneakerDTO sdto = sneakerList6.get(i);
						Date original_release_date = original_format.parse(sdto.getRelease_date());

						int compare_releaseTime_6 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
				%>
					<div id="shoeList_image_6" class="shoelist_image">
						<div id="shoeList_6<%=i%>">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage_thumb().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>		
			
			<!-- 7월 발매 테이블 -->
			<p id="month7" class="month"> 
				7월 July.
				<span id="slide-down_7"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_7"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_7" class="div_month">
				<%
					if(sneakerList7.size() == 0){
				%>
					<div class="no_info" id="no_info7">
						<span> 7월 발매 정보가 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <sneakerList7.size(); i++) {
						SneakerDTO sdto = sneakerList7.get(i);
						Date original_release_date = original_format.parse(sdto.getRelease_date());

						int compare_releaseTime_7 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
				%>
					<div id="shoeList_image_7" class="shoelist_image">
						<div id="shoeList_7<%=i%>">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage_thumb().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>
			
			<!-- 8월 발매 테이블 -->
			<p id="month8" class="month"> 
				8월 Aug.
				<span id="slide-down_8"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_8"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_8" class="div_month">
				<%
					if(sneakerList8.size() == 0){
				%>
					<div class="no_info" id="no_info8">
						<span> 8월 발매 정보가 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <sneakerList8.size(); i++) {
						SneakerDTO sdto = sneakerList8.get(i);
						Date original_release_date = original_format.parse(sdto.getRelease_date());

						int compare_releaseTime_8 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
				%>
					<div id="shoeList_image_8" class="shoelist_image">
						<div id="shoeList_8<%=i%>">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage_thumb().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>
			
			<!-- 9월 발매 테이블 -->
			<p id="month9" class="month"> 
				9월 Sept.
				<span id="slide-down_9"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_9"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_9" class="div_month">
				<%
					if(sneakerList9.size() == 0){
				%>
					<div class="no_info" id="no_info9">
						<span> 9월 발매 정보가 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <sneakerList9.size(); i++) {
						SneakerDTO sdto = sneakerList9.get(i);
						Date original_release_date = original_format.parse(sdto.getRelease_date());

						int compare_releaseTime_9 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
				%>
					<div id="shoeList_image_9" class="shoelist_image">
						<div id="shoeList_9<%=i%>">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage_thumb().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>
			
			<!-- 10월 발매 테이블 -->
			<p id="month10" class="month"> 
				10월 Oct.
				<span id="slide-down_10"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_10"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_10" class="div_month">
				<%
					if(sneakerList10.size() == 0){
				%>
					<div class="no_info" id="no_info10">
						<span> 10월 발매 정보가 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <sneakerList10.size(); i++) {
						SneakerDTO sdto = sneakerList10.get(i);
						Date original_release_date = original_format.parse(sdto.getRelease_date());

						int compare_releaseTime_10 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
				%>
					<div id="shoeList_image_10" class="shoelist_image">
						<div id="shoeList_10<%=i%>">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage_thumb().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>
			
			<!-- 11월 발매 테이블 -->
			<p id="month11" class="month"> 
				11월 Nov.
				<span id="slide-down_11"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_11"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_11" class="div_month">
				<%
					if(sneakerList11.size() == 0){
				%>
					<div class="no_info" id="no_info11">
						<span> 11월 발매 정보가 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <sneakerList11.size(); i++) {
						SneakerDTO sdto = sneakerList11.get(i);
						Date original_release_date = original_format.parse(sdto.getRelease_date());

						int compare_releaseTime_11 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
				%>
					<div id="shoeList_image_11" class="shoelist_image">
						<div id="shoeList_11<%=i%>">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage_thumb().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>
			
			<!-- 12월 발매 테이블 -->
			<p id="month12" class="month"> 
				12월 Dec.
				<span id="slide-down_12"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_12"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_12" class="div_month">
				<%
					if(sneakerList12.size() == 0){
				%>
					<div class="no_info" id="no_info12">
						<span> 12월 발매 정보가 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <sneakerList12.size(); i++) {
						SneakerDTO sdto = sneakerList12.get(i);
						Date original_release_date = original_format.parse(sdto.getRelease_date());

						int compare_releaseTime_12 = today.compareTo(original_release_date); //1이면 오늘보다 전 시간, -1이면 오늘보다 후 시간
				%>
					<div id="shoeList_image_12" class="shoelist_image">
						<div id="shoeList_12<%=i%>">
							<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage_thumb().split(",")[0]%>" > <br>
							</a>
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
		
		var today = new Date();
		var month = today.getMonth() + 1; //오늘의 달은 + 1 해야한다
		
		for(var i=1; i<13; i++){
			
			if(i < month) {
				
				$("#month" + (i-1)).hide(); //2달 지나간 월들은 없애기
				$("#div_month" + (i-1)).hide();
				
				$("#slide-up_" + i).hide();
				$("#slide-down_" + i).show();
				
				$("#div_month_" + i).hide();
			}
			//미래의 월들은 나타내기
			else if(i >= month) {
				
				//3개월 후까지만 나타내기
				if((i+3) >= month) {
					$("#month" + (i+3)).hide(); //3달 후 월들은 없애기
					$("#div_month" + (i+3)).hide();
					$("#no_info" + (i+3)).hide();
				}
				
				$("#slide-up_" + i).show();
				$("#slide-down_" + i).hide();
				
				$("#div_month_" + i).show();
			}
		}
		
		
		//각 달별로 slide down 버튼을 눌렸을시
		$(".month").click(function(){
			
			var month = $(this).attr('id').replace(/[^0-9]/g,''); //숫자만 추출
			
			//만약 신발 리스트가 닫혀있으면
			if($("#div_month_" + month).css("display") == "none"){
				$("#slide-up_" + month).show();
				$("#slide-down_" + month).hide();
			}
			//신발 리스트가 열려있으면
			else {
				$("#slide-up_" + month).hide();
				$("#slide-down_" + month).show();
			}
			
			$("#div_month_" + month).slideToggle("slow");
		});


	});


</script>
</html>