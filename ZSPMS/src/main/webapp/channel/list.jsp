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
<title>栏目列表</title>
<meta charset="UTF-8">

</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 栏目管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onclick="javascript:window.location.href='channelpid.do'"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">
 
<form action="channellist.do" method="post" style="padding-top:5px;">
<input type="hidden" value="1" name="pageNo"/>
名称: <input type="text" onkeyup="changePageNo()" value="" name="mohucname"/>
	
	<select onchange="changePageNo()" name="mohupid">
		<option value="">请选择上级栏目</option>
			<c:forEach items="${pchannels }" var="pchannel">
				<option value="${pchannel.id }" >${pchannel.cname }</option>
			</c:forEach>
	</select>
	
	<input type="submit" class="query" value="查询"/>
</form>


<form method="post" id="tableForm">

<table cellspacing="1" cellpadding="0" width="100%" border="0" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" /></th>
			<th>栏目ID</th>
			<th>栏目名</th>
			<th>上级栏目</th>
			<th >级别</th>
			<th >是否叶子</th>
			<!-- <th >顺序</th> -->
			
			<th >操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
		
		<c:forEach items="${channels }" var="channel">
			<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
				<td><input type="checkbox" name="id" value="${channel.id }"/></td>
				<td align="center">${channel.id }</td>
				<td align="center">${channel.cname }</td>
				<td align="center">${channel.pid }</td>
				<td align="center">${channel.lev }</td>
				<td align="center">${channel.leaf }</td>
				<%-- <td align="center">${channel.sort }</td> --%>
			
				<td align="center">
				<a href="channelget.do?id=${channel.id }" class="pn-opt">修改</a> | <a href="channeldelete.do?id=${channel.id }" onclick="if(!confirm('确定删除？')) {return false;}" class="pn-opt">删除</a> 
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
			
			<td align="center">
			 <a href="update.jsp" class="pn-opt">修改</a> | <a href="/admin/productDelete.do?ids=297&name=&brandId=&isShow=" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> 
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
			
			<td align="center">
			<a href="update.jsp" class="pn-opt">修改</a> | <a href="/admin/productDelete.do?ids=297&name=&brandId=&isShow=" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> 
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
			
			<td align="center">
			<a href="update.jsp" class="pn-opt">修改</a> | <a href="/admin/productDelete.do?ids=297&name=&brandId=&isShow=" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> 
			</td>
		</tr>
		<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
			<td><input type="checkbox" name="id" value="5"/></td>
			<td></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center"></td>
			<td align="center"></td>
			
			<td align="center">
			<a href="update.jsp" class="pn-opt">修改</a> | <a href="/admin/productDelete.do?ids=297&name=&brandId=&isShow=" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> 
			</td>
		</tr>
		
			
		 -->
		
	</tbody>
</table>
<div class="page pb15">
	<span class="r inb_a page_b">
		
			<a href="channellist.do?currentPage=1&mohucname=${mohucname }&mohupid=${mohupid }"><font size=2>首页</font></a>
			
			<c:if test="${requestScope.currentPage>1 }">
				<a href="channellist.do?currentPage=${requestScope.currentPage-1 }&mohucname=${mohucname }&mohupid=${mohupid }"><font size=2>上一页</font></a>
			</c:if>
			<c:if test="${requestScope.currentPage<requestScope.pageCount }">
				<a href="channellist.do?currentPage=${requestScope.currentPage+1 }&mohucname=${mohucname }&mohupid=${mohupid }"><font size=2>下一页</font></a>
			</c:if>
			
			<a href="channellist.do?currentPage=${requestScope.pageCount }&mohucname=${mohucname }&mohupid=${mohupid }"><font size=2>尾页</font></a>
		
			当前<var>${requestScope.currentPage }</var>页共<var>${requestScope.pageCount }</var>页 到第<input type='text' id='PAGENO'  size='3' />页 <input type='button' id='skip' class='hand btn60x20' value='确定' onclick="javascript:window.location.href = 'channellist.do?&currentPage=' + $('#PAGENO').val() +'&mohucname=${mohucname }&mohupid=${mohupid }'"/>
			
		
	
	</span>
</div>

</form>
</div>
</body>
</html>