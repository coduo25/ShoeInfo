<%@page import="net.country.db.CountryDTO"%>
<%@page import="net.brand.db.BrandDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SHOE INFO.</title>
<link href="./css/board/adminForm.css" rel="stylesheet">
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
	
		//CountryDB로부터 모든 국가 리스트 가져오는 함수
		List<CountryDTO> countryList_all = (List<CountryDTO>) request.getAttribute("countryList_all");
	
		//BrandDB로부터 브랜드별 국가 리스트 가져오는 함수
		List<BrandDTO> countryList_bybrand = (List<BrandDTO>) request.getAttribute("countryList_bybrand");
	
		if(countryList_all == null || countryList_bybrand == null){
			System.out.println("넘어온 리스트 값이 null입니다.");
		}
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_adminAddSneaker">

			<!-- 온라인 정보 추가하는 란 -->
			<div>
				<h3> 발매 정보 추가하기 </h3>
				<form action="./AddOnlineInfoAction.ad" id="addOnlineForm" method="post">
					<table>
						<tr>
							<td id="category"> 신발 스타일 코드* </td>
							<td> <input type="text" name="model_stylecode" value="<%=model_stylecode%>" required> </td>
						</tr>
						<tr>
							<td id="category" rowspan="2"> 브랜드* </td>
							<td> 
								나라 선택
								<select id="country_name_on" name="country_name">
									<option value="default"> 나라를 선택해주세요 </option>
									<% for(int i=0;i<countryList_bybrand.size();i++) { BrandDTO bdto = countryList_bybrand.get(i); %><option value="<%=bdto.getCountry_name()%>"> <%=bdto.getCountry_name()%> </option><%}%>
								</select>
							</td>
						</tr>
						<tr>
							<td id="brand_name_on"> 
								
							</td>
						</tr>
						<tr>
							<td id="category"> 온라인 링크* </td>
							<td> <input type="text" name="online_link"> </td>
						</tr>
						<tr>
							<td id="category"> 
								온라인 시간		
							</td>
							<td> 
								<span id="cate_ref"> <i class="fas fa-exclamation-triangle"></i> &nbsp; 발매방식이 선착일시, 시작시간만 작성하기 </span> 
								<span id="cate_ref"> <i class="fas fa-exclamation-triangle"></i> &nbsp; 발매방식이 미정이고 발매날짜가 있을시, 시작시간에 입력 </span>
								<span id="cate_ref"> <i class="fas fa-exclamation-triangle"></i> &nbsp; 발매날짜와 시간이 없을시, 모두 빈칸으로 입력 </span>
								<br>
								
								<input type="date" name="online_date_start" id="input_date">
								<input type="time" name="online_hour_start" id="input_date">
								~
								<input type="date" name="online_date_end" id="input_date">
								<input type="time" name="online_hour_end" id="input_date">
							</td>
						</tr>
						<tr>
							<td id="category"> 발매 방식* </td>
							<td> 
								<select name="online_method" id="online_method">
									<option value="default"> 발매 방식을 선택해주세요. </option>
									<option value="선착"> 선착 </option>
									<option value="드로우"> 드로우 </option>
									<option value="-"> 미정 </option>
								</select>
							</td>
						</tr>
						<tr>
							<td id="category"> 구매 방식* </td>
							<td>
								<select name="buy_method" id="buy_method">
									<option value="default"> 구매 방식을 선택해주세요. </option>
									<option value="선착순 구매"> 선착순 구매 </option>
									<option value="당첨 후 결제"> 당첨 후 결제 </option>
									<option value="당첨전 선결제"> 당첨 전 선결제 </option>
									<option value="당첨자간 선착순"> 당첨자간 선착순 구매 </option> 
									<option value="-"> - </option>
								</select>
							</td>
						</tr>
						<tr>
							<td id="category"> 직배 여부* </td>
							<td>
								<select name="delivery_method" id="delivery_method">
									<option value="default"> 직배여부를 선택해주세요. </option>
									<option value="직배가능"> 직배가능 </option>
									<option value="배대지"> 배대지 </option>
									<option value="국내배송"> 국내배송 </option>
								</select>
							</td>
						</tr>
						<tr>
							<td id="category"> 특이사항 </td>
							<td> <textarea name="description"></textarea>
						</tr>
						<tr>
							<td colspan="2"> 
								<input type="submit" id="submit_btn" value="추가하기">
							</td>
							
						</tr>
					</table>
				</form>
			</div>
			
			<br>
			<br>
			
			<!-- 새로운 브랜드 추가하는 란 -->
			<div>
				<h3> 새로운 브랜드 추가하기 </h3>
				<form action="./AddBrandAction.ad" id="addBrandForm" method="post" enctype="multipart/form-data">	
					<table border = "1">
						<tr>
							<td id="category"> 국가/지역 </td>
							<td> 
								<select name="country_name" id="country_name">
									<option value="default"> 나라를 선택해주세요. </option>
									<%
										for(int i=0;i<countryList_all.size();i++) {
											CountryDTO cdto = countryList_all.get(i);
									%>
										<option value="<%=cdto.getCountry_name()%>"> <%=cdto.getCountry_name()%> </option>
									<%
										}
									%>
								</select>
							</td>
						</tr>
						<tr>
							<td id="category"> 로고 Image </td>
							<td> <input type="file" name="brand_logo"> </td>
						</tr>
						<tr>
							<td id="category"> 브랜드 이름 </td>
							<td> <input type="text" name="brand_name"> </td>
						</tr>
					
						<tr>
							<td colspan="2"> 
								<input type="submit" id="submit_btn" value="추가하기"> 
							</td>
						</tr>
				</table>
			</form>
			</div>
		
			<br>
			<br>
			
			<!-- 새로운 나라 추가하는 란 -->
			<div>
				<h3> 새로운 나라 추가하기 </h3>
				<form action="./AddCountryAction.ad" id="addCountryForm" method="post" enctype="multipart/form-data">
					<table border = "1">
						<tr>
							<td id="category"> 지역 </td>
							<td> 
								<select name="country_region" id="country_region">
									<option value="default"> 지역을 선택해주세요. </option>
									<option value="아시아"> 아시아 </option>
									<option value="유럽"> 유럽 </option>
									<option value="아메리카"> 아메리카 </option>
									<option value="기타"> 기타 </option>
								</select> 
							</td>
						</tr>
						<tr>
							<td id="category"> 나라 이름(ex.대한민국) </td>
							<td> <input type="text" name="country_name"> </td>
						</tr>
						<tr>
							<td id="category"> 나라 코드(ex.82 - <a href="https://countrycode.org/" target="_blank">코드보러가기</a>) </td>
							<td> <input type="text" name="country_code"> </td>
						</tr>
						<tr>
							<td id="category"> 국기 이미지 업로드 </td>
							<td> <input type="file" name="country_flag"> </td>
						</tr>
						<tr>
							<td colspan="2"> 
								<input type="submit" id="submit_btn" value="추가하기"> 
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>

</body>
<script type="text/javascript">

	$(document).ready(function(){
		$('#country_name_on').change(function() {
			//온라인 나라 항목을 선택했을시 브랜드 호출하는 함수
			$.ajax({
				type:'get',
				url:'/ShoeInfo/admin/searchBrandAjax.jsp',
				data:'country_name='+$("#country_name_on").val(),
				dataType:"html",
				success:function(data){
					$('#brand_name_on').html(data);
				},error:function(request,status,error){
					 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
	    });
		
		
		//모든 input 유효성 검사
		//온라인 발매 정보 추가하는 form 태그 검사
		$('#addOnlineForm').submit(function(){
			//신발 스타일 코드가 빈칸일때
			if($('input[name=model_stylecode]').val() == '') {
				alert("스타일 코드를 입력해주세요.");
				$('input[name=model_stylecode]').focus();
				return false;
			}
			//나라를 선택 안했을시
			else if($('#country_name_on').val() == 'default'){
				alert("나라를 선택해주세요.");
				$('#country_name_on').focus();
				return false;
			}
			//브랜드를 선택 안했을시
			else if($('#brand_name').val() == 'default'){
				alert("브랜드를 선택해주세요.");
				$('#brand_name').focus();
				return false;
			}
			//온라인 링크가 빈칸일때
			else if($('input[name=online_link]').val() == '') {
				alert("온라인 링크를 입력해주세요.");
				$('input[name=online_link]').focus();
				return false;
			}
			//온라인 방식을 선택 안했을시
			else if($('#online_method').val() == 'default'){
				alert("온라인 방식을 선택해주세요.");
				$('#online_method').focus();
				return false;
			}
			//구매 방식을 선택 안했을시
			else if($('#buy_method').val() == 'default'){
				alert("구매 방식을 선택해주세요.");
				$('#buy_method').focus();
				return false;
			}
			//직배 여부를 선택 안했을시
			else if($('#delivery_method').val() == 'default'){
				alert("직배 여부를 선택해주세요.");
				$('#delivery_method').focus();
				return false;
			}
		});
		
		//새로운 브랜드 추가 유효성 검사
		$('#addBrandForm').submit(function(){
			//나라를 선택 안했을시
			if($('#country_name').val() == 'default'){
				alert("나라를 선택해주세요.");
				$('#country_name').focus();
				return false;
			}
			//로고 이미지를 첨부 안했을시
			else if($('input[name=brand_logo]').val() == ''){
				alert("로고 이미지를 첨부해주세요.");
				$('input[name=brand_logo]').focus();
				return false;
			}
			//브랜드 이름이 빈칸일시
			else if($('input[name=brand_name]').val() == ''){
				alert("브랜드 이름을 입력해주세요.");
				$('input[name=brand_name]').focus();
				return false;
			}
		});
		
		//새로운 나라 추가 유효성 검사
		$('#addCountryForm').submit(function(){
			//지역을 선택 안했을시
			if($('#country_region').val() == 'default'){
				alert("지역을 선택해주세요.");
				$('#country_region').focus();
				return false;
			}
			//나라 이름이 빈칸일시
			else if($('input[name=country_name]').val() == ''){
				alert("나라 이름을 입력해주세요.");
				$('input[name=country_name]').focus();
				return false;
			}
			//나라 코드가 빈칸일시
			else if($('input[name=country_code]').val() == ''){
				alert("나라 코드를 입력해주세요.");
				$('input[name=country_code]').focus();
				return false;
			}
			//국가 이미지를 첨부 안했을시
			else if($('input[name=country_flag]').val() == ''){
				alert("국가 이미지를 첨부해주세요.");
				$('input[name=country_flag]').focus();
				return false;
			}
			
		});
		
	}); 
</script>
</html>