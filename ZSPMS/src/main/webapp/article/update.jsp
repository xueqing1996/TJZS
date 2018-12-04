<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<link href="res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- 引时间控件 -->
<script type="text/javascript" src="js/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="res/fckeditor/fckeditor.js"></script>
<script src="res/common/js/jquery.js" type="text/javascript"></script>
<script src="res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="res/common/js/lecheng.js" type="text/javascript"></script>
<script src="res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="res/css/style.css" />






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<!-- 引入jQuery -->
<script type="text/javascript" language="javascript"
	src="js/jquery-1.11.0.min.js"></script>
<!-- 引入日期控件 -->
<script type="text/javascript" language="javascript"
	src="js/DatePicker/WdatePicker.js"></script>

<title>article-update</title>
<script type="text/javascript">
//不为空
var CHKNOTNULL="^[\s\S]*.*[^\s][\s\S]*$";
function chktitle(){
	//获取标题
	var title=$("#title").val();
	//定义标题匹配的正则表达式
	var reg=new RegExp(CHKNOTNULL);
	if (reg.test(title)) {//表示输入正确
		$("#resulttitle").html("✔");
		$("#resulttitle").css("color","green");
		return true;
	} else {//输入失败 
		$("#resulttitle").html("不能为空");
		$("#resulttitle").css("color","red");
		$("#title").val();
		$("#title").focus();
		return false;
	}
}
function chkcontent(){
	//获取内容
	var content=$("#content").val();
	//定义内容匹配的正则表达式
	var reg=new RegExp(CHKNOTNULL);
	if (reg.test(content)) {//表示输入正确
		$("#resultcontent").html("✔");
		$("#resultcontent").css("color","green");
		return true;
	} else {//输入失败 
		$("#resultcontent").html("不能为空");
		$("#resultcontent").css("color","red");
		$("#content").val();
		$("#content").focus();
		return false;
	}
}
function chkauthor(){
	//获取内容
	var author=$("#author").val();
	//定义内容匹配的正则表达式
	var reg=new RegExp(CHKNOTNULL);
	if (reg.test(author)) {//表示输入正确
		$("#resultauthor").html("✔");
		$("#resultauthor").css("color","green");
		return true;
	} else {//输入失败 
		$("#resultauthor").html("不能为空");
		$("#resultauthor").css("color","red");
		$("#author").val();
		$("#author").focus();
		return false;
	}
}
function del(){
 var con=confirm("是否修改该文章");
 if (con) {
	return true;
} else {
return false;
}
}
</script>
<style type="">
.h2_ch a:hover, .h2_ch a.here {
    color: #FFF;
    font-weight: bold;
    background-position: 0px -32px;
}
.h2_ch a {
    float: left;
    height: 32px;
    margin-right: -1px;
    padding: 0px 16px;
    line-height: 32px;
    font-size: 14px;
    font-weight: normal;
    border: 1px solid #C5C5C5;
    background: url('../res/lecheng/img/admin/bg_ch.gif') repeat-x scroll 0% 0% transparent;
}
a {
    color: #06C;
    text-decoration: none;
}
</style>

</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 文章管理 - 修改</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='http://localhost:8080/ZSCMS/articlelist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>

<div class="body-box" style="float:right">
	<form id="jvForm" action="articleupdate.do?id=${article.id }" method="post" >
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody id="tab_1">
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						文章标题:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="title" maxlength="100" size="100" value="${article.title }" onblur="chktitle()"/>
						<span id="resulttitle"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						
						文章内容:</td><td width="80%" class="pn-fcontent">
						<textarea name="content" rows="30" cols="100" onblur="chkcontent()">${article.content }</textarea>
						<span id="resultcontent"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						
						作者:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="author" maxlength="100" size="30" value="${article.author }" onblur="chkauthor()"/>
						<span id="resultauthor"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						添加日期:</td><td width="80%" class="pn-fcontent">
						<input type="text"  name="crtime" maxlength="80"  class="Wdate" onclick="WdatePicker(  )" value="${article.crtime }"/>
					</td>
				</tr>
				<tr>
					
					<td width="20%" class="pn-flabel pn-flabel-h">
						
						所属栏目:</td><td width="80%" class="pn-fcontent">
						<select name="channel">
							<c:forEach items="${channels }" var="channel">
								<c:if test="${article.channel==channel.id }">
									<option value="${channel.id }" selected="selected">${channel.cname }</option>
								</c:if>
								<c:if test="${article.channel!=channel.id }">
									<option value="${channel.id }">${channel.cname }</option>
								</c:if>
							</c:forEach>
									
											
						</select>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否推荐:</td><td width="80%" class="pn-fcontent">
						<c:if test="${article.isremod==1 }">
							<input type="radio" name="isremod" value="1" checked="checked"/>推荐
							<input type="radio" name="isremod" value="0"/>非推荐
						</c:if>
						<c:if test="${article.isremod!=1 }">
							<input type="radio" name="isremod" value="1"/>推荐
							<input type="radio" name="isremod" value="0" checked="checked"/>非推荐
						</c:if>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						是否热点:</td><td width="80%" class="pn-fcontent">
						<c:if test="${article.ishot==1 }">
							<input type="radio" name="ishot" value="1" checked="checked"/>热点
							<input type="radio" name="ishot" value="0"/>非热点
						</c:if>
						<c:if test="${article.ishot!=1 }">
							<input type="radio" name="ishot" value="1"/>热点
							<input type="radio" name="ishot" value="0" checked="checked"/>非热点
						</c:if>
						
					</td>
				</tr>
				
			</tbody>
			<tbody id="tab_2" style="display: none">
				<tr>
					<td >
						<textarea rows="10" cols="10" id="productdesc" name="description"></textarea>
					</td>
				</tr>
			</tbody>
			<tbody id="tab_3" style="display: none">
				<tr>
					<td >
						<textarea rows="15" cols="136" id="productList" name="packageList"></textarea>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="pn-fbutton" colspan="2">
						<input type="submit" class="submit" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>