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
		//	email , check 파라미터를 이용해서 check에 일치하는 조건에 따라 email로 메일을 발송함
		
		
		String user_email = request.getParameter("email").trim();
		String path_check = request.getParameter("check").trim();
		
		final String user = "semisendemail@gmail.com";
	    final String password = "xvctfjjreuhukttx";
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
			
			//제목 + 내용
			if(path_check.equals("user_join")) {
				clsMessage.setSubject("GoCatchStay 회원가입 이메일 인증입니다.");
				clsMessage.setText("안녕하세요 GoCatchStay입니다."
						+ "GoCatchStay에 오신것을 환영합니다. "
						+ " 회원가입을 위한 인증코드는 ["+code+"] 입니다.");
				Transport.send(clsMessage);
				result = 1;
			}else if(path_check.equals("id_search")){
				clsMessage.setSubject("GoCatchStay ID 찾기 이메일 인증입니다.");
				clsMessage.setText("안녕하세요 GoCatchStay입니다."
						+ " 아이디를 찾기 위한 인증코드는 ["+code+"] 입니다.");
				Transport.send(clsMessage);
				result = 1;
			}else if(path_check.equals("pwd_search")) {
				clsMessage.setSubject("GoCatchStay 비밀번호 찾기 이메일 인증입니다.");
				clsMessage.setText("안녕하세요 GoCatchStay입니다."
						+ " 비밀번호를 찾기 위한 인증코드는 ["+code+"] 입니다.");
				Transport.send(clsMessage);
				result = 1;
			}else { //path_check 실패
				result = 0;
			}
		}
		catch( Exception e ){
			e.printStackTrace();
		}
		response.getWriter().println(result);
		return null;
	}
}