<%@page import="net.sneaker.db.SneakerDTO"%>
<%@page import="net.board.action.Criteria"%>
<%@page import="net.board.action.PageMaker"%>
<%@page import="net.country.db.CountryDTO"%>
<%@page import="net.brand.db.BrandDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>SHOE INFO.</title>
<link href="./css/board/sneakerDetail.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body>

	<%
	
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		if(user == null){
			response.sendRedirect("./SneakerList.go");
		}
		
		String model_stylecode = (String) request.getParameter("model_stylecode");
		if(model_stylecode == null){
			model_stylecode = "";
		}
		
		List<BrandDTO> brandList = (List<BrandDTO>) request.getAttribute("brandList");
		
		SneakerDTO sdto = (SneakerDTO) request.getAttribute("sneakerDetail");
	
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>
	
	<div id="wrapper" class="container">

		<!-- content -->
		<div id="content_sneakerDetail">
			<!-- 신발 기본 정보 -->
			<div id="sneaker_Detail">
				<div class="sneaker_image_wrapper"> 
					<div class="sneaker_image"> 
						<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>">
					</div>
					<!-- 신발 이름 -->
					<div class="sneaker_name">
						<span><%=sdto.getModel_name() %></span>
					</div>
				</div>

			
				<!-- 추가하는 form -->
				<div class="add_wrapper">
					<form action="./AddOnlineInfoAction.ad" id="addOnlineForm" method="post">
						<div id="stylecode-form">
							<span id="category"> 스타일 코드* </span>
							<input type="text" name="model_stylecode" value="<%=model_stylecode%>" readonly>
						</div>
						
						<div id="brand-form">
							<span id="category"> 브랜드* </span>
							<div class="search-form">
								<input type="text" placeholder="ex. END, SNS, ..." onkeyup="filter()" id="textBrand"> 
								<input type="button" value="검색" id="searchBtn"> 					
							</div>
							<div class="searched-form">
								<!-- form 끄는 버튼 -->
								<span id="exit-form"> <i class="far fa-window-close"></i> </span>
								
								<%
									for(int i=0; i<brandList.size(); i++) {
										BrandDTO bdto = brandList.get(i);
								%>
									<div class="brandList-wrapper" onclick="addBrand(<%=i%>)" id="brandList-wrapper<%=i%>">
										<div>
											<img src="./brand_img_upload/<%=bdto.getBrand_logo().split(",")[0]%>">
										</div>
										
										<div id="brandList-name" >
											<span class="name"><%=bdto.getBrand_name()%></span>
										</div>
										
										<input type="hidden" id="val_brandLogo<%=i%>" value="<%=bdto.getBrand_logo()%>">
										<input type="hidden" id="val_countryName<%=i%>" value="<%=bdto.getCountry_name()%>">
										<input type="hidden" id="val_brandName<%=i%>" value="<%=bdto.getBrand_name()%>">
									</div>
								<%}%>
								
								<!-- searched 안될때 -->
								<div id="nothingSearched">
									<span> 검색 결과가 없습니다. </span>
									<div class="request-Btn"> 브랜드 등록 요청하기 </div>
								</div> 
							</div>
							
							<div class="picked-form">
								<span id="exit-form2">
									<i class="fas fa-times" id="exit-icon"></i>
								</span>
								<div>
									<img id="brandlogo_img" >
								</div>
								<div>
									<span class="picked-name"></span>
								</div>
								
								<input type="hidden" id="country_name">
								<input type="hidden" id="brand_name">
							</div>
							
							<div class="request-form"> 
								
							</div>
						</div>
						
						<div id="link-form"> 
							<span id="category"> 온라인 링크*</span>
							<input type="text" name="online_link">
						</div>
						
						<div id="online_method-form">
							<span id="category"> 발매 방식* </span>
							<input type="radio" id="fcfs" name="online_method" value="선착"> <label for="fcfs">선착</label>
							<input type="radio" id="draw" name="online_method" value="드로우"> <label for="draw">드로우</label>
							<input type="radio" id="Undefined" name="online_method" value="-"> <label for="Undefined">미정</label>
						</div>
						
						<div id="onlineTime-form">
							<span id="category"> 발매 시간 </span>
							<input type="date" name="online_date_start" id="input_date">
							<input type="time" name="online_hour_start" id="input_date">
							~
							<input type="date" name="online_date_end" id="input_date">
							<input type="time" name="online_hour_end" id="input_date">
						</div>
						
						<div id="buyMethod-form">
							<span id="category"> 구매 방식* </span>
							
							<div id="radio-wrapper">
								<input type="radio" id="buy_fcfs" name="buy_method" value="선착순 구매"> <label for="buy_fcfs">선착순 구매</label>
							</div>
							
							<div id="radio-wrapper">
								<input type="radio" id="buy_afCredit" name="buy_method" value="당첨 후 결제"> <label for="buy_afCredit">당첨 후 결제</label>
							</div>
							<div id="radio-wrapper">
								<input type="radio" id="buy_beCredit" name="buy_method" value="당첨 전 선결제"> <label for="buy_beCredit">당첨 전 선결제</label>
							</div>
							<div id="radio-wrapper">
								<input type="radio" id="buy_affcfs" name="buy_method" value="당첨자간 선착순 구매"> <label for="buy_affcfs">당첨자간 선착순 구매</label>
							</div>
							<div id="radio-wrapper">
								<input type="radio" id="buy_Undefined" name="buy_method" value="-"> <label for="buy_Undefined">미정</label>
							</div>	
							
						</div>
						
						<div id="delivery_method-form">
							<span id="category"> 직배 여부* </span>
							<input type="radio" id="can" name="delivery_method" value="직배가능"> <label for="can">직배가능</label>
							<input type="radio" id="cant" name="delivery_method" value="배대지"> <label for="cant">배대지</label>
							<input type="radio" id="domestic" name="delivery_method" value="국내배송"> <label for="domestic">국내배송</label>
							<input type="radio" id="instore" name="delivery_method" value="매장수령"> <label for="instore">매장수령</label>
						</div>
						
						<div id="submitBtn-form">
							<button type="button" class="rel_Btn2"> 
								<span> 추가하기 </span>
							</button>
						</div>

					</form>
				</div>
				
			</div>
			
		</div>
	</div>

	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>

</body>

<script type="text/javascript">

	//브랜드 검색 input focus 되었을시 검색결과창 켜기
	$('#textBrand').focus(function(){
		$('.searched-form').show();
	});
	$('.far').click(function(){
		$('.searched-form').hide();
	});
	
	function filter(){
		
		var test, i, name;
		
		var value = document.getElementById("textBrand").value.toUpperCase().trim();
		var item = document.getElementsByClassName("brandList-wrapper");
		
		var test = item.length;
		
		for(i=0;i<item.length;i++){
        	name = item[i].getElementsByClassName("name");
        	
        	if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
        		item[i].style.display = "inline-block";
            	test = test + 1;
        	} else {
            	item[i].style.display = "none";
            	test = test - 1;
          	}
        	
        	//검색결과가 없을때
        	if(test <= 0) {
        		$('#nothingSearched').show();
        	}else{
        		$('#nothingSearched').hide();
        	}
        	
        }
		
		$('.request-Btn').click(function(){
			
		});

		
// 		var isVisible = brandArray.some(brandArray[i].css("display") == "inline-block");
		
// 		for(i=0;i<item.length;i++){
// 			name = item[i].getElementsByClassName("name");
			
// 			if(){
// 				item.length - 1;
// 			} else {
// 				item.length 
// 			}
			
			
// 			if($('#brandList-wrapper' + i).css("display") == "inline-block"){
// 				$('#nothingSearched').hide();
//         	}else {
//         		$('#nothingSearched').show();
//         	}
// 		}
	}
	
	//브랜드를 클릭했을시
	function addBrand(i) {
		$('.searched-form').hide();
		$('.picked-form').show();
		
		//선택한 브랜드로고이름, 국가이름, 브랜드이름 가져오기
		var brandLogo = $('#val_brandLogo' + i).val();
		var countryName = $('#val_countryName' + i).val();
		var brandName = $('#val_brandName' + i).val();
		
		$('#brandlogo_img').attr("src", "./brand_img_upload/" + brandLogo);
		$('.picked-name').text(brandName);
		
		$('#country_name').val(countryName);
		$('#brand_name').val(brandName);
	}
	
	$('#exit-icon').click(function(){
		$('.picked-form').hide();
		
		$('#country_name').val("");
		$('#brand_name').val("");
	});

</script>

</html>