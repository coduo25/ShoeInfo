package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;

public class MemberIDFindAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 넘어온 값 받기
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		MemberDAO mdao = new MemberDAO();
		
		String email = mdao.findEmail(name, phone);

		// 응답정보의 타입을 html 형식으로 응답
		response.setContentType("text/html; charset=UTF-8");
	
		// 출력객체를 생성(response객체의 정보를 가지고 생성)
		PrintWriter out = response.getWriter();
		
		//이메일이 DB에 없으면
		if(email.contains("NOEMAIL")) {
			out.print("NOEMAIL");
		}
		//이메일이 DB에 있으면
		else{
			out.print(email);
		}
		
		return null;
	}
	
}
