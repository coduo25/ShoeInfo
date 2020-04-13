<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		//가상 주소로 이동시켜주는 index 페이지
		
		// ./ => 프로젝트의 주소 = http://localhost:8088/ShoeGame
		
		//회원가입 페이지
		//response.sendRedirect("./MemberJoin.me");.
		
		//로그인 페이지
		//response.sendRedirect("./MemberLogin.me");
		
		//메인페이지
		//response.sendRedirect("./Main.bo");
		
		//신발 리스트 보여주는 페이지-메인페이지
		response.sendRedirect("./SneakerList.go");
	%>

</body>
</html>