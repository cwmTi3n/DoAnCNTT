package com.tpt.util;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	public String getRandom() {
		Random rnd = new Random();
		int number = rnd.nextInt(999999);
		
		return String.format("%06d", number);
	}
	
	public boolean sendEmail(String userMail, String code) {
		boolean test = false;
		
		// Đăng nhập vào mail hệ thống web
				final String systemMail = "find-room@outlook.com";
				final String password = "123456789FR";
				Properties prop = new Properties();
				prop.put("mail.smtp.host", "smtp-mail.outlook.com");
				prop.put("mail.smtp.post", "587");
				prop.put("mail.smtp.auth", "true");
				prop.put("mail.smtp.starttls.enable", "true"); // TLS
				prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
				Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
					@Override
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(systemMail, password);
					}
				});
				

		// Gửi mail
				Message mess = new MimeMessage(session);
				try {
					mess.setFrom(new InternetAddress(systemMail));
					mess.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userMail));
					mess.setSubject("Mã xác thực đăng ký tài khoản Find Room");
					mess.setText("Cảm ơn bạn đã đăng ký tài khoản tại Findroom. Để sử dụng tài khoản, bạn vui lòng sử dụng mã xác thực dưới đây: "+ code);
					Transport.send(mess);
					test = true;
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return false;
				}

		
		return test;
	}
}
