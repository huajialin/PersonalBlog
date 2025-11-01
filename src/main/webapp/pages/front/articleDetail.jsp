<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${article.title} - 个人博客</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/article.css">
</head>
<body>
<!-- 头部导航 -->
<header class="header">
    <div class="container">
        <nav class="navbar">
            <a href="${pageContext.request.contextPath}/" class="logo">个人博客</a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/article/list">文章</a></li>
                <c:if test="${not empty sessionScope.user}">
                    <li><a href="${pageContext.request.contextPath}/pages/back/adminIndex.jsp">管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout">退出</a></li>
                </c:if>
                <c:if test="${empty sessionScope.user}">
                    <li><a href="${pageContext.request.contextPath}/login">登录</a></li>
                </c:if>
            </ul>
        </nav>
    </div>
</header>

<!-- 主要内容 -->
<main class="container">
    <div class="main-content">
        <!-- 文章内容 -->
        <div class="content-left">
            <article class="card">
                <!-- 文章头部 -->
                <div class="article-header">
                    <h1 class="article-title">${article.title}</h1>
                    <div class="article-meta">
                        <span>作者: ${article.authorName}</span>
                        <span>发布时间: <fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd HH:mm"/></span>
                        <span>分类: ${article.categoryName}</span>
                        <span>阅读: ${article.viewCount}</span>
                    </div>
                </div>

                <!-- 文章封面 -->
                <c:if test="${not empty article.coverImage}">
                    <div class="article-cover">
                        <img src="${article.coverImage}" alt="${article.title}">
                    </div>
                </c:if>

                <!-- 文章内容 -->
                <div class="article-content">
                    ${article.content}
                </div>

                <!-- 文章操作 -->
                <div class="article-actions">
                    <input type="hidden" id="article-id" value="${article.id}">
                    <a href="javascript:void(0)" class="action-btn" id="like-btn">
                        <span>👍</span>
                        <span class="like-count">${article.likeCount}</span>
                        <span>点赞</span>
                    </a>
                    <a href="javascript:void(0)" class="action-btn" id="favorite-btn">
                        <span>🤍</span>
                        <span>收藏</span>
                    </a>
                    <a href="#comments" class="action-btn">
                        <span>💬</span>
                        <span>评论 ${article.commentCount}</span>
                    </a>
                </div>
            </article>

            <!-- 评论区域 -->
            <section class="comments-section" id="comments">
                <div class="card">
                    <h2>评论 (${article.comments.size()})</h2>

                    <!-- 评论表单 -->
                    <c:if test="${not empty sessionScope.user}">
                        <form id="comment-form" class="comment-form"
                              action="${pageContext.request.contextPath}/article/comment" method="post">
                            <input type="hidden" name="articleId" value="${article.id}">
                            <div class="form-group">
                                    <textarea name="content" class="form-control"
                                              placeholder="写下你的评论..." required maxlength="1000"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">发布评论</button>
                        </form>
                    </c:if>
                    <c:if test="${empty sessionScope.user}">
                        <div class="comment-form">
                            <p>请 <a href="${pageContext.request.contextPath}/login">登录</a> 后发表评论</p>
                        </div>
                    </c:if>

                    <!-- 评论列表 -->
                    <div class="comment-list">
                        <c:forEach var="comment" items="${article.comments}">
                            <div class="comment-item">
                                <img src="${not empty comment.avatar ? comment.avatar : '${pageContext.request.contextPath}/images/avatar/default.png'}"
                                     alt="${comment.username}" class="comment-avatar">
                                <div class="comment-content">
                                    <div class="comment-header">
                                        <span class="comment-author">${comment.username}</span>
                                        <span class="comment-time">
                                                <fmt:formatDate value="${comment.createTime}" pattern="yyyy-MM-dd HH:mm"/>
                                            </span>
                                    </div>
                                    <div class="comment-text">${comment.content}</div>
                                    <div class="comment-actions">
                                        <a href="javascript:void(0)" class="comment-action comment-like"
                                           data-comment-id="${comment.id}">
                                            <span>👍</span>
                                            <span class="like-count">${comment.likeCount}</span>
                                        </a>
                                        <c:if test="${not empty sessionScope.user}">
                                            <a href="javascript:void(0)" class="comment-action reply-btn"
                                               data-comment-id="${comment.id}" data-username="${comment.username}">
                                                回复
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <c:if test="${empty article.comments}">
                            <div class="empty-comments">
                                <p>还没有评论，快来抢沙发吧！</p>
                            </div>
                        </c:if>
                    </div>
                </div>
            </section>
        </div>

        <!-- 侧边栏 -->
        <aside class="sidebar">
            <!-- 作者信息 -->
            <div class="card sidebar-widget">
                <h3 class="widget-title">关于作者</h3>
                <div class="author-info">
                    <div class="author-avatar">
                        <img src="${pageContext.request.contextPath}/images/avatar/default.png" alt="${article.authorName}">
                    </div>
                    <div class="author-details">
                        <h4>${article.authorName}</h4>
                        <p>热爱技术的全栈开发者</p>
                    </div>
                </div>
            </div>

            <!-- 目录导航 -->
            <div class="card sidebar-widget">
                <h3 class="widget-title">文章目录</h3>
                <div class="toc-container" id="toc-container">
                    <!-- 通过JavaScript动态生成 -->
                </div>
            </div>

            <!-- 相关文章 -->
            <div class="card sidebar-widget">
                <h3 class="widget-title">相关文章</h3>
                <ul class="related-list">
                    <li><a href="#">Spring Boot入门指南</a></li>
                    <li><a href="#">Java集合框架详解</a></li>
                    <li><a href="#">MySQL索引优化实践</a></li>
                </ul>
            </div>
        </aside>
    </div>
</main>

<!-- 页脚 -->
<footer class="footer">
    <div class="container">
        <p>&copy; 2024 个人博客. All rights reserved.</p>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/article.js"></script>
</body>
</html>