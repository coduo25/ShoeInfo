<%@page import="net.board.action.Criteria"%>
<%@page import="net.board.action.PageMaker"%>
<%@page import="net.brand.db.BrandDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>SHOE INFO.</title>
<link href="./css/board/adminForm.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

	<%
		String user = (String) session.getAttribute("email");
		String usr_position = (String) session.getAttribute("usr_position");
	
		if(user == null || !usr_position.equals("admin")){
			response.sendRedirect("./SneakerList.go");
		}
		
		List<BrandDTO> admin_brandList = (List<BrandDTO>) request.getAttribute("admin_brandList");
	%>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_admin_brandList">
			
			<!-- 전체 브랜드 리스트 -->
			<div>
				<h3 style="margin: 5% 0 1% 0;"> 전체 브랜드 리스트 </h3>
				<div class="search-bar">
					<input type="text" placeholder="ex. END, SNS, ..." onkeyup="filter()" id="textBrand"> 
				</div>
				<div class="searched-form">
					<%
						for( int i=0; i<admin_brandList.size(); i++){
							BrandDTO bdto = admin_brandList.get(i);
					%>
						<div class="brandList-wrapper" onclick="location.href='./UpdateBrandInfo.ad?brand_id=<%=bdto.getBrand_id()%>'">
							<div>
								<img src="./brand_img_upload/<%=bdto.getBrand_logo().split(",")[0]%>">
							</div>
							<div id="brandList-name">
								<span class="name"><%=bdto.getBrand_name()%></span>
							</div>
						</div>
					<%
						}
					%>
				</div>
			</div>
			
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>

</body>
<script type="text/javascript">
	
	function filter() {
		var i, name;
		
		var value = document.getElementById("textBrand").value.toUpperCase().trim();
		var item = document.getElementsByClassName("brandList-wrapper");
		
		var length = item.length;
		
		for(i=0;i<item.length;i++){
			name = item[i].getElementsByClassName("name");
			
			if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
        		item[i].style.display = "inline-block";
        		length = length + 1;
        	} else {
            	item[i].style.display = "none";
            	length = length - 1;
          	}
		}
		
	}
	
</script>
</html>