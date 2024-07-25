<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ page import="java.io.*, java.util.*" %>
<%
	// name == profileImage file upload
	String path = "C:\\Temp\\upload\\profile";
	File file = new File(path);
	if(!file.exists()){
		file.mkdirs();
	}
%>
<!-- joinCheck.jsp -->
<!-- 회원가입 처리 -->
<jsp:useBean id="joinMember" class="vo.MemberVO" />
<jsp:setProperty property="*" name="joinMember" />

<%
	Collection<Part> parts = request.getParts();
	if(parts != null){
		for(Part p : parts){
			if(p.getContentType() != null && p.getName().equals("profileImage")){
				
				// 원본 파일 이름
				String fileName = p.getSubmittedFileName();
				UUID uid = UUID.randomUUID();
				fileName = uid.toString().replace("-","")+"_"+fileName;
				String uploadPath = path + File.separator + fileName;
				System.out.println("uploadPath : "+uploadPath);
				// 업로드된 임시파일을 uplaodPath copy
				p.write(uploadPath);
				p.delete();
				joinMember.setU_profile(fileName);
			}
		}
	}

%>

<%-- ${joinMember}  --%>
<s:update var="result" dataSource="jdbc/MySQLDB">
	INSERT INTO digital_member
	(u_id, u_pw,u_name, u_profile, u_phone, u_birth, u_addr, u_addr_detail, u_addr_post)
	VALUES(?,?,?,?,?,?,?,?,?); 
	<s:param>${joinMember.u_id}</s:param>
	<s:param>${joinMember.u_pw}</s:param>
	<s:param>${joinMember.u_name}</s:param>
	<s:param>${joinMember.u_profile}</s:param>
	<s:param>${joinMember.u_phone}</s:param>
	<s:param>${joinMember.u_birth}</s:param>
	<s:param>${joinMember.u_addr}</s:param>
	<s:param>${joinMember.u_addr_detail}</s:param>
	<s:param>${joinMember.u_addr_post}</s:param>
</s:update>
<c:choose>
	<c:when test="${result == 1}">
		<script>
			alert('회원가입 성공');
			location.href='login.jsp';
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert('회원가입 실패');
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>








