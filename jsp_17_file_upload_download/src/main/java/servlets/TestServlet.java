package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/test")
@MultipartConfig(
	location = "C:\\Temp",					// 임시 파일 저장소
	fileSizeThreshold = 1024 * 1024 * 2,	// 임시 메모리 파일 크기
	maxFileSize = 1024 * 1024 * 8,  // 8MB
	maxRequestSize = 1024 * 1024 * 50		// 50MB
)
public class TestServlet extends HttpServlet{

	private static final long serialVersionUID = 3208415682126821808L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Test Post 요청");
		
		String id = request.getParameter("id");
		System.out.println("param id : " + id);
		
		Collection<Part> parts = request.getParts();
		
		for(Part p : parts) {
			String contentType = p.getContentType();
			System.out.println("contentType : " + contentType);
			if(contentType != null && p.getSize() > 0 && p.getName().equals("imageFile")) {
				// 일반 파일
				if(contentType.startsWith("image/")) {
					// 이미지 파일
					// test_image table에 blob 타입으로 파일 저장
					
					Connection conn = null;
					PreparedStatement pstmt = null;
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						conn = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/digital_jsp",
							"digital",
							"1234"
						);
						pstmt = conn.prepareStatement(
							"INSERT INTO test_image VALUES(?,?,?,?)"
						);
						pstmt.setString(1, id);
						pstmt.setString(2, p.getSubmittedFileName());
						pstmt.setString(3, contentType);
						pstmt.setBlob(4, p.getInputStream());
						pstmt.executeUpdate();
						
						PrintWriter pw = response.getWriter();
						pw.print("<h1>"+id+" image</h1>");
						pw.print("<img src='imageFile.jsp?id="+id+"'/>");
						
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						if(pstmt != null) {
							try {
								pstmt.close();
							} catch (SQLException e) {}
						}
						if(conn != null) {
							try {
								conn.close();
							} catch (SQLException e) {}
						}
					}
				}else {
					// 이미지 파일이 아님
					response.sendError(400,"이미지 파일이 아닙니다.");
				}
			}
		}
		
		
	}// end doPost
	
}