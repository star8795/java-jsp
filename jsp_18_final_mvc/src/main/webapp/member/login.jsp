<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<section>
	<form action="login.mc" method="post">
		<table>
			<tr>
				<th colspan=2><h1>로그인</h1></th>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" required/>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" required/></td>
			</tr>
			<tr>
				<td colspan=2>
					<label>
					<input type="checkbox" name="login"/>
					로그인 상태 유지
					</label>
				</td>
			</tr>
			<tr >
				<td colspan="2">
					<input type="submit" value="로그인"/>
					<input type="button" value="비밀번호찾기"/>
				</td>				
			</tr>
		</table>
	</form>
</section>
<jsp:include page="../common/footer.jsp"/>