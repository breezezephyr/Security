# 证券期货分析平台

基于 Spring MVC 的证券期货交易数据分析平台，支持用户登录、积分系统与期货分钟级交易数据读取。

## 技术栈

| 类别 | 技术 |
|------|------|
| 语言 | Java 8 |
| Web 框架 | Spring MVC 4.3 |
| 数据访问 | Spring JdbcTemplate |
| 数据库 | MySQL 5.7+ |
| 视图 | JSP + JSTL |
| 日志 | SLF4J + Logback |
| 构建 | Maven |
| 应用服务器 | Jetty 9.4（嵌入式） |

## 快速开始

### 1. 环境要求

- JDK 8
- Maven 3.x
- MySQL 5.7+

### 2. 初始化数据库

```bash
mysql -u root -p < src/main/resources/sql/schema.sql
mysql -u root -p < src/main/resources/sql/data.sql
```

默认数据库连接配置在 `src/main/resources/jdbc.properties`：

```properties
jdbc.url=jdbc:mysql://localhost:3306/sampledb
jdbc.username=root
jdbc.password=201407
```

### 3. 构建 & 运行

```bash
# 编译
mvn compile

# 运行测试
mvn test

# 启动开发服务器（端口 8090）
mvn jetty:run
```

访问 http://localhost:8090/index.html ，使用 `admin` / `123456` 登录。

## 项目结构

```
src/
├── main/
│   ├── java/com/security/
│   │   ├── domain/        # 实体类 (User, LoginLog)
│   │   ├── dao/           # 数据访问层 (UserDao, LoginLogDao)
│   │   ├── service/       # 业务逻辑层 (UserService, FileService)
│   │   └── web/           # 控制器 (LoginController)
│   ├── resources/
│   │   ├── applicationContext.xml   # Spring 配置
│   │   ├── jdbc.properties          # 数据库连接配置
│   │   ├── logback.xml              # 日志配置
│   │   └── sql/                     # 数据库脚本
│   └── webapp/
│       └── WEB-INF/
│           ├── web.xml
│           ├── springmvc-servlet.xml
│           └── jsp/                 # JSP 视图
└── test/
    └── java/com/security/service/   # 单元测试
```

## 开发路线

- [x] 读取期货分钟交易数据
- [ ] 交易指标计算
- [ ] 进场点 / 出场点计算
- [ ] 交易算法历史数据回测
- [ ] 利用 CTP 接口实现程序化交易
