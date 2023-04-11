package com.action.user;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.mail.*;
import javax.mail.internet.*;

import com.action.Action;
import com.action.ActionForward;
import com.model.user.UserDAO;

public class EmailSendAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String user_email = request.getParameter("email").trim();
		
		final String user = "semiemailsend@gmail.com";
	    final String password = "oyrgqrepssjsdbic";
	    String code = UserDAO.getInstance().insertEmailCode(user_email);
	    int result = 0;
		try{   
			Properties clsProp = System.getProperties();
			
			clsProp.put("mail.smtp.host", "smtp.gmail.com");
			clsProp.put("mail.smtp.port", 465);
			clsProp.put("mail.smtp.auth", "true");
			clsProp.put("mail.smtp.ssl.enable", "true");
			clsProp.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			
			Session clsSession = Session.getInstance(clsProp, new Authenticator(){
				public PasswordAuthentication getPasswordAuthentication(){
					return new PasswordAuthentication(user, password);
				}
			});
			
			Message clsMessage = new MimeMessage(clsSession);
			
			// 발신자 이메일 주소를 설정한다.
			clsMessage.setFrom(new InternetAddress(user));
			
			// 수신자 이메일 주소를 설정한다.
			clsMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(user_email));
			
			// 제목을 저장한다.
			clsMessage.setSubject("호텔 찾기 사이트 이메일 인증입니다.");
			
			clsMessage.setText("Welcome to Hotel Search Site. your code is ["+code+"]");
			
			// 메일 전송
			Transport.send(clsMessage);
			result = 1;
		}
		catch( Exception e ){
			e.printStackTrace();
		}
		response.getWriter().println(result);
		return null;
	}
}