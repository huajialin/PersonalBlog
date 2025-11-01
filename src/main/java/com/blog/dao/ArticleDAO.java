package com.blog.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.blog.entity.Article;
import com.blog.entity.Comment;
import com.blog.util.StringUtils;

public class ArticleDAO extends BaseDAO {

    public List<Article> findAllPublished(int page, int pageSize) {
        String sql = "SELECT a.*, u.username as author_name, c.name as category_name " +
                "FROM articles a " +
                "LEFT JOIN users u ON a.author_id = u.id " +
                "LEFT JOIN categories c ON a.category_id = c.id " +
                "WHERE a.status = 1 " +
                "ORDER BY a.create_time DESC " +
                "LIMIT ? OFFSET ?";

        return findArticles(sql, pageSize, (page - 1) * pageSize);
    }

    public Article findById(Integer id) {
        String sql = "SELECT a.*, u.username as author_name, c.name as category_name " +
                "FROM articles a " +
                "LEFT JOIN users u ON a.author_id = u.id " +
                "LEFT JOIN categories c ON a.category_id = c.id " +
                "WHERE a.id = ? AND a.status = 1";

        List<Article> articles = findArticles(sql, id);
        return articles.isEmpty() ? null : articles.get(0);
    }

    public boolean addArticle(Article article) {
        String sql = "INSERT INTO articles(title, summary, content, cover_image, author_id, category_id, view_count, comment_count, like_count, status, create_time) " +
                "VALUES(?, ?, ?, ?, ?, ?, 0, 0, 0, 1, NOW())";

        try {
            Integer id = executeUpdate(sql,
                    article.getTitle(),
                    article.getSummary(),
                    article.getContent(),
                    article.getCoverImage(),
                    article.getAuthorId(),
                    article.getCategoryId()
            );

            if (id != null) {
                article.setId(id);
                return true;
            }
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void incrementViewCount(Integer articleId) {
        String sql = "UPDATE articles SET view_count = view_count + 1 WHERE id = ?";

        try {
            executeUpdate(sql, articleId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Comment> findCommentsByArticleId(Integer articleId) {
        String sql = "SELECT c.*, u.username, u.avatar " +
                "FROM comments c " +
                "LEFT JOIN users u ON c.user_id = u.id " +
                "WHERE c.article_id = ? AND c.status = 1 " +
                "ORDER BY c.create_time DESC";

        List<Comment> comments = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, articleId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                comments.add(mapResultSetToComment(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, pstmt, rs);
        }
        return comments;
    }

    public boolean addComment(Comment comment) {
        String sql = "INSERT INTO comments(article_id, user_id, content, parent_id, like_count, status, create_time) " +
                "VALUES(?, ?, ?, ?, 0, 1, NOW())";

        try {
            Integer id = executeUpdate(sql,
                    comment.getArticleId(),
                    comment.getUserId(),
                    comment.getContent(),
                    comment.getParentId()
            );
            return id != null;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private List<Article> findArticles(String sql, Object... params) {
        List<Article> articles = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);

            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }

            rs = pstmt.executeQuery();

            while (rs.next()) {
                articles.add(mapResultSetToArticle(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, pstmt, rs);
        }
        return articles;
    }

    private Article mapResultSetToArticle(ResultSet rs) throws SQLException {
        Article article = new Article();
        article.setId(rs.getInt("id"));
        article.setTitle(rs.getString("title"));
        article.setSummary(rs.getString("summary"));
        article.setContent(rs.getString("content"));
        article.setCoverImage(rs.getString("cover_image"));
        article.setAuthorId(rs.getInt("author_id"));
        article.setAuthorName(rs.getString("author_name"));
        article.setCategoryId(rs.getInt("category_id"));
        article.setCategoryName(rs.getString("category_name"));
        article.setViewCount(rs.getInt("view_count"));
        article.setCommentCount(rs.getInt("comment_count"));
        article.setLikeCount(rs.getInt("like_count"));
        article.setStatus(rs.getInt("status"));
        article.setCreateTime(rs.getTimestamp("create_time"));
        article.setUpdateTime(rs.getTimestamp("update_time"));
        return article;
    }

    private Comment mapResultSetToComment(ResultSet rs) throws SQLException {
        Comment comment = new Comment();
        comment.setId(rs.getInt("id"));
        comment.setArticleId(rs.getInt("article_id"));
        comment.setUserId(rs.getInt("user_id"));
        comment.setUsername(rs.getString("username"));
        comment.setAvatar(rs.getString("avatar"));
        comment.setContent(rs.getString("content"));
        comment.setParentId(rs.getInt("parent_id"));
        comment.setLikeCount(rs.getInt("like_count"));
        comment.setStatus(rs.getInt("status"));
        comment.setCreateTime(rs.getTimestamp("create_time"));
        return comment;
    }
}