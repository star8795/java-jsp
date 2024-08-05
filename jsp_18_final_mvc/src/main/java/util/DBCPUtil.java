package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBCPUtil {

	public static Connection getConnection() {
		Connection conn = null;
		try {
			/*
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/MySQLDB");
			conn = ds.getConnection();
			*/
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/digital_jsp",
					"digital",
					"1234"
			);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void close(AutoCloseable... closer) {
		for (AutoCloseable a : closer) {
			try {
				if (a != null) {
					a.close();
				}
			} catch (Exception e) {
			}
		}
	}

}
