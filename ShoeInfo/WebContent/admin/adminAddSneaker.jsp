<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SHOE INFO.</title>
<link href="./css/board/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
</head>
<body>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_adminAddSneaker">
			<form action="./AddSneakerAction.ad" method="post" enctype="multipart/form-data">
				<table border = "1">
					<tr>
						<td> 발매방식 </td>
						<td colspan="2">
							<select name="release_status">
								<option value="planned"> 정식 발매 </option>
								<option value="shock"> 기습 발매 </option>
							</select>
						</td>
					</tr>
					<tr>
						<td rowspan="3"> 브랜드 </td>
						<td> brand <br> (ex. Nike, Air Jordan, Adidas) </td>
						<td> <input type="text" name="brand"> </td>
					</tr>
					<tr>
						<td> sub-brand <br> (ex. 1, 11, Yeezy, Dunk, Dunk SB) </td> 
						<td> <input type="text" name="sub_brand"> </td>
					</tr>
					<tr>
						<td> brand-index <br> (ex. Low, Fear of God, Boost 350 V2, 992) </td> 
						<td> <input type="text" name="brand_index"> </td>
					</tr>
					<tr>
						<td> 제품 이미지 <br> (썸네일용 - 날짜 적혀있는) </td>
						<td colspan="2"> <input type="file" name="file0"> </td>
					</tr>
					<tr>
						<td> 제품 이미지 <br> (날짜 없는 사진) </td>
						<td colspan="2"> <input type="file" name="file1"> </td>
					</tr>
					<tr>
						<td> 제품 스타일 코드  </td>
						<td colspan="2"> <input type="text" name="model_stylecode"> </td>
					</tr>
					<tr>
						<td> 제품명 </td>
						<td colspan="2"> <input type="text" name="model_name"> </td>
					</tr>
					<tr>
						<td> 제품 컬러 웨이 </td>
						<td colspan="2"> <input type="text" name="model_colorway"> </td>
					</tr>
					<tr>
						<td> 가격 <br> (한국 가격이 아직 나오지 않았다면 0으로 쓰기) </td>
						<td colspan="2"> <input type="text" name="price"> 원</td>
					</tr>
					<tr>
						<td> 발매일 <br> (글로벌기준, 만약 월만 나왔을경우 일은 99 선택) </td>
						<td colspan="2">
							<select name="year">
								<option value="2020"> 2020 </option>
								<option value="2021"> 2021 </option>
								<option value="2022"> 2022 </option>
							</select>
							년
							<select name="month">
								<option value="01"> 1 </option>
								<option value="02"> 2 </option>
								<option value="03"> 3 </option>
								<option value="04"> 4 </option>
								<option value="05"> 5 </option>
								<option value="06"> 6 </option>
								<option value="07"> 7 </option>
								<option value="08"> 8 </option>
								<option value="09"> 9 </option>
								<option value="10"> 10 </option>
								<option value="11"> 11 </option>
								<option value="12"> 12 </option>
							</select>
							월
							<select name="day">
								<option value="01"> 1 </option>
								<option value="02"> 2 </option>
								<option value="03"> 3 </option>
								<option value="04"> 4 </option>
								<option value="05"> 5 </option>
								<option value="06"> 6 </option>
								<option value="07"> 7 </option>
								<option value="08"> 8 </option>
								<option value="09"> 9 </option>
								<option value="10"> 10 </option>
								<option value="11"> 11 </option>
								<option value="12"> 12 </option>
								<option value="13"> 13 </option>
								<option value="14"> 14 </option>
								<option value="15"> 15 </option>
								<option value="16"> 16 </option>
								<option value="17"> 17 </option>
								<option value="18"> 18 </option>
								<option value="19"> 19 </option>
								<option value="20"> 20 </option>
								<option value="21"> 21 </option>
								<option value="22"> 22 </option>
								<option value="23"> 23 </option>
								<option value="24"> 24 </option>
								<option value="25"> 25 </option>
								<option value="26"> 26 </option>
								<option value="27"> 27 </option>
								<option value="28"> 28 </option>
								<option value="29"> 29 </option>
								<option value="30"> 30 </option>
								<option value="31"> 31 </option>
								<option value="99"> 99 </option>
							</select>
							일
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="submit" value="신발 등록">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>
</body>
</html>