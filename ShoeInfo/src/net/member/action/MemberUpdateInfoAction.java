package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;

public class MemberUpdateInfoAction implements Action{

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
		
		// 넘어온 값 받기
		MemberDTO mdto = new MemberDTO();
		
		mdto.setEmail(request.getParameter("email"));
		
		String salt = SHA256Util.generateSalt();
		String newpass = SHA256Util.getEncrypt(request.getParameter("pass"), salt);
		
		mdto.setSalt(salt);
		mdto.setPass(newpass);
		mdto.setName(request.getParameter("name"));
		mdto.setPhone(request.getParameter("phone"));;
		
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.modiMemberInfo(mdto);
		String str = "";
		
		// 응답정보의 타입을 html 형식으로 응답
		response.setContentType("text/html; charset=UTF-8");

		// 출력객체를 생성(response객체의 정보를 가지고 생성)
		PrintWriter out = response.getWriter();
		
		// DB에 존재하지 않는 아이디 이면
		if(check == 0) {
			str = "NO";
			out.print(str);
		}
		// DB에 모든 정보를 수정하였으면
		else if(check == 1) {
			str = "YES";
			out.print(str);
			session.invalidate(); //로그아웃 시키기
		}
		
		return null;
	}
}
