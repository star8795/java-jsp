<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet" %>
<%
	String email = request.getParameter("email");
	String code = String.valueOf(new Random().nextInt(899999) + 100000);
	
	// 세션에 인증코드 저장
	session.setAttribute("authCode", code);
	session.setAttribute("email", email);
	
	// 이메일 전송 설정
	String host = "smtp.example.com";	// SMTP 서버 주소
	final String username = "your_email@example.com";	// 이메일 계정
	final String password = "your_password";
	
	Properties props = new Properties();
	props.put("mail.smtp.host", host);
	Props.put("mail.smtp.suth", "true");
	Props.put("mail.smtp.port", "587");
	Props.put("mail.smtp.starttls.enable", "true");
	
	Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    });
	
	try{
		Message message = new MimeMessage(mailSession);
		message.setFrom(new InternetAddress(username));
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
		message.setSubject("이메일 인증 코드");
		message.setText("인증 코드 : " + code);
		
		Transport.send(message);
		
		out.println("success");
	}catch(MessagingException e){
		throw new RuntimeException(e);
	}
%>