<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录 - 个人博客</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
<div class="login-container">
    <form class="login-form" action="${pageContext.request.contextPath}/login" method="post">
        <div class="login-header">
            <h2>用户登录</h2>
            <p>欢迎回到个人博客</p>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-error">
                    ${error}
            </div>
        </c:if>

        <c:if test="${not empty success}">
            <div class="alert alert-success">
                    ${success}
            </div>
        </c:if>

        <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" id="username" name="username" class="form-control"
                   placeholder="请输入用户名" required value="${param.username}">
        </div>

        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" id="password" name="password" class="form-control"
                   placeholder="请输入密码" required>
        </div>

        <button type="submit" class="btn btn-primary btn-login">登录</button>

        <div class="login-links">
            <a href="${pageContext.request.contextPath}/pages/front/register.jsp">还没有账号？立即注册</a>
        </div>
    </form>
</div>

<script src="${pageContext.request.contextPath}/js/loginValidate.js"></script>
</body>
</html>