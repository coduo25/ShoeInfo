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
						<td> 발매일 <br> (한국기준, 만약 발매일이 미정이면 날짜 건드리지 않고 추가하기) </td>
						<td colspan="2"> <input type="date" name="release_date"> </td>
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