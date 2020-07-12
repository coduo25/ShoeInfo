<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SHOE INFO.</title>
<link href="./css/board/adminForm.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://kit.fontawesome.com/febeeb992c.js" crossorigin="anonymous"></script>
</head>
<body>

	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>

	<!-- Main Content -->
	<div id="wrapper" class="container">
	
		<!-- 제목 -->
		<h3> 새로운 신발 추가하기 </h3>
	
		<!-- content -->
		<div id="content_adminAddSneaker">
			<form action="./AddSneakerAction.ad" id="addSneakerForm" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<td id="category" colspan="2"> 발매방식 </td>
						<td colspan="2">
							<select name="release_status">
								<option value="planned"> 정식 발매 </option>
								<option value="shock"> 기습 발매 </option>
							</select>
						</td>
					</tr>
					<tr>
						<td rowspan="3" id="category_brand"> 브랜드 </td>
						<td id="category"> 브랜드* </td>
						<td> 
							<input type="text" name="brand">
							<span id="cate_ref"> (ex. Nike, Air Jordan, Adidas) </span> 
						</td>
					</tr>
					<tr>
						<td id="category"> 서브브랜드  </td> 
						<td> 
							<input type="text" name="sub_brand">
							<span id="cate_ref"> (ex. 1, 11, Yeezy, Dunk, Dunk SB) </span> 
						</td>
					</tr>
					<tr>
						<td id="category"> 브랜드인덱스 </td> 
						<td> 
							<input type="text" name="brand_index">
							 <span id="cate_ref"> (ex. Low, Fear of God, Boost 350 V2, 992) </span> 
						</td>
					</tr>
					<tr>
						<td id="category" colspan="2"> 썸네일 이미지* </td>
						<td colspan="2"> <input type="file" name="file0"> </td>
					</tr>
					<tr>
						<td id="category" colspan="2"> 제품 이미지* </td>
						<td colspan="2"> <input type="file" name="file1"> </td>
					</tr>
					<tr>
						<td id="category" colspan="2"> 제품 스타일 코드 </td>
						<td colspan="2">
							<input type="text" name="model_stylecode">
							<span id="cate_ref"> <i class="fas fa-exclamation-triangle"></i> &nbsp; 미정일시, 빈칸유지 </span>
						</td>
					</tr>
					<tr>
						<td id="category" colspan="2"> 제품명 </td>
						<td colspan="2"> 
							<input type="text" name="model_name">
							<span id="cate_ref"> <i class="fas fa-exclamation-triangle"></i> &nbsp; 미정일시, 빈칸유지 </span> 
						</td>
					</tr>
					<tr>
						<td id="category" colspan="2"> 제품 컬러 웨이 </td>
						<td colspan="2"> 
							<input type="text" name="model_colorway">
							<span id="cate_ref"> <i class="fas fa-exclamation-triangle"></i> &nbsp; 미정일시, 빈칸유지 </span> 
						</td>
					</tr>
					<tr>
						<td id="category" colspan="2"> 가격  </td>
						<td colspan="2"> 
							<input type="text" name="price">원
							<span id="cate_ref"> <i class="fas fa-exclamation-triangle"></i> &nbsp; 한국기준 가격이 미정일시, 빈칸유지 </span> 
						</td>
					</tr>
					<tr>
						<td id="category" colspan="2"> 발매일* </td>
						<td colspan="2">
							<select name="year" id="sel_year">
								<option value="default"> - </option>
								<option value="2020"> 2020 </option>
								<option value="2021"> 2021 </option>
								<option value="2022"> 2022 </option>
							</select>
							년
							<select name="month" id="sel_month">
								<option value="default"> - </option>
								<option value="01"> 1 </option>
								<option value="02"> 2 </option>
								<option value="03"> 3 </option>
								<option value="04"> 4 </option>
								<option value="05"> 5 </option>
								<option value="06"> 6 </option>
								<option value="07"> 7 </option>
								<option value="08"> 8 </option>
								<option value="09"> 9 </option>
								<option value="10"> 10 </option>
								<option value="11"> 11 </option>
								<option value="12"> 12 </option>
							</select>
							월
							<select name="day" id="sel_day">
								<option value="default"> - </option>
								<option value="01"> 1 </option>
								<option value="02"> 2 </option>
								<option value="03"> 3 </option>
								<option value="04"> 4 </option>
								<option value="05"> 5 </option>
								<option value="06"> 6 </option>
								<option value="07"> 7 </option>
								<option value="08"> 8 </option>
								<option value="09"> 9 </option>
								<option value="10"> 10 </option>
								<option value="11"> 11 </option>
								<option value="12"> 12 </option>
								<option value="13"> 13 </option>
								<option value="14"> 14 </option>
								<option value="15"> 15 </option>
								<option value="16"> 16 </option>
								<option value="17"> 17 </option>
								<option value="18"> 18 </option>
								<option value="19"> 19 </option>
								<option value="20"> 20 </option>
								<option value="21"> 21 </option>
								<option value="22"> 22 </option>
								<option value="23"> 23 </option>
								<option value="24"> 24 </option>
								<option value="25"> 25 </option>
								<option value="26"> 26 </option>
								<option value="27"> 27 </option>
								<option value="28"> 28 </option>
								<option value="29"> 29 </option>
								<option value="30"> 30 </option>
								<option value="31"> 31 </option>
								<option value="99"> 99 </option>
							</select>
							일
							<span id="cate_ref"> <i class="fas fa-exclamation-triangle"></i> &nbsp; 글로벌기준, 만약 월만 나왔을경우 일은 99 선택 </span> 
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="submit" id="submit_btn" value="등록하기">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>
	
</body>

<script type="text/javascript">

	$(document).ready(function(){
		
		//모든 input 유효성 검사하는 함수
		$('#addSneakerForm').submit(function(){
			//브랜드가 빈칸이면
			if($('input[name=brand]').val() == ''){
				alert("브랜드를 입력해주세요.");
				$('input[name=brand]').focus();
				return false;
			}
			//제품 이미지들 안 넣을때
			else if($('input[name=file0]').val() == ''){
				alert("썸네일 이미지를 넣어주세요.");
				$('input[name=file0]').focus();
				return false;
			}
			else if($('input[name=file1]').val() == ''){
				alert("신발 이미지를 넣어주세요.");
				$('input[name=file1]').focus();
				return false;
			}
			
			//발매일이 빈칸일시
			else if($('#sel_year').val() == 'default'){
				alert("발매 년도를 선택해주세요.");
				$('#sel_year').focus();
				return false;
			}
			else if($('#sel_month').val() == 'default'){
				alert("발매 월을 선택해주세요.");
				$('#sel_month').focus();
				return false;
			}
			else if($('#sel_day').val() == 'default'){
				alert("발매 날짜를 선택해주세요.");
				$('#sel_day').focus();
				return false;
			}
			
		});
		
	});

</script>

</html>