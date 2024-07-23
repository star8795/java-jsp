<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*, java.util.*" %>
<%
	/*
	InputStream is = request.getInputStream();
	InputStreamReader reader = new InputStreamReader(is);
	BufferedReader br = new BufferedReader(reader);
	
	String readData = "";
	while((readData = br.readLine()) != null){
		out.println(readData + "<br/>");
	}
	*/
	
	// file upload 경로
	String path = "C:\\Temp\\upload";
	File file = new File(path);
	if(!file.exists()){		// 해당 위치에 파일 또는 디렉토리가 존재하지 않을 경우
		System.out.println("생성완료");
		file.mkdirs();
	}
	
	Collection<Part> parts = request.getParts();
	// multipart 로 전달된 데이터가 존재 할 경우
	if(parts != null){
		for(Part part : parts){
			System.out.printf(
				"파라미터 명 : %s, contentType : %s, size : %d bytes \n",
				part.getName(),
				part.getContentType(),
				part.getSize()
			);
			
			// 일반 param 과  file data 구분
			if(part.getContentType() != null){
				// submit 된 file의 실제 이름
				String fileName = part.getSubmittedFileName();
				System.out.println("업로드 파일 명 : " + fileName);
				
				UUID uid = UUID.randomUUID();
				System.out.println(uid.toString());
				fileName = uid.toString().replace("-","")+"_"+fileName;
				System.out.println("조합된 파일명 : " + fileName);
				
				String uploadPath = path + File.separator + fileName;
				
				// InputStream is = part.getInputStream();
				// part에 저장된 임시디렉토리 파일을 
				// 매개변수로 전달된 경로로 복사
				part.write(uploadPath);
				// 임시 디렉토리 파일 삭제
				part.delete();
				String original = part.getSubmittedFileName();
				out.println("<a href='file_down.jsp?fileName="+fileName+"' download='"+original+"'>"+original+"</a> <br/>");
			}else{
				// 일반 텍스트 data
				String formValue = request.getParameter(part.getName());
				System.out.println(part.getName()+":"+formValue);
			}
		} // end parts iterator
	} // end null check
%>

<hr/>

<a href="index.jsp" download="i.jsp">index</a>