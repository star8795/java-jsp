<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EXPRESSION LANGUAGE - 표현 언어</title>
</head>
<body>
<!-- 
	Expression Language - EL
	4대 영역 객체나 파라미터와 같이 개발자가 정의한 데이터를
	jsp page내에서 쉽게 사용할 수 있도록 지원하는 표현 언어 
 -->	
<%
	// pageContext.setAttribute("scopeName","page 영역");
	request.setAttribute("scopeName","request 영역");
	session.setAttribute("scopeName","session 영역");
	application.setAttribute("scopeName","application 영역");
%>	
<h3>영역객체에 저장된 속성 값 출력(사용)</h3>
page영역 : <%= pageContext.getAttribute("scopeName") %> <br/>
request영역 : <%= request.getAttribute("scopeName") %> <br/>
session영역 : <%= session.getAttribute("scopeName") %> <br/>
application영역 : <%= application.getAttribute("scopeName") %> <br/>
<hr/>
<h3>EL 표현식 - \${영역객체.key}</h3>
pageEL : ${pageScope.scopeName} <br/>
request EL : ${requestScope.scopeName} <br/>
session EL : ${sessionScope.scopeName} <br/>
application EL : ${applicationScope.scopeName} <br/>
<hr/>

EL scopeName : ${scopeName} <br/>
<!-- 
	pageContext   <  request   <  session  < application
 -->
<%
	ServletRequest req = pageContext.getRequest();
	HttpSession ses = pageContext.getSession();
	ServletContext app = pageContext.getServletContext();
	
	ses = request.getSession();
	app = request.getServletContext();
	
	app = session.getServletContext();

	// pageContext.removeAttribute("scopeName");
	
	Object obj = pageContext.findAttribute("scopeName");
%> 

<%=obj%> <br/>
pageEL : ${pageScope.scopeName} <br/>
request EL : ${requestScope.scopeName} <br/>
session EL : ${sessionScope.scopeName} <br/>
application EL : ${applicationScope.scopeName} <br/>
<hr/>
<br/>
<form action="elTest.jsp" method="POST">
	<input type="text" name="id" /> <button>확인</button>
</form>
<br />
<br />
<br />
<br />
<br />
<br />
</body>
</html>