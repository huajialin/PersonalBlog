package com.blog.dao;

import com.blog.model.User;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class UserDAO {
    // 加载数据库配置
    private static Properties props = new Properties();
    static {
        try (InputStream is = UserDAO.class.getClassLoader().getResourceAsStream("db.properties")) {
            props.load(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 根据用户名和密码查询用户（登录验证）
    public User findUserByUsernameAndPwd(String username, String password) {
        User user = null;
        String sql = "SELECT id, username, password, nickname FROM user WHERE username = ? AND password = ?";

        try (Connection conn = DriverManager.getConnection(
                props.getProperty("url"),
                props.getProperty("username"),
                props.getProperty("password")
        );
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            Class.forName(props.getProperty("driver"));
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setNickname(rs.getString("nickname"));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}