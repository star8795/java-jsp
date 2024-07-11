<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- element.jsp -->
<!-- Custom tag 생성 -->
<!-- <choi id="choiName" class="choiClass"><h1>Choi Class</h1></choi> -->
<style>
	choi{
		display:block;
		padding:10px;
		background-color:black;
		color:white;
	}
</style>
<jsp:element name="choi">
	<jsp:attribute name="id">
		choiName
	</jsp:attribute>
	<jsp:attribute name="class">
		choiClass
	</jsp:attribute>
	<jsp:body>
		<h1>Choi Class</h1>
	</jsp:body>
</jsp:element>