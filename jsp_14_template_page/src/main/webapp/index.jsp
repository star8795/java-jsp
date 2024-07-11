<%@ page import="test.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
	String includePage = request.getParameter("page");
	if(includePage == null){
		includePage = "default";
	}

	// default
	includePage = includePage + ".jsp";
	// default.jsp
	
	UserVO sessionUser = (UserVO)session.getAttribute("user");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag include</title>
<style type="text/css">
	table{
		width:900px;
		margin:0 auto;
		text-align:center;
		border:1px solid black;
	}
	
	table tr td:first-child{
		border-right:1px solid gray;	
	}
	
	aside ul{
		list-style:none;
		padding-left:10px;
		text-align:left;
		width:130px;
		height:500px;
	}
	
	aside ul li a{
		text-decoration:none;
		color:gray;
	}
	
	aside ul li a:hover{
		color:red;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th colspan="2" height="150"> 
				<h1>HEADER - <%=sessionUser%></h1>
				<hr/>
			</th>
		</tr>
		<tr>
			<td>
				<aside>
					<ul>
						<li><a href="index.jsp?page=default">HOME</a></li>
						<li><a href="index.jsp?page=intro">회사소개</a></li>
						<li><a href="index.jsp?page=useBean">USE Bean</a></li>
						<li><a href="index.jsp?page=join">회원가입</a></li>
						<li><a href="index.jsp?page=element">동적 요소</a></li>
					</ul>
				</aside>
			</td>
			<td width="790">
				<!-- content -->
				<jsp:include page="<%=includePage%>"/>
			</td>
		</tr>
		<tr>
			<th colspan="2" height="150"> 
				<hr/>
				<center>
					Copyright &copy; 2024.
				</center>
			</th>
		</tr>
	</table>
</body>
</html>