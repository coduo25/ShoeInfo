<%@page import="net.sneaker.db.SneakerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	
		if(user == null || !usr_position.equals("admin")){
			response.sendRedirect("./SneakerList.go");
		}
	
		//넘어온 기본정보 객체 받기
		SneakerDTO sdto = (SneakerDTO) request.getAttribute("sneakerInfo");

		//날짜 자르기
		String str = sdto.getRelease_date();
		String[] dateArray = str.split("-");
		
		String year = dateArray[0];
		String month = dateArray[1];
		String day = dateArray[2];
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
	
		<!-- 제목 -->
		<h3> 기본정보 수정하기 </h3>
	
		<!-- content -->
		<div id="content_adminAddSneaker">
			<form action="./UpdateSneakerInfoAction.ad" id="updateSneakerForm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="num" value="<%=sdto.getNum()%>">
				<input type="hidden" name="old_model_stylecode" value="<%=sdto.getModel_stylecode()%>"> 
				<table border = "1">
					<tr>
						<td id="category" colspan="2"> 발매방식 </td>
						<td colspan="2">
							<select name="release_status">
								<option value="planned" <%if(sdto.getRelease_status().equals("planned")) {%> selected <%}%>> 정식 발매 </option>
								<option value="shock" <%if(sdto.getRelease_status().equals("shock")) {%> selected <%}%>> 기습 발매 </option>
							</select>
						</td>
					</tr>
					<tr>
						<td id="category" colspan="2"> 브랜드* </td>
						<td> 
							<input type="text" name="brand" value="<%=sdto.getBrand()%>">
						</td>
					</tr>
					<tr>
						<td id="category" colspan="2"> 이미지* </td>
						<td colspan="2"> <input type="file" name="file1"> </td>
					</tr>
					<tr>
						<td id="category" colspan="2"> 스타일 코드  </td>
						<td colspan="2"> 
							<input type="text" name="model_stylecode" <%if(sdto.getModel_stylecode().equals("UNKNOWN")){%>value=""<%}else{%>value="<%=sdto.getModel_stylecode()%> <%}%>"> 
						</td>
					</tr>
					<tr>
						<td id="category" colspan="2"> 제품명 ENG </td>
						<td colspan="2">
							<input type="text" name="model_name" <%if(sdto.getModel_name().equals("UNKNOWN")){%>value=""<%}else{%>value="<%=sdto.getModel_name()%> <%}%>">
						</td>
					</tr>
					<tr>
						<td id="category" colspan="2"> 제품명 KOR </td>
						<td colspan="2">
							<input type="text" name="model_name_kr" <%if(sdto.getModel_name_kr().equals("UNKNOWN")){%>value=""<%}else{%>value="<%=sdto.getModel_name_kr()%> <%}%>">
						</td>
					</tr>
					<tr>
						<td id="category" colspan="2"> 컬러 웨이 </td>
						<td colspan="2">
							<input type="text" name="model_colorway" <%if(sdto.getModel_colorway().equals("UNKNOWN")){%>value=""<%}else{%> value="<%=sdto.getModel_colorway()%> <%}%>">
						</td>
					</tr>
					<tr>
						<td id="category" colspan="2"> 가격 </td>
						<td colspan="2">
							<input type="text" name="price" <%if(sdto.getPrice() == 0){%>value=""<%}else{%>value="<%=sdto.getPrice()%> <%}%>">
						</td>
					</tr>
					<tr>
						<td id="category" colspan="2"> 발매일* </td>
						<td colspan="2">
							<select name="year" id="sel_year">
								<option value="default"> 년 </option>
								<option value="2020" <%if(year.equals("2020")){%> selected <%}%>> 2020 </option>
								<option value="2021" <%if(year.equals("2021")){%> selected <%}%>> 2021 </option>
								<option value="2022" <%if(year.equals("2022")){%> selected <%}%>> 2022 </option>
							</select>
							년
							<select name="month" id="sel_month">
								<option value="default"> 월 </option>
								<option value="01" <%if(month.equals("01")){%> selected <%}%>> 1 </option>
								<option value="02" <%if(month.equals("02")){%> selected <%}%>> 2 </option>
								<option value="03" <%if(month.equals("03")){%> selected <%}%>> 3 </option>
								<option value="04" <%if(month.equals("04")){%> selected <%}%>> 4 </option>
								<option value="05" <%if(month.equals("05")){%> selected <%}%>> 5 </option>
								<option value="06" <%if(month.equals("06")){%> selected <%}%>> 6 </option>
								<option value="07" <%if(month.equals("07")){%> selected <%}%>> 7 </option>
								<option value="08" <%if(month.equals("08")){%> selected <%}%>> 8 </option>
								<option value="09" <%if(month.equals("09")){%> selected <%}%>> 9 </option>
								<option value="10" <%if(month.equals("10")){%> selected <%}%>> 10 </option>
								<option value="11" <%if(month.equals("11")){%> selected <%}%>> 11 </option>
								<option value="12" <%if(month.equals("12")){%> selected <%}%>> 12 </option>
								<option value="default" disabled> ---- </option>
								<option value="99" <%if(month.equals("99")){%> selected <%}%>> 99 </option>
							</select>
							월
							<select name="day" id="sel_day">
								<option value="default"> 일 </option>
								<option value="01" <%if(day.equals("01")){%> selected <%}%>> 1 </option>
								<option value="02" <%if(day.equals("02")){%> selected <%}%>> 2 </option>
								<option value="03" <%if(day.equals("03")){%> selected <%}%>> 3 </option>
								<option value="04" <%if(day.equals("04")){%> selected <%}%>> 4 </option>
								<option value="05" <%if(day.equals("05")){%> selected <%}%>> 5 </option>
								<option value="06" <%if(day.equals("06")){%> selected <%}%>> 6 </option>
								<option value="07" <%if(day.equals("07")){%> selected <%}%>> 7 </option>
								<option value="08" <%if(day.equals("08")){%> selected <%}%>> 8 </option>
								<option value="09" <%if(day.equals("09")){%> selected <%}%>> 9 </option>
								<option value="10" <%if(day.equals("10")){%> selected <%}%>> 10 </option>
								<option value="11" <%if(day.equals("11")){%> selected <%}%>> 11 </option>
								<option value="12" <%if(day.equals("12")){%> selected <%}%>> 12 </option>
								<option value="13" <%if(day.equals("13")){%> selected <%}%>> 13 </option>
								<option value="14" <%if(day.equals("14")){%> selected <%}%>> 14 </option>
								<option value="15" <%if(day.equals("15")){%> selected <%}%>> 15 </option>
								<option value="16" <%if(day.equals("16")){%> selected <%}%>> 16 </option>
								<option value="17" <%if(day.equals("17")){%> selected <%}%>> 17 </option>
								<option value="18" <%if(day.equals("18")){%> selected <%}%>> 18 </option>
								<option value="19" <%if(day.equals("19")){%> selected <%}%>> 19 </option>
								<option value="20" <%if(day.equals("20")){%> selected <%}%>> 20 </option>
								<option value="21" <%if(day.equals("21")){%> selected <%}%>> 21 </option>
								<option value="22" <%if(day.equals("22")){%> selected <%}%>> 22 </option>
								<option value="23" <%if(day.equals("23")){%> selected <%}%>> 23 </option>
								<option value="24" <%if(day.equals("24")){%> selected <%}%>> 24 </option>
								<option value="25" <%if(day.equals("25")){%> selected <%}%>> 25 </option>
								<option value="26" <%if(day.equals("26")){%> selected <%}%>> 26 </option>
								<option value="27" <%if(day.equals("27")){%> selected <%}%>> 27 </option>
								<option value="28" <%if(day.equals("28")){%> selected <%}%>> 28 </option>
								<option value="29" <%if(day.equals("29")){%> selected <%}%>> 29 </option>
								<option value="30" <%if(day.equals("30")){%> selected <%}%>> 30 </option>
								<option value="31" <%if(day.equals("31")){%> selected <%}%>> 31 </option>
								<option value="default" disabled> ---- </option>
								<option value="99" <%if(day.equals("99")){%> selected <%}%>> 99 </option>
							</select>
							일
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="submit" id="submit_btn" value="수정하기"> <a href="./DeleteSneaker.ad?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>" style="float:right;"> 삭제하기 </a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>

</body>

<script type="text/javascript">

	$(document).ready(function(){
		
		//모든 input 유효성 검사하는 함수
		$('#updateSneakerForm').submit(function(){
			//브랜드가 빈칸이면
			if($('input[name=brand]').val() == ''){
				alert("브랜드를 입력해주세요.");
				$('input[name=brand]').focus();
				return false;
			}
			//제품 이미지들 안 넣을때
			else if($('input[name=file1]').val() == ''){
				alert("신발 이미지를 넣어주세요.");
				$('input[name=file1]').focus();
				return false;
			}
			
			//발매일이 빈칸일시
			else if($('#sel_year').val() == 'default'){
				alert("발매 년도를 선택해주세요.");
				$('#sel_year').focus();
				return false;
			}
			else if($('#sel_month').val() == 'default'){
				alert("발매 월을 선택해주세요.");
				$('#sel_month').focus();
				return false;
			}
			else if($('#sel_day').val() == 'default'){
				alert("발매 날짜를 선택해주세요.");
				$('#sel_day').focus();
				return false;
			}
			
		});
		
	});

</script>

</html>