<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/include/header.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
</head>
<body>
	<section id="header" class="container">
		<a href="./SneakerList.go" id="logo"> SHOE Info. </a>
		<div id="head-right">
		<%
			//로그인 되었는지	
			String user = (String) session.getAttribute("id");
			if(user == null){
		%>
			<a href="./MemberLogin.me"> LOGIN </a>
		<% }else if(user.equals("admin")) { %>
			<a href="./Main.ad"> ADMIN_PAGE </a>
			<a href="./MemberDrawInfo.me"> MYPAGE </a>
			<a href="./MemberLogout.me"> LOGOUT </a>
		<% }else{ %>
			<a href="./MemberDrawInfo.me"> MYPAGE </a>
			<a href="./MemberLogout.me"> LOGOUT </a>
		<% } %> 
		</div>
	</section>
</body>
</html>