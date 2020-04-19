<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.online.db.OnlineDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="./css/board/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton|Noto+Sans+KR:700&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
	
		OnlineDTO onlineDrawInfo = (OnlineDTO) request.getAttribute("onlineDrawInfo");
	
		SimpleDateFormat original_format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
		SimpleDateFormat new_date_format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat new_hour_format = new SimpleDateFormat("HH:mm");
		
		Date original_Online_start_time = original_format.parse(onlineDrawInfo.getOnline_start_time());
		Date original_Online_end_time = original_format.parse(onlineDrawInfo.getOnline_end_time());
		
		//������� �ð� ������(yyyy-MM-dd�� HH:mm)
		String new_Online_start_date = new_date_format.format(original_Online_start_time);
		String new_Online_start_hour = new_hour_format.format(original_Online_start_time);
		
		String new_Online_end_date = new_date_format.format(original_Online_end_time);
		String new_Online_end_hour = new_hour_format.format(original_Online_end_time);
	%>
	
	<!-- Header -->
	<header> <jsp:include page="/include/header.jsp" /> </header>


	<!-- Main Content -->
	<div id="wrapper" class="container">
		<!-- content -->
		<div id="content_adminAddSneaker">
			<!-- �¶��� ���� �߰��ϴ� �� -->
			<div>
				<h3> �¶��� �߸� ���� �����ϱ� </h3>
				<form action="./UpdateDrawInfoAction.ad" method="post">
					<table border = "1">
						<input type="hidden" name="country_region" value="<%=onlineDrawInfo.getCountry_region()%>">
						<input type="hidden" name="country_name" value="<%=onlineDrawInfo.getCountry_name()%>">
						<input type="hidden" name="brand_id" value="<%=onlineDrawInfo.getBrand_id()%>">
						<tr>
							<td> �Ź� ��Ÿ�� �ڵ� </td>
							<td> <input type="text" name="model_stylecode" value="<%=onlineDrawInfo.getModel_stylecode()%>"> </td>
						</tr>
						<tr>
							<td> �¶��� ��ũ </td>
							<td> <input type="text" name="online_link" value="<%=onlineDrawInfo.getOnline_link()%>"> </td>
						</tr>
						<tr>
							<td> �¶��� �ð� </td>
							<td> 
								<input type="date" name="online_date_start" value="<%=new_Online_start_date%>">
								<input type="time" name="online_hour_start" value="<%=new_Online_start_hour%>">
								~
								<input type="date" name="online_date_end" value="<%=new_Online_end_date%>">
								<input type="time" name="online_hour_end" value="<%=new_Online_end_hour%>">
							</td>
						</tr>
						<tr>
							<td> �¶��� ��� </td>
							<td> 
								<select name="online_method">
									<option value="default" <%if(onlineDrawInfo.getOnline_method().equals("default")){%> selected<%}%>> �¶��� ����� �������ּ���. </option>
									<option value="����" <%if(onlineDrawInfo.getOnline_method().equals("����")){%> selected<%}%>> ���� </option>
									<option value="��ο�" <%if(onlineDrawInfo.getOnline_method().equals("��ο�")){%> selected<%}%>> ��ο� </option>
								</select>
							</td>
						</tr>
						<tr>
							<td> ���� ��� </td>
							<td>
								<select name="buy_method">
									<option value="default" <%if(onlineDrawInfo.getBuy_method().equals("default")){%> selected<%}%>> ���� ����� �������ּ���. </option>
									<option value="������ ����" <%if(onlineDrawInfo.getBuy_method().equals("������ ����")){%> selected<%}%>> ������ ���� </option>
									<option value="��÷ �� ����" <%if(onlineDrawInfo.getBuy_method().equals("��÷ �� ����")){%> selected<%}%>> ��÷ �� ���� </option>
									<option value="��÷�� ������" <%if(onlineDrawInfo.getBuy_method().equals("��÷�� ������")){%> selected<%}%>> ��÷ �� ������ </option>
									<option value="��÷�ڰ� ������ ����" <%if(onlineDrawInfo.getBuy_method().equals("��÷�ڰ� ������ ����")){%> selected<%}%>> ��÷�ڰ� ������ ���� </option> 
									<option value="-" <%if(onlineDrawInfo.getBuy_method().equals("-")){%> selected<%}%>> - </optino>
								</select>
							</td>
						</tr>
						<tr>
							<td> ���� ���� </td>
							<td>
								<select name="delivery_method">
									<option value="default" <%if(onlineDrawInfo.getDelivery_method().equals("default")){%> selected<%}%>> ���迩�θ� �������ּ���. </option>
									<option value="���谡��" <%if(onlineDrawInfo.getDelivery_method().equals("���谡��")){%> selected<%}%>> ���谡�� </option>
									<option value="����Ұ�(�������õ)" <%if(onlineDrawInfo.getDelivery_method().equals("����Ұ�(�������õ)")){%> selected<%}%>> ����Ұ�(�������õ) </option>
									<option value="-" <%if(onlineDrawInfo.getDelivery_method().equals("-")){%> selected<%}%>> - </option>
								</select>
							</td>
						</tr>
						<tr>
							<td> Ư�̻��� </td>
							<td> <textarea name="description"><%=onlineDrawInfo.getDescription()%></textarea>
						</tr>
						<tr>
							<td colspan="2"> 
								<input type="submit" value="�����ϱ�">
							</td>
						</tr>
					</table>
				</form>
			</div>	
		</div>
	</div>
	
	
	<!-- FOOTER -->
	<footer> <jsp:include page="/include/footer.jsp"/> </footer>
	
</body>
</html>