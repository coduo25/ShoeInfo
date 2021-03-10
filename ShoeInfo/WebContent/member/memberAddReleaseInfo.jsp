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
		if(user == null || usr_position.equals("general")){
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
	
		<!-- 좌측 사이드 바 -->
		<jsp:include page="/include/leftSideBar.jsp" />

		<!-- content -->
		<div id="content_sneakerDetail" style="margin-top:30px !important; padding-top:0 !important;">
			
			<div id="sneaker_Detail">
				<!-- 추가하는 form -->
				<div class="add_wrapper">
					<!-- 신발이미지 -->
					<div class="sneaker_image_wrapper"> 
						<div class="sneaker_image"> 
							<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>" style="width:20%;">
						</div>
					</div>
					
					<form action="./AddOnlineInfoAction.me" id="addOnlineForm" method="post">
					
						<input type="hidden" name="model_num" value="<%=sdto.getNum()%>">
						
						<!-- 스타일코드 --> 
						<div id="cate-Row">
							<div class="category">
								<span>스타일 코드*</span>
							</div>
							<div class="addContent">
								<input type="text" name="model_stylecode" value="<%=model_stylecode%>" readonly>
							</div>
						</div>
						
						<!-- 브랜드 -->
						<div id="cate-Row">
							<div class="category">
								<span> 브랜드*</span>
							</div>
							<div class="addContent">
							
								<div class="search-form">
									<input type="text" placeholder="ex. END, SNS, ..." onkeyup="filter()" id="textBrand"> 
<!-- 									<input type="button" value="검색" id="searchBtn"> -->
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
									
									
									<!-- 브랜드 요청하는 form -->
									<div id="request-form">
										<!-- 브랜드 이름 -->
										<div>
											<span id="category"> 브랜드 이름*</span>
											<input type="text" id="req-brandName">
										</div>
										<!-- 브랜드 주소 -->
										<div>
											<span id="category"> 브랜드 주소(옵션) </span>
											<input type="text" id="req-brandURL">
										</div>
										<!-- 요청하기 버튼 -->
										<div>
											<button type="button" class="newBrand_req"> 요청하기 </button>
										</div>
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
									
									<input type="hidden" name="country_name" id="country_name">
									<input type="hidden" name="brand_name" id="brand_name">
								</div>
							</div>
						</div>
						
						<!-- 온라인 링크 -->
						<div id="cate-Row"> 
							<div class="category">
								<span> 온라인 링크*</span>
							</div>
							<div class="addContent">
								<input type="text" name="online_link">
							</div>
						</div>
						
						<!-- 발매방식 -->
						<div id="cate-Row">
							<div class="category">
								<span> 발매 방식*</span>
							</div>
							<div class="addContent">
								<div id="onlineM-radio-wrapper">
									<input type="radio" id="fcfs" name="online_method" value="선착"> <label for="fcfs">선착</label>
								</div>
								
								<div id="onlineM-radio-wrapper">
									<input type="radio" id="draw" name="online_method" value="드로우"> <label for="draw">드로우</label>
								</div>
								
								<div id="onlineM-radio-wrapper">
									<input type="radio" id="instadraw" name="online_method" value="인스타라플"> <label for="instadraw">인스타라플</label>
								</div>
								
								<div id="onlineM-radio-wrapper">
									<input type="radio" id="emaildraw" name="online_method" value="이메일라플"> <label for="emaildraw">이메일라플</label>
								</div>
								
								<div id="onlineM-radio-wrapper">
									<input type="radio" id="offdraw" name="online_method" value="오프라인라플"> <label for="offdraw">오프라인라플</label>
								</div>
								
								<div id="onlineM-radio-wrapper">
									<input type="radio" id="Undefined" name="online_method" value="-"> <label for="Undefined">미정</label>
								</div>
							</div>		
						</div>
						
						<!-- 발매시간 -->
						<div id="cate-Row">
							<div class="category">
								<span> 발매 시간 </span>
							</div>
							<div class="addContent">
								<span style="display:block; padding-bottom:10px;">시작</span>
								<input type="date" name="online_date_start" id="input_date">
								<input type="time" name="online_hour_start" id="input_date"> ~
								
								<span style="display:block; padding:10px 0;">끝</span>
								<input type="date" name="online_date_end" id="input_date">
								<input type="time" name="online_hour_end" id="input_date">
							</div>
						</div>
						
						<!-- 발표시간 -->
						<div id="cate-Row">
							<div class="category">
								<span> 발표 시간 </span>
							</div>
							<div class="addContent">
								<input type="text" name="winner_time" maxlength="25"> 
							</div>
						</div>
						
						<!-- 구매방식 -->
						<div id="cate-Row">
							<div class="category">
								<span> 구매 방식*</span>
							</div>
							<div class="addContent">
								<div id="radio-wrapper" class="buy_fcfs">
									<input type="radio" id="buy_fcfs" name="buy_method" value="선착순 구매" disabled> <label for="buy_fcfs">선착순 구매</label>
								</div>
								
								<div id="radio-wrapper" class=buy_afCredit>
									<input type="radio" id="buy_afCredit" name="buy_method" value="당첨후 결제" disabled> <label for="buy_afCredit">당첨후 결제</label>
								</div>
								<div id="radio-wrapper" class="buy_beCredit">
									<input type="radio" id="buy_beCredit" name="buy_method" value="당첨전 선결제" disabled> <label for="buy_beCredit">당첨전 선결제</label>
								</div>
								<div id="radio-wrapper" class="buy_affcfs">
									<input type="radio" id="buy_affcfs" name="buy_method" value="당첨후 선착구매" disabled> <label for="buy_affcfs">당첨후 선착구매</label>
								</div>
								<div id="radio-wrapper" class="buy_Undefined">
									<input type="radio" id="buy_Undefined" name="buy_method" value="-" disabled> <label for="buy_Undefined">미정</label>
								</div>	
							</div>		
						</div>
						
						<!-- 배송여부 -->
						<div id="cate-Row">
							<div class="category">
								<span> 배송 여부*</span>
							</div>
							<div class="addContent">
								<div style="padding:0;">
									<div id="del-radio-wrapper">
										<input type="radio" id="can" name="delivery_method" value="직배"> <label for="can">직배</label>
									</div>
									<div id="del-radio-wrapper">
										<input type="radio" id="cant" name="delivery_method" value="배대지"> <label for="cant">배대지</label>
									</div>
									<div id="del-radio-wrapper">
										<input type="radio" id="domestic" name="delivery_method" value="국내배송"> <label for="domestic">국내배송</label>
									</div>
									<div id="del-radio-wrapper">
										<input type="radio" id="instore" name="delivery_method" value="매장수령"> <label for="instore">매장수령</label>
									</div>
									<div id="del-radio-wrapper">
										<input type="radio" id="onlyLocal" name="delivery_method" value="직배x배대지x"> <label for="onlyLocal">직배x 배대지x</label>
									</div>
									<div id="del-radio-wrapper">
										<input type="radio" id="etc" name="delivery_method"> <label for="etc" style="margin-right: 1%;"> 기타: </label> <input type="text" id="delivery_etc" maxlength="10" disabled>
									</div>
								</div>
							</div>	
						</div>
	
						<!-- 작성자 -->
						<div id="cate-Row">
							<div class="category">
								<span> 작성자*</span>
							</div>
							<div class="addContent">
								<input type="text" name="online_writer" value="<%=user%>" id="online_writer" readonly>
							</div>
						</div>
						
						<!-- 추가버튼 -->
						<div id="cate-Row">
							<button type="button" class="rel_Btn2"> 
								<span> 추가 </span>
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
		
		var i, name;
		
		var value = document.getElementById("textBrand").value.toUpperCase().trim();
		var item = document.getElementsByClassName("brandList-wrapper");
		
		var length = item.length;
		
		for(i=0;i<item.length;i++){
        	name = item[i].getElementsByClassName("name");
        	
        	if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
        		item[i].style.display = "inline-block";
        		length = length + 1;
        	} else {
            	item[i].style.display = "none";
            	length = length - 1;
          	}
        	
        	//검색결과가 없을때
        	if(length <= 0) {
        		$('#nothingSearched').show();
        	}else{
        		$('#nothingSearched').hide();
        		$('#request-form').hide();
        	}
        }
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
		$('#request-form').hide();
	}
	
	$('#exit-icon').click(function(){
		$('.picked-form').hide();
		
		$('#country_name').val("");
		$('#brand_name').val("");
	});
	
	$('.request-Btn').click(function(){
		$('#nothingSearched').hide();
		$('#request-form').show();
	});
	
	//요청하기 눌렸을시
	$('.newBrand_req').click(function(){

		if($('#req-brandName').val() == ''){
			alert("요청하고자 하는 브랜드 이름을 입력해주세요.");
			$('#req-brandName').focus();
			return false;
		}
	
		$.ajax({
			type:'post',
			url:'./AddBrandRequest.me',
			data:'brandName='+ $('#req-brandName').val() + '&brandURL=' + $('#req-brandURL').val() + '&model_stylecode=' + $('input[name=model_stylecode]').val(),
			dataType: 'html',
			success:function(data){
				if($.trim(data) == "reqExist"){
					alert("이미 추가요청을 한 브랜드입니다.");
				}else if($.trim(data) == "reqSuccess"){
					alert("해당 브랜드를 추가요청하였습니다. \n빠른시일내로 추가하도록 하겠습니다.");
				}
			},error:function(request,status,error){
			 	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}
		});
	});
	
	// 발매방식 선착을 선택했을시
	$('input:radio[name=online_method]').click(function(){
		var online_method = $('input:radio[name=online_method]:checked').val();
		
		//선착일시 끝나는 발매시간 없애기
		if(online_method == '선착'){
			$('input[name=online_date_end]').hide();
			$('input[name=online_hour_end]').hide();	
			$('#tilde').show();
			
			//선착란
			$('.buy_fcfs').show();
			$('#buy_fcfs').removeAttr("disabled");
			$('#buy_fcfs').prop('checked', true);
			
			//드로우란
			$('.buy_afCredit').hide();
			$('.buy_beCredit').hide();
			$('.buy_affcfs').hide();
			
			$('#buy_afCredit').prop('checked', false);
			$('#buy_beCredit').prop('checked', false);
			$('#buy_affcfs').prop('checked', false);
			
			//미정란
			$('.buy_Undefined').show();
			$('#buy_Undefined').removeAttr("disabled");
			$('#buy_Undefined').prop('checked', false);
		}
		
		//드로우일시 그대로 놔두기
		if(online_method == '드로우' || online_method == '오프라인라플' || online_method == '인스타라플' || online_method == '이메일라플'){
			$('input[name=online_date_start]').show();
			$('input[name=online_hour_start]').show();
			$('#tilde').show();
			$('input[name=online_date_end]').show();
			$('input[name=online_hour_end]').show();
			
			//선착란
			$('.buy_fcfs').hide();
			$('#buy_fcfs').prop('checked', false);
			
			//드로우란
			$('.buy_afCredit').show();
			$('.buy_beCredit').show();
			$('.buy_affcfs').show();

			$('#buy_afCredit').removeAttr("disabled");
			$('#buy_beCredit').removeAttr("disabled");
			$('#buy_affcfs').removeAttr("disabled");
			
			$('#buy_afCredit').prop('checked', false);
			$('#buy_beCredit').prop('checked', false);
			$('#buy_affcfs').prop('checked', false);
			
			//미정란
			$('.buy_Undefined').show();
			$('#buy_Undefined').removeAttr("disabled");
			$('#buy_Undefined').prop('checked', false);
		}
		
		//미정일때 끝나는 시간과 물결표시 없애기
		if(online_method == '-'){
			$('#tilde').hide();
			$('input[name=online_date_end]').hide();
			$('input[name=online_hour_end]').hide();
			
			//선착란
			$('.buy_fcfs').show();
			$('#buy_fcfs').removeAttr("disabled");
			$('#buy_fcfs').prop('checked', false);
			
			//드로우란
			$('.buy_afCredit').show();
			$('.buy_beCredit').show();
			$('.buy_affcfs').show();

			$('#buy_afCredit').removeAttr("disabled");
			$('#buy_beCredit').removeAttr("disabled");
			$('#buy_affcfs').removeAttr("disabled");
			
			$('#buy_afCredit').prop('checked', false);
			$('#buy_beCredit').prop('checked', false);
			$('#buy_affcfs').prop('checked', false);
			
			//미정란
			$('.buy_Undefined').show();
			$('#buy_Undefined').removeAttr("disabled");
			$('#buy_Undefined').prop('checked', false);
		}
		
	});
	
	
	//배송방식을 클릭했을시
	$('input:radio[name=delivery_method]').click(function(){
		if($('#etc').is(":checked") == true) {
			$('#delivery_etc').attr("disabled", false);
		}else {
			$('#delivery_etc').attr("disabled", true);
		}
	});
	
	//기타 배송방식 값이 변경되었을시
	$('#delivery_etc').change(function(){
		$('#etc').val($('#delivery_etc').val());
	});
	//기타 배송방식 input을 다시 클릭했을시
	$('#delivery_etc').click(function(){
		$('#etc').val($('#delivery_etc').val());
	});
	
	
	//모든 input 유효성 검사
	//온라인 발매 정보 추가하는  form 태그 검사
	$('.rel_Btn2').click(function(){

		//신발 스타일 코드가 빈칸일때
		if($('input[name=model_stylecode]').val() == '') {
			alert("스타일 코드를 입력해주세요.");
			$('input[name=model_stylecode]').focus();
			return false;
		}
		//브랜드를 선택 안했을시
		else if($('#country_name').val() == '' || $('#brand_name').val() == ''){
			alert("브랜드를 선택해주세요.");
			$('#textBrand').focus();
			return false;
		}
		//온라인 링크가 빈칸일때
		else if($('input[name=online_link]').val() == '') {
			alert("온라인 링크를 입력해주세요.");
			$('input[name=online_link]').focus();
			return false;
		}
		//발매 방식을 선택 안했을시
		else if(!$('input:radio[name=online_method]').is(':checked')) {
			alert("발매 방식을 선택해주세요.");
			return false;
		}
		//구매 방식을 선택 안했을시
		else if(!$('input:radio[name=buy_method]').is(':checked')) {
			alert("구매 방식을 선택해주세요.");
			return false;
		}
		//배송 여부를 선택 안했을시
		else if(!$('input:radio[name=delivery_method]').is(':checked')) {
			alert("배송 여부를 선택해주세요.");
			return false;
		}
		//배송 여부 중 기타란을 선택했을시 input 태그에 값을 넣기
		else if($('#etc').is(":checked") == true && $('#delivery_etc').val() == '') {
			alert("기타 배송방식을 입력해주세요.");
			$('#delivery_etc').focus();
			return false;
		}
		//유저 이름 확인란
		else if($('input[name=online_writer]').val() == ''){
			alert("로그인을 해주세요.");
			location.href="./MemberLogin.me";
			return false;
		}
		else {
			var submitConfirm = confirm("스타일코드: " + $('input[name=model_stylecode]').val()
										+ "\n브랜드: " + $('#brand_name').val()
										+ "\n발매방식: " + $('input:radio[name=online_method]:checked').val()
										+ "\n발매시간: " + $('input[name=online_date_start]').val() + " "+ $('input[name=online_hour_start]').val() + "~" + $('input[name="online_date_end"]').val() + " " + $('input[name=online_hour_end]').val()
										+ "\n구매방식: " + $('input:radio[name=buy_method]:checked').val()
										+ "\n배송여부: " + $('input:radio[name=delivery_method]:checked').val()
										+ "\n\n추가하실 발매정보는 수정은 가능하나 삭제는 불가합니다. \n발매정보를 추가하시겠습니까?");
			if(submitConfirm){
				$('#addOnlineForm').submit();
			}else{
				return false;
			}
			
		}
		
	});
	

</script>

</html>