package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class MemberLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//���� ���� ���� ����
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		//DBó�� ��ü ����
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.idCheck(id, pass);
			
		//��й�ȣ ����
		if (check == 0) {
			// ���������� Ÿ���� html �������� �����ϰڴ�.����
			response.setContentType("text/html; charset=UTF-8");

			// ��°�ü�� ����(response��ü�� ������ ������ ����)
			PrintWriter out = response.getWriter();

			out.print("<script>");
			out.print("  alert('��й�ȣ ���� �Դϴ�.'); ");
			out.print("  history.back(); ");
			out.print("</script>");
			out.close();

			return null;
		} 
		//���̵� ����
		else if (check == -1) {
			// ���������� Ÿ���� html �������� �����ϰڴ�.����
			response.setContentType("text/html; charset=UTF-8");

			// ��°�ü�� ����(response��ü�� ������ ������ ����)
			PrintWriter out = response.getWriter();

			// �ڹٽ�ũ��Ʈ�� ���� ������ �̵��� ��Ʈ�ѷ� ���� �ٷ� �̵� 
			out.print("<script>");
			out.print("  alert('���̵� �����ϴ�.'); ");
			out.print(" location.href='./MemberLogin.me'; ");
			out.print("</script>");
			out.close();

			return null;
		}
		// request ��ü�� ����ؼ� ���� ��ü�� ����
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		
		// ������ �̵�(����������)
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.bo");
		forward.setRedirect(true);
		return forward;
	}

}
