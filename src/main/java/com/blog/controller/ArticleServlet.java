package com.blog.controller;

import java.io.IOException;
import java.util.List;
import com.blog.dao.ArticleDAO;
import com.blog.entity.Article;
import com.blog.entity.Comment;
import com.blog.entity.User;
import com.blog.util.StringUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/article/*")
public class ArticleServlet extends HttpServlet {
    private ArticleDAO articleDAO = new ArticleDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getPathInfo();

        if (pathInfo == null || "/list".equals(pathInfo)) {
            showArticleList(request, response);
        } else if (pathInfo.startsWith("/detail")) {
            showArticleDetail(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getPathInfo();

        if ("/comment".equals(pathInfo)) {
            addComment(request, response);
        }
    }

    private void showArticleList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int page = 1;
        int pageSize = 10;

        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            // 使用默认值
        }

        List<Article> articles = articleDAO.findAllPublished(page, pageSize);
        request.setAttribute("articles", articles);
        request.setAttribute("currentPage", page);

        request.getRequestDispatcher("/pages/front/articleList.jsp").forward(request, response);
    }

    private void showArticleDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (StringUtils.isEmpty(idParam)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "文章ID不能为空");
            return;
        }

        try {
            Integer articleId = Integer.parseInt(idParam);
            Article article = articleDAO.findById(articleId);

            if (article == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "文章不存在");
                return;
            }

            // 增加阅读量
            articleDAO.incrementViewCount(articleId);

            // 获取评论
            List<Comment> comments = articleDAO.findCommentsByArticleId(articleId);
            article.setComments(comments);

            request.setAttribute("article", article);
            request.getRequestDispatcher("/pages/front/articleDetail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "无效的文章ID");
        }
    }

    private void addComment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        String articleIdParam = request.getParameter("articleId");
        String content = request.getParameter("content");

        if (StringUtils.isEmpty(articleIdParam) || StringUtils.isEmpty(content)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "参数不完整");
            return;
        }

        try {
            Integer articleId = Integer.parseInt(articleIdParam);
            Comment comment = new Comment();
            comment.setArticleId(articleId);
            comment.setUserId(user.getId());
            comment.setContent(StringUtils.escapeHtml(content));

            boolean success = articleDAO.addComment(comment);

            if (success) {
                response.sendRedirect(request.getContextPath() + "/article/detail?id=" + articleId);
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "评论发布失败");
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "无效的文章ID");
        }
    }
}