<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>
	<!-- 
		encType - POST로 전송되는 데이터의 인코딩 설정
		
		enctype="application/x-www-form-urlencoded"
		- 전송되는 모든 문자들을 서버로 보내기 전에 인코딩 됨을 명시
		
		encType="text/plain"
		일반문자 - 공백은 + 기호로 변환되지만
		나머지 문자는 인코딩 되지 않음을 명시
		
		encType="multipart/form-data"
		전달되는 데이터에 이진 데이터가 포함되어 있으므로 모든 문자를 인코딩 하지 않음을 명시
		이 방식은 문자가 아닌 데이터 등을 서버에 전송할 때 사용.(파일 업로드ㄴ)
	-->
	<form enctype="application/x-www-form-urlencoded"
		action="requestResult.jsp" method="post">
		이름 : <input type="text" name="name" /> <br /> 성별 : <input
			type="radio" name="gender" value="male" /> 남 <input type="radio"
			name="gender" value="female" checked /> 여 <br /> 취미 : <input
			type="checkbox" name="habbies" value="축구"> 축구 <input
			type="checkbox" name="habbies" value="database"> database <input
			type="checkbox" name="habbies" value="자바"> 자바 <input
			type="checkbox" name="habbies" value="라이딩"> 라이딩 <br /> <input
			type="submit" />
	</form>
</body>
</html>