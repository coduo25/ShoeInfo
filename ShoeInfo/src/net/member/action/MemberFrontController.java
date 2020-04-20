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
		
		//System.out.println("BoardFrontController_doProcess 호출");
		
		/************************************************************
		 * 1. 가상 주소 계산
		 *************************************************************/
		String requestURI = request.getRequestURI();
		//System.out.println("URI: " + requestURI);
		
		String contextPath = request.getContextPath();
		//System.out.println("ContextPath(프로젝트명): " + contextPath);
		
		String command = requestURI.substring(contextPath.length());
		//System.out.println("command : " + command);
		
		//System.out.println("-------페이지 주소 계산 완료-------------");
		
		/************************************************************
		 * 2. 계산된 주소를 사용해서 페이지 형태구분(View/Model)
		 *************************************************************/
		//System.out.println("-------페이지 구분 (view/model)-------------");
		
		Action action = null;
		ActionForward forward = null;
		
		//회원가입 처리페이지(/MemberJoin.me)
		if(command.equals("/MemberJoin.me")){
			// 회원가입처리 페이지로 바로 이동
			//System.out.println("/MemberJoin.me 주소요청 ");
			
			// ActionForward 객체 생성
			forward = new ActionForward();
			forward.setPath("./member/insertForm.jsp");
			forward.setRedirect(false);	
		} 
		
		//회원가입 처리페이지2(/MemberJoinAction.me)
		else if(command.equals("/MemberJoinAction.me")){
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//로그인 페이지 처리
		else if(command.equals("/MemberLogin.me")){
			forward = new ActionForward();
			forward.setPath("./member/loginForm.jsp");
			forward.setRedirect(false);
		}
		
		//로그인 페이지 처리2
		else if(command.equals("/MemberLoginAction.me")){
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//로그아웃 페이지 처리
		else if(command.equals("/MemberLogout.me")) {
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//나의 응모정보 페이지 처리
		else if(command.equals("/MemberDrawInfo.me")){
			action = new MemberDrawInfo();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//나의 응모정보 상세페이지 처리
		else if(command.equals("/MemberDrawDetailInfo.me")){
			action = new MemberDrawDetailInfo();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//응모정보 저장하는 페이지 처리
		else if(command.equals("/addUserDrawInfoAction.me")){
			action = new addUserDrawInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		/************************************************************
		 * 3. 실제 페이지 이동 동작 (redirect/forward)
		 *************************************************************/
		//System.out.println("-------페이지 이동(redirect-true/forward-false)-----------");
		//페이지 이동정보가 있을때만 이동
		if(forward != null) {
			if(forward.isRedirect()) {
				//System.out.println("sendReirect() 이동: " + forward.getPath());
				response.sendRedirect(forward.getPath());
			} else {
				//System.out.println("forward() 이동: " + forward.getPath());
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
	}
	
}