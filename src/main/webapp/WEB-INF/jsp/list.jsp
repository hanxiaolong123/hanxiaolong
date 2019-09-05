<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/index_work.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="list.do" method="post" id="start">
	<input type="hidden" name="cpage" value="${map.cpage }">
	<input type="text" name="pname">
	<button>查找</button>
</form>
<table>
	<tr>
		<td><input type="checkbox" onclick="qx()">全选/全不选</td>
		<td>编号</td>
		<td>名称</td>
		<td>描述</td>
		<td>类别</td>
		<td>操作
		<input type="button" value="添加" onclick="location='add.do'">
		 </td>
	</tr>
	<c:forEach items="${list }" var="em">
	<tr>
		<td><input type="checkbox" name="xz" value="${em.pid }"></td>
		<td>${em.pid }</td>
		<td>${em.pname }</td>
		<td>${em.content }</td>
		<td>${em.tname }</td>
		<td>
		<input type="button" value="修改" onclick="location='toupdate.do?pid=${em.pid }'"> 
		<input type="button" value="删除" onclick="location='delete.do?pid=${em.pid }'"> 
		</td>
	</tr>
	</c:forEach>
	
	<tr>
		<td><input type="button" value="批量删除" onclick="deleteAll()"></td>
		<td colspan="11">
		<input type="button" value="首页" onclick="page('1')">
		<input type="button" value="上一页" onclick="page('${page.pageNum-1}')">
		<input type="button" value="下一页" onclick="page('${page.pageNum+1}')">
		<input type="button" value="尾页" onclick="page('${page.pages}')">
		</td>
	</tr>
</table>
</body>
<script type="text/javascript">

	function page(cpage) {
		$("[name='cpage']").val(cpage);
		$("#start").submit();
	}

	var flay;
	function qx() {
		var arr = $("[name='xz']")
		if (flay) {
			for (var i = 0; i < arr.length; i++) {
				arr[i].checked=false;
			}
			flay=false;
		} else {
			for (var i = 0; i < arr.length; i++) {
				arr[i].checked=true;
			}
			flay=true;
		}
	}
	
	function deleteAll() {
		var a = $("[name='xz']:checked")
		var arr = new Array;
		for (var i = 0; i < a.length; i++) {
			arr.push(a[i].value)
		}

		$.post("deleteAll.do",{pid:arr.toString()},function(obj){
			location.href="list.do";
			},'json')
	}
	
</script>
</html>