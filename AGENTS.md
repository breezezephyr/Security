# AGENTS.md

## Cursor Cloud specific instructions

### Overview

This is a Java/Spring MVC web application — a securities & futures trading analysis platform (证券期货分析平台). It uses Spring 3.2.5, JdbcTemplate for data access, JSP views, and runs on Jetty 6.1.26 (port 8090).

### Prerequisites

- **JDK 8** — set `JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64`; also use `update-alternatives` to make it the default `java`/`javac`.
- **Maven** — `apt install maven`
- **MySQL 8.0** — needs special configuration for compatibility with the old mysql-connector-java 5.1.29 driver:
  - Set `character-set-server=utf8` and `default-authentication-plugin=mysql_native_password` in `/etc/mysql/mysql.conf.d/mysqld.cnf`.
  - In this container environment, start MySQL manually: `sudo mysqld --user=mysql --daemonize` (systemd doesn't work).
  - After start, ensure `/var/run/mysqld/` is readable: `sudo chmod 755 /var/run/mysqld`.
  - Replace the cached `mysql-connector-java-5.1.29.jar` in `~/.m2/repository/mysql/mysql-connector-java/5.1.29/` with version 5.1.49 to avoid "Could not retrieve transaction read-only status" errors against MySQL 8.0.

### Private Dependencies (Qunar internal)

The `pom.xml` references a private parent POM (`qunar.common:qunar-supom-generic:1.3.2`) and internal libraries (`qunar.common:common-web`, `com.qunar.base:meerkat-mybatis`). These are unavailable from Maven Central. To build:

1. Install a local parent POM at `~/.m2/repository/qunar/common/qunar-supom-generic/1.3.2/` that provides `<dependencyManagement>` entries for all dependencies without explicit versions in the project POM.
2. Install empty stub JARs for `qunar.common:common-web:8.1.6` and `com.qunar.base:meerkat-mybatis:2.2.0` (these are declared but not actually used in the code).

### Database Setup

- MySQL database: `sampledb` on `localhost:3306` (root / 201407 — hardcoded in `applicationContext.xml`).
- Required tables: `t_user` (columns: `user_id` AUTO_INCREMENT PK, `user_name`, `password`, `credits`, `last_visit`, `last_ip`) and `t_login_log` (`login_log_id` AUTO_INCREMENT PK, `user_id`, `ip`, `login_datetime`).
- Seed data: `INSERT INTO t_user (user_name, password, credits) VALUES ('admin', '123456', 0)`.

### Common Commands

| Task | Command |
|------|---------|
| Build | `mvn compile` |
| Test | `mvn test` |
| Run app (dev) | `mvn jetty:run` (serves on port 8090) |
| Login URL | `http://localhost:8090/index.html` (user: `admin` / pass: `123456`) |

### Gotchas

- The `UserDao.queryForInt` is deprecated in Spring 3.2.x — produces a compiler warning but compiles fine.
- All tests require a live MySQL connection (`applicationContext.xml` is shared between main and test). There are no in-memory/mock database configs.
- The `FileServiceTest` reads `M1505.TXT` from the working directory — run tests from the project root (`/workspace`).
- `mvn jetty:run` runs in the foreground with hot-reload scanning every 10 seconds.
