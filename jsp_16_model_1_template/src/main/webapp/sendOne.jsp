<%@ page language="java" contentType="application/json; charset=UTF-8" %>
<%@ page import = "net.nurigo.sdk.message.request.SingleMessageSendingRequest"%>
<%@ page import = "net.nurigo.sdk.message.response.SingleMessageSentResponse"%>
<%@ page import = "net.nurigo.sdk.message.model.Message"%>
<%@ page import = "net.nurigo.sdk.message.service.DefaultMessageService" %>
<%@ page import = "net.nurigo.sdk.NurigoApp"%>
<%@ page import = "net.nurigo.sdk.message.model.Balance"%>
<%
	String u_phone = request.getParameter("u_phone");

	DefaultMessageService messageService;
	// 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
    messageService = NurigoApp.INSTANCE.initialize(
    	"NCSTU0XMLNXAJPBY",						// API 키
    	"YHDC0EMZAARMNQJ83FEQMKUPUWXO8PXU",		// API Secret Key
    	"https://api.coolsms.co.kr"
    );
	
    Message message = new Message();
    // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
    message.setFrom("01085191769");
    if(u_phone == null || u_phone.equals("")){
	    // test용 전화번호 - 금액 차감 x
	    message.setTo("01000000000");
    }else{
    	message.setTo(u_phone);
    }
    // message.setText("한글 45자, 영자 90자 이하 입력되면 자동으로 SMS타입의 메시지가 추가됩니다.");
    message.setText("안녕하세요");

    SingleMessageSentResponse res = messageService.sendOne(
    	new SingleMessageSendingRequest(message)
    );
    System.out.println(res);
    
    // response 응답객체를 이용해서 처리 상태 코드 전달
    response.getWriter().write(res.getStatusCode());
%>