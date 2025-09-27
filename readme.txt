功能模块图
PersonalBlog 个人博客系统
├─ 前台模块（用户访问）
│  ├─ 首页（展示热门文章、轮播图、推荐分类）
│  ├─ 文章模块
│  │  ├─ 文章列表页（按时间/分类筛选）
│  │  └─ 文章详情页（查看内容、标签）
│  ├─ 分类模块（查看全部分类及对应文章）
│  ├─ 标签模块（查看热门标签及关联文章）
│  ├─ 关于我（展示博主个人信息）
│  └─ 登录入口（跳转至后台登录页）
└─ 后台模块（博主管理）
   ├─ 登录页（带前后端验证）
   ├─ 文章管理（发布/编辑/删除文章）
   ├─ 分类管理（添加/修改/删除分类）
   ├─ 标签管理（添加/关联/删除标签）
   └─ 个人信息管理（修改昵称、头像、密码）


项目结构
PersonalBlog/
├─ src/
│  ├─ main/
│  │  ├─ java/
│  │  │  └─ com/
│  │  │     ├─ blog/
│  │  │     │  ├─ model/       # JavaBean（实体类）
│  │  │     │  │  └─ User.java # 用户实体
│  │  │     │  ├─ servlet/     # Servlet（控制层）
│  │  │     │  │  └─ LoginServlet.java # 登录控制
│  │  │     │  └─ dao/         # DAO（数据访问层）
│  │  │     │     └─ UserDAO.java # 用户数据操作
│  │  ├─ resources/
│  │  │  └─ db.properties      # 数据库配置
│  │  └─ webapp/
│  │     ├─ pages/             # 静态页面
│  │     │  ├─ front/          # 前台页面
│  │     │  │  ├─ index.jsp    # 首页
│  │     │  │  ├─ articleList.jsp # 文章列表
│  │     │  │  └─ about.jsp    # 关于我
│  │     │  └─ back/           # 后台页面
│  │     │     ├─ login.jsp    # 登录页
│  │     │     └─ adminIndex.jsp # 后台首页
│  │     ├─ css/               # 自定义样式
│  │     ├─ js/                # 自定义JS
│  │     │  └─ loginValidate.js # 登录验证JS
│  │     ├─ images/            # 图片资源（轮播图、头像）
│  │     └─ WEB-INF/
│  │        ├─ web.xml         # 配置Servlet、欢迎页
│  │        └─ jsp/            # 后端渲染页面（可选）
└─ pom.xml                     # 依赖配置