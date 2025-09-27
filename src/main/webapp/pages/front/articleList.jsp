<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PersonalBlog - 文章列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        .navbar { box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .article-item { border-bottom: 1px dashed #eee; padding: 15px 0; }
        .article-item:last-child { border-bottom: none; }
        .footer { margin-top: 50px; padding: 20px 0; background-color: #f8f9fa; }
    </style>
</head>
<body>
<!-- 导航栏（复用首页导航栏） -->
<nav class="navbar navbar-expand-lg navbar-light bg-white">
    <div class="container">
        <a class="navbar-brand fs-4 fw-bold" href="${pageContext.request.contextPath}/pages/front/index.jsp">
            PersonalBlog
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">首页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="articleList.jsp">文章列表</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="category.jsp">文章分类</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">关于我</a>
                </li>
            </ul>
            <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/pages/back/login.jsp">
                后台登录
            </a>
        </div>
    </div>
</nav>

<!-- 主体内容 -->
<div class="container mt-5">
    <div class="row">
        <!-- 文章列表（左侧8列） -->
        <div class="col-lg-8">
            <h3 class="mb-4 border-bottom pb-2">全部文章</h3>
            <!-- 文章项1 -->
            <div class="article-item">
                <h5>
                    <a href="articleDetail.jsp" class="text-decoration-none text-dark">Java Web入门：MVC模式详解</a>
                </h5>
                <p class="text-muted small">
                    <span class="me-3"><i class="bi bi-calendar"></i> 2024-09-01</span>
                    <span class="me-3"><i class="bi bi-folder"></i> 技术笔记</span>
                    <span class="me-3"><i class="bi bi-tags"></i> Java, MVC</span>
                    <span><i class="bi bi-eye"></i> 128</span>
                </p>
                <p>本文详细讲解MVC设计模式的原理、分层思想，以及在Java Web项目中的实际应用，适合入门开发者学习。通过案例演示如何将Model、View、Controller分层实现，降低代码耦合度...</p>
                <a href="articleDetail.jsp" class="btn btn-sm btn-primary">阅读更多</a>
            </div>
            <!-- 文章项2 -->
            <div class="article-item">
                <h5>
                    <a href="articleDetail.jsp" class="text-decoration-none text-dark">Bootstrap 5 快速搭建响应式页面</a>
                </h5>
                <p class="text-muted small">
                    <span class="me-3"><i class="bi bi-calendar"></i> 2024-08-25</span>
                    <span class="me-3"><i class="bi bi-folder"></i> 前端开发</span>
                    <span class="me-3"><i class="bi bi-tags"></i> Bootstrap, 前端</span>
                    <span><i class="bi bi-eye"></i> 96</span>
                </p>
                <p>Bootstrap 5是目前流行的前端框架，本文介绍如何使用Bootstrap的栅格系统、组件快速实现响应式页面，提升开发效率。包括导航栏、轮播图、卡片等组件的使用，以及自定义样式的方法...</p>
                <a href="articleDetail.jsp" class="btn btn-sm btn-primary">阅读更多</a>
            </div>
            <!-- 分页 -->
            <nav aria-label="Page navigation example" class="mt-4">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled"><a class="page-link" href="#">上一页</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">下一页</a></li>
                </ul>
            </nav>
        </div>

        <!-- 分类筛选（右侧4列） -->
        <div class="col-lg-4">
            <h3 class="mb-4 border-bottom pb-2">文章分类</h3>
            <div class="card">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <a href="articleList.jsp?category=技术笔记" class="text-decoration-none">技术笔记</a>
                        <span class="badge bg-primary rounded-pill">12</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <a href="articleList.jsp?category=前端开发" class="text-decoration-none">前端开发</a>
                        <span class="badge bg-primary rounded-pill">8</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <a href="articleList.jsp?category=后端开发" class="text-decoration-none">后端开发</a>
                        <span class="badge bg-primary rounded-pill">15</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <a href="articleList.jsp?category=学习心得" class="text-decoration-none">学习心得</a>
                        <span class="badge bg-primary rounded-pill">5</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- 页脚（复用首页页脚） -->
<div class="footer text-center">
    <div class="container">
        <p class="mb-0">个人博客 | 设计与开发：第九小组</p>
    </div>
</div>

<script src="${pageContext.request.contextPath}/webjars/jquery/3.6.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</body>
</html>