package net.admin.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.admin.action.Action;
import net.admin.action.ActionForward;

public class AdminFrontController extends HttpServlet{
	
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
		System.out.println("URI: " + requestURI);
		
		String contextPath = request.getContextPath();
		System.out.println("ContextPath(������Ʈ��): " + contextPath);
		
		String command = requestURI.substring(contextPath.length());
		System.out.println("command : " + command);
		
		System.out.println("-------������ �ּ� ��� �Ϸ�-------------");
		
		/************************************************************
		 * 2. ���� �ּҸ� ����ؼ� ������ ���±���(View/Model)
		 *************************************************************/
		System.out.println("-------������ ���� (view/model)-------------");
		
		Action action = null;
		ActionForward forward = null;
		
		//������ ���� ������ ó��
		if(command.equals("/Main.ad")){
			forward = new ActionForward();
			forward.setPath("./admin/adminMain.jsp");
			forward.setRedirect(false);
		}
		// ---------------�����߰�----------------------------
		//���ο� ���� �߰��ϴ� ������ ó��
		else if(command.equals("/AddCountryAction.ad")){
			action = new AddCountryAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// ---------------���� �귣���߰�----------------------------
		//�귣�� ����Ʈ �߰��ϴ� ������ ó��
		else if(command.equals("/AddBrandAction.ad")){
			action = new AddBrandAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// ---------------�¶���/�������� ���� �߰�----------------------------
		//������ �귣�� ������ �ͼ� ���� �߰��ϴ� �������� ����
		else if(command.equals("/searchBrand.ad")) {
			action = new searchBrandAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//�������� ���� �Է� ó�� ������
		else if(command.equals("/AddOfflineInfoAction.ad")) {
			action = new AddOfflineInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//�¶��� ���� �Է� ó�� ������
		else if(command.equals("/AddOnlineInfoAction.ad")) {
			action = new AddOnlineInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// ---------------�� �Ź� ���� �߰�----------------------------
		//���ο� �Ź� �߰��ϴ�  form �������� ����
		else if(command.equals("/AddSneaker.ad")) {
			forward = new ActionForward();
			forward.setPath("./admin/adminAddSneaker.jsp");
			forward.setRedirect(false);
		}
		//�Ź� �߰��ϴ� ������ ó��
		else if(command.equals("/AddSneakerAction.ad")) {
			action = new AddSneakerAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/************************************************************
		 * 3. ���� ������ �̵� ���� (redirect/forward)
		 *************************************************************/
		System.out.println("-------������ �̵�(redirect-true/forward-false)-----------");
		//������ �̵������� �������� �̵�
		if(forward != null) {
			if(forward.isRedirect()) {
				System.out.println("sendReirect() �̵�: " + forward.getPath());
				response.sendRedirect(forward.getPath());
			} else {
				System.out.println("forward() �̵�: " + forward.getPath());
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
	}
}
