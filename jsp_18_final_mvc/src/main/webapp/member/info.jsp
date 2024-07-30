<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="../common/header.jsp"/>
	<table border=1>
		<tr>
			<th colspan="2"><h1>회원정보</h1></th>
		</tr>
		<tr>
			<td>회원번호</td>
			<td></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td></td>
		</tr>
		<tr>
			<td>이름</td>
			<td></td>
		</tr>
		<tr>
			<td>나이</td>
			<td></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				
			</td>
		</tr>
		<tr>
			<td>회원가입일</td>
			<td></td>
		</tr>
		<tr>
			<td>회원정보수정일</td>
			<td></td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="button" value="메인으로"/>
				<input type="button" value="정보수정"/>
				<input type="button" value="회원탈퇴"/>
			</td>
		</tr>
	</table>
<jsp:include page="../common/footer.jsp"/>