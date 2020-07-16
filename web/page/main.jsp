<%@page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市订单管理系统</title>
    <link rel="icon" href="/dir/favicon.ico" mce_href="/dir/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/dir/favicon.ico" mce_href="/dir/favicon.ico" type="image/x-icon">
    <link rel="icon" href="animated_favicon1.gif" type="image/gif" >
    <link rel="stylesheet" href="/css/style.css"/>
    <link rel="stylesheet" href="/css/public.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市订单管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！
           </span><span style="color: #fff21b"> ${roleName[loginInfo.roleId] } 
           	${loginInfo.realName } </span> , 欢迎你！</p>
        <a href="/user/logoff" onclick="return confirm('确定退出吗?')">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>

<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
            	<c:if test="${loginInfo.roleId == 0 || loginInfo.roleId == 3 }">
	                <li><a href="jsp/bill.do?method=query">订单管理</a></li>
            	</c:if>
            	<c:if test="${loginInfo.roleId == 0 || loginInfo.roleId == 2 }">
	                <li><a href="jsp/provider.do?method=query">供应商管理</a></li>
            	</c:if>
            	<c:if test="${loginInfo.roleId == 0 || loginInfo.roleId == 1 }">
                	<li><a href="javascript:toJump('${pageContext.request.contextPath}/user/query', '', '#mainframe')">用户管理</a></li>
            	</c:if>
                <li><a href="jsp/pwdmodify.jsp">密码修改</a></li>
                <li><a href="${pageContext.request.contextPath}/logoff" onclick="return confirm('确定退出吗?')">退出系统</a></li>
            </ul>
        </nav>
    </div>

    <div class="right" id="mainframe">
        <!-- 主体内容发生变化的地方开始-->
        
        <!-- 主体内容发生变化的地方结束-->
    </div>
</section>


<footer class="footer">
    版权归北大青鸟
</footer>
<script src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/time.js"></script>
<script src="/js/jump.js"></script>
<script src="/js/common.js"></script>
<script src="/calendar/WdatePicker.js"></script>
</body>
<script type="text/javascript">

//获取当前需要加载的mainframe的页面路径
var urlLoading = "${urlLoading}";
var paramLoading = "${paramLoading}";

urlLoading = urlLoading || "/page/wel.jsp";

//alert(urlLoading + ", " + paramLoading)

//使用ajax加载对应的页面
toJump(urlLoading, paramLoading, "#mainframe");


</script>
</html>
