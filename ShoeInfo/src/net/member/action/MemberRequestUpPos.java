package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;

public class MemberRequestUpPos implements Action{

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
		String email = request.getParameter("email");
		
		MemberDAO mdao = new MemberDAO();
		
		MemberDTO mdto = mdao.getMemberInfo(email);
		
		request.setAttribute("mdto", mdto);
		
		forward.setPath("./member/memberUpPos.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
