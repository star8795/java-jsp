package Util;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil {
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/login",
				"login",
				"1234"					
			);
		} catch (Exception e) {
			System.out.println("연결 요청 정보 오류 : " + e.getMessage());
		}return conn;
	}
	
	public static void close(AutoCloseable... closer) {
		for (AutoCloseable c : closer) {
			if (c != null) {
				try {
					c.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
}
