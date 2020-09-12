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
		
		String contextPath = request.getContextPath();
		
		String command = requestURI.substring(contextPath.length());
		
		Action action = null;
		ActionForward forward = null;
		
		//회원가입 처리페이지(/MemberJoin.me)
		if(command.equals("/MemberJoin.me")){
			forward = new ActionForward();
			forward.setPath("./member/joinForm.jsp");
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
		
		//회원가입시 이메일 체크 하는 페이지 처리
		else if(command.equals("/MemberCheckEmailAction.me")){
			action = new MemberCheckEmailAction();
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
			action = new AddUserDrawInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//응모정보 삭제하는 페이지 처리
		else if(command.equals("/deleteUserDrawInfoAction.me")){
			action = new DeleteUserDrawInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원 정보 수정하는 페이지 전 비밀번호 확인 페이지로 가기
		else if(command.equals("/MemberInfoCheck.me")){
			forward = new ActionForward();
			forward.setPath("./member/memberInfoCheck.jsp");
			forward.setRedirect(false);
		}
		//비밀번호 확인 페이지 처리
		else if(command.equals("/MemberInfoCheckAction.me")){
			action = new MemberInfoCheckAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원 정보 수정하기
		else if(command.equals("/MemberUpdateInfo.me")){
			action = new MemberUpdateInfo();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원 정보 수정 처리하기
		else if(command.equals("/MemberUpdateInfoAction.me")){
			action = new MemberUpdateInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원 아이디 비밀번호 찾는 페이지로 이동하기
		else if(command.equals("/MemberFindIDPW.me")){
			forward = new ActionForward();
			forward.setPath("./member/lostinfo.jsp");
			forward.setRedirect(false);
		}
		//회원 아이디 찾는 페이지로 이동하기
		else if(command.equals("/MemberIDFindAction.me")){
			action = new MemberIDFindAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원 비밀번호 찾는 페이지로 이동하기
		else if(command.equals("/MemberPWFindAction.me")){
			action = new MemberPWFindAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원 비밀번호 바꾸는 페이지로 이동하기
		else if(command.equals("/ChangePass.me")){
			action = new MemberChangePass();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원 비밀번호 변경 처리하기
		else if(command.equals("/MemberChangePassAction.me")){
			action = new MemberChangePassAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//회원 발매정보 추가하는 페이지로 가기
		else if(command.equals("/SearchBrand.me")){
			action = new SearchBrand();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원 브랜드 요청 처리
		else if(command.equals("/AddBrandRequest.me")){
			action = new AddBrandRequestAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원 발매 정보 추가하는 요청 처리
		else if(command.equals("/AddOnlineInfoAction.me")){
			action = new AddOnlineInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원 발매정보 수정 하는 페이지 처리
		else if(command.equals("/UpdateDrawInfo.me")){
			action = new UpdateDrawInfo();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원 발매정보 수정하는 페이지 요청 처리
		else if(command.equals("/UpdateDrawInfoAction.me")){
			action = new UpdateDrawInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//회원 삭제(탈퇴) 페이지 요청 처리
		else if(command.equals("/MemberDeleteAction.me")){
			action = new MemberDeleteAction();
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