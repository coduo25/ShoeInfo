package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class MemberDeleteAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		ActionForward forward = new ActionForward();
		if(user == null || user.length() == 0){
			forward.setPath("./Main.bo");
			forward.setRedirect(true);
			return forward;
		}
	
		//넘어온 값 가져오기
		String email = request.getParameter("email");
		
		MemberDAO mdao = new MemberDAO();
		int check = mdao.deleteMemberInfo(email);
		
		PrintWriter out = response.getWriter();
		String str = "";

		response.setContentType("text/html; charset=UTF-8");
		
		if(check == 1){
			str = "SUCCESS";
			out.print(str);
			session.invalidate();
		}
		
		return null;
	}

}
