<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>文章列表 - 个人博客</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
</head>
<body>
<!-- 头部导航 -->
<header class="header">
    <div class="container">
        <nav class="navbar">
            <a href="${pageContext.request.contextPath}/" class="logo">个人博客</a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/article/list" class="active">文章</a></li>
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
        <!-- 文章列表 -->
        <div class="content-left">
            <div class="card">
                <div class="article-header">
                    <h1>所有文章</h1>
                    <p>共 ${articles.size()} 篇文章</p>
                </div>

                <div class="article-list">
                    <c:forEach var="article" items="${articles}">
                        <div class="article-item">
                            <c:if test="${not empty article.coverImage}">
                                <img src="${article.coverImage}" alt="${article.title}" class="article-cover">
                            </c:if>
                            <c:if test="${empty article.coverImage}">
                                <div class="article-cover" style="background: #f8f9fa; display: flex; align-items: center; justify-content: center;">
                                    <span style="color: #999; font-size: 14px;">暂无图片</span>
                                </div>
                            </c:if>
                            <div class="article-content">
                                <h3>
                                    <a href="${pageContext.request.contextPath}/article/detail?id=${article.id}">
                                            ${article.title}
                                    </a>
                                </h3>
                                <div class="article-meta">
                                    <span>作者: ${article.authorName}</span>
                                    <span>
                                            <fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd HH:mm"/>
                                        </span>
                                    <span>分类: ${article.categoryName}</span>
                                </div>
                                <p class="article-summary">${article.summary}</p>
                                <div class="article-stats">
                                    <span>阅读 ${article.viewCount}</span>
                                    <span>评论 ${article.commentCount}</span>
                                    <span>点赞 ${article.likeCount}</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <c:if test="${empty articles}">
                        <div class="empty-state">
                            <h3>暂无文章</h3>
                            <p>还没有发布任何文章</p>
                        </div>
                    </c:if>
                </div>

                <!-- 分页 -->
                <div class="pagination">
                    <c:if test="${currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/article/list?page=${currentPage - 1}" class="btn btn-outline">上一页</a>
                    </c:if>

                    <span class="page-info">第 ${currentPage} 页</span>

                    <c:if test="${not empty articles && articles.size() == 10}">
                        <a href="${pageContext.request.contextPath}/article/list?page=${currentPage + 1}" class="btn btn-outline">下一页</a>
                    </c:if>
                </div>
            </div>
        </div>

        <!-- 侧边栏 -->
        <aside class="sidebar">
            <!-- 搜索框 -->
            <div class="card sidebar-widget">
                <form id="search-form" class="search-form">
                    <div class="form-group">
                        <input type="text" name="q" class="form-control" placeholder="搜索文章...">
                    </div>
                    <button type="submit" class="btn btn-primary" style="width: 100%;">搜索</button>
                </form>
            </div>

            <!-- 分类 -->
            <div class="card sidebar-widget">
                <h3 class="widget-title">文章分类</h3>
                <ul class="category-list">
                    <li><a href="#">Java开发 (15)</a></li>
                    <li><a href="#">前端技术 (8)</a></li>
                    <li><a href="#">数据库 (6)</a></li>
                    <li><a href="#">架构设计 (4)</a></li>
                    <li><a href="#">生活随笔 (12)</a></li>
                </ul>
            </div>

            <!-- 热门文章 -->
            <div class="card sidebar-widget">
                <h3 class="widget-title">热门文章</h3>
                <ul class="popular-list">
                    <li>
                        <div class="popular-item">
                            <a href="#">Spring Boot实战教程</a>
                            <span class="view-count">1.2k</span>
                        </div>
                    </li>
                    <li>
                        <div class="popular-item">
                            <a href="#">Vue3组合式API详解</a>
                            <span class="view-count">980</span>
                        </div>
                    </li>
                    <li>
                        <div class="popular-item">
                            <a href="#">MySQL性能优化指南</a>
                            <span class="view-count">856</span>
                        </div>
                    </li>
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
</body>
</html>