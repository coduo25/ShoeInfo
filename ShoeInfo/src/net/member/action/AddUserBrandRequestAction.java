package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;

public class AddUserBrandRequestAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		//넘어온 값 받기
		String brandName = request.getParameter("brandName");
		String brandURL = request.getParameter("brandURL");
		
		MemberDAO mdao = new MemberDAO();
		mdao.requestBrand(brandName, brandURL);
		
		return null;
	}
	
}
