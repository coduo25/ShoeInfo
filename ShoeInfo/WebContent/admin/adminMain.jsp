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
		<div id="content_adminMain">
			<table border="1">
				<h3> 신발 </h3>
				<tr>
					<td> 새로운 신발 </td>
					<td> <a href="./AddSneaker.ad"> 추가하기 </a> </td>
				</tr>
				<tr>
					<td> 신발 발매 정보 </td>
					<td> <a href="./searchBrand.ad"> 추가하기 </a></td>
				</tr>
			</table>
			<br>
			<br>
			<table border="1">
				<h3> 회원 </h3>
				<tr>
					<td> 전체 회원 보기(관리) </td>
				</tr>
			</table>
		</div>
	</div>

	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>
</body>
</html>