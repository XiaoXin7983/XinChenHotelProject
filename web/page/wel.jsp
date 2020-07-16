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
	<div>
        <img class="wColck" src="${pageContext.request.contextPath}/images/clock.jpg"/>
        <div class="wFont">
            <h2>${roleName[loginInfo.roleId] } ${loginInfo.realName }</h2>
            <p>欢迎来到超市订单管理系统!</p>
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
