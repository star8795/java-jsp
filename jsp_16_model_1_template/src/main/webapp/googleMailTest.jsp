<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 구글 메일 발송 테스트 -->
<%@ page import="javax.mail.*,javax.mail.internet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="api.*"%>
<%
	try{
		// SMTP - 간이 우편전송 규약
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		
		// SSL 보안 소켓 계층 - Secure Socket Layer - 465 port 사용
		// TLS 전송 계약 보안 - Transport Layer Secutity
		// SSL 보안 강화 -> TLS => 587 port 사용
		
		// 구글 메일 인증 정보
		GoogleAuthenticator auth = new GoogleAuthenticator();
		
		// 지정된 메일 서버와 통신할 정보를 저장할 객체
		Session ses = Session.getDefaultInstance(props, auth);
		
		// 메일발송에 필요한 정보를 저장하는 객체
		MimeMessage msg = new MimeMessage(ses);
		
		// 발송 시간
		msg.setSentDate(new Date());
		
		// 전송되는 메일 데이터 타입 설정
		msg.addHeader("Content-Type", "text/html;charset=utf-8");
		
		// 수신자 지정
		InternetAddress to = new InternetAddress("star8795@naver.com");		
		msg.setRecipient(Message.RecipientType.TO, to);
		
		msg.setFrom(new InternetAddress("master@btc.ac.kr","MASTER"));
		msg.setSubject("TEST MASTER!");
		msg.setSubject("TEST MASTER!", "UTF-8");
		msg.setContent("<h3>오늘은 무사히...</h3>","text/html;chrset=utf-8");
		Transport.send(msg);
		out.println("<script>");
 		out.println("alert('메일 발송 성공. 메일을 확인해주세요.');");
 		out.println("location.href='"+request.getContextPath()+"';");
 		out.println("</script>");
	}catch(Exception e){
		e.printStackTrace();
 		out.println("<script>");
 		out.println("alert('메일 발송 실패');");
 		out.println("history.go(-1);");
 		out.println("</script>");
	}
%>