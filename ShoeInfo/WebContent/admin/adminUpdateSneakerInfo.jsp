<%@page import="net.sneaker.db.SneakerDTO"%>
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
	<%
		//넘오온 기본정보 객체 받기
		SneakerDTO sdto = (SneakerDTO) request.getAttribute("sneakerInfo");
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_adminAddSneaker">
			<form action="./UpdateSneakerInfoAction.ad" method="post" enctype="multipart/form-data">
				<table border = "1">
					<tr>
						<td rowspan="3"> 브랜드 </td>
						<td> brand </td>
						<td> <input type="text" name="brand" value="<%=sdto.getBrand()%>"> </td>
					</tr>
					<tr>
						<td> sub-brand </td> 
						<td> <input type="text" name="sub_brand" value="<%=sdto.getSub_brand()%>"> </td>
					</tr>
					<tr>
						<td> brand-index </td> 
						<td> <input type="text" name="brand_index" value="<%=sdto.getBrand_index()%>"> </td>
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
						<td colspan="2"> <input type="text" name="model_stylecode" value="<%=sdto.getModel_stylecode()%>" readonly> </td>
					</tr>
					<tr>
						<td> 제품명 </td>
						<td colspan="2"> <input type="text" name="model_name" value="<%=sdto.getModel_name()%>"> </td>
					</tr>
					<tr>
						<td> 제품 컬러 웨이 </td>
						<td colspan="2"> <input type="text" name="model_colorway" value="<%=sdto.getModel_colorway()%>"> </td>
					</tr>
					<tr>
						<td> 가격 </td>
						<td colspan="2"> $<input type="text" name="price" value="<%=sdto.getPrice()%>"> </td>
					</tr>
					<tr>
						<td> 발매일 </td>
						<td colspan="2"> <input type="date" name="release_date" value="<%=sdto.getRelease_date()%>"> </td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="신발 정보 수정하기">
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