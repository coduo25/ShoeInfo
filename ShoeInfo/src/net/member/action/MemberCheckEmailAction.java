package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;

public class MemberCheckEmailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//넘어온 값 받기(email 값)
		String email = request.getParameter("email");
		
		//DAO 값 생성
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.joinEmailCheck(email);
		String str = "";
		
		// 응답정보의 타입을 html 형식으로 응답
		response.setContentType("text/html; charset=UTF-8");

		// 출력객체를 생성(response객체의 정보를 가지고 생성)
		PrintWriter out = response.getWriter();
		
		//이메일이 DB에 이미 존재하면
		if(check == 0) {
			//이미 존재하는 이메일
			str = "NO";
			out.print(str);
		}
		//이메일이 DB에 없으면
		else if(check == 1) {
			//사용 가능한 이메일
			str = "YES";
			out.print(str);
		}
		
		return null;
	}
}
