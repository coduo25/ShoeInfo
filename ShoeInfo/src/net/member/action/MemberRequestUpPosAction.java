package net.member.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.MemberPosReqDTO;

public class MemberRequestUpPosAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("email");
		ActionForward forward = new ActionForward();
		if(user == null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		//넘어온 값 받기
		String email = request.getParameter("email").trim();
		String name = request.getParameter("name").trim();
		String reason = request.getParameter("reason").trim();
		
		MemberPosReqDTO mprdto = new MemberPosReqDTO();
		
		mprdto.setReq_email(email);
		mprdto.setReq_name(name);
		mprdto.setReq_reason(reason);
		mprdto.setReq_time(new Timestamp(System.currentTimeMillis()));
		
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.insertMemberReqPos(mprdto);
		
		String str = "";
		PrintWriter out = response.getWriter();
		
		if(check == 0){
			str = "EXIST";
			out.print(str);
		}else if(check == 1){
			str = "SUCCESS";
			out.print(str);
		}
		
		return null;
	}
}
