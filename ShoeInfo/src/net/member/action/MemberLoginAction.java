package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class MemberLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달 받은 정보 저장
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		//DB처리 객체 생성
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.emailCheck(email, pass);
			
		//비밀번호 오류
		if (check == 0) {
			// 응답정보의 타입을 html 형식으로 응답하겠다.설정
			response.setContentType("text/html; charset=UTF-8");

			// 출력객체를 생성(response객체의 정보를 가지고 생성)
			PrintWriter out = response.getWriter();

			out.print("<script>");
			out.print("  alert('비밀번호가 올바르지 않습니다.'); ");
			out.print("  history.back(); ");
			out.print("</script>");
			out.close();

			return null;
		} 
		//아이디 없음
		else if (check == -1) {
			// 응답정보의 타입을 html 형식으로 응답하겠다.설정
			response.setContentType("text/html; charset=UTF-8");

			// 출력객체를 생성(response객체의 정보를 가지고 생성)
			PrintWriter out = response.getWriter();

			// 자바스크립트를 통한 페이지 이동은 컨트롤러 없이 바로 이동 
			out.print("<script>");
			out.print("  alert('존재하지 않는 이메일입니다.'); ");
			out.print("  location.href='./MemberLogin.me'; ");
			out.print("</script>");
			out.close();

			return null;
		}
	
		//로그인 성공시
	
		// request 객체를 사용해서 세션 객체를 생성
		HttpSession session = request.getSession();
		session.setAttribute("email", email);
		
		//로그인 성공했을시 해당 유저의 position이 뭔지 알아내기
		String usr_position = mdao.positionCheck(email);
		
		session.setAttribute("usr_position", usr_position);
		
		// 페이지 이동(메인페이지)
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.bo");
		forward.setRedirect(true);
		return forward;
	}

}