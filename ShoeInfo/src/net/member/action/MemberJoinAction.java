package net.member.action;

import java.sql.Timestamp;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;
import net.member.db.MemberDTO;

public class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		MemberDTO mdto = new MemberDTO();
		// 전달된 파라미터정보를 저장 
		String email = request.getParameter("email");

		mdto.setEmail(email);
		
		String salt_id = SHA256Util.generateSalt();
		String newID = SHA256Util.getEncrypt(request.getParameter("email"), salt_id);
		
		mdto.setEmail_BySHA(newID);
		mdto.setSalt_id(salt_id);
			
		String salt = SHA256Util.generateSalt();
		String newpass = SHA256Util.getEncrypt(request.getParameter("pass"), salt);
		
		mdto.setPass(newpass);
		
		mdto.setName(request.getParameter("name"));
		mdto.setPhone(request.getParameter("phone"));
		mdto.setReg_date(new Timestamp(System.currentTimeMillis()));
		mdto.setSalt(salt);
		
		MemberDAO mdao = new MemberDAO();
		mdao.insertMember(mdto);

		ActionForward forward = new ActionForward();
				
		forward.setPath("./MemberLogin.me?url=");
		forward.setRedirect(true);		
		return forward;
	}

	
	
}