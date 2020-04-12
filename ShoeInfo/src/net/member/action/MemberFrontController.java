package net.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.action.Action;
import net.member.action.ActionForward;

public class MemberFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//System.out.println("BoardFrontController_doProcess ȣ��");
		
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
		
		//ȸ������ ó��������(/MemberJoin.me)
		if(command.equals("/MemberJoin.me")){
			// ȸ������ó�� �������� �ٷ� �̵�
			System.out.println("/MemberJoin.me �ּҿ�û ");
			
			// ActionForward ��ü ����
			forward = new ActionForward();
			forward.setPath("./member/insertForm.jsp");
			forward.setRedirect(false);	
		} 
		
		//ȸ������ ó��������2(/MemberJoinAction.me)
		else if(command.equals("/MemberJoinAction.me")){
			action = new MemberJoinAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//�α��� ������ ó��
		else if(command.equals("/MemberLogin.me")){
			forward = new ActionForward();
			forward.setPath("./member/loginForm.jsp");
			forward.setRedirect(false);
		}
		
		//�α��� ������ ó��2
		else if(command.equals("/MemberLoginAction.me")){
			action = new MemberLoginAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//�α׾ƿ� ������ ó��
		else if(command.equals("/MemberLogout.me")) {
			action = new MemberLogoutAction();
			
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
