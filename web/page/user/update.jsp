<%@page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市订单管理系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" />
</head>
<body>
	<div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>用户管理页面 >> 用户修改页面</span>
    </div>
    <div class="providerAdd">
        <form id="userForm" name="userForm" method="post" action="jsp/user.do">
            <div>
                <label for="realName">用户姓名：</label>
                <input type="text" name="realName" id="realName" value="${userInfo.realName}">
                <font color="red"></font>
            </div>
            <div>
                <label >用户性别：</label>
                <select name="gender" id="gender">
                    <option value="1" <c:if test="${userInfo.gender == 1 }">selected</c:if>>男</option>
                    <option value="0" <c:if test="${userInfo.gender == 0 }">selected</c:if>>女</option>
                </select>
            </div>
            <div>
                <label for="birthday">出生日期：</label>
                <input type="text" Class="Wdate" id="birthday" name="birthday" readonly="readonly" 
                	value="<fmt:formatDate value="${userInfo.birthday }" pattern="yyyy-MM-dd"/>"
                       onclick="WdatePicker();">
                <font color="red"></font>
            </div>

            <div>
                <label for="phone">用户电话：</label>
                <input type="text" name="phone" id="phone" value="${userInfo.phone }">
                <font color="red"></font>
            </div>
            <div>
                <label for="address">用户地址：</label>
                <input type="text" name="address" id="address" value="${userInfo.address }">
            </div>
            <div>
                <label >用户角色：</label>
                <select name="roleId" id="roleId">
                	<c:forEach items="${roleName }" var="t" varStatus="line">
                		<option value="${line.index }"
                			<c:if test="${userInfo.roleId == line.index }">selected</c:if>
                		>${t }</option>
                	</c:forEach>
                </select>
                <font color="red"></font>
            </div>
            <div class="providerAddBtn">
                <input type="button" id="save" value="保存" />
                <input type="button" id="reset" value="重置" />
                <input type="button" id="back" value="返回"/>
            </div>
        </form>
    </div>
</body>
<!-- 保存当前页的后台路径和参数 -->
<c:set var="urlLoading" value="${pageContext.request.contextPath}/user/detail" scope="session"></c:set>
<c:set var="paramLoading" value="id=${userInfo.id }&page=update.jsp" scope="session"></c:set>

<script type="text/javascript">
$(".providerAddBtn :button[value='保存']").bind("click", function() {
	
	if(!confirm("确定保存吗?")) return;
	
	toJump("${pageContext.request.contextPath}/user/update", 
			$("#userForm").serialize()+"&id=${userInfo.id}", "#mainframe");
});
$(".providerAddBtn :button[value='返回']").bind("click", function() {
	toJump("${pageContext.request.contextPath}/user/query", 
			"curr=${paUser.curr}&realName=${realName}&roleId=${roleId}", "#mainframe");
});
$(".providerAddBtn :button[value='重置']").bind("click", function() {
	$("#userForm [name='realName']").val("${userInfo.realName}");
	$("#userForm [name='birthday']").val("${userInfo.birthday}");
	$("#userForm [name='phone']").val("${userInfo.phone}");
	$("#userForm [name='address']").val("${userInfo.address}");
	
	$("#userForm [name='gender'] option[value='${userInfo.gender}']").attr("selected", true);
	$("#userForm [name='roleId'] option[value='${userInfo.roleId}']").attr("selected", true);
});
</script>
</html>
