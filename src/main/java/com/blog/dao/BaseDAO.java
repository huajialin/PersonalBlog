package com.blog.dao;

import java.sql.*;
import java.util.List;
import com.blog.util.DBUtil;

public abstract class BaseDAO {

    protected Connection getConnection() throws SQLException {
        return DBUtil.getConnection();
    }

    protected void close(Connection conn, Statement stmt, ResultSet rs) {
        DBUtil.close(conn, stmt, rs);
    }

    protected Integer executeUpdate(String sql, Object... params) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }

            pstmt.executeUpdate();
            rs = pstmt.getGeneratedKeys();

            if (rs.next()) {
                return rs.getInt(1);
            }
            return null;
        } finally {
            close(conn, pstmt, rs);
        }
    }
}