package net.sneaker.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SneakerFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/************************************************************
		 * 1. ���� �ּ� ���
		 *************************************************************/
		String requestURI = request.getRequestURI();
		//System.out.println("URI: " + requestURI);
		
		String contextPath = request.getContextPath();
		//System.out.println("ContextPath(������Ʈ��): " + contextPath);
		
		String command = requestURI.substring(contextPath.length());
		//System.out.println("command : " + command);
		
		//System.out.println("-------������ �ּ� ��� �Ϸ�-------------");
		
		/************************************************************
		 * 2. ���� �ּҸ� ����ؼ� ������ ���±���(View/Model)
		 *************************************************************/
		//System.out.println("-------������ ���� (view/model)-------------");
		
		Action action = null;
		ActionForward forward = null;
		
		//�Ź� ����Ʈ �����ִ� ������ ó��
		if(command.equals("/SneakerList.go")) {
			action = new SneakerListAction();		
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//�Ź� ����(������) �����ִ� ������ ó��
		else if(command.equals("/SneakerDetail.go")) {
			action = new SneakerDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/************************************************************
		 * 3. ���� ������ �̵� ���� (redirect/forward)
		 *************************************************************/
		//System.out.println("-------������ �̵�(redirect-true/forward-false)-----------");
		//������ �̵������� �������� �̵�
		if(forward != null) {
			if(forward.isRedirect()) {
				//System.out.println("sendReirect() �̵�: " + forward.getPath());
				response.sendRedirect(forward.getPath());
			} else {
				//System.out.println("forward() �̵�: " + forward.getPath());
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
	}
	
}
