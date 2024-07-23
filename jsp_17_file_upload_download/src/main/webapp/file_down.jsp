<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*" %>
<%
	String fileName = request.getParameter("fileName");
	
	String savePath = "C:\\Temp\\upload";
	String downloadPath = savePath + File.separator + fileName;
	System.out.println(downloadPath);

	// 매개변수로 지정된 위치의 파일의 data type(MIME Type) 을 문자열로 반환
	String mimeType = application.getMimeType(downloadPath);
	System.out.println("mimeType >>> " + mimeType);
	
	if(mimeType == null){
		// 형태를 이해 할 수 없는 이진 데이터
		// 브라우저는 이해 할수 없는 파일 데이터로 인식하고 다운로드 받음
		mimeType = "application/octet-stream";
	}

	response.setContentType(mimeType);
	String original = fileName.substring(fileName.indexOf("_")+1);
	
	original = new String(original.getBytes("UTF-8"), "iso-8859-1");
	/*
		Content-Disposition - 컨텐츠의 기질 - 성향을 알려주는 속성
	*/
	response.setHeader("Content-Disposition","attachment; fileName="+original);
	
	byte bytes[] = new byte[4096];
	// 서버에 업로드된 파일과 연결된 입력 스트림
	FileInputStream fis = new FileInputStream(downloadPath);
	// 요청한 사용한 브라우저로 출력 할 스트림
	OutputStream os = response.getOutputStream();
	int numRead;
	while((numRead = fis.read(bytes, 0, bytes.length)) != -1){ // EOF
		os.write(bytes, 0, numRead);
	}
	
	os.flush();
	os.close();
	fis.close();
	
%>