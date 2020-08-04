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
		
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 회원정보를 저장 객체생성(자바빈객체)
		MemberDTO mdto = new MemberDTO();
		// 전달된 파라미터정보를 저장 
		String email = request.getParameter("email");
		mdto.setEmail(email);
		
		String salt = SHA256Util.generateSalt();
		String newpass = SHA256Util.getEncrypt(request.getParameter("pass"), salt);
		
		mdto.setPass(newpass);
		
		mdto.setName(request.getParameter("name"));
		mdto.setPhone(request.getParameter("phone"));
		mdto.setReg_date(new Timestamp(System.currentTimeMillis()));
		mdto.setSalt(salt);
		
		// DB에 값을 저장하기 위한 객체생성 (DAO객체)
		MemberDAO mdao = new MemberDAO();
		
		// insertMember(자바빈);
		mdao.insertMember(mdto);
		
		// 운영자 메일로 회원가입된 이메일로 가입인사 메일보내기
//			String host = "smtp.gmail.com";
//			final String user = "shoeinfoshoeinfo";
//			final String password = "dhfpswl@7695!";
//			
//			//세션
//			Properties props = new Properties();
//			props.put("mail.smtp.host", host);
//			props.put("mail.smtp.auth", "true");
//			props.put("mail.smtp.starttls.enable", "true");
//			
//			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
//				protected PasswordAuthentication getPasswordAuthentication() {
//					return new PasswordAuthentication(user, password);
//				}
//			});
//			try{
//				MimeMessage message = new MimeMessage(session);
//				message.setFrom(new InternetAddress(user));
//				message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
//				
//				// Subject
//				message.setSubject("[SHOEINFO] 회원가입을 축하드립니다.");
//	
//				// Text
//				message.setText("회원가입을 진심으로 축하드립니다. \n"
//						+ "\n"
//						+ "회원님의 메일은 " + email + "입니다. \n"
//						+ "\n"
//						+ "SHOINFO 페이지 이동하기. \n"
//						+ "\n"
//						+ "http://localhost:8080/ShoeInfo/SneakerList.go");
//				
//				// send the message
//				Transport.send(message);
////				System.out.println("message sent successfully...");
//			} catch (MessagingException e) {
//				e.printStackTrace();
//			}
			
		
		// 페이지 이동(로그인 페이지로이동)
		// ActionForward 객체를 생성해서 값 저장 후 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./MemberLogin.me");
		forward.setRedirect(true);		
		
		return forward;
	}

	
	
}