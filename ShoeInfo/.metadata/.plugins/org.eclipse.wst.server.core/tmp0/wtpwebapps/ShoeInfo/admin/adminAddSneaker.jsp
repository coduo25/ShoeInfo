<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
						<td rowspan="3"> 브랜드 </td>
						<td> brand </td>
						<td> <input type="text" name="brand"> </td>
					</tr>
					<tr>
						<td> sub-brand </td> 
						<td> <input type="text" name="sub_brand"> </td>
					</tr>
					<tr>
						<td> brand-index </td> 
						<td> <input type="text" name="brand_index"> </td>
					</tr>
					<tr>
						<td> 제품 이미지 1 </td>
						<td colspan="2"> <input type="file" name="file1"> </td>
					</tr>
					<tr>
						<td> 제품 이미지 2 </td>
						<td colspan="2"> <input type="file" name="file2"> </td>
					</tr>
					<tr>
						<td> 제품 이미지 3 </td>
						<td colspan="2"> <input type="file" name="file3"> </td>
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
						<td> 가격 </td>
						<td colspan="2"> $<input type="text" name="price"> </td>
					</tr>
					<tr>
						<td> 발매일 </td>
						<td colspan="2"> <input type="date" name="release_date"> </td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="신발 등록">
							<input type="reset" value="다시 등록">
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