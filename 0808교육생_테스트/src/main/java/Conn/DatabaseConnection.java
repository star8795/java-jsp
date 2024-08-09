package Conn;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DatabaseConnection {
    public static Connection getConnection() throws NamingException, SQLException {
        Context initialContext = new InitialContext();
        Context envContext = (Context) initialContext.lookup("java:/comp/env");
        DataSource ds = (DataSource) envContext.lookup("jdbc/MyDB");
        return ds.getConnection();
    }
}
