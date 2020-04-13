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
			<!-- 오프라인 정보 추가하는 란 -->
			<div>
				<h3> 오프라인 발매 정보 추가하기 </h3>
				<form action="./AddOfflineInfoAction.ad" method="post">
					<table border = "1">
						<tr>
							<td> 신발 스타일 코드 </td>
							<td> <input type="text" name="model_stylecode"> </td>
						</tr>
						<tr>
							<td rowspan="2"> 브랜드* </td>
							<td> 
								나라 선택
								<select id="country_name" name="country_name">
									<option value="default"> 나라를 선택해주세요 </option>
									<% for(int i=0;i<countryList_bybrand.size();i++) { BrandDTO bdto = countryList_bybrand.get(i); %><option value="<%=bdto.getCountry_name()%>"> <%=bdto.getCountry_name()%> </option><%}%>
								</select>
							</td>
						</tr>
						<tr>
							<td id="brand_name_offline"> 
							</td>
						</tr>
						<tr>
							<td> 오프라인 장소명 </td>
							<td> <input type="text" name="offline_location"> </td>
						</tr>
						<tr>
							<td> 오프라인 링크 </td>
							<td> <input type="text" name="offline_link"> </td>
						</tr>
						<tr>
							<td> 오프라인 시간 </td>
							<td> <input type="date" name="offline_date_start"><input type="time" name="offline_hour_start">~<input type="date" name="offline_date_end"><input type="time" name="offline_hour_end"></td>
						</tr>
						<tr>
							<td> 발표 시간 </td>
							<td> <input type="date" name="offline_result_date"><input type="time" name="offline_result_hour"></td>
						</tr>
						<tr>
							<td> 오프라인 방식 </td>
							<td> 
								<select name="offline_method">
									<option value="default"> 오프라인 방식을 선택해주세요. </option>
									<option value="선착"> 선착 </option>
									<option value="스크래치"> 스크래치 </option>
									<option value="추첨"> 추첨(응모) </option>
								</select>
							</td>
						</tr>
						<tr>
							<td> 추가설명 </td>
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
		
			<!-- 온라인 정보 추가하는 란 -->
			<div>
				<h3> 온라인 발매 정보 추가하기 </h3>
				<form action="./AddOnlineInfoAction.ad" method="post">
					<table border = "1">
						<tr>
							<td> 신발 스타일 코드 </td>
							<td> <input type="text" name="model_stylecode"> </td>
						</tr>
						<tr>
							<td rowspan="2"> 브랜드* </td>
							<td> 
								나라 선택
								<select id="country_name" name="country_name">
									<option value="default"> 나라를 선택해주세요 </option>
									<% for(int i=0;i<countryList_bybrand.size();i++) { BrandDTO bdto = countryList_bybrand.get(i); %><option value="<%=bdto.getCountry_name()%>"> <%=bdto.getCountry_name()%> </option><%}%>
								</select>
							</td>
						</tr>
						<tr>
							<td id="brand_name_online"> 
								
							</td>
						</tr>
						<tr>
							<td> 온라인 링크 </td>
							<td> <input type="text" name="online_link"> </td>
						</tr>
						<tr>
							<td> 온라인 시간 </td>
							<td> <input type="date" name="online_date_start"><input type="time" name="online_hour_start">~<input type="date" name="online_date_end"><input type="time" name="online_hour_end"></td>
						</tr>
						<tr>
							<td> 발표 시간 </td>
							<td> <input type="date" name="online_result_date"><input type="time" name="online_result_hour"></td>
						</tr>
						<tr>
							<td> 온라인 방식 </td>
							<td> 
								<select name="online_method">
									<option value="default"> 온라인 방식을 선택해주세요. </option>
									<option value="선착"> 선착 </option>
									<option value="드로우"> 드로우(당첨후 결제) </option>
									<option value="드로우(당첨전 선결제)"> 드로우(당첨전 선결제) </option>
									<option value="드로우(드로우당첨자간 선착순 구매)"> 응모(드로우당첨자간 선착순 구매) </option>
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
	//jquery 구문
	$(document).ready(function(){
		$('#country_name').change(function() {
			//나라 항목들을 모두 선택하게 되면 브랜드 항목들 불러오는 함수 호출
			$.ajax({
				type:'get',
				url:'/ShoeInfo/admin/searchBrandAjax.jsp',
				data:'country_name='+$("#country_name").val(),
				dataType:"html",
				success:function(data){
					$('#brand_name_offline').html(data);
					$('#brand_name_online').html(data);
				},error:function(request,status,error){
					 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
	    });
	}); 
</script>
</html>