<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="header.jsp"/>
	<section>
		<h1 class="main">test - ${requestScope.test}</h1>
		<h1>context - ${pageContext.request.contextPath}</h1>
		<h1>path - ${path}</h1>
	</section>
	<jsp:include page="footer.jsp"/>