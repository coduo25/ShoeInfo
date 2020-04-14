<%@page import="net.brand.db.BrandDTO"%>
<%@page import="java.util.List"%>
<%@page import="net.brand.db.BrandDAO"%>
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
		request.setCharacterEncoding("UTF-8");
	
		//넘어온 값 저장하기
		String country_name = request.getParameter("country_name");
		
		//BrandDAO 객체 생성
		BrandDAO bdao = new BrandDAO();
		
		List brandNameList = (List) bdao.searchBrand(country_name);
	%>
		<select name="brand_name">
			<option value="default"> 브랜드를 선택해주세요 </option>
			<%
				for(int i=0; i<brandNameList.size(); i++) {
					BrandDTO bdto = (BrandDTO) brandNameList.get(i);
			%>
				<option value="<%=bdto.getBrand_name()%>"><%=bdto.getBrand_name()%></option>
			<%
				}
			%>
		</select>
</body>
</html>