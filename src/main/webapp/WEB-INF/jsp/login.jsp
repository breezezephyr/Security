<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>证券期货分析平台 - 登录</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            padding: 40px;
            width: 380px;
        }
        .login-card h1 {
            text-align: center;
            color: #1a1a2e;
            font-size: 22px;
            margin-bottom: 8px;
        }
        .login-card .subtitle {
            text-align: center;
            color: #888;
            font-size: 13px;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-size: 14px;
            color: #333;
            margin-bottom: 6px;
            font-weight: 500;
        }
        .form-group input {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.2s;
            outline: none;
        }
        .form-group input:focus {
            border-color: #0f3460;
            box-shadow: 0 0 0 3px rgba(15,52,96,0.1);
        }
        .error-msg {
            background: #fff2f0;
            border: 1px solid #ffccc7;
            color: #cf1322;
            padding: 8px 12px;
            border-radius: 6px;
            font-size: 13px;
            margin-bottom: 16px;
        }
        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 24px;
        }
        .btn {
            flex: 1;
            padding: 10px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.2s;
        }
        .btn-primary {
            background: #0f3460;
            color: #fff;
        }
        .btn-primary:hover { background: #1a4a7a; }
        .btn-secondary {
            background: #f0f0f0;
            color: #666;
        }
        .btn-secondary:hover { background: #e0e0e0; }
    </style>
</head>
<body>
    <div class="login-card">
        <h1>证券期货分析平台</h1>
        <p class="subtitle">Security & Futures Analysis Platform</p>
        <c:if test="${!empty error}">
            <div class="error-msg"><c:out value="${error}"/></div>
        </c:if>
        <form action="<c:url value="loginCheck.html"/>" method="post">
            <div class="form-group">
                <label for="userName">用户名</label>
                <input type="text" id="userName" name="userName" placeholder="请输入用户名" autofocus>
            </div>
            <div class="form-group">
                <label for="password">密码</label>
                <input type="password" id="password" name="password" placeholder="请输入密码">
            </div>
            <div class="btn-group">
                <input type="submit" value="登 录" class="btn btn-primary">
                <input type="reset" value="重 置" class="btn btn-secondary">
            </div>
        </form>
    </div>
</body>
</html>
