package net.member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;

public class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// �ѱ�ó�� 
		request.setCharacterEncoding("UTF-8");
		
		// ���޵� ȸ�������� ���� ��ü����(�ڹٺ�ü)
		MemberDTO mdto = new MemberDTO();
		// ���޵� �Ķ���������� ���� 
		mdto.setId(request.getParameter("id"));
		mdto.setPass(request.getParameter("pass"));
		mdto.setName(request.getParameter("name"));
		mdto.setEmail(request.getParameter("email"));
		mdto.setPhone(request.getParameter("phone"));
		mdto.setReg_date(new Timestamp(System.currentTimeMillis()));

		// DB�� ���� �����ϱ� ���� ��ü���� (DAO��ü)
		MemberDAO mdao = new MemberDAO();
		
		// insertMember(�ڹٺ�);
		mdao.insertMember(mdto);
		
		// ������ �̵�(�α��� ���������̵�)
		// ActionForward ��ü�� �����ؼ� �� ���� �� �̵�
		ActionForward forward = new ActionForward();
		forward.setPath("./MemberLogin.me");
		forward.setRedirect(true);		
		
		return forward;
	}

	
	
}
