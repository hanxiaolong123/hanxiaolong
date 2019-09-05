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
<form action="update.do" method="post">
<input type="hidden" name="pid" value="${plant.pid }">
植物名称：<input type="text" name="pname" value="${plant.pname }"><br>
描述：<input type="text" name="content" value="${plant.content}"><br>
类别：<select name="tid">
</select><br>
<button>修改</button>
</form>
</body>
<script type="text/javascript">

	$(function(){
			$.post("selectType.do",function(obj){
				$("[name='tid']").append("<option value='0'>==请选择==</option>")
				for ( var i in obj){
					$("[name='tid']").append("<option value='"+obj[i].tid+"'>"+obj[i].tname+"</option>")
					$("[name='tid']").val(${plant.tid})
				}
			},'json')
		})
</script>
</html>