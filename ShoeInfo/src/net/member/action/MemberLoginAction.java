package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class MemberLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		//전달 받은 정보 저장
		String email = request.getParameter("email").trim();
		
		//MemberDB에 들어가서 이메일에 해당하는 salt값 가져오기
		MemberDAO mdao = new MemberDAO();
		String salt = mdao.getSaltByEmail(email);
		
		String pass = SHA256Util.getEncrypt(request.getParameter("pass").trim(), salt);
		
		int check = mdao.loginEmailCheck(email, pass);
		String str = "";
		
		PrintWriter out = response.getWriter();
		
		//비밀번호 오류
		if (check == 0) {
			str = "WRONGPASS";
			out.print(str);
		} 
		//이메일 없음
		else if (check == -1) {
			str = "NOEMAIL";
			out.print(str);
		}
		//로그인 성공시
		else if(check == 1){
			// request 객체를 사용해서 세션 객체를 생성
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			
			//로그인 성공했을시 해당 유저의 position이 뭔지 알아내기
			String usr_position = mdao.positionCheck(email);
			session.setAttribute("usr_position", usr_position);
			
			str = "SUCCESS";
			out.print(str);
		}
		return null;
	}

}