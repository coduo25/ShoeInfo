package net.member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;

public class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 회원정보를 저장 객체생성(자바빈객체)
		MemberDTO mdto = new MemberDTO();
		// 전달된 파라미터정보를 저장 
		mdto.setId(request.getParameter("id"));
		mdto.setPass(request.getParameter("pass"));
		mdto.setName(request.getParameter("name"));
		mdto.setEmail(request.getParameter("email"));
		mdto.setPhone(request.getParameter("phone"));
		mdto.setReg_date(new Timestamp(System.currentTimeMillis()));

		// DB에 값을 저장하기 위한 객체생성 (DAO객체)
		MemberDAO mdao = new MemberDAO();
		
		// insertMember(자바빈);
		mdao.insertMember(mdto);
		
		// 페이지 이동(로그인 페이지로이동)
		// ActionForward 객체를 생성해서 값 저장 후 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./MemberLogin.me");
		forward.setRedirect(true);		
		
		return forward;
	}

	
	
}
