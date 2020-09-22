package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class AddBrandRequestAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		ActionForward forward = new ActionForward();
		if(user == null || user.length() == 0){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}
		
		//넘어온 값 받기
		String brandName = request.getParameter("brandName");
		String brandURL = request.getParameter("brandURL");
		String model_stylecode = request.getParameter("model_stylecode");
		
		MemberDAO mdao = new MemberDAO();
		int check = mdao.requestBrand(brandName, brandURL, user);
		
		PrintWriter out = response.getWriter();
		
		if(check == 0){
			out.print("reqExist");
		}else {
			out.print("reqSuccess");
		}
		
		return null;
	}
	
}