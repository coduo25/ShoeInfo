<%@page import="net.sneaker.db.SneakerDTO"%>
<%@page import="java.util.List"%>
<%@page import="net.board.action.PageMaker"%>
<%@page import="net.board.action.Criteria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="./icon/favicon-48x48.png" />
<title>SHOE INFO.</title>
<link href="./css/board/sneakerAll.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body oncontextmenu='return false' onselectstart='return fasle' ondragstart='return false'>

	<%
		List<SneakerDTO> allSneakerList = (List<SneakerDTO>) request.getAttribute("allSneakerList");
	%>
	
	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_sneakerList">
			<!-- 전체 신발 리스트 -->
			<div>
				<div class="search_wrapper">
				
					<div class="searched-form">
						<!-- 검색하는 input 창 -->
					<div class="search-bar">
						<input type="text" placeholder="ex. Jordan 1, Adidas Yeezy" onkeyup="filter()" id="textSneaker"> 
					</div>
						<%
							for( int i=0; i<allSneakerList.size(); i++){
								SneakerDTO sdto = allSneakerList.get(i);
						%>
							<div class="sneakerList-wrapper" onclick="location.href='./SneakerDetail.go?model_stylecode=<%=sdto.getModel_stylecode()%>&num=<%=sdto.getNum()%>'">
								<div class="sneaker_img_wrapper">
									<img src="./sneaker_img_upload/<%=sdto.getImage().split(",")[0]%>">
								</div>
								<div id="sneakerList-name">
									<span class="name"><%=sdto.getModel_name_kr()%></span>
								</div>
							</div>
						<%
							}
						%>
					</div>
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
		
		var value = document.getElementById("textSneaker").value.toUpperCase().trim();
		var item = document.getElementsByClassName("sneakerList-wrapper");
		
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
	
	$(document).ready(function(){
		
		//방지
		$(document).bind('keydown', function(e){
			if(e.keyCode == 123 /* F12 */){
				e.preventDefault();
				e.returnVale = false;
			}
		});
	}
	
	document.onmousedown=disableclick;
	//status="Right click is not availble";
	
	function disableclick(event){
		if(event.button==2){
			//alert(status);
			return false;
		}
	}
	
	

</script>
</html>