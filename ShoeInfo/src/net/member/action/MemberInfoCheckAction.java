package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class MemberInfoCheckAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리 
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
		
		//전달 받은 정보 저장
		String email = request.getParameter("email");
		
		//MemberDB에 들어가서 이메일에 해당하는 salt값 가져오기
		MemberDAO mdao = new MemberDAO();
		String salt = mdao.getSaltByEmail(email);
		
		String pass = SHA256Util.getEncrypt(request.getParameter("pass"), salt);
		
		int check = mdao.loginEmailCheck(email, pass);
		
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
		//이메일 없음
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

		// 비밀번호 맞았을시 페이지 이동(수정페이지)
		forward.setPath("./MemberUpdateInfo.me");
		forward.setRedirect(true);
		return forward;
	}
}
