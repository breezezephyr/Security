# AGENTS.md

## Cursor Cloud specific instructions

### Overview

Java/Spring MVC 证券期货分析平台。Spring 4.3 + JdbcTemplate + JSP + Jetty 9.4，端口 8090。

### Prerequisites

- **JDK 8** — `JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64`
- **Maven 3.x**
- **MySQL 8.0** — 在容器中需手动启动：`sudo mysqld --user=mysql --daemonize`，之后 `sudo chmod 755 /var/run/mysqld`。
  - MySQL 8.0 须设置 `character-set-server=utf8` 和 `default-authentication-plugin=mysql_native_password`。

### Database Setup

数据库脚本位于 `src/main/resources/sql/`。连接配置在 `src/main/resources/jdbc.properties`（默认 root/201407）。

```bash
mysql -u root -p < src/main/resources/sql/schema.sql
mysql -u root -p < src/main/resources/sql/data.sql
```

### Common Commands

| Task | Command |
|------|---------|
| Build | `mvn compile` |
| Test | `mvn test` |
| Run (dev) | `mvn jetty:run` (port 8090) |
| Login | http://localhost:8090/index.html (admin / 123456) |

### Gotchas

- 所有测试依赖 live MySQL 连接，没有内存数据库配置。
- `FileServiceTest` 从工作目录读取 `M1505.TXT` — 须在项目根目录 (`/workspace`) 运行测试。
- `mvn jetty:run` 前台运行，每 10 秒扫描变更热重载。
