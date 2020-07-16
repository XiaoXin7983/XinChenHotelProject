<%@page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>系统登录 - 超市订单管理系统</title>
    <link href="/css/style.css" rel="stylesheet"/>
</head>
<body class="login_bg">
<section class="loginBox">
    <header class="loginHeader">
        <h1>超市订单管理系统</h1>
    </header>
    <section class="loginCont">
        <form class="loginForm" action="/user/login" name="actionForm" id="actionForm" method="post" >
            <div class="info">${msg }</div>
            <c:remove var="msg" scope="session"/>
            <div class="inputbox">
                <label for="userName">用户名：</label>
                <input type="text" class="input-text" id="userName" name="userName" placeholder="请输入用户名" required/>
            </div>
            <div class="inputbox">
                <label for="password">密码：</label>
                <input type="password" id="password" name="password" placeholder="请输入密码" required/>
            </div>
            <div class="subBtn">
                <input type="submit" value="登录"/>
                <input type="reset" value="重置"/>
            </div>
        </form>
    </section>
</section>
</body>
</html>
