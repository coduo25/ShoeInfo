package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;

public class MemberChangePass implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//넘어온 암호화된 아이디 값 가져오기
		String email_BySHA = request.getParameter("email");
		
		//암호화된 아이디 값을 가지고 실제 아이디 값 가져오기
		MemberDAO mdao = new MemberDAO();
		String email = mdao.findEmailbySHA(email_BySHA);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./member/changePass.jsp?email="+email);
		forward.setRedirect(false);		
		return forward;
	}

}
