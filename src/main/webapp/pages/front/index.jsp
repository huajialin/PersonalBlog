<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PersonalBlog - 首页</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.0/css/bootstrap.min.css">
    <!-- 自定义样式 -->
    <style>
        .navbar {
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .carousel-item {
            height: 400px;
        }
        .carousel-item img {
            height: 100%;
            object-fit: cover; /* 图片自适应填充 */
        }
        .article-card {
            transition: transform 0.3s;
        }
        .article-card:hover {
            transform: translateY(-5px); /* hover时上浮效果 */
        }
        .tag-badge {
            margin: 0 5px 5px 0;
        }
        .footer {
            margin-top: 50px;
            padding: 20px 0;
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
<!-- 导航栏 -->
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
                    <a class="nav-link active" href="index.jsp">首页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="articleList.jsp">文章列表</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="category.jsp">文章分类</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">关于我</a>
                </li>
            </ul>
            <!-- 登录入口 -->
            <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/pages/back/login.jsp">
                后台登录
            </a>
        </div>
    </div>
</nav>

<!-- 轮播图 -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="${pageContext.request.contextPath}/images/carousel/1.jpg" class="d-block w-100" alt="博客封面1">
        </div>
        <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/images/carousel/2.jpg" class="d-block w-100" alt="博客封面2">
        </div>
        <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/images/carousel/3.jpg" class="d-block w-100" alt="博客封面3">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<!-- 主体内容：最新文章 + 热门标签 -->
<div class="container mt-5">
    <div class="row">
        <!-- 最新文章（左侧8列） -->
        <div class="col-lg-8">
            <h3 class="mb-4 border-bottom pb-2">最新文章</h3>
            <!-- 文章卡片1 -->
            <div class="card mb-4 article-card">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="${pageContext.request.contextPath}/images/articles/1.jpg" class="img-fluid h-100" alt="文章封面">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">
                                <a href="articleDetail.jsp" class="text-decoration-none text-dark">Java Web入门：MVC模式详解</a>
                            </h5>
                            <p class="card-text text-muted small">
                                <span class="me-3"><i class="bi bi-calendar"></i> 2024-09-01</span>
                                <span class="me-3"><i class="bi bi-folder"></i> 技术笔记</span>
                                <span><i class="bi bi-eye"></i> 128</span>
                            </p>
                            <p class="card-text">本文详细讲解MVC设计模式的原理、分层思想，以及在Java Web项目中的实际应用，适合入门开发者学习...</p>
                            <a href="articleDetail.jsp" class="btn btn-sm btn-primary">阅读更多</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 文章卡片2 -->
            <div class="card mb-4 article-card">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="${pageContext.request.contextPath}/images/articles/2.jpg" class="img-fluid h-100" alt="文章封面">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">
                                <a href="articleDetail.jsp" class="text-decoration-none text-dark">Bootstrap 5 快速搭建响应式页面</a>
                            </h5>
                            <p class="card-text text-muted small">
                                <span class="me-3"><i class="bi bi-calendar"></i> 2024-08-25</span>
                                <span class="me-3"><i class="bi bi-folder"></i> 前端开发</span>
                                <span><i class="bi bi-eye"></i> 96</span>
                            </p>
                            <p class="card-text">Bootstrap 5是目前流行的前端框架，本文介绍如何使用Bootstrap的栅格系统、组件快速实现响应式页面，提升开发效率...</p>
                            <a href="articleDetail.jsp" class="btn btn-sm btn-primary">阅读更多</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 热门标签（右侧4列） -->
        <div class="col-lg-4">
            <h3 class="mb-4 border-bottom pb-2">热门标签</h3>
            <div class="card">
                <div class="card-body">
                    <a href="articleList.jsp?tag=Java" class="badge bg-primary tag-badge">Java</a>
                    <a href="articleList.jsp?tag=Web开发" class="badge bg-secondary tag-badge">Web开发</a>
                    <a href="articleList.jsp?tag=Bootstrap" class="badge bg-success tag-badge">Bootstrap</a>
                    <a href="articleList.jsp?tag=MVC" class="badge bg-danger tag-badge">MVC</a>
                    <a href="articleList.jsp?tag=JavaScript" class="badge bg-warning tag-badge">JavaScript</a>
                    <a href="articleList.jsp?tag=MySQL" class="badge bg-info tag-badge">MySQL</a>
                    <a href="articleList.jsp?tag=前端" class="badge bg-dark tag-badge">前端</a>
                    <a href="articleList.jsp?tag=后端" class="badge bg-light text-dark tag-badge">后端</a>
                    <a href="articleList.jsp?tag=学习笔记" class="badge bg-primary tag-badge">学习笔记</a>
                </div>
            </div>

            <!-- 博主信息 -->
            <div class="card mt-4">
                <div class="card-header bg-primary text-white">
                    博主信息
                </div>
                <div class="card-body text-center">
                    <img src="${pageContext.request.contextPath}/images/avatar/default.jpg"
                         class="rounded-circle" width="100" height="100" alt="博主头像">
                    <h5 class="card-title mt-2">Blog博主</h5>
                    <p class="card-text">专注于Java Web开发与技术分享，记录学习路上的点点滴滴。</p>
                    <a href="about.jsp" class="btn btn-sm btn-outline-primary">了解更多</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 页脚 -->
<div class="footer text-center">
    <div class="container">
        <p class="mb-0">个人博客 | 设计与开发：第九小组</p>
    </div>
</div>

<!-- Bootstrap JS和jQuery -->
<script src="${pageContext.request.contextPath}/webjars/jquery/3.6.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.0/js/bootstrap.min.js"></script>
<!-- 引入Bootstrap图标（用于文章卡片的图标） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</body>
</html>