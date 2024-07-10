<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 메시지 목록 &amp; 작성</title>
</head>
<body>
	<!-- 방명록 작성 -->
	<form action="guest_book_write.jsp" method="POST">
		<table>
			<tr>
				<th colspan="3"><h2>방명록 작성</h2></th>
			</tr>
			<tr>
				<td colspan="2"></td>
				<td rowspan="4">
					<button style="margin-left:20px;width:100%; height:130px;">메세지 남기기</button>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="guestName" style="width:100%;" required/>
				</td>
			</tr>
			<tr>
				<td>암호</td>
				<td>
					<input type="password" name="password" style="width:100%;" required/>
				</td>
			</tr>
			<tr>
				<td>메세지</td>
				<td>
					<textarea name="message" cols="35" rows="5"></textarea>
				</td>
			</tr>
		</table>
	</form>
	<%@ page import="java.sql.*, utils.*" %>
	<%
		// 한 페이지에 보여줄 게시물 개수
		int pageCount = 10;
	
		// 요청이  들어온 페이지, 사용자가 요청한 페이지 번호
		// 별다른 페이지 요청이 없을 시에는 1 page 출력
		int currentPage = 1; 
		
		// 사용자가 확인할 목록 페이지를 page 라는 파라미터 이름으로 전달
		String paramPage = request.getParameter("page");
		if(paramPage != null){
			// 파라미터로 전달된 페이지 번호가 존재하면 해당 페이지 번호로 목록 검색
			currentPage = Integer.parseInt(paramPage);
		}
		
		out.println("현재 요청 페이지 : " + currentPage + "<br/>");
		
		// 검색 범위는 0 부터 시작
		// LIMIT 0 , pageCount;
		// 사용자에게 입력받는 페이지 번호는 1부터 시작
		// page == 1 ==  0 == 10;
		// page == 2 == 10 == 20;
		// page == 3 == 20 == 30;
		// (page - 1) * pageCount;
		
		// (1page - 1 ) * 10 == 0;
		// (2page - 1 ) * 10 == 10;
		// (3page - 1 ) * 10 == 20;
		// ... 
		
		//  LIMIT page, 5;
		// (1page - 1) * 5 == 0;
		// (2page - 1) * 5 == 5;
		// (3page - 1) * 5 == 10;
		// ...
		
		int startRow = (currentPage - 1) * pageCount;
		
		Connection conn = JDBCUtil.getConnection();
		
		/*
		String sql = "SELECT num, guestName, message FROM guestBook ORDER BY num DESC";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		*/
		String sql = "SELECT num, guestName, message FROM guestBook "+ 
				     "ORDER BY num DESC limit ? , ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, pageCount);
		ResultSet rs = pstmt.executeQuery();
	%>
	
	<hr/>
	<br/>
	<h1>방명록 리스트</h1>
	<table border="1" cellspacing="0" cellpadding="0" style="width:100%;">
		<%
			while(rs.next()){
				int num = rs.getInt("num");				
				String guestName = rs.getString("guestName");
				String message = rs.getString("message");
		%>
			<tr style="width:100%;margin-bottom:5px;">
				<td>
					메세지 번호 : <%=num%> <br/>
					손님 이름 : <%=guestName %> <br/>
					메세지 : <%=message %> 
					<a href="guest_book_confirm.jsp?num=<%=num%>">[삭제]</a>
				</td>				
			</tr>
		<%
			} // end while 
			// 검색된 행 정보 출력 완료
			// 사용이 끝난 자원 해제
			/*
			JDBCUtil.close(rs);
			JDBCUtil.close(stmt);
			JDBCUtil.close(conn);
			*/
			JDBCUtil.close(rs,pstmt,conn);
		%>
		<!-- 페이지 이동 번호 출력 -->
		<%
			// guestBook table에 등록된 전체 행(게시물)의 개수
			sql = "SELECT count(*) FROM guestBook";		
			conn = JDBCUtil.getConnection();
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			// 전체 게시물 개수를 저장할 변수
			int totalCount = 0;
			if(rs.next()){
				totalCount = rs.getInt(1);
			}
			
			out.println("전체 게시물 개수 : " + totalCount +"<br/>");
			JDBCUtil.close(rs, stmt, conn);
			
			int maxPage = (totalCount - 1) / pageCount + 1;
			out.println("최대 페이지 : " + maxPage +"<br/>");
			// 24576 :     24576 / 10 == 2457.6 == 2457 + 1 == 2458
			//   130 :       130 / 10 ==     13 ==   13 + 1 == 14
			//   130 : (130 - 1) / 10 ==   12.9 ==   12 + 1 == 13
			//   129 : (129 - 1) / 10 ==   12.8 ==   12 + 1 == 13
			//   121 : (121 - 1) / 10 ==   12.0 ==   12 + 1 == 13
			//                        2457.1 ~ 2457.9 == 2458.0        
			maxPage =  (int)(Math.ceil((double)totalCount / pageCount));
			out.println("최대 페이지 : " + maxPage +"<br/>");
			
			// 현재 요청 페이지에서 보여줄 시작 페이지 번호
			int startPage = 0;
			// 현재 요청 페이지에서 보여줄 마지막 페이지 번호
			int endPage = 0;
			// 한번에 보여줄 페이지 번호 개수
			int displayPageNum = 5;
			
			// 1 ~ 5 page 요청
			// [1][2][3][4][5]
			// 6 ~ 10 page 요청
			// [6][7][8][9][10]
			// ..
			// 시작 페이지 번호 부터 구하기
			startPage = (currentPage - 1) / displayPageNum * displayPageNum + 1;
			// 1 ~ 5 == 1
			// 1page (1 - 1) / 5 * 5 + 1; == 1
			// 5page (5 - 1) / 5(0.8) == (0 * 5) == 0 + 1 == 1;
			// 6page (6 - 1) / 5(1) == (1 * 5) == 5 + 1 == 6;
			// 10page (10 - 1) / 5(1.8) == (1 * 5) == 5 + 1 == 6;
			
			// 출력할 마지막 페이지 번호
			endPage = startPage + (displayPageNum - 1);
			
			// endPage 가 maxPage 보다 크면 이동할 수 없는 페이지 번호가 출력
			if(endPage > maxPage){
				endPage = maxPage;
			}
			
		%>
		
		<tr style="width:100%;">
			<th>
				<!-- 사용자가 요청한 출력된 현재 페이지가 1페이지가 아니면 출력 -->
				<%if(currentPage != 1){ %>
				<a href="guest_book.jsp?page=1">[처음]</a>
				<%}%>
				<%if(startPage != 1){ %>
				<a href="guest_book.jsp?page=<%=startPage - 1%>">[이전]</a>
				<%}%>
				<!-- 이동가능한 페이지 번호 출력 -->
				<%
					for(int i = startPage; i <= endPage; i++){
				%>
						<a href="guest_book.jsp?page=<%=i%>">[<%=i%>]</a>
				<%		
					}
				%>
				
				<%if(endPage < maxPage){ %>
				<a href="guest_book.jsp?page=<%=endPage + 1%>">[다음]</a>
				<%}%>
				<%if(currentPage < maxPage){ %>
				<!-- 마지막 페이지 이동 -->
				<a href="guest_book.jsp?page=<%=maxPage%>">[마지막]</a>
				<%} %>
			</th>
		</tr>
	</table>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
</body>
</html>