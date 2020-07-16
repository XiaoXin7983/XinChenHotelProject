
function toJump(url, param, selector) {
	/* 处理参数 */
	selector = selector || "#main";
	
//	alert(url);
//	alert(param);
//	alert(selector);
	
	/* ajax */
	$.post(url, param, function(data) {
		$(selector).html(data);
	}, "html");
}