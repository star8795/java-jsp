<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="../common/header.jsp"/>
	<!-- 
		form tag에 action 속성의 값이 비어 있거나 속성이 존재하지 않으면 
		현재 URL 요청 경로에 전송방식만 지정된 형식으로 요청
	-->
	<form method="post">
		<table>
			<tr>
				<th colspan="2"><h1>회원정보 수정</h1></th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"  value="${member.id}" readonly/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" value="${member.pass}"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${member.name}"/></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" value="${member.age}"/></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<label>
						<input type="radio" name="gender" value="male"
						${member.gender eq 'male' ? 'checked' : ''} /> 남성
					</label>
					<label>
						<input type="radio" name="gender" value="female" 
						${member.gender ne 'male' ? 'checked' : ''} /> 여성
					</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="정보수정"/>
				</td>
			</tr>
		</table>
	</form>
<jsp:include page="../common/footer.jsp"/>








