<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
	// 브라우저에서는 요청을 전달 할때마다 해당 사이트에 등록된 쿠키 정보(목록)을 전달
	// 쿠키는 요청 정보인 request에 가공처리되어서 전달됨.
	
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		// 등록된 쿠키 개수 만큼 순회하면서 출력
		for(Cookie c : cookies){
			String name = c.getName(); 		// key
			String value = c.getValue();	// value
			out.println(name+":"+value+"<br/>");
		}
	}else{
		out.println("<h2>등록된 쿠키가 없습니다.</h2>");	
	}
%>