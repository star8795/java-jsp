<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*" %>
<%
	// profileImage.jsp
	// 8e0fcec324b9421c8d55ea999b09dab3_rice.png 

	String fileName = request.getParameter("fileName");
	String original = fileName.substring(fileName.indexOf("_") + 1);
	
	String savePath = "C:\\Temp\\upload\\profile";
	
	// C:\\Temp\\upload\\profile\\8e0fcec324b9421c8d55ea999b09dab3_rice.png 
	String filePath = savePath + File.separator + fileName;
	
	String mimeType = application.getMimeType(filePath);
	
	response.setContentType(mimeType);
	response.setHeader("Content-Disposition", "attachment; fileName="+original);
	
	FileInputStream fis = new FileInputStream(filePath);
	byte[] bytes = new byte[4096];
	
	OutputStream os = response.getOutputStream();
	int numRead;
	
	while((numRead = fis.read(bytes, 0 , bytes.length)) != -1){
		os.write(bytes, 0 , numRead);
	}
	os.flush();
	os.close();
	fis.close();

%>
















