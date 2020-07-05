<%@page import="net.country.db.CountryDTO"%>
<%@page import="net.brand.db.BrandDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/board/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<%
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		if(user == null){
			response.sendRedirect("./searchBrand.ad");
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
				<h3> 온라인 발매 정보 추가하기 </h3>
				<form action="./AddOnlineInfoAction.ad" method="post">
					<table border = "1">
						<tr>
							<td> 신발 스타일 코드 </td>
							<td> <input type="text" name="model_stylecode" value="<%=model_stylecode%>" required> </td>
						</tr>
						<tr>
							<td rowspan="2"> 브랜드* </td>
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
							<td> 온라인 링크 </td>
							<td> <input type="text" name="online_link"> </td>
						</tr>
						<tr>
							<td> 온라인 시간 </td>
							<td> 
								<input type="date" name="online_date_start">
								<input type="time" name="online_hour_start">
								~
								<input type="date" name="online_date_end">
								<input type="time" name="online_hour_end">
							</td>
						</tr>
						<tr>
							<td> 온라인 방식 </td>
							<td> 
								<select name="online_method">
									<option value="default"> 온라인 방식을 선택해주세요. </option>
									<option value="선착"> 선착 </option>
									<option value="드로우"> 드로우 </option>
								</select>
							</td>
						</tr>
						<tr>
							<td> 구매 방식 </td>
							<td>
								<select name="buy_method">
									<option value="default"> 구매 방식을 선택해주세요. </option>
									<option value="선착순 구매"> 선착순 구매 </option>
									<option value="당첨 후 결제"> 당첨 후 결제 </option>
									<option value="당첨전 선결제"> 당첨 전 선결제 </option>
									<option value="당첨자간 선착순 구매"> 당첨자간 선착순 구매 </option> 
									<option value="-"> - </optino>
								</select>
							</td>
						</tr>
						<tr>
							<td> 직배 여부 </td>
							<td>
								<select name="delivery_method">
									<option value="default"> 직배여부를 선택해주세요. </option>
									<option value="직배가능"> 직배가능 </option>
									<option value="직배불가(배대지추천)"> 직배불가(배대지추천) </option>
									<option value="-"> - </option>
								</select>
							</td>
						</tr>
						<tr>
							<td> 특이사항 </td>
							<td> <textarea name="description"></textarea>
						</tr>
						<tr>
							<td colspan="2"> 
								<input type="submit" value="추가하기">
								<input type="reset" value="다시작성">
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
				<form action="./AddBrandAction.ad" method="post" enctype="multipart/form-data">	
					<table border = "1">
						<tr> 
							<td colspan="2"> 브랜드(사이트)의 국가 정보 </td>	
						<tr>
						<tr>
							<td> 국가/지역 </td>
							<td> 
								<select name="country_name">
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
							<td> 로고 Image </td>
							<td> <input type="file" name="brand_logo"> </td>
						</tr>
						<tr>
							<td> 브랜드 이름 </td>
							<td> <input type="text" name="brand_name"> </td>
						</tr>
					
						<tr>
							<td colspan="2"> 
								<input type="submit" value="추가하기"> 
								<input type="reset" value="다시작성">
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
				<form action="./AddCountryAction.ad" method="post" enctype="multipart/form-data">
					<table border = "1">
						<tr>
							<td> 지역 </td>
							<td> 
								<select name="country_region">
									<option value="default"> 지역을 선택해주세요. </option>
									<option value="아시아"> 아시아 </option>
									<option value="유럽"> 유럽 </option>
									<option value="아메리카"> 아메리카 </option>
									<option value="기타"> 기타 </option>
								</select> 
							</td>
						</tr>
						<tr>
							<td> 나라 이름(ex.대한민국) </td>
							<td> <input type="text" name="country_name"> </td>
						</tr>
						<tr>
							<td> 나라 코드(ex.82 - <a href="https://countrycode.org/" target="_blank">코드보러가기</a>) </td>
							<td> <input type="text" name="country_code"> </td>
						</tr>
						<tr>
							<td> 국기 이미지 업로드 </td>
							<td> <input type="file" name="country_flag"> </td>
						</tr>
						<tr>
							<td colspan="2"> 
								<input type="submit" value="추가하기"> 
								<input type="reset" value="다시작성">
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
	}); 
</script>
</html>