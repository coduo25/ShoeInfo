<%@page import="net.country.db.CountryDTO"%>
<%@page import="java.util.List"%>
<%@page import="net.brand.db.BrandDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>SHOE INFO.</title>
<link href="./css/board/adminForm.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

	<%
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
		if(user == null){
			response.sendRedirect("./SneakerList.go");
		}
	
		//넘어온 객체 받기
		BrandDTO bdto = (BrandDTO) request.getAttribute("brandInfo");
		
		List<CountryDTO> countryList_all = (List<CountryDTO>) request.getAttribute("countryList_all");
		
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_adminAddSneaker" style="height: 700px">

			<!-- 브랜드 수정하는 란 -->
			<div>
				<h3> 브랜드 정보 수정하기 </h3>
				<form action="./UpdateBrandInfoAction.ad" id="updateBrandForm" method="post" enctype="multipart/form-data">	
					<table border = "1">
						<tr>
							<td id="category"> 국가/지역 </td>
							<td> 
								<select name="country_name" id="country_name">
									<option value="default"> 나라를 선택해주세요. </option>
									<option value="default" disabled> ------------------------ </option>
									<%
										for(int i=0;i<countryList_all.size();i++) {
											CountryDTO cdto = countryList_all.get(i);
									%>
										<option value="<%=cdto.getCountry_name()%>" <%if(bdto.getCountry_name().equals(cdto.getCountry_name())){%> selected <%}%>> <%=cdto.getCountry_name()%> </option>
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
							<td> <input type="text" name="brand_name" value="<%=bdto.getBrand_name()%>"> </td>
						</tr>
						<tr>
							<td id="category"> 브랜드 아이디 </td>
							<td> <input type="text" name="brand_id" value="<%=bdto.getBrand_id()%>" readonly> </td>
						</tr>
						<tr>
							<td id="category"> 브랜드 넘버 </td>
							<td> <input type="text" name="brand_num" value="<%=bdto.getBrand_num()%>" readonly> </td>
						</tr>
					
						<tr>
							<td colspan="2"> 
								<input type="submit" id="submit_btn" value="수정하기"> 
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
		
		//브랜드 수정하는 유효성 검사
		$('#updateBrandForm').submit(function(){
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