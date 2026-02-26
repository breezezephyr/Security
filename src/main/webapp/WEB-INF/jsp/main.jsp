<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>证券期货分析平台</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background: #f5f6fa;
            min-height: 100vh;
        }
        .navbar {
            background: linear-gradient(135deg, #1a1a2e, #0f3460);
            color: #fff;
            padding: 0 30px;
            height: 56px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
        }
        .navbar h1 { font-size: 18px; font-weight: 500; }
        .navbar .user-info {
            font-size: 14px;
            color: rgba(255,255,255,0.85);
        }
        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
        }
        .welcome-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            padding: 32px;
            margin-bottom: 24px;
        }
        .welcome-card h2 {
            color: #1a1a2e;
            font-size: 20px;
            margin-bottom: 12px;
        }
        .welcome-card p {
            color: #666;
            line-height: 1.6;
        }
        .stats {
            display: flex;
            gap: 20px;
            margin-top: 24px;
        }
        .stat-item {
            background: #f0f4ff;
            border-radius: 8px;
            padding: 20px;
            flex: 1;
            text-align: center;
        }
        .stat-item .number {
            font-size: 28px;
            font-weight: 700;
            color: #0f3460;
        }
        .stat-item .label {
            font-size: 13px;
            color: #888;
            margin-top: 4px;
        }
        .roadmap {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            padding: 32px;
        }
        .roadmap h3 {
            color: #1a1a2e;
            font-size: 16px;
            margin-bottom: 16px;
        }
        .roadmap ol {
            padding-left: 20px;
            color: #555;
            line-height: 2;
        }
        .roadmap li.done { color: #52c41a; }
    </style>
</head>
<body>
    <nav class="navbar">
        <h1>证券期货分析平台</h1>
        <span class="user-info">欢迎, ${user.userName}</span>
    </nav>
    <div class="container">
        <div class="welcome-card">
            <h2>${user.userName}，欢迎回来！</h2>
            <p>您已成功登录证券期货分析平台。每次登录将获得 5 积分奖励。</p>
            <div class="stats">
                <div class="stat-item">
                    <div class="number">${user.credits}</div>
                    <div class="label">当前积分</div>
                </div>
                <div class="stat-item">
                    <div class="number">${user.userId}</div>
                    <div class="label">用户 ID</div>
                </div>
            </div>
        </div>
        <div class="roadmap">
            <h3>开发路线</h3>
            <ol>
                <li class="done">读取期货分钟交易数据</li>
                <li>交易指标计算</li>
                <li>进场点 / 出场点计算</li>
                <li>交易算法历史数据回测</li>
                <li>利用 CTP 接口实现程序化交易</li>
            </ol>
        </div>
    </div>
</body>
</html>
