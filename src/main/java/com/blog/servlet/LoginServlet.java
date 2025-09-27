package com.blog.servlet;

import com.blog.dao.UserDAO;
import com.blog.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login") // 映射URL：/login
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 获取表单参数（处理中文乱码）
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // 2. 调用DAO查询用户
        User user = userDAO.findUserByUsernameAndPwd(username, password);

        // 3. 验证结果：成功则跳后台首页，失败则返回登录页提示错误
        if (user != null) {
            // 登录成功：将用户信息存入Session，防止未登录访问后台
            req.getSession().setAttribute("loginUser", user);
            resp.sendRedirect(req.getContextPath() + "/pages/back/adminIndex.jsp");
        } else {
            // 登录失败：携带错误信息返回登录页
            req.setAttribute("loginError", "用户名或密码错误，请重新输入！");
            req.getRequestDispatcher("/pages/back/login.jsp").forward(req, resp);
        }
    }
}