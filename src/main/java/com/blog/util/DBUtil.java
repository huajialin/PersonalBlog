package com.blog.util;

import java.io.InputStream;
import java.sql.*;
import java.util.Properties;
import javax.sql.DataSource;
import com.mysql.cj.jdbc.MysqlDataSource;

public class DBUtil {
    private static DataSource dataSource;

    static {
        try {
            Properties props = new Properties();
            InputStream input = DBUtil.class.getClassLoader()
                    .getResourceAsStream("db.properties");
            props.load(input);

            MysqlDataSource mysqlDS = new MysqlDataSource();
            mysqlDS.setURL(props.getProperty("db.url"));
            mysqlDS.setUser(props.getProperty("db.username"));
            mysqlDS.setPassword(props.getProperty("db.password"));

            dataSource = mysqlDS;
        } catch (Exception e) {
            throw new ExceptionInInitializerError("Database initialization failed: " + e.getMessage());
        }
    }

    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    public static void close(Connection conn, Statement stmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(Connection conn, Statement stmt) {
        close(conn, stmt, null);
    }
}