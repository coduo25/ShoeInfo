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
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
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
		
			<!-- 1 ~ 12 월 응모내역 테이블  -->
			<%
				for(int z=1; z<13; z++){
					ArrayList<MemberDrawDTO> new_userDrawStylecodeList = new ArrayList();
					ArrayList<SneakerDTO> new_sneakerInfoList = new ArrayList();
					
					if(z==1){ new_userDrawStylecodeList = userDrawStylecodeList1; new_sneakerInfoList = sneakerInfoList1;}
					if(z==2){ new_userDrawStylecodeList = userDrawStylecodeList2; new_sneakerInfoList = sneakerInfoList2;}
					if(z==3){ new_userDrawStylecodeList = userDrawStylecodeList3; new_sneakerInfoList = sneakerInfoList3;}
					if(z==4){ new_userDrawStylecodeList = userDrawStylecodeList4; new_sneakerInfoList = sneakerInfoList4;}
					if(z==5){ new_userDrawStylecodeList = userDrawStylecodeList5; new_sneakerInfoList = sneakerInfoList5;}
					if(z==6){ new_userDrawStylecodeList = userDrawStylecodeList6; new_sneakerInfoList = sneakerInfoList6;}
					if(z==7){ new_userDrawStylecodeList = userDrawStylecodeList7; new_sneakerInfoList = sneakerInfoList7;}
					if(z==8){ new_userDrawStylecodeList = userDrawStylecodeList8; new_sneakerInfoList = sneakerInfoList8;}
					if(z==9){ new_userDrawStylecodeList = userDrawStylecodeList9; new_sneakerInfoList = sneakerInfoList9;}
					if(z==10){ new_userDrawStylecodeList = userDrawStylecodeList10; new_sneakerInfoList = sneakerInfoList10;}
					if(z==11){ new_userDrawStylecodeList = userDrawStylecodeList11; new_sneakerInfoList = sneakerInfoList11;}
					if(z==12){ new_userDrawStylecodeList = userDrawStylecodeList12; new_sneakerInfoList = sneakerInfoList12;}
			%>
				<p id="month<%=z%>" class="month"> 
					<%=z%>월 응모내역. 
					<span id="slide-down_<%=z%>"> <i class="fas fa-caret-down"></i> </span>
					<span id="slide-up_<%=z%>"> <i class="fas fa-caret-up"></i> </span>
				</p>
			
				<div id="div_month_<%=z%>" class="div_month">
					<%
						if(new_userDrawStylecodeList.size() == 0){
					%>
						<div class="no_info" id="no_info<%=z%>">
							<span> <%=z%>월 응모한 내역이 없습니다. </span>
						</div>
					<%
						}
						for (int i = 0; i <new_userDrawStylecodeList.size(); i++) {
							MemberDrawDTO mddto = new_userDrawStylecodeList.get(i);
							SneakerDTO sdto = new_sneakerInfoList.get(i);
							
							Date original_release_date = original_format.parse(sdto.getRelease_date());
					%>
						<div id="shoeList_image_<%=z%>" class="shoelist_image">
							<div id="shoeList_<%=z%><%=i%>">
								<a href="./MemberDrawDetailInfo.me?model_stylecode=<%=sdto.getModel_stylecode()%>">
			  						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
								</a>
							</div>
						</div>
					<%	
						}
					%>
				</div>
			<%
				}
			%>

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