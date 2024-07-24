<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File upload download</title>
</head>
<body>
	<h1>part - fileUpload</h1>
	<!-- 
		enctype="application/x-www-form-urlencoded"  URL 형식으로 인코딩
		enctype="multipart/form-data"				 인코딩 하지 않음 
	-->
	<form action="result" method="post" enctype="multipart/form-data">
		<input type="file" name="file" accept="image/*, .pdf" multiple/><br/>
		<input type="file" name="file1"/><br/>
		<input type="text" name="test"/><br/>
		<button>업로드</button>
	</form>
	<h1>BLOB file upload</h1>
	<form action="test" method="POST" enctype="multipart/form-data">
		<input type="file" name="imageFile" accept="image/*" /><br/>
		<input type="text" name="id" required />
		<button>submit</button>
	</form>
	<hr/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
</body>
</html>