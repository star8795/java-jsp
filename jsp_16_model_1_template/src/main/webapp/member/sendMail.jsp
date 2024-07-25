<%@ page language="java" contentType="application/json; charset=UTF-8" %>
<%-- sendMail.jsp  --%>
<%@ page import="jakarta.mail.*, jakarta.mail.internet.*, api.*" %>
<%

	// 사용자 메일 인증에 사용할 코드	
	String code = "";
	for(int i = 0; i < 5; i++ ){
		code += (int)(Math.random()*10);   // 0 ~ 9
	}
	System.out.println("발신 코드 : "+code);
	
	// 수신자 이메일 주소
	String u_id = request.getParameter("u_id");
	
	GoogleAuthenticator auth = new GoogleAuthenticator();
	
	Session ses = Session.getDefaultInstance(auth.getProp(), auth);
	
	MimeMessage msg = new MimeMessage(ses);
	// 발신자 지정
	msg.setFrom(new InternetAddress("chlrlrms2@gmail.com","MASTER_CGG"));
	// 수신자 지정
	msg.setRecipient(Message.RecipientType.TO, new InternetAddress(u_id));
	// 제목
	msg.setSubject("CGG 이메일 인증 코드");
	// 내용
	msg.setContent("다음 인증 코드를 입력해주세요 <h3>["+code+"]</h3>","text/html;charset=utf-8");
	// 메일 발송 요청
	Transport.send(msg);
	
	response.getWriter().print(code);
	
%>






















