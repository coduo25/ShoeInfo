<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/board/main.css" rel="stylesheet">
</head>
<body>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_register">
		    <form action="./MemberJoinAction.me" method="post">
			      아이디 : <input type="text" name="id"> <br>
			      비밀번호 : <input type="password" name="pass"> <br>
			      이름 : <input type="text" name="name"> <br>
			      이메일 : <input type="text" name="email"> <br>
			      전화번호: <input type="text" name="phone"> <br>
			   <input type="submit" value="회원가입">   
		    </form>  
		</div>
	</div>
  	
  	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>
</body>
</html>