<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<form action="loginCheck.jsp" method="POST">
	<table border="1">
		<tr>
			<th colspan="2">
				<h3>
					LOGIN PAGE
					<select name="stmt">
						<option value="stmt">Statement</option>
						<option value="pstmt">PreparedStatement</option>
						<option value="cstmt">CallableStatement</option>
					</select>
				</h3>
			</th>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" required autocomplete="off" />
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pass" required /></td>
		</tr>
		<tr>
			<th colspan="2">
				<button>로그인</button>
			</th>
		</tr>
	</table>
</form>