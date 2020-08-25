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
		
		//관리자 메인 페이지 처리
		if(command.equals("/Main.ad")){
			action = new GetAllInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// ---------------새 신발 정보 추가----------------------------
		//새로운 신발 추가하는  form 페이지로 가기
		else if(command.equals("/AddSneaker.ad")) {
			forward = new ActionForward();
			forward.setPath("./admin/adminAddSneaker.jsp");
			forward.setRedirect(false);
		}
		//신발 추가하는 페이지 처리
		else if(command.equals("/AddSneakerAction.ad")) {
			action = new AddSneakerAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//신발 정보 수정하는 페이지로 가기
		else if(command.equals("/UpdateSneakerInfo.ad")) {
			action = new UpdateSneaker();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//신발 정보 수정하는 페이지 처리
		else if(command.equals("/UpdateSneakerInfoAction.ad")) {
			action = new UpdateSneakerAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//신발 삭제하는 페이지 처리
		else if(command.equals("/DeleteSneaker.ad")){
			action = new DeleteSneaker();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//신발 발매 정보 삭제하는 페이지 처리하기
		else if(command.equals("/DeleteDrawInfo.ad")){
			action = new DeleteDrawInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// ---------------나라추가----------------------------
		//새로운 나라 추가하는 form 페이지로 가기
		else if(command.equals("/AddCountry.ad")){
			forward = new ActionForward();
			forward.setPath("./admin/adminAddCountry.jsp");
			forward.setRedirect(false);
		}
		//새로운 나라 추가하는 페이지 처리
		else if(command.equals("/AddCountryAction.ad")){
			action = new AddCountryAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// ---------------나라별 브랜드추가------------------------
		//브랜드 추가하는 form 페이지로 가기
		else if(command.equals("/AddBrand.ad")){
			action = new searchBrandAction2();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//브랜드 사이트 추가하는 페이지 처리
		else if(command.equals("/AddBrandAction.ad")){
			action = new AddBrandAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//브랜드 정보 수정하는 form 페이지로 가기
		else if(command.equals("/UpdateBrandInfo.ad")){
			action = new UpdateBrandInfo();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//브랜드 정보 수정하는 페이지 처리
		else if(command.equals("/UpdateBrandInfoAction.ad")){
			action = new UpdateBrandInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// ---------------온라인 발매정보 추가-------------------
		//발매정보 추가하는 페이지 가기전 국가 정보 가져오는 처리페이지로 가기
		else if(command.equals("/searchBrand.ad")) {
			action = new searchBrandAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//--------------- 모든 리스트 가져오는 함수들 처리 ------------------
		else if(command.equals("/SneakerList.ad")) {
			action = new SneakerListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/BrandList.ad")) {
			action = new BrandListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/CountryList.ad")) {
			action = new CountryListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/MemberList.ad")) {
			action = new MemberListAction();
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