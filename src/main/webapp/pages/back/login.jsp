<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PersonalBlog - 登录</title>
    <!-- 引入Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.0/css/bootstrap.min.css">
    <!-- 自定义样式 -->
    <style>
        .login-container {
            margin-top: 100px;
            max-width: 400px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 30px;
            border-radius: 8px;
        }
        .error-message {
            color: #dc3545;
            font-size: 0.875rem;
            margin-top: 0.25rem;
            display: none; /* 默认隐藏错误提示 */
        }
    </style>
</head>
<body class="bg-light">
<div class="container login-container">
    <h2 class="text-center mb-4">个人博客 - 后台登录</h2>
    <!-- 登录表单：提交至LoginServlet -->
    <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
        <!-- 用户名输入框 -->
        <div class="mb-3">
            <label for="username" class="form-label">用户名</label>
            <input type="text" class="form-control" id="username" name="username"
                   placeholder="admin">
            <div id="usernameError" class="error-message">用户名不能为空，且长度为3-12位</div>
        </div>
        <!-- 密码输入框 -->
        <div class="mb-3">
            <label for="password" class="form-label">密码</label>
            <input type="password" class="form-control" id="password" name="password"
                   placeholder="123456">
            <div id="passwordError" class="error-message">密码不能为空，且长度≥6位</div>
        </div>
        <!-- 后端错误提示（如用户名密码错误） -->
        <% if (request.getAttribute("loginError") != null) { %>
        <div class="alert alert-danger text-center" role="alert">
            <%= request.getAttribute("loginError") %>
        </div>
        <% } %>
        <!-- 登录按钮 -->
        <button type="submit" class="btn btn-primary w-100">登录</button>
        <!-- 跳转前台首页 -->
        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/pages/front/index.jsp">返回首页</a>
        </div>
    </form>
</div>

<!-- 引入Bootstrap JS和jQuery -->
<script src="${pageContext.request.contextPath}/webjars/jquery/3.6.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.0/js/bootstrap.min.js"></script>
<!-- 引入登录验证JS -->
<script src="${pageContext.request.contextPath}/js/loginValidate.js"></script>
</body>
</html>