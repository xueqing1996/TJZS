<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt"  prefix="c"%>

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
<title>文章列表</title>
<meta charset="UTF-8">

</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 文章管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onclick="javascript:window.location.href='channelid.do'"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">

<form action="articlelist.do" method="post" style="padding-top:5px;">
<input type="hidden" value="1" name="pageNo"/>
文章标题: <input type="text" onkeyup="changePageNo()" value="" name="mohutitle"/>
	 
	<select onchange="changePageNo()" name="mohuchannel">
		<option value="">请选择所属栏目</option>
			<c:forEach items="${channels }" var="channel">
				<option value="${channel.id }" >${channel.cname }</option>
			</c:forEach>
	</select>
	<!--
	<select onchange="changePageNo()" name="author">
		<option value="">请选择作者</option>
			<option value="1" >1</option>
			<option value="2" >2</option>
			<option value="3" >3</option>
	</select>
	<select onchange="changePageNo()" name="isremod">
		<option  value="1">推荐</option>
		<option   value="0">非推荐</option>
	</select>
	<select onchange="changePageNo()" name="ishot">
		<option  value="1">热点</option>
		<option   value="0">非热点</option>
	</select>
	 -->
	<input type="submit" class="query" value="查询"/>
</form>


<form method="post" id="tableForm">

<table cellspacing="1" cellpadding="0" width="100%" border="0" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" /></th>
			<th>文章ID</th>
			<th>标题</th>
			<th>内容</th>
			<th >作者</th>
			<th >添加日期</th>
			<th >所属栏目</th>
			<th >是否推荐</th>
			<th >是否热点</th>
			<th >操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
		
		
		<c:forEach items="${articles }" var="article">
			<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
				<td><input type="checkbox" name="id" value="${article.id }"/></td>
				<td align="center">${article.id }</td>
				<td align="center">${article.title }</td>
				<td align="center">${article.content }</td>
				<td align="center">${article.author }</td>
				<td align="center">${article.crtime }</td>
				<td align="center">${article.cname }</td>
				<td align="center">${article.remod }</td>
				<td align="center">${article.hot }</td>
				<td align="center">
				<!-- <a href="file:///e:/Bochy/Resource/webfront/paixiewang/paixiewang/detail.html" class="pn-opt">查看</a> |  -->
				<a href="articleget.do?id=${article.id }" class="pn-opt">修改</a> | <a href="articledelete.do?id=${article.id }" onclick="if(!confirm('确定删除？')) {return false;}" class="pn-opt">删除</a> 
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
		
			
			<a href="articlelist.do?currentPage=1&mohutitle=${mohutitle }&mohuchannel=${mohuchannel }"><font size=2>首页</font></a>
			
			<c:if test="${requestScope.currentPage>1 }">
				<a href="articlelist.do?currentPage=${requestScope.currentPage-1 }&mohutitle=${mohutitle }&mohuchannel=${mohuchannel }"><font size=2>上一页</font></a>
			</c:if>
			<c:if test="${requestScope.currentPage<requestScope.pageCount }">
				<a href="articlelist.do?currentPage=${requestScope.currentPage+1 }&mohutitle=${mohutitle }&mohuchannel=${mohuchannel }"><font size=2>下一页</font></a>
			</c:if>
			
			<a href="articlelist.do?currentPage=${requestScope.pageCount }&mohutitle=${mohutitle }&mohuchannel=${mohuchannel }"><font size=2>尾页</font></a>
		
			当前<var>${requestScope.currentPage }</var>页共<var>${requestScope.pageCount }</var>页 到第<input type='text' id='PAGENO'  size='3' />页 <input type='button' id='skip' class='hand btn60x20' value='确定' onclick="javascript:window.location.href = 'articlelist.do?&currentPage=' + $('#PAGENO').val() +'&mohutitle=${mohutitle }&mohuchannel=${mohuchannel }'"/>
			
		
	
	</span>
</div>

</form>
</div>
</body>
</html>