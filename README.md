# PersonalBlog 个人博客系统

这是一个基于 Java 的个人博客系统，前后台分离结构，前台用于用户访问，后台用于博主管理内容。系统实现了博客的基本功能，包括文章展示、分类管理、标签管理、用户登录及个人信息维护等。

## 功能模块

### 前台模块（用户访问）
- **首页**：展示热门文章、轮播图、推荐分类
- **文章模块**：
  - 文章列表页（支持按时间/分类筛选）
  - 文章详情页（查看内容、标签）
- **分类模块**：查看全部分类及对应文章
- **标签模块**：查看热门标签及关联文章
- **关于我**：展示博主个人信息
- **登录入口**：跳转至后台登录页

### 后台模块（博主管理）
- **登录页**：带前后端验证
- **文章管理**：发布、编辑、删除文章
- **分类管理**：添加、修改、删除分类
- **标签管理**：添加、关联、删除标签
- **个人信息管理**：修改昵称、头像、密码

## 技术架构

- **后端**：Java Servlet + DAO 模式
- **前端**：JSP + HTML + CSS + JavaScript
- **数据库**：通过 `db.properties` 配置
- **构建工具**：Maven（`pom.xml`）

## 项目结构

```
src/
├── main/
│   ├── java/               # Java 源码
│   │   └── com/blog/
│   │       ├── model/      # 实体类（User.java）
│   │       ├── servlet/    # 控制层（LoginServlet.java）
│   │       └── dao/        # 数据访问层（UserDAO.java）
│   ├── resources/
│   │   └── db.properties   # 数据库配置文件
│   └── webapp/             # Web 资源
│       ├── pages/          # 页面资源
│       │   ├── front/      # 前台页面（index.jsp, articleList.jsp 等）
│       │   └── back/       # 后台页面（login.jsp, adminIndex.jsp 等）
│       ├── css/            # 样式文件
│       ├── js/             # JavaScript 文件（如登录验证）
│       ├── images/         # 图片资源（轮播图、头像等）
│       └── WEB-INF/
│           └── web.xml     # Web 应用配置
└── pom.xml                 # Maven 依赖配置
```

## 快速启动

1. **环境要求**
   - JDK 1.8+
   - Apache Tomcat 9+
   - Maven 3.x
   - MySQL 或其他支持 JDBC 的数据库

2. **配置数据库**
   修改 `src/main/resources/db.properties` 文件，配置数据库连接信息。

3. **构建项目**
   ```bash
   mvn clean package
   ```

4. **部署运行**
   将生成的 WAR 包部署到 Tomcat 的 `webapps` 目录下，启动 Tomcat。

5. **访问系统**
   - 前台首页：`http://localhost:8080/PersonalBlog/pages/front/index.jsp`
   - 后台登录页：`http://localhost:8080/PersonalBlog/pages/back/login.jsp`

## 开发与贡献

欢迎贡献代码和提出建议！请遵循以下步骤：
1. Fork 项目
2. 创建新分支 (`git checkout -b feature/new-feature`)
3. 提交更改 (`git commit -m 'Add new feature'`)
4. 推送分支 (`git push origin feature/new-feature`)
5. 提交 Pull Request

## 许可证

本项目采用 MIT License，请查看具体许可文件。