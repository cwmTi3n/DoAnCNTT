package com.tpt.util;

import java.util.Properties;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class SendMail {
	
	public static final boolean sendEmail(String userMail, String subject, String text) {
		
        final String username = "find-room@outlook.com";
        final String password = "123456789FR";

        Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp-mail.outlook.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        
        Session session = Session.getInstance(prop,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("find-room@outlook.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(userMail)
            );
            message.setSubject(subject);
            message.setText(text);

            Transport.send(message);
            //System.out.println("Done");
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }
		
//		boolean test = false;
//		
//		// Đăng nhập vào mail hệ thống web
//				final String systemMail = "find-room@outlook.com";
//				final String password = "123456789FR";
//				Properties prop = new Properties();
//				prop.put("mail.smtp.host", "smtp-mail.outlook.com");
//				prop.put("mail.smtp.post", "587");
//				prop.put("mail.smtp.auth", "true");
//				prop.put("mail.smtp.starttls.enable", "true"); // TLS
//				prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
//				Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
//					@Override
//					protected PasswordAuthentication getPasswordAuthentication() {
//						return new PasswordAuthentication(systemMail, password);
//					}
//				});
//				
//
//		// Gửi mail
//				Message mess = new MimeMessage(session);
//				try {
//					mess.setFrom(new InternetAddress(systemMail));
//					mess.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userMail));
//					mess.setSubject("Mã xác thực đăng ký tài khoản Find Room");
//					mess.setText("Cảm ơn bạn đã đăng ký tài khoản tại Findroom. Để sử dụng tài khoản, bạn vui lòng sử dụng mã xác thực dưới đây: "+ code);
//					Transport.send(mess);
//					test = true;
//				} catch (MessagingException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//					return false;
//				}
//
//		
//		return test;
}
