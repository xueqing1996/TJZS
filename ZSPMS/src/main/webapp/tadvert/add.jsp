<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- 引时间控件 -->
<script type="text/javascript" src="../js/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="../res/css/style.css" />






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

<title>advert-add</title>
<script type="text/javascript">
	//不为空
	var CHKNOTNULL="^[\s\S]*.*[^\s][\s\S]*$";
	//日期     yyyy-MM-dd  月份1-12     日期1-31
	var CHKDATE="^[0-9]{4}-0?[1-9]|1[0-2]-0?[1-9]|[1-2][0-9]|3[0-1]$";
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
	function chkcrman(){
		//获取内容
		var crman=$("#crman").val();
		//定义内容匹配的正则表达式
		var reg=new RegExp(CHKNOTNULL);
		if (reg.test(crman)) {//表示输入正确
			$("#resultcrman").html("✔");
			$("#resultcrman").css("color","green");
			return true;
		} else {//输入失败 
			$("#resultcrman").html("不能为空");
			$("#resultcrman").css("color","red");
			$("#crman").val();
			$("#crman").focus();
			return false;
		}
	}
	function chkcrtime(){
		//获取内容
		var crtime=$("#crtime").val();
		//定义内容匹配的正则表达式
		var reg=new RegExp(CHKDATE);
		if (reg.test(crtime)) {//表示输入正确
			$("#resultcrtime").html("✔");
			$("#resultcrtime").css("color","green");
			return true;
		} else {//输入失败 
			$("#resultcrtime").html("格式不正确");
			$("#resultcrtime").css("color","red");
			$("#crtime").val();
			$("#crtime").focus();
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
	<div class="rpos">当前位置: 广告管理 - 添加</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='http://localhost:8080/ZSCMS/advertlist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>

<div class="body-box" style="float:right">
	<form id="jvForm" action="http://localhost:8080/ZSCMS/advertadd.do" method="post" >
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody id="tab_1">
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						广告标题:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="title" maxlength="100" size="100" onblur="chktitle()"/>
						<span id="resulttitle"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						
						广告内容:</td><td width="80%" class="pn-fcontent">
						<textarea name="content" rows="30" cols="100" onblur="chkcontent()"></textarea>
						<span id="resultcontent"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						公告时间:</td><td width="80%" class="pn-fcontent">
						<input type="text"  name="crtime" maxlength="80"  class="Wdate" onclick="WdatePicker()" />
						
					</td>
				</tr>
				<!-- 
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						
						公告人:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="crman" maxlength="100" size="30"/>
					</td>
				</tr>
				 -->
				
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