 <%@page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>超市订单管理系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" />
<style type="text/css">
.order{ cursor: pointer; }
.order:hover{ background-color: #FFB800;}
</style>
</head>
<body>

	<div class="location">
		<strong>你现在所在的位置是:</strong> <span>用户管理页面</span>
	</div>
	<div class="${updateClass }">${updateMsg }</div>
	<c:remove var="updateMsg" scope="session"/>
	<c:remove var="updateClass" scope="session"/>
	<div class="search">
		<form id="form1">
			<input name="method" value="query" class="input-text" type="hidden">
			<span>用户姓名：</span> 
			<input name="realName" class="input-text" type="text" value="${realName }"> 
			<span>用户角色：</span> 
			<select name="roleId">
				<option value="">--请选择--</option>
				<option value="0">经理</option>
				<option value="1" <c:if test="${roleId == '1' }">selected</c:if>>人事专员</option>
				<option value="2" <c:if test="${roleId == '2' }">selected</c:if>>客户专员</option>
				<option value="3" <c:if test="${roleId == '3' }">selected</c:if>>销售专员</option>
			</select> 
			<input type="hidden" name="pageIndex" value="1" /> 
			<input value="查 询" type="button" id="searchbutton"> 
			<a href="javascript:toJump('${pageContext.request.contextPath}/page/user/add.jsp', '', '#mainframe')">添加用户</a>
		</form>
	</div>
	<!--用户-->
	<table class="providerTable" cellpadding="0" cellspacing="0">
		<tr class="firstTr">
			<th width="10%" class="order" role="userName">用户账号<span></span></th>
			<th width="20%" class="order" role="realName">用户姓名<span></span></th>
			<th width="10%" class="order" role="gender">性别<span></span></th>
			<th width="10%" class="order" role="birthday">年龄<span></span></th>
			<th width="10%">电话</th>
			<th width="10%" class="order" role="roleId">用户角色<span></span></th>
			<th width="30%">操作</th>
		</tr>

		<c:forEach items="${paUser.items }" var="t">
		
		<tr>
			<td><span>${t.userName }</span></td>
			<td><span>${t.realName }</span></td>
			<td><span>${t.gender == 1 ? '男' : '女' }</span></td>
			<td><span>${t.getAge() }</span></td>
			<td><span>${t.phone }</span></td>
			<td><span>${roleName[t.roleId] }</span></td>
			<td><span> 
					<a class="viewUser" 
						href="javascript:toJump('${pageContext.request.contextPath}/user/detail', 'id=${t.id }&page=detail.jsp', '#mainframe')"> 
						<img src="${pageContext.request.contextPath}/images/read.png" 
							alt="查看" title="查看"/>
					</a>
				</span>
				<span> 
					<a class="modifyUser" href="javascript:toJump('${pageContext.request.contextPath}/user/detail', 'id=${t.id }&page=update.jsp', '#mainframe')">
						<img src="${pageContext.request.contextPath}/images/xiugai.png"
							alt="修改" title="修改" />
					</a>
				</span>
				<span> 
					<a class="deleteUser" onclick="return confirm('确定删除用户${t.realName}吗?')" 
						href="javascript:toJump('${pageContext.request.contextPath}/user/remove', 'id=${t.id }&curr=${paUser.curr}&realName=${realName}&roleId=${roleId}', '#mainframe')"> 
						<img src="${pageContext.request.contextPath}/images/schu.png" 
							alt="删除" title="删除" />
					</a>
				</span>
			</td>
		</tr>
		</c:forEach>
	</table>
	<input type="hidden" id="totalPageCount" value="3" />

	<div class="page-bar">
		<ul class="page-num-ul clearfix">
			<li>共${paUser.count }条记录&nbsp;&nbsp;${paUser.curr }/${paUser.total }页</li>
			&nbsp;&nbsp;

			<a href="javascript:void(0)">首页</a>
			<a href="javascript:void(0)">上一页</a>
			<a href="javascript:void(0)">下一页</a>
			<a href="javascript:void(0)">尾页</a> &nbsp;&nbsp;
		</ul>
		<span class="page-go-form">
			<label>跳转至</label> 
			<input type="text" name="inputPage" id="inputPage" class="page-key" 
				value="${paUser.curr }"/>页
			<button type="button" class="page-btn">GO</button>
		</span>
	</div>

	<!--点击删除按钮后弹出的页面开始-->
	<div class="zhezhao"></div>
	<div class="remove" id="removeUse">
		<div class="removerChid">
			<h2>提示</h2>
			<div class="removeMain">
				<p>你确定要删除该用户吗？</p>
				<a href="#" id="yes">确定</a> <a href="#" id="no">取消</a>
			</div>
		</div>
	</div>
	<!--点击删除按钮后弹出的页面结束-->
</body>
<!-- 保存当前页的后台路径和参数 -->
<c:set var="urlLoading" value="${pageContext.request.contextPath}/user/query" scope="session"></c:set>
<c:set var="paramLoading" value="curr=${paUser.curr }&realName=${realName }&roleId=${roleId }" scope="session"></c:set>

<!-- 排序 -->
<script type="text/javascript">
//显示当前的排序状态
$(".firstTr .order[role='${column}'] span").html("${state == '1' ? '▽' : '△' }");
//为可以排序的标题栏添加单击事件
$(".firstTr .order").bind("click", function() {
	//获取需要排序的列名
	var column = $(this).attr("role");
	//获取当前列排序状态
	var state = $(this).find("span").text();
	
	//0表示升序△, 1表示降序▽
	state = state || "▽";
	//切换排序状态
	state = state == "▽" ? 0 : 1;
	//查询
	toJump(
		"${pageContext.request.contextPath}/user/query",
		$("#form1").serialize() + "&curr=${paUser.curr}&column="+column+"&state="+state, 
		"#mainframe"		
	);
});
 
</script>

<!-- 分页和条件查询 -->
<script type="text/javascript">
/* 设置翻页的超链接是否显示 */
var curr = "${paUser.curr}";
var total = "${paUser.total}";
//判断, 是否是第一页
if(curr == 1){
	$(".page-num-ul a:lt(2)").hide();
}
//判断, 是否是最后一页
if(curr == total){
	$(".page-num-ul a:gt(1)").hide();
}

/* $(".page-num-ul a:eq(0)").attr("href", 
		"javascript:toJump('${pageContext.request.contextPath}/user/query'," 
		+ "'curr=1&" + $("#form1").serialize() + "', '#mainframe')");
$(".page-num-ul a:eq(1)").attr("href", 
		"javascript:toJump('${pageContext.request.contextPath}/user/query'," 
		+ "'curr=${paUser.curr-1}&" + $("#form1").serialize() + "', '#mainframe')");
$(".page-num-ul a:eq(2)").attr("href", 
		"javascript:toJump('${pageContext.request.contextPath}/user/query'," 
		+ "'curr=${paUser.curr+1}&" + $("#form1").serialize() + "', '#mainframe')");
$(".page-num-ul a:eq(3)").attr("href", 
		"javascript:toJump('${pageContext.request.contextPath}/user/query'," 
		+ "'curr=${paUser.total}&" + $("#form1").serialize() + "', '#mainframe')"); */

$(".page-num-ul a:eq(0)").bind("click", function() {
	toJump(
		"${pageContext.request.contextPath}/user/query",
		$("#form1").serialize() + "&curr=1&column=${column}&state=${state}", "#mainframe"
	);
});
$(".page-num-ul a:eq(1)").bind("click", function() {
	toJump(
		"${pageContext.request.contextPath}/user/query",
		$("#form1").serialize() + "&curr=${paUser.curr-1}&column=${column}&state=${state}", "#mainframe"
	);
});
$(".page-num-ul a:eq(2)").bind("click", function() {
	toJump(
		"${pageContext.request.contextPath}/user/query",
		$("#form1").serialize() + "&curr=${paUser.curr+1}&column=${column}&state=${state}", "#mainframe"
	);
});
$(".page-num-ul a:eq(3)").bind("click", function() {
	toJump(
		"${pageContext.request.contextPath}/user/query",
		$("#form1").serialize() + "&curr=${paUser.total}&column=${column}&state=${state}", "#mainframe"
	);
});

$(".page-go-form .page-btn").bind("click", function() {
	//获取跳转目标页码
	var target = $(".page-go-form .page-key").val();
	//获取当前页
	var curr = "${paUser.curr}";
	//获取总页数
	var total = "${paUser.total}";
	
	//判断, target的值是否符合数值格式
	if(!/^\d+$/.test(target)) {
		$(".page-go-form .page-key").val(curr);
		return;
	}
	//判断, target是否在合理的范围内
	if(target == curr || target < 1 || target > total){
		$(".page-go-form .page-key").val(curr);
		return;
	}
	
	//跳转
	toJump(
		"${pageContext.request.contextPath}/user/query",
		$("#form1").serialize() + "&curr="+target+"&column=${column}&state=${state}", "#mainframe"
	);
});

//为查询按钮绑定事件
$("#searchbutton").bind("click", function() {
	toJump(
		"${pageContext.request.contextPath}/user/query",
		$("#form1").serialize(), "#mainframe"
	);
});

</script>
</html>

