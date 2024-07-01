<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attrTest1.jsp</title>
</head>
<body>
	<%
	String id = request.getParameter("id");

	// id != null : id라는 name으로 전달된 parameter가 존재할때
	// !id.equals("") : 작성한 텍스트가 빈 문자열이 아닐 때
	if (id != null && !id.equals("")) {
		// key type은 문자열(String)
		// value type은 Object
		pageContext.setAttribute("pageId", id);
		application.setAttribute("appId", id);
	}
	%>
	<h2>저장된 정보 확인</h2>
	<%
	// application 영역 객체에 저장된 속성 값들 중에
	// name(key) 가 appId인 속성 값 
	Object appId = application.getAttribute("appId");

	String pageId = (String) pageContext.getAttribute("pageId");
	%>

	<h3>
		pageContext id :
		<%=pageId%></h3>
	<h3>
		application id :
		<%=appId%></h3>
	<hr />
	<form action="attrTest2.jsp" method="POST">
		이메일 : <input type="email" name="email" required />
		<button>확인</button>
	</form>
</body>
</html>