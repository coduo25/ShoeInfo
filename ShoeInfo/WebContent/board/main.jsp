<%@page import="java.util.ArrayList"%>
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
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
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
	
		ArrayList<SneakerDTO> sneakerList1 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList1");
		ArrayList<SneakerDTO> sneakerList2 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList2");
		ArrayList<SneakerDTO> sneakerList3 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList3");
		ArrayList<SneakerDTO> sneakerList4 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList4");
		ArrayList<SneakerDTO> sneakerList5 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList5");
		ArrayList<SneakerDTO> sneakerList6 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList6");
		ArrayList<SneakerDTO> sneakerList7 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList7");
		ArrayList<SneakerDTO> sneakerList8 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList8");
		ArrayList<SneakerDTO> sneakerList9 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList9");
		ArrayList<SneakerDTO> sneakerList10 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList10");
		ArrayList<SneakerDTO> sneakerList11 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList11");
		ArrayList<SneakerDTO> sneakerList12 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerList12");
		
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
		
			<!-- 1~12월 발매 테이블 -->
			<%
				for(int z=1; z<13; z++){
					ArrayList<SneakerDTO> new_sneakerList = new ArrayList<SneakerDTO>();
					String month_label = "";
					if(z==1){ new_sneakerList = sneakerList1; month_label = "Jan."; }
					if(z==2){ new_sneakerList = sneakerList2; month_label = "Feb."; }
					if(z==3){ new_sneakerList = sneakerList3; month_label = "Mar."; }
					if(z==4){ new_sneakerList = sneakerList4; month_label = "Apr."; }
					if(z==5){ new_sneakerList = sneakerList5; month_label = "May."; }
					if(z==6){ new_sneakerList = sneakerList6; month_label = "June."; }
					if(z==7){ new_sneakerList = sneakerList7; month_label = "July."; }
					if(z==8){ new_sneakerList = sneakerList8; month_label = "Aug."; }
					if(z==9){ new_sneakerList = sneakerList9; month_label = "Sept."; }
					if(z==10){ new_sneakerList = sneakerList10; month_label = "Oct."; }
					if(z==11){ new_sneakerList = sneakerList11; month_label = "Nov."; }
					if(z==12){ new_sneakerList = sneakerList12; month_label = "Dec."; }
			%>
				<!-- <%=z%>월 발매 테이블 -->
				<p id="month<%=z%>" class="month"> 
					<%=z%>월 <%=month_label%>
					<span id="slide-down_<%=z%>"> <i class="fas fa-caret-down"></i> </span>
					<span id="slide-up_<%=z%>"> <i class="fas fa-caret-up"></i> </span>
				</p>
				
				<div id="div_month_<%=z%>" class="div_month">
					<%
						if(new_sneakerList.size() == 0){
					%>
						<div class="no_info" id="no_info<%=z%>">
							<span> <%=z%>월 발매 정보가 없습니다. </span>
						</div>
					<%
						}
						for (int i = 0; i <new_sneakerList.size(); i++) {
							SneakerDTO sdto = new_sneakerList.get(i);
					%>
						<div id="shoeList_image_<%=z%>" class="shoelist_image">
							<div id="shoeList_<%=z%><%=i%>" class="shoelist_image_wrapper">
								<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">
			  						<img src="./sneaker_img_upload/<%=sdto.getImage_thumb().split(",")[0]%>" id="shoeList_<%=z%><%=i%>_img" > <br>
								</a>
								
								<!-- hover -->
								<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>">	
									<div id="shoeList_image_<%=z%><%=i%>_hover" class="shoeList_image_hover">		
										<!-- 링크 wrapper -->
										<div id="link-wrapper">
											<i class="fas fa-link"></i> <%=sdto.getCountLinks() %> <span>LINKS</span>
										</div>							
									</div>
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
		//image hover 했을시 이미지 뜨게 하기
		$('.shoelist_image_wrapper').hover(function() {
			//shoeList_80
			var monthi = $(this).attr('id');
			//80 만 남기기
			var splitArray = monthi.split('_');
			var lastElement = splitArray[splitArray.length - 1];
			//shoeList_image_ + 80 + _hover
			var shoeList_image_hover = 'shoeList_image_' + lastElement + '_hover';
			
			//뒷 배경 약간 투명하기 만들기
			$('#' + 'shoeList_' + lastElement + '_img').css('opacity', '0.3');
			//hover 요소들 나타내기
			$('#' + shoeList_image_hover).css('opacity', '1');
		}, function() {
			//shoeList_80
			var monthi = $(this).attr('id');
			//80 만 남기기
			var splitArray = monthi.split('_');
			var lastElement = splitArray[splitArray.length - 1];
			//shoeList_image_ + 80 + _hover
			var shoeList_image_hover = 'shoeList_image_' + lastElement + '_hover';
			
			//뒷 배경 약간 투명 풀기
			$('#' + 'shoeList_' + lastElement + '_img').css('opacity', '1');
			//hover 요소들 나타내기
			$('#' + shoeList_image_hover).css('opacity', '0');
		});
		
		var today = new Date();
		var month = today.getMonth() + 1; //오늘의 달은 + 1 해야한다
		
		for(var i=1; i<13; i++){
			//지금 달 보다 전전달들 ex.현재 8월, 1~6월 사라지고 7월 slideDown 만 나타내기
			if(i < month) {
				$("#month" + (i-1)).hide(); //2달 지나간 월들은 없애기
				
				$("#slide-up_" + i).hide();
				$("#slide-down_" + i).show();
				
				$("#div_month_" + i).hide();
			}
			//지금 달부터 미래의 달부터 나타내기 8~12월
			else if(i >= month) {
				//4개월 후까지만 나타내기
				var monthPlus4 = month + 4;

				if(i >= monthPlus4) {
					$("#month" + i).hide(); //4달 후 월들은 없애기
					$("#no_info" + i).hide();
					$("#div_month_" + i).hide();
				}
				else {
					$("#slide-up_" + i).show();
					$("#slide-down_" + i).hide();
					
					$("#div_month_" + i).show();
				}
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

	<!-- 리포트2.0 로그분석코드 시작 -->
		var JsHost = (("https:" == document.location.protocol) ? "https://" : "http://");
		var sTime = new Date().getTime();
		document.write(unescape("%3Cscript id='log_script' src='" + JsHost + "coduo25.weblog.cafe24.com/weblog.js?uid=coduo25&t="+sTime+"' type='text/javascript'%3E%3C/script%3E"));
	<!-- 리포트2.0  로그분석코드 완료 -->

</script>
</html>