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
	
		ArrayList<MemberDrawDTO> userDrawStylecodeList = (ArrayList<MemberDrawDTO>) request.getAttribute("userDrawStylecodeList");
		ArrayList<SneakerDTO> sneakerInfoList = (ArrayList<SneakerDTO>) request.getAttribute("sneakerInfoList");

		//국내 응모 정보
		ArrayList<MemberDrawDTO> drawInfoList_kr = (ArrayList<MemberDrawDTO>) request.getAttribute("drawInfoList_kr");
		ArrayList<BrandDTO> brandList_kr = (ArrayList<BrandDTO>) request.getAttribute("brandList_kr");
		ArrayList<OnlineDTO> onlineinfoList_kr = (ArrayList<OnlineDTO>) request.getAttribute("onlineinfoList_kr");
		
		//해외 응모 정보
		ArrayList<MemberDrawDTO> drawInfoList_etc = (ArrayList<MemberDrawDTO>) request.getAttribute("drawInfoList_etc");
		ArrayList<BrandDTO> brandList_etc = (ArrayList<BrandDTO>) request.getAttribute("brandList_etc");
		ArrayList<OnlineDTO> onlineinfoList_etc = (ArrayList<OnlineDTO>) request.getAttribute("onlineinfoList_etc");
		
		//응모 횟수 리스트
		ArrayList<Integer> countDrawList = (ArrayList<Integer>) request.getAttribute("countDrawList");
		
		SimpleDateFormat original_format = new SimpleDateFormat("yyyy-MM-dd");
		
		//오늘날짜
		Date currentTime = new Date();
		String current = original_format.format(currentTime);
		Date today = original_format.parse(current);
	%>

	<!-- Header -->	
	<header> <jsp:include page="/include/header.jsp" /> </header>
	
	<input type="hidden" class="login_user" id="login_user" value="<%=user%>">
	
	<!-- Main Content -->
	<div id="wrapper" class="container">
	
		<!-- 나의 응모내역 리스트 -->
		<div class="myDrawList-container" style="margin:40px 0 400px !important;">
			<div class="sub-title">
				<h4> 나의 응모내역 </h4>
			</div>
			<div class="myDraw-table-container">
				<% if(userDrawStylecodeList.isEmpty()) { %>
					<div>
						참여한 응모내역이 없습니다.
					</div>
				<%} else {
					//응모한 신발 리스트
					for(int i=0; i<userDrawStylecodeList.size(); i++) {
						SneakerDTO mydraw_sdto = sneakerInfoList.get(i);
						int countNum = countDrawList.get(i);
				%>
					<div class="myDraw-container">
						<div class="myDraw-shoeInfo">
							<!-- 신발이미지 -->
							<div class="myDraw-image">
								<a href="./SneakerDetail.go?model_stylecode=<%=mydraw_sdto.getModel_stylecode()%>&num=<%=mydraw_sdto.getNum()%>">
									<img src="./sneaker_img_upload/<%=mydraw_sdto.getImage()%>">
								</a>
							</div>
							<!-- 신발 이름 + 해당 신발 응모 횟수 -->
							<div class="myDrawShoeInfo-container">
								<!-- 이름 -->
								<div class="myDrawShoeInfo-name" onclick="location.href='./SneakerDetail.go?model_stylecode=<%=mydraw_sdto.getModel_stylecode()%>&num=<%=mydraw_sdto.getNum()%>';">
									<span><%=mydraw_sdto.getModel_name_kr()%></span>
								</div>
								<!-- 응모 횟수 -->
								<div class="myDrawShoeInfo-countNum">
									<span>응모횟수 : <%=countNum%></span>
								</div>
							</div>
							
							<!-- List DropDown 버튼 -->
							<div class="myDrawDropDown-container" id="myDrawDropDown-container-<%=i%>">
								<span style="color:rgb(216, 216, 216);"><i class="fas fa-list"></i></span>
							</div>
							<!-- List DropUp 버튼 -->
							<div class="myDrawDropUp-container" id="myDrawDropUp-container-<%=i%>" style="display:none;">
								<span style="color:black;"><i class="fas fa-list"></i></span>
							</div>	
						</div>
						
						<!-- 응모 브랜드 리스트 -->
						<div class="brandList-container" id="brandList-container<%=i%>" style="display:none;">
							<div class="brandList-table">
								<!-- 국내 테이블 -->
								<div class="kr-table">
									<h4>국내</h4>
									<table>
										<tr>
											<th style="width:50%;">  </th>
											<th style="width:30%;"> 발표일 </th>
											<th style="width:20%;"> 남은시간 </th>
										</tr>
										
										<%if(drawInfoList_kr.isEmpty()){%>
											<tr>
												<td> 응모내역이 없습니다. </td>
											</tr>	
										<%} else {
											//countDrawList.get(0) 의 값 만큼씩 
											for(int j=0; j<countDrawList.get(i); j++) {
												MemberDrawDTO mddto = (MemberDrawDTO) drawInfoList_kr.get(j);
												BrandDTO bdto = (BrandDTO) brandList_kr.get(j);
												OnlineDTO odto = (OnlineDTO) onlineinfoList_kr.get(j);
										%>
											<tr>
												<!-- 브랜드 이미지 + 이름-->
												<td class="brandLogoName">
													<div style="display:flex; align-items: center;">
														<div class="myDraw-logo">
															<a href="<%=odto.getOnline_link()%>" target="_blank"> 
																<img id="brandlogo_img" src="./brand_img_upload/<%=bdto.getBrand_logo()%>">
															</a>
														</div>
														<div class="myDraw-brandName">
															<div class="myDraw-brandNameTxt">
																<span><%=bdto.getBrand_name()%> </span>
															</div>
														</div>
													</div>
												</td>
												<!-- 발표일 -->
												<td>
													<div>
														<%if(odto.getWinner_time().equals("-")){%>-<%} else {%> <%=odto.getWinner_time()%> <%}%>
													</div>
													<div>
														당첨문자
													</div>
												</td>
												<!-- 남은시간 -->
												<td>
													<div>
														<span>-</span>
													</div>
												</td>
											</tr>
										<% } } %>
									</table>
								</div>
								
								<!-- 해외 테이블 -->
								<div class="etc-table">
									<h4>해외</h4>
								</div>
							</div>
						</div>
						
						
						
					</div>
				<%} } %>
			</div>
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
		
		//리스트 DrowDown 버튼 눌렸을시
		$('.myDrawDropDown-container').click(function(){
			$(this).css('display', 'none');
			
			//아이다 값 가져오기
			var divID = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = divID.split('-');
			//맨 마지막 = 번호
			var number = splitArray[splitArray.length - 1];
			
			//DrowUp버튼 활성화
			$('#myDrawDropUp-container-'+number).css('display','block');
			
			//리스트 열기
			$('#brandList-container'+number).slideDown('fast');
		});
		
		//리스트 DrowUp 버튼 눌렸을시
		$('.myDrawDropUp-container').click(function(){
			$(this).css('display', 'none');
			
			//아이다 값 가져오기
			var divID = $(this).attr('id');
			// - 기준으로 자르기
			var splitArray = divID.split('-');
			//맨 마지막 = 번호
			var number = splitArray[splitArray.length - 1];
			
			//DrowUp버튼 활성화
			$('#myDrawDropDown-container-'+number).css('display','block');
			
			//리스트 열기
			$('#brandList-container'+number).slideUp('fast');
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