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
<meta content="width=device-width, initial-scale=1" name="viewport" />
<title>SHOE INFO.</title>
<link href="./css/board/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:600&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<%
		ArrayList<MemberDrawDTO> userDrawStylecodeList1 = (ArrayList<MemberDrawDTO>) request.getAttribute("userDrawStylecodeList1");
		ArrayList<SneakerDTO> sneakerInfoList1 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerInfoList1");	
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList2 = (ArrayList<MemberDrawDTO>) request.getAttribute("userDrawStylecodeList2");
		ArrayList<SneakerDTO> sneakerInfoList2 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerInfoList2");	
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList3 = (ArrayList<MemberDrawDTO>) request.getAttribute("userDrawStylecodeList3");
		ArrayList<SneakerDTO> sneakerInfoList3 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerInfoList3");	
	
		ArrayList<MemberDrawDTO> userDrawStylecodeList4 = (ArrayList<MemberDrawDTO>) request.getAttribute("userDrawStylecodeList4");
		ArrayList<SneakerDTO> sneakerInfoList4 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerInfoList4");	
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList5 = (ArrayList<MemberDrawDTO>) request.getAttribute("userDrawStylecodeList5");
		ArrayList<SneakerDTO> sneakerInfoList5 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerInfoList5");	
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList6 = (ArrayList<MemberDrawDTO>) request.getAttribute("userDrawStylecodeList6");
		ArrayList<SneakerDTO> sneakerInfoList6 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerInfoList6");	
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList7 = (ArrayList<MemberDrawDTO>) request.getAttribute("userDrawStylecodeList7");
		ArrayList<SneakerDTO> sneakerInfoList7 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerInfoList7");	
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList8 = (ArrayList<MemberDrawDTO>) request.getAttribute("userDrawStylecodeList8");
		ArrayList<SneakerDTO> sneakerInfoList8 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerInfoList8");	
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList9 = (ArrayList<MemberDrawDTO>) request.getAttribute("userDrawStylecodeList9");
		ArrayList<SneakerDTO> sneakerInfoList9 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerInfoList9");	
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList10 = (ArrayList<MemberDrawDTO>) request.getAttribute("userDrawStylecodeList10");
		ArrayList<SneakerDTO> sneakerInfoList10 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerInfoList10");	
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList11 = (ArrayList<MemberDrawDTO>) request.getAttribute("userDrawStylecodeList11");
		ArrayList<SneakerDTO> sneakerInfoList11 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerInfoList11");	
		
		ArrayList<MemberDrawDTO> userDrawStylecodeList12 = (ArrayList<MemberDrawDTO>) request.getAttribute("userDrawStylecodeList12");
		ArrayList<SneakerDTO> sneakerInfoList12 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerInfoList12");	
		
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
		
			<!-- 1월 응모내역 테이블 -->
			<p id="month1" class="month"> 
				1월 응모내역. 
				<span id="slide-down_1"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_1"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_1" class="div_month">
				<%
					if(userDrawStylecodeList1.size() == 0){
				%>
					<div class="no_info" id="no_info1">
						<span> 1월 응모한 내역이 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <userDrawStylecodeList1.size(); i++) {
						MemberDrawDTO mddto = userDrawStylecodeList1.get(i);
						SneakerDTO sdto = sneakerInfoList1.get(i);
						
						Date original_release_date = original_format.parse(sdto.getRelease_date());
				%>
					<div id="shoeList_image_1" class="shoelist_image">
						<div id="shoeList_1<%=i%>">
							<a href="./MemberDrawDetailInfo.me?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>
		
			<!-- 2월 응모내역 테이블 -->
			<p id="month2" class="month"> 
				2월 응모내역. 
				<span id="slide-down_3"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_3"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_2" class="div_month">
				<%
					if(userDrawStylecodeList1.size() == 0){
				%>
					<div class="no_info" id="no_info2">
						<span> 2월 응모한 내역이 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <userDrawStylecodeList2.size(); i++) {
						MemberDrawDTO mddto = userDrawStylecodeList2.get(i);
						SneakerDTO sdto = sneakerInfoList1.get(i);
						
						Date original_release_date = original_format.parse(sdto.getRelease_date());
				%>
					<div id="shoeList_image_2" class="shoelist_image">
						<div id="shoeList_2<%=i%>">
							<a href="./MemberDrawDetailInfo.me?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>
		
			<!-- 3월 응모내역 테이블 -->
			<p id="month3" class="month"> 
				3월 응모내역. 
				<span id="slide-down_3"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_3"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_3" class="div_month">
				<%
					if(userDrawStylecodeList3.size() == 0){
				%>
					<div class="no_info" id="no_info3">
						<span> 3월 응모한 내역이 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <userDrawStylecodeList3.size(); i++) {
						MemberDrawDTO mddto = userDrawStylecodeList3.get(i);
						SneakerDTO sdto = sneakerInfoList1.get(i);
						
						Date original_release_date = original_format.parse(sdto.getRelease_date());
				%>
					<div id="shoeList_image_3" class="shoelist_image">
						<div id="shoeList_3<%=i%>">
							<a href="./MemberDrawDetailInfo.me?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>
		
			<!-- 4월 응모내역 테이블 -->
			<p id="month4" class="month"> 
				4월 응모내역. 
				<span id="slide-down_4"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_4"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_4" class="div_month">
				<%
					if(userDrawStylecodeList4.size() == 0){
				%>
					<div class="no_info" id="no_info4">
						<span> 4월 응모한 내역이 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <userDrawStylecodeList4.size(); i++) {
						MemberDrawDTO mddto = userDrawStylecodeList4.get(i);
						SneakerDTO sdto = sneakerInfoList4.get(i);
						
						Date original_release_date = original_format.parse(sdto.getRelease_date());
				%>
					<div id="shoeList_image_4" class="shoelist_image">
						<div id="shoeList_4<%=i%>">
							<a href="./MemberDrawDetailInfo.me?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>

			<!-- 5월 응모내역 테이블 -->
			<p id="month5" class="month"> 
				5월 응모내역. 
				<span id="slide-down_5"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_5"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_5" class="div_month">
				<%
					if(userDrawStylecodeList5.size() == 0){
				%>
					<div class="no_info" id="no_info5">
						<span> 5월 응모한 내역이 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <userDrawStylecodeList5.size(); i++) {
						MemberDrawDTO mddto = userDrawStylecodeList5.get(i);
						SneakerDTO sdto = sneakerInfoList5.get(i);
						
						Date original_release_date = original_format.parse(sdto.getRelease_date());
				%>
					<div id="shoeList_image_5" class="shoelist_image">
						<div id="shoeList_5<%=i%>">
							<a href="./MemberDrawDetailInfo.me?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>		

			<!-- 6월 응모내역 테이블 -->
			<p id="month6" class="month"> 
				6월 응모내역.
				<span id="slide-down_6"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_6"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_6" class="div_month">
				<%
					if(userDrawStylecodeList6.size() == 0){
				%>
					<div class="no_info" id="no_info6">
						<span> 6월 응모한 내역이 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <userDrawStylecodeList6.size(); i++) {
						MemberDrawDTO mddto = userDrawStylecodeList6.get(i);
						SneakerDTO sdto = sneakerInfoList6.get(i);
						
						Date original_release_date = original_format.parse(sdto.getRelease_date());
				%>
					<div id="shoeList_image_6" class="shoelist_image">
						<div id="shoeList_6<%=i%>">
							<a href="./MemberDrawDetailInfo.me?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>		
			
			<!-- 7월 응모내역 테이블 -->
			<p id="month7" class="month"> 
				7월 응모내역.
				<span id="slide-down_7"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_7"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_7" class="div_month">
				<%
					if(userDrawStylecodeList7.size() == 0){
				%>
					<div class="no_info" id="no_info7">
						<span> 7월 응모한 내역이 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <userDrawStylecodeList7.size(); i++) {
						MemberDrawDTO mddto = userDrawStylecodeList7.get(i);
						SneakerDTO sdto = sneakerInfoList7.get(i);
						
						Date original_release_date = original_format.parse(sdto.getRelease_date());
				%>
					<div id="shoeList_image_7" class="shoelist_image">
						<div id="shoeList_7<%=i%>">
							<a href="./MemberDrawDetailInfo.me?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>
			
			<!-- 8월 응모내역 테이블 -->
			<p id="month8" class="month"> 
				8월 응모내역.
				<span id="slide-down_8"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_8"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_8" class="div_month">
				<%
					if(userDrawStylecodeList8.size() == 0){
				%>
					<div class="no_info" id="no_info8">
						<span> 8월 응모한 내역이 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <userDrawStylecodeList8.size(); i++) {
						MemberDrawDTO mddto = userDrawStylecodeList8.get(i);
						SneakerDTO sdto = sneakerInfoList8.get(i);
						
						Date original_release_date = original_format.parse(sdto.getRelease_date());
				%>
					<div id="shoeList_image_8" class="shoelist_image">
						<div id="shoeList_8<%=i%>">
							<a href="./MemberDrawDetailInfo.me?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>
			
			<!-- 9월 응모내역 테이블 -->
			<p id="month9" class="month"> 
				9월 응모내역.
				<span id="slide-down_9"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_9"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_9" class="div_month">
				<%
					if(userDrawStylecodeList9.size() == 0){
				%>
					<div class="no_info" id="no_info9">
						<span> 9월 응모한 내역이 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <userDrawStylecodeList9.size(); i++) {
						MemberDrawDTO mddto = userDrawStylecodeList9.get(i);
						SneakerDTO sdto = sneakerInfoList9.get(i);
						
						Date original_release_date = original_format.parse(sdto.getRelease_date());
				%>
					<div id="shoeList_image_9" class="shoelist_image">
						<div id="shoeList_9<%=i%>">
							<a href="./MemberDrawDetailInfo.me?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>
			
			<!-- 10월 응모내역 테이블 -->
			<p id="month10" class="month"> 
				10월 응모내역.
				<span id="slide-down_10"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_10"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_10" class="div_month">
				<%
					if(userDrawStylecodeList10.size() == 0){
				%>
					<div class="no_info" id="no_info10">
						<span> 10월 응모한 내역이 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <userDrawStylecodeList10.size(); i++) {
						MemberDrawDTO mddto = userDrawStylecodeList10.get(i);
						SneakerDTO sdto = sneakerInfoList10.get(i);
						
						Date original_release_date = original_format.parse(sdto.getRelease_date());
				%>
					<div id="shoeList_image_10" class="shoelist_image">
						<div id="shoeList_10<%=i%>">
							<a href="./MemberDrawDetailInfo.me?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>
			
			<!-- 11월 응모내역 테이블 -->
			<p id="month11" class="month"> 
				11월 응모내역.
				<span id="slide-down_11"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_11"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_11" class="div_month">
				<%
					if(userDrawStylecodeList11.size() == 0){
				%>
					<div class="no_info" id="no_info11">
						<span> 11월 응모한 내역이 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <userDrawStylecodeList11.size(); i++) {
						MemberDrawDTO mddto = userDrawStylecodeList11.get(i);
						SneakerDTO sdto = sneakerInfoList11.get(i);
						
						Date original_release_date = original_format.parse(sdto.getRelease_date());
				%>
					<div id="shoeList_image_11" class="shoelist_image">
						<div id="shoeList_11<%=i%>">
							<a href="./MemberDrawDetailInfo.me?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
							</a>
						</div>
					</div>
				<%	
					}
				%>
			</div>
			
			<!-- 12월 응모내역 테이블 -->
			<p id="month12" class="month"> 
				12월 응모내역.
				<span id="slide-down_12"> <i class="fas fa-caret-down"></i> </span>
				<span id="slide-up_12"> <i class="fas fa-caret-up"></i> </span>
			</p>
			
			<div id="div_month_12" class="div_month">
				<%
					if(userDrawStylecodeList12.size() == 0){
				%>
					<div class="no_info" id="no_info12">
						<span> 12월 응모한 내역이 없습니다. </span>
					</div>
				<%
					}
					for (int i = 0; i <userDrawStylecodeList12.size(); i++) {
						MemberDrawDTO mddto = userDrawStylecodeList12.get(i);
						SneakerDTO sdto = sneakerInfoList12.get(i);
						
						Date original_release_date = original_format.parse(sdto.getRelease_date());
				%>
					<div id="shoeList_image_12" class="shoelist_image">
						<div id="shoeList_12<%=i%>">
							<a href="./MemberDrawDetailInfo.me?model_stylecode=<%=sdto.getModel_stylecode()%>">
		  						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
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