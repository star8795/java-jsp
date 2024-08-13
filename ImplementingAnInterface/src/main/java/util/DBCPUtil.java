package util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public abstract class DBCPUtil {

    public static Connection getConnection() {
        Connection conn = null;

        try {
            Context init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
            conn = ds.getConnection();
        } catch (NamingException e) {
            System.out.println("이름으로 dataSource 객체를 찾을 수 없음 :" + e.toString());
        } catch (SQLException e) {
            System.out.println("DB 연결 정보 오류 :" + e.toString());
        }

        return conn;
    }

    public static DataSource getDataSource() {
        DataSource ds = null;

        try {
            Context init = new InitialContext();
            ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
        } catch (NamingException e) {
            System.out.println("이름으로 dataSource 객체를 찾을 수 없음 :" + e.toString());
        }

        return ds;
    }

    public static void close(AutoCloseable... closer) {
        for (AutoCloseable c : closer) {
            try {
                if (c != null) c.close();
            } catch (Exception e) {}
        }
    }
}
