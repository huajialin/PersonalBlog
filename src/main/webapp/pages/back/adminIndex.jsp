<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>后台管理 - 个人博客</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>
<div class="admin-layout">
    <!-- 侧边栏 -->
    <aside class="admin-sidebar">
        <div class="sidebar-header">
            <h2>博客管理</h2>
        </div>
        <nav class="sidebar-nav">
            <ul>
                <li class="nav-item active">
                    <a href="${pageContext.request.contextPath}/pages/back/adminIndex.jsp">
                        <span>📊</span>
                        <span>仪表盘</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/pages/back/articleManage.jsp">
                        <span>📝</span>
                        <span>文章管理</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/pages/back/categoryManage.jsp">
                        <span>📂</span>
                        <span>分类管理</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/pages/back/commentManage.jsp">
                        <span>💬</span>
                        <span>评论管理</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/pages/back/userManage.jsp">
                        <span>👥</span>
                        <span>用户管理</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/">
                        <span>🏠</span>
                        <span>返回前台</span>
                    </a>
                </li>
            </ul>
        </nav>
    </aside>

    <!-- 主内容区 -->
    <main class="admin-main">
        <!-- 顶部导航 -->
        <header class="admin-header">
            <div class="header-left">
                <button class="sidebar-toggle">☰</button>
                <h1>仪表盘</h1>
            </div>
            <div class="header-right">
                <div class="user-info">
                    <span>欢迎, ${sessionScope.user.username}</span>
                    <a href="${pageContext.request.contextPath}/logout" class="logout-btn">退出</a>
                </div>
            </div>
        </header>

        <!-- 内容区域 -->
        <div class="admin-content">
            <!-- 统计卡片 -->
            <div class="stats-cards">
                <div class="stat-card">
                    <div class="stat-icon" style="background: #4CAF50;">
                        <span>📝</span>
                    </div>
                    <div class="stat-info">
                        <h3>文章总数</h3>
                        <p class="stat-number">128</p>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon" style="background: #2196F3;">
                        <span>💬</span>
                    </div>
                    <div class="stat-info">
                        <h3>评论总数</h3>
                        <p class="stat-number">542</p>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon" style="background: #FF9800;">
                        <span>👥</span>
                    </div>
                    <div class="stat-info">
                        <h3>用户总数</h3>
                        <p class="stat-number">86</p>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon" style="background: #F44336;">
                        <span>👁️</span>
                    </div>
                    <div class="stat-info">
                        <h3>总访问量</h3>
                        <p class="stat-number">12,458</p>
                    </div>
                </div>
            </div>

            <!-- 最近文章 -->
            <div class="content-section">
                <div class="section-header">
                    <h2>最近文章</h2>
                    <a href="${pageContext.request.contextPath}/pages/back/articleManage.jsp" class="btn btn-primary">管理文章</a>
                </div>
                <div class="table-container">
                    <table class="data-table">
                        <thead>
                        <tr>
                            <th>标题</th>
                            <th>分类</th>
                            <th>发布时间</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Spring Boot实战教程</td>
                            <td>Java开发</td>
                            <td>2024-01-15</td>
                            <td><span class="status published">已发布</span></td>
                            <td>
                                <button class="btn btn-sm btn-outline">编辑</button>
                                <button class="btn btn-sm btn-danger">删除</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Vue3组合式API详解</td>
                            <td>前端技术</td>
                            <td>2024-01-12</td>
                            <td><span class="status published">已发布</span></td>
                            <td>
                                <button class="btn btn-sm btn-outline">编辑</button>
                                <button class="btn btn-sm btn-danger">删除</button>
                            </td>
                        </tr>
                        <tr>
                            <td>MySQL性能优化指南</td>
                            <td>数据库</td>
                            <td>2024-01-10</td>
                            <td><span class="status draft">草稿</span></td>
                            <td>
                                <button class="btn btn-sm btn-outline">编辑</button>
                                <button class="btn btn-sm btn-danger">删除</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- 最近评论 -->
            <div class="content-section">
                <div class="section-header">
                    <h2>最近评论</h2>
                    <a href="${pageContext.request.contextPath}/pages/back/commentManage.jsp" class="btn btn-primary">管理评论</a>
                </div>
                <div class="comments-list">
                    <div class="comment-item">
                        <div class="comment-avatar">
                            <img src="${pageContext.request.contextPath}/images/avatar/default.png" alt="用户头像">
                        </div>
                        <div class="comment-content">
                            <div class="comment-header">
                                <strong>张三</strong>
                                <span>在 <a href="#">Spring Boot实战教程</a> 中评论</span>
                            </div>
                            <div class="comment-text">这篇文章写得很详细，对我帮助很大！</div>
                            <div class="comment-time">2小时前</div>
                        </div>
                        <div class="comment-actions">
                            <button class="btn btn-sm btn-outline">通过</button>
                            <button class="btn btn-sm btn-danger">删除</button>
                        </div>
                    </div>

                    <div class="comment-item">
                        <div class="comment-avatar">
                            <img src="${pageContext.request.contextPath}/images/avatar/default.png" alt="用户头像">
                        </div>
                        <div class="comment-content">
                            <div class="comment-header">
                                <strong>李四</strong>
                                <span>在 <a href="#">Vue3组合式API详解</a> 中评论</span>
                            </div>
                            <div class="comment-text">期待更多关于Vue3的内容！</div>
                            <div class="comment-time">5小时前</div>
                        </div>
                        <div class="comment-actions">
                            <button class="btn btn-sm btn-outline">通过</button>
                            <button class="btn btn-sm btn-danger">删除</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
</body>
</html>