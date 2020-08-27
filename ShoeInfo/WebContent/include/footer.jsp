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
			<span id="copyright"> Copyright 2020 (C) SHOEINFO. All rights reserved. </span>
			<nav class="footer-nav">
				<ul>
					<li>
						<span onclick="openJoin_term()"> 이용약관 </span>
					</li>
					<li>
						<span onclick="openPrivacy()"> 개인정보처리방침 </span>
					</li>
					<li>
						<span> <i class="fab fa-instagram"></i> </span>
					</li>
				</ul>
			</nav>
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