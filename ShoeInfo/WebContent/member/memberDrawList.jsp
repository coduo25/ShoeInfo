<%@page import="net.online.db.OnlineDTO"%>
<%@page import="java.util.Calendar"%>
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
<body> <!-- oncontextmenu='return false' onselectstart='return fasle' ondragstart='return false' -->
	<%
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		if(user == null){
			response.sendRedirect("./SneakerList.go");
		}
	
		ArrayList<MemberDrawDTO> userDrawStylecodeList1 = (ArrayList<MemberDrawDTO>) request.getAttribute("userDrawStylecodeList1");
		ArrayList<SneakerDTO> sneakerInfoList1 = (ArrayList<SneakerDTO>) request.getAttribute("sneakerInfoList1");
		
		//국내 응모 정보
		ArrayList<MemberDrawDTO> drawInfoList_kr = (ArrayList<MemberDrawDTO>) request.getAttribute("drawInfoList_kr");
		ArrayList<BrandDTO> brandList_kr = (ArrayList<BrandDTO>) request.getAttribute("brandList_kr");
		ArrayList<OnlineDTO> onlineinfoList_kr = (ArrayList<OnlineDTO>) request.getAttribute("onlineinfoList_kr");
		
		//해외 응모 정보
		ArrayList<MemberDrawDTO> drawInfoList_etc = (ArrayList<MemberDrawDTO>) request.getAttribute("drawInfoList_etc");
		ArrayList<BrandDTO> brandList_etc = (ArrayList<BrandDTO>) request.getAttribute("brandList_etc");
		ArrayList<OnlineDTO> onlineinfoList_etc = (ArrayList<OnlineDTO>) request.getAttribute("onlineinfoList_etc");
		
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
	
		<div id="content_sneakerList" style="margin-top: 20px;">
			<%
				Calendar cal = Calendar.getInstance();
				int month = cal.get(Calendar.MONTH);
		
				for(int z=1; z<13; z++){
					ArrayList<MemberDrawDTO> new_userDrawStylecodeList = new ArrayList();
					ArrayList<SneakerDTO> new_sneakerInfoList = new ArrayList();
					
					if(z==1){ new_userDrawStylecodeList = userDrawStylecodeList1; new_sneakerInfoList = sneakerInfoList1;}
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
						<div class="shoelist_content">
							<div class="content_wrapper_draw">
								<!-- 이미지 -->
								<div class="content_img">
									<a href="./MemberDrawDetailInfo.me?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>">
		  								<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" > <br>
									</a>
								</div>
								<!-- links -->
								<div class="content_links">
									<a href="./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>">	
										<div id="link-wrapper" style="pointer-events: auto;">
											<%=sdto.getModel_name_kr()%>
										</div>
									</a>
								</div>
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
		
		//방지
		$(document).bind('keydown', function(e){
			if(e.keyCode == 123 /* F12 */){
				e.preventDefault();
				e.returnVale = false;
			}
		});

		
	});
	
	document.onmousedown=disableclick;
	//status="Right click is not availble";
	
	function disableclick(event){
		if(event.button==2){
			//alert(status);
			return false;
		}
	}

</script>
</html>