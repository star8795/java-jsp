<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잔액 확인</title>
</head>
<body>
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ page import = "net.nurigo.sdk.message.service.DefaultMessageService" %>
	<%@ page import = "net.nurigo.sdk.NurigoApp"%>
	<%@ page import = "net.nurigo.sdk.message.model.Balance"%>
	<%
		DefaultMessageService messageService;
		// 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
	    messageService = NurigoApp.INSTANCE.initialize(
	    	"NCSTU0XMLNXAJPBY",						// API 키
	    	"YHDC0EMZAARMNQJ83FEQMKUPUWXO8PXU",		// API Secret Key
	    	"https://api.coolsms.co.kr"
	    );
		
	    Balance balance = messageService.getBalance();
        out.println(balance);
	%>
</body>
</html>