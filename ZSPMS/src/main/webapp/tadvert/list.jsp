<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<link href="res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="res/common/js/jquery.js" type="text/javascript"></script>
<script src="res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="res/common/js/lecheng.js" type="text/javascript"></script>
<script src="res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="res/css/style.css" />






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>广告列表</title>
<meta charset="UTF-8">

</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 广告管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onclick="javascript:window.location.href='advert/add.jsp'"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">
 
<form action="advertlist.do" method="post" style="padding-top:5px;">
<input type="hidden" value="1" name="pageNo"/>
广告标题: <input type="text" onkeyup="changePageNo()" value="" name="mohutitle"/>
	
	
	<select onchange="changePageNo()" name="mohucrman">
		<option value="">请选择公告人</option>
			<c:forEach items="${users }" var="user">
				<option value="${user.id }" >${user.realname }</option>
			</c:forEach>
			
		
	</select>
	 
	 
	<input type="submit" class="query" value="查询"/>
</form>

<form method="post" id="tableForm">

<table cellspacing="1" cellpadding="0" width="100%" border="0" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" /></th>
			<th>广告ID</th>
			<th>标题</th>
			<th>内容</th>
			<th >公告时间</th>
			<th >公告人</th>
			<th >操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
		
		<c:forEach items="${adverts }" var="advert">
			<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
				<td><input type="checkbox" name="id" value="${advert.id }"/></td>
				<td align="center">${advert.id }</td>
				<td align="center">${advert.title }</td>
				<td align="center">${advert.content }</td>
				<td align="center">${advert.crtime }</td>
				<td align="center">${advert.crmanTxt }</td>
				<td align="center">
				<!-- <a href="file:///e:/Bochy/Resource/webfront/paixiewang/paixiewang/detail.html" class="pn-opt">查看</a> |  -->
				<a href="advertget.do?id=${advert.id }" class="pn-opt">修改</a> | <a href="advertdelete.do?id=${advert.id }" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> 
				</td>
			</tr>
		</c:forEach>
		
		
		<!-- 
		<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
			<td><input type="checkbox" name="id" value="2"/></td>
			<td></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center">
			<a href="file:///e:/Bochy/Resource/webfront/paixiewang/paixiewang/detail.html" class="pn-opt">查看</a> | <a href="update.jsp" class="pn-opt">修改</a> | <a href="/admin/productDelete.do?ids=297&name=&brandId=&isShow=" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> 
			</td>
		</tr>
		<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
			<td><input type="checkbox" name="id" value="3"/></td>
			<td></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center">
			<a href="file:///e:/Bochy/Resource/webfront/paixiewang/paixiewang/detail.html" class="pn-opt">查看</a> | <a href="update.jsp" class="pn-opt">修改</a> | <a href="/admin/productDelete.do?ids=297&name=&brandId=&isShow=" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> 
			</td>
		</tr>
		<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
			<td><input type="checkbox" name="id" value="4"/></td>
			<td></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center">
			<a href="file:///e:/Bochy/Resource/webfront/paixiewang/paixiewang/detail.html" class="pn-opt">查看</a> | <a href="update.jsp" class="pn-opt">修改</a> | <a href="/admin/productDelete.do?ids=297&name=&brandId=&isShow=" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> 
			</td>
		</tr>
		
		 -->
	
		
		
	</tbody>
</table>
<div class="page pb15">
	<span class="r inb_a page_b">
		
			<a href="advertlist.do?currentPage=1&mohutitle=${mohutitle }&mohucrman=${mohucrman }"><font size=2>首页</font></a>
			
			<c:if test="${requestScope.currentPage>1 }">
				<a href="advertlist.do?currentPage=${requestScope.currentPage-1 }&mohutitle=${mohutitle }&mohucrman=${mohucrman }"><font size=2>上一页</font></a>
			</c:if>
			<c:if test="${requestScope.currentPage<requestScope.pageCount }">
				<a href="advertlist.do?currentPage=${requestScope.currentPage+1 }&mohutitle=${mohutitle }&mohucrman=${mohucrman }"><font size=2>下一页</font></a>
			</c:if>
			
			<a href="advertlist.do?currentPage=${requestScope.pageCount }&mohutitle=${mohutitle }&mohucrman=${mohucrman }"><font size=2>尾页</font></a>
		
			当前<var>${requestScope.currentPage }</var>页共<var>${requestScope.pageCount }</var>页 到第<input type='text' id='PAGENO'  size='3' />页 <input type='button' id='skip' class='hand btn60x20' value='确定' onclick="javascript:window.location.href = 'advertlist.do?&currentPage=' + $('#PAGENO').val() +'&mohutitle=${mohutitle }&mohucrman=${mohucrman }'"/>
			
		
		
	
	</span>
</div>

</form>
</div>
</body>
</html>