<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PersonalBlog - 关于我</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        .navbar { box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .about-container { max-width: 800px; margin: 50px auto; }
        .avatar { width: 150px; height: 150px; border-radius: 50%; object-fit: cover; }
        .info-item { margin: 15px 0; }
        .footer { margin-top: 50px; padding: 20px 0; background-color: #f8f9fa; }
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
                    <a class="nav-link" href="index.jsp">首页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="articleList.jsp">文章列表</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="category.jsp">文章分类</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="about.jsp">关于我</a>
                </li>
            </ul>
            <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/pages/back/login.jsp">
                后台登录
            </a>
        </div>
    </div>
</nav>

<!-- 关于我内容 -->
<div class="about-container px-4">
    <div class="text-center">
        <img src="${pageContext.request.contextPath}/images/avatar/default.jpg" class="avatar" alt="博主头像">
        <h2 class="mt-3">Blog博主</h2>
        <p class="text-muted">Java Web开发者 | 技术爱好者 | 分享学习心得</p>
    </div>

    <div class="mt-5">
        <h4 class="border-bottom pb-2">个人简介</h4>
        <p class="mt-3">
            大家好！我是一名Java Web开发爱好者，目前专注于Java后端、前端框架（Bootstrap、JavaScript）的学习与实践。
            开设这个个人博客，主要是为了记录自己的学习历程，分享技术笔记和开发经验，希望能与更多志同道合的开发者交流学习，共同进步。
        </p>
        <p>
            博客内容主要涵盖Java Web开发、MVC模式、数据库设计、前端响应式开发等方向，适合入门级开发者参考。
            如果您有任何问题或建议，欢迎通过下方联系方式与我沟通！
        </p>
    </div>

    <div class="mt-5">
        <h4 class="border-bottom pb-2">联系方式</h4>
        <div class="info-item">
            <span class="fw-bold me-2">邮箱：</span>
            <a href="mailto:blog@example.com" class="text-decoration-none">blog@example.com</a>
        </div>
        <div class="info-item">
            <span class="fw-bold me-2">GitHub：</span>
            <a href="https://github.com/example" target="_blank" class="text-decoration-none">github.com/example</a>
        </div>
        <div class="info-item">
            <span class="fw-bold me-2">微信：</span>
            <span>example_wechat</span>
        </div>
    </div>
</div>

<!-- 页脚 -->
<div class="footer text-center">
    <div class="container">
        <p class="mb-0">PersonalBlog 个人博客 | 设计与开发：第九小组</p>
    </div>
</div>

<script src="${pageContext.request.contextPath}/webjars/jquery/3.6.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.0/js/bootstrap.min.js"></script>
</body>
</html>