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
		
		//신발 리스트 보여주는 페이지 처리
		if(command.equals("/SneakerList.go")) {
			action = new SneakerListAction();		
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//신발 정보(디테일) 보여주는 페이지 처리
		else if(command.equals("/SneakerDetail.go")) {
			action = new SneakerDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//신발 전체 리스트 보여주는 페이지 처리
		else if(command.equals("/AllSneaker.go")){
			action = new AllSneakerAction();
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