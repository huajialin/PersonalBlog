CREATE DATABASE blog_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE blog_db;

CREATE TABLE users (
                       id INT PRIMARY KEY AUTO_INCREMENT,
                       username VARCHAR(50) NOT NULL UNIQUE,
                       password VARCHAR(100) NOT NULL,
                       email VARCHAR(100),
                       avatar VARCHAR(500),
                       role VARCHAR(20) DEFAULT 'user',
                       status INT DEFAULT 1,
                       create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
                       update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE categories (
                            id INT PRIMARY KEY AUTO_INCREMENT,
                            name VARCHAR(50) NOT NULL,
                            description VARCHAR(200),
                            status INT DEFAULT 1,
                            create_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE articles (
                          id INT PRIMARY KEY AUTO_INCREMENT,
                          title VARCHAR(200) NOT NULL,
                          summary VARCHAR(500),
                          content TEXT NOT NULL,
                          cover_image VARCHAR(500),
                          author_id INT NOT NULL,
                          category_id INT NOT NULL,
                          view_count INT DEFAULT 0,
                          comment_count INT DEFAULT 0,
                          like_count INT DEFAULT 0,
                          status INT DEFAULT 1, -- 1: 已发布, 0: 草稿
                          create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
                          update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                          FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE CASCADE,
                          FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

CREATE TABLE comments (
                          id INT PRIMARY KEY AUTO_INCREMENT,
                          article_id INT NOT NULL,
                          user_id INT NOT NULL,
                          content TEXT NOT NULL,
                          parent_id INT DEFAULT 0,
                          like_count INT DEFAULT 0,
                          status INT DEFAULT 1,
                          create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
                          FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE,
                          FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);



/*测试*/
INSERT INTO users (username, password, email, avatar, role) VALUES
                                                                ('admin', '123456', 'admin@blog.com', '/images/avatar/admin.png', 'admin'),
                                                                ('zhangsan', '123456', 'zhangsan@blog.com', '/images/avatar/default.png', 'user'),
                                                                ('lisi', '123456', 'lisi@blog.com', '/images/avatar/default.png', 'user'),
                                                                ('wangwu', '123456', 'wangwu@blog.com', '/images/avatar/default.png', 'user');

INSERT INTO categories (name, description) VALUES
                                               ('Java开发', 'Java相关技术文章'),
                                               ('前端技术', 'HTML、CSS、JavaScript等前端技术'),
                                               ('数据库', 'MySQL、Redis等数据库技术'),
                                               ('架构设计', '系统架构和设计模式'),
                                               ('生活随笔', '生活感悟和随笔'),
                                               ('DevOps', '持续集成、部署和运维');

-- Java开发相关文章
INSERT INTO articles (title, summary, content, author_id, category_id, view_count, comment_count, like_count) VALUES
                                                                                                                  ('Spring Boot入门教程', '本文详细介绍Spring Boot的基本概念和使用方法，帮助初学者快速上手。', '<h2>什么是Spring Boot？</h2><p>Spring Boot是Spring框架的一个子项目，旨在简化Spring应用的初始搭建和开发过程。</p><p>它通过自动配置和起步依赖，让开发者能够快速创建独立运行的、生产级的Spring应用程序。</p><h2>Spring Boot的主要特性</h2><ul><li>创建独立的Spring应用程序</li><li>直接嵌入Tomcat、Jetty或Undertow（无需部署WAR文件）</li><li>提供固化的"starter"依赖，简化构建配置</li><li>尽可能自动配置Spring和第三方库</li><li>提供生产就绪的特性，如指标、健康检查和外部化配置</li><li>绝对没有代码生成，也不需要XML配置</li></ul>', 1, 1, 1250, 23, 45),

                                                                                                                  ('MyBatis使用指南', '全面讲解MyBatis框架的使用方法和最佳实践。', '<h2>MyBatis简介</h2><p>MyBatis是一款优秀的持久层框架，它支持自定义SQL、存储过程以及高级映射。</p><p>MyBatis避免了几乎所有的JDBC代码和手动设置参数以及获取结果集。</p><h2>核心组件</h2><ul><li>SqlSessionFactory</li><li>SqlSession</li><li>Mapper接口</li><li>SQL映射文件</li></ul>', 1, 1, 890, 15, 32),

                                                                                                                  ('Java集合框架详解', '深入分析Java集合框架的设计原理和使用技巧。', '<h2>集合框架概述</h2><p>Java集合框架提供了一套性能优良、使用方便的接口和类，它们位于java.util包中。</p><h2>主要接口</h2><ul><li>Collection接口</li><li>List接口</li><li>Set接口</li><li>Map接口</li></ul>', 2, 1, 756, 18, 28),

                                                                                                                  ('Spring Cloud微服务实战', '使用Spring Cloud构建微服务架构的完整指南。', '<h2>微服务架构概述</h2><p>微服务架构是一种将单个应用程序开发为一套小型服务的方法，每个服务运行在自己的进程中。</p><h2>Spring Cloud组件</h2><ul><li>Eureka - 服务发现</li><li>Ribbon - 客户端负载均衡</li><li>Feign - 声明式REST客户端</li><li>Hystrix - 断路器</li><li>Zuul - 服务网关</li></ul>', 1, 1, 1345, 31, 67);

-- 前端技术相关文章
INSERT INTO articles (title, summary, content, cover_image, author_id, category_id, view_count, comment_count, like_count) VALUES
                                                                                                                               ('Vue3组合式API详解', '介绍Vue3的组合式API及其在实际项目中的应用。', '<h2>组合式API简介</h2><p>Vue 3引入了组合式API，这是一种新的编写组件逻辑的方式。</p><p>它让我们能够更好地组织和复用代码逻辑。</p><h2>主要特性</h2><ul><li>更好的逻辑复用</li><li>更灵活的代码组织</li><li>更好的TypeScript支持</li></ul>', '/images/articles/vue3.jpg', 1, 2, 980, 32, 56),

                                                                                                                               ('React Hooks实践指南', '分享React Hooks在实际项目中的使用经验和技巧。', '<h2>Hooks的出现</h2><p>Hooks是React 16.8的新增特性，它可以让你在不编写class的情况下使用state以及其他的React特性。</p><h2>常用Hooks</h2><ul><li>useState</li><li>useEffect</li><li>useContext</li><li>useReducer</li></ul>', '/images/articles/react.jpg', 2, 2, 845, 25, 41),

                                                                                                                               ('TypeScript入门到精通', 'TypeScript基础语法和高级特性的全面讲解。', '<h2>TypeScript简介</h2><p>TypeScript是JavaScript的超集，为JavaScript添加了静态类型定义。</p><h2>主要特性</h2><ul><li>静态类型检查</li><li>类与接口</li><li>泛型编程</li><li>装饰器</li></ul>', '/images/articles/typescript.jpg', 3, 2, 1123, 42, 78);

-- 数据库相关文章
INSERT INTO articles (title, summary, content, author_id, category_id, view_count, comment_count, like_count) VALUES
                                                                                                                  ('MySQL索引优化', '详细讲解MySQL索引的原理和优化策略。', '<h2>索引的重要性</h2><p>索引是提高数据库查询性能的关键因素。</p><p>正确的索引策略可以显著提升查询速度。</p><h2>索引类型</h2><ul><li>B-Tree索引</li><li>哈希索引</li><li>全文索引</li><li>空间索引</li></ul>', 1, 3, 1120, 28, 62),

                                                                                                                  ('Redis实战应用', '介绍Redis在缓存、会话存储等场景中的实际应用。', '<h2>Redis简介</h2><p>Redis是一个开源的内存数据结构存储，用作数据库、缓存和消息代理。</p><h2>主要用途</h2><ul><li>缓存</li><li>会话存储</li><li>消息队列</li><li>排行榜</li></ul>', 2, 3, 934, 19, 37),

                                                                                                                  ('SQL性能优化技巧', '分享提高SQL查询性能的各种方法和技巧。', '<h2>SQL优化基础</h2><p>编写高效的SQL查询是数据库性能优化的关键。</p><h2>优化技巧</h2><ul><li>避免SELECT *</li><li>合理使用索引</li><li>减少子查询</li><li>使用JOIN替代子查询</li></ul>', 1, 3, 876, 22, 45);

-- 架构设计相关文章
INSERT INTO articles (title, summary, content, author_id, category_id, view_count, comment_count, like_count) VALUES
                                                                                                                  ('微服务架构设计原则', '探讨微服务架构的核心设计原则和最佳实践。', '<h2>微服务设计原则</h2><p>微服务架构需要遵循一定的设计原则才能发挥其优势。</p><h2>核心原则</h2><ul><li>单一职责原则</li><li>服务自治</li><li>去中心化治理</li><li>容错设计</li></ul>', 1, 4, 987, 29, 53),

                                                                                                                  ('DDD领域驱动设计入门', '领域驱动设计的基本概念和实践方法。', '<h2>DDD概述</h2><p>领域驱动设计是一种软件设计方法，强调业务领域的建模。</p><h2>核心概念</h2><ul><li>实体</li><li>值对象</li><li>聚合</li><li>领域服务</li></ul>', 2, 4, 765, 18, 32);

-- 生活随笔相关文章
INSERT INTO articles (title, summary, content, author_id, category_id, view_count, comment_count, like_count) VALUES
                                                                                                                  ('程序员的自我修养', '分享程序员职业发展和技术成长的思考。', '<h2>技术成长路径</h2><p>程序员的成长不仅仅是技术能力的提升，还包括思维方式和职业规划的完善。</p><h2>成长建议</h2><ul><li>持续学习新技术</li><li>参与开源项目</li><li>写作与分享</li><li>建立个人品牌</li></ul>', 1, 5, 1543, 56, 89),

                                                                                                                  ('远程工作的经验分享', '多年远程工作的心得体会和实用技巧。', '<h2>远程工作的优势</h2><p>远程工作提供了更大的灵活性和自主性，但也需要更强的自律能力。</p><h2>实用技巧</h2><ul><li>建立规律的工作时间</li><li>创造专注的工作环境</li><li>有效沟通</li><li>工作与生活平衡</li></ul>', 3, 5, 1234, 43, 76);

-- 为文章添加评论
INSERT INTO comments (article_id, user_id, content) VALUES
                                                        (1, 2, '这篇文章对我帮助很大，谢谢分享！'),
                                                        (1, 3, '讲解得很详细，期待更多Spring Boot相关的内容。'),
                                                        (1, 4, '示例代码很实用，可以直接用在项目中。'),
                                                        (2, 2, 'MyBatis确实很方便，减少了大量重复代码。'),
                                                        (2, 3, '希望有更多关于MyBatis高级用法的文章。'),
                                                        (3, 4, '集合框架是Java基础中的重点，这篇文章总结得很好。'),
                                                        (4, 2, '微服务架构现在很流行，这篇文章来得正是时候。'),
                                                        (5, 3, 'Vue3的组合式API让代码组织更加清晰了。'),
                                                        (5, 4, '对比Options API，组合式API确实更灵活。'),
                                                        (6, 2, 'React Hooks改变了React开发方式，很实用。'),
                                                        (7, 3, 'TypeScript的类型系统确实能减少很多运行时错误。'),
                                                        (8, 4, 'MySQL索引优化是数据库性能的关键，这篇文章很有价值。'),
                                                        (9, 2, 'Redis在我们的项目中广泛使用，这篇文章很实用。'),
                                                        (10, 3, 'SQL优化技巧很实用，收藏了。'),
                                                        (11, 4, '微服务架构设计原则讲得很透彻。'),
                                                        (12, 2, 'DDD概念比较抽象，这篇文章解释得很清楚。'),
                                                        (13, 3, '程序员的职业发展确实是需要认真思考的问题。'),
                                                        (14, 4, '远程工作需要很强的自律能力，深有体会。');



