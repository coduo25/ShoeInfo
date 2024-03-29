package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class MemberChangePassAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 넘어온 값 받기
		String email = request.getParameter("email");
		
		// 비밀번호 암호화
		String salt = SHA256Util.generateSalt();
		String newpass = SHA256Util.getEncrypt(request.getParameter("pass"), salt);
		
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.changePass(email, newpass, salt);
		
		// 출력객체를 생성(response객체의 정보를 가지고 생성)
		PrintWriter out = response.getWriter();
		
		// DB에 존재하지 않는 회원이면
		if(check == 0) {
			out.print("NO");
		}
		// DB에 비밀번호를 재설정하였다면
		else if(check == 1) {
			out.print("YES");
		}
		
		return null;
	}
	
}
