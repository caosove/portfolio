package it.will.kingsmap;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class SendCode {
	
	@Autowired()
	private JavaMailSender javaMailSender;
	
	public void sendCode(String email,String subject,String content) {
		MimeMessage message=javaMailSender.createMimeMessage();
		try {
			message.setSubject(subject);
			message.setText(content);
			message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email));
			
			javaMailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
}
