package net.member.action;

import java.io.PrintWriter;
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

public class MemberPWFindAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//넘어온 값 받기
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		MemberDAO mdao = new MemberDAO();
		String checkEmail = mdao.findPW(name, email);
		
		response.setContentType("text/html; charset=UTF-8");
	
		// 출력객체를 생성(response객체의 정보를 가지고 생성)
		PrintWriter out = response.getWriter();
		
		//이메일이 DB에 없으면
		if(checkEmail.contains("NOEMAIL")) {
			out.print("NOEMAIL");
		}
		//이메일이 DB에 있으면
		else{
			out.print("CHECKEMAIL");
			
			String salt_id = mdao.getSalt_idByEmail(email);
			
			String email_BySHA = SHA256Util.getEncrypt(email, salt_id);
			
			// 운영자 메일로 사용자 이메일에 비밀번호 재설정하는 링크 보내기
			String host = "smtp.gmail.com";
			final String user = "shoeinfo.official";
			final String password = "agyyxslsqqlmtiof";
			
			//세션
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});
			try{
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(user));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(checkEmail));
				
				// Subject
				message.setSubject("[SHOEINFO] 비밀번호를 재설정 해주세요.");
	
				// Text
				message.setText("\n"
						+ "안녕하세요 " + name + "님, SHOEInfo 입니다.\n"
						+ "\n"
						+ "비밀번호를 재설정 해주세요. \n"
						+ "\n"
						+ "http://www.shoeinfo.co.kr/ChangePass.me?email=" + email_BySHA + " \n"
						+ "\n"
						+ "SHOEInfo. 를 이용해주셔서 감사드리며, \n"
						+ "앞으로 더 좋은 서비스를 만들기 위하여 노력하겠습니다. \n" 
						+ "\n"
						+ "감사합니다. \n"
						+ "\n"
						+ "SHOEInfo. 고객센터 드림"
						
						);
				
				// send the message
				Transport.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
		}
		
		return null;
	}

}
