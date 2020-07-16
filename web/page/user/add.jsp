<%@page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市订单管理系统</title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <link type="text/css" rel="stylesheet" href="css/public.css" />
</head>
<body>

<div class="location">
    <strong>你现在所在的位置是:</strong>
    <span>用户管理页面 >> 用户添加页面</span>
</div>

<div class="${updateClass }">${updateMsg }</div>
<c:remove var="updateMsg" scope="session"/>
<c:remove var="updateClass" scope="session"/>

<div class="providerAdd">
    <form id="userForm">
        <input type="hidden" name="method" value="add">
        <!--div的class 为error是验证错误，ok是验证成功-->
        <div>
            <label for="userName">用户账号：</label>
            <input type="text" name="userName" id="userName" value="">
            <!-- 放置提示信息 -->
            <font color="red"></font>
        </div>
        <div>
            <label for="realName">用户姓名：</label>
            <input type="text" name="realName" id="realName" value="">
            <font color="red"></font>
        </div>
        <div>
            <label for="password">用户密码：</label>
            <input type="password" name="password" id="password" value="">
            <font color="red"></font>
        </div>
        <div>
            <label for="ruserPassword">确认密码：</label>
            <input type="password" id="ruserPassword" value="">
            <font color="red"></font>
        </div>
        <div>
            <label >用户性别：</label>
            <select name="gender" id="gender">
                <option value="1" selected="selected">男</option>
                <option value="0">女</option>
            </select>
        </div>
        <div>
            <label for="birthday">出生日期：</label>
            <input type="text" Class="Wdate" id="birthday" name="birthday"
                   readonly="readonly" onclick="WdatePicker();">
            <font color="red"></font>
        </div>
        <div>
            <label for="phone">用户电话：</label>
            <input type="text" name="phone" id="phone" value="">
            <font color="red"></font>
        </div>
        <div>
            <label for="address">用户地址：</label>
            <input name="address" id="address"  value="">
        </div>
        <div>
            <label >用户角色：</label>
            <!-- 列出所有的角色分类 -->
            <select name="roleId" id="roleId">
            	<option value="">请选择</option>
            	<c:forEach items="${roleName }" var="t" varStatus="line">
               		<option value="${line.index }">${t }</option>
               	</c:forEach>
            </select>
            <font color="red"></font>
        </div>
        <div class="providerAddBtn">
            <input type="button" name="add" id="add" value="保存" >
            <input type="button" id="back" name="back" value="返回" >
        </div>
    </form>
</div>
<!-- 保存当前页的路径 -->
<c:set var="urlLoading" value="${pageContext.request.contextPath}/page/user/add.jsp" scope="session"></c:set>
</body>
<script type="text/javascript">
$(".providerAddBtn :button[value='保存']").bind("click", function() {
	/* 表单验证 */
	
	/* 确认提示 */
	if(!confirm("确定保存新用户信息吗?")) return;
	
	toJump("${pageContext.request.contextPath}/user/add",
			$("#userForm").serialize() + "&page=detail.jsp", "#mainframe");
});
$(".providerAddBtn :button[value='返回']").bind("click", function() {
	toJump("${pageContext.request.contextPath}/user/query", 
			"curr=${paUser.curr}&realName=${realName}&roleId=${roleId}", "#mainframe");
});
</script>
</html>
