<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/include/footer.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body>
	<div id="footer">
		<div id="footer-wrapper">
			<div class="copyright">
				<span>Copyright 2021 (C) SHOEINFO. All rights reserved.</span>
			</div>
			
			<div class="footer-nav">
				<span onclick="openJoin_term()"> 이용약관 </span>
				<span onclick="openPrivacy()"> 개인정보처리방침 </span>
				<span> <a href="https://www.instagram.com/shoeinfo.official/" target="_blank"><i class="fab fa-instagram"></i></a> </span>
			</div>
			
			<div class="info">
				<span>Contact : info@shoeinfo.co.kr</span>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	function openJoin_term() {
		window.open("./include/join_terms.html", "a", "width=550, height=500, left=100, top=50");
	}

	function openPrivacy() {
		window.open("./include/privacy.html", "a", "width=550, height=500, left=100, top=50");
	}

</script>
</html>