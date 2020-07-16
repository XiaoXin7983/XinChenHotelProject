<%@page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市订单管理系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
</head>
<body>
	<div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>用户管理页面 >> 用户信息查看页面</span>
    </div>
    
    <div class="${updateClass }">${updateMsg }</div>
   	<c:remove var="updateMsg" scope="session"/>
	<c:remove var="updateClass" scope="session"/>
	
    <div class="providerView">
        <p><strong>用户账号：
        	</strong><span>${userInfo.userName }</span></p>

        <p><strong>用户姓名：
        	</strong><span>${userInfo.realName }</span></p>

        <p><strong>用户性别：
        	</strong><span>${userInfo.gender == 1 ? '男' : '女' }</span></p>

        <p><strong>出生日期：
        	</strong><span><fmt:formatDate value="${userInfo.birthday }" pattern="yyyy-MM-dd"/>
        </span></p>

        <p><strong>用户电话：
        	</strong><span>${userInfo.phone }</span></p>

        <p><strong>用户地址：
        	</strong><span>${userInfo.address }</span></p>

        <p><strong>用户角色：
        	</strong><span>${roleName[userInfo.roleId] }</span></p>

        <div class="providerAddBtn">
            <input type="button" id="update" value="修改" >
            <input type="button" id="delete" value="删除" >
            <input type="button" id="back" value="返回">
        </div>
    </div>
</body>
<!-- 保存当前页的后台路径和参数 -->
<c:set var="urlLoading" value="${pageContext.request.contextPath}/user/detail" scope="session"></c:set>
<c:set var="paramLoading" value="id=${userInfo.id }&page=detail.jsp" scope="session"></c:set>

<script type="text/javascript">
$(".providerAddBtn :button[value='修改']").bind("click", function() {
	toJump("${pageContext.request.contextPath}/page/user/update.jsp", null, "#mainframe");
});
$(".providerAddBtn :button[value='返回']").bind("click", function() {
	toJump("${pageContext.request.contextPath}/user/query", 
			"curr=${paUser.curr}&realName=${realName}&roleId=${roleId}", "#mainframe");
});
$(".providerAddBtn :button[value='删除']").bind("click", function() {
	
	if(!confirm("确定删除用户${userInfo.realName}吗?")) return;
	
	toJump("${pageContext.request.contextPath}/user/remove", 
			"id=${userInfo.id}&curr=${paUser.curr}&realName=${realName}&roleId=${roleId}", "#mainframe");
});
</script>
</html>
