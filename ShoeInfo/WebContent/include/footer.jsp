<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/include/footer.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body>
	<div id="footer">
		<div id="footer-wrapper">
			<div class="footer-nav">
				<span onclick="openJoin_term()" style="font-weight:bold; cursor:pointer;"> 이용약관 </span>
				<span onclick="openPrivacy()" style="font-weight:bold; cursor:pointer;"> 개인정보처리방침 </span>
				<span>Contact : info@shoeinfo.co.kr</span>
				
				<div class="info">
					 <a href="https://www.instagram.com/shoeinfo_official/" target="_blank">
					 	<span><i class="fab fa-instagram"></i></span>
					 </a>
					 <a href="https://www.facebook.com/Shoeinfo_official-115824286928329/" target="_blank">
					 	<span><i class="fab fa-facebook-square"></i></span>
					 </a>
				</div>
			</div>
			
			<div class="copyright">
				<span>Copyright 2021 (C) SHOEINFO. All rights reserved.</span>		
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