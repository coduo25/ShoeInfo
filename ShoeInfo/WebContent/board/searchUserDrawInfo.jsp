<%@page import="net.member.db.MemberDrawDTO"%>
<%@page import="net.member.db.MemberDAO"%>
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
	
		String model_stylecode = request.getParameter("model_stylecode");
		String brand_id = request.getParameter("brand_id");
		String user = request.getParameter("user");
		
		System.out.println(model_stylecode + ", " + brand_id + ", " + user);
		
		MemberDrawDTO mddto = new MemberDrawDTO();
		mddto.setModel_stylecode(model_stylecode);
		mddto.setBrand_id(brand_id);
		mddto.setMember_id(user);
		
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.searchDrawInfo(mddto);
		System.out.println(check);
		//사용자의 응모 정보가 없을시
		if( check == 0) {
	%>
		<a href="./addUserDrawInfoAction.me?model_stylecode=<%=model_stylecode%>&brand_id=<%=brand_id%>"> <input type="button" value="응모하기"> </a>
	<%
		//사용자의 응모 정보가 있을시
		} else if(check == 1) {
	%>
		<span> 응모완료 </span>
	<%
		}
	%>

</body>
</html>