
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户新增</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="../res/lecheng/css/admin.css" rel="stylesheet"
		type="text/css" />
	<link href="../res/common/css/theme.css" rel="stylesheet"
		type="text/css" />
	<link href="../res/common/css/jquery.validate.css" rel="stylesheet"
		type="text/css" />
	<link href="../res/common/css/jquery.treeview.css" rel="stylesheet"
		type="text/css" />
	<link href="../res/common/css/jquery.ui.css" rel="stylesheet"
		type="text/css" />

	<script type="text/javascript" src="../js/DatePicker/WdatePicker.js"></script>

	<script src="../res/common/js/jquery.js" type="text/javascript"></script>

	<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
	<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
	<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
	<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>

	<link rel="stylesheet" href="../res/css/style.css" />

	<script type="text/javascript">
	function upload() {
		//ajax请求和异步提交
		//ajaxSubmit---->jquery.form.js
		//组装参数
		var as = {
			url : $("#path").val()+"/upload/common.do", //提交路径
			dataType : "text", //返回文本类型
			type : "post", //提交方式
			success : function(result) {
				//img  回显
				$("#img").attr("src",$("#path").val()+"/upload/" + result);
				//装隐藏域的值
				$("#picurl").val(result);

			}// 成功执行 data是返回值
		};
		//局部表单提交
		$("#jvForm").ajaxSubmit(as);

	}
	
	//文档就绪事件 
	$(function() {

		//在一级部门的改变事件中
		$("#dep1").change(
				function() {
					//清空下拉框2
					$("#dep2").empty();

					//发ajax请求
					$.post("getdep.do", //url
					{
						pid : this.value
					}, //json类型数据 传值
					function(data) {
						//装载数据
						if (data != null) {
							$(data).each(
									function() {
										//装到下拉框中
										$("#dep2").append("<option value="+this.id+">"+ this.name+ "</option>");
									});
						}
					}, //成功后执行
					"json" //返回类型
					)
				});
	});
	
	
</script>
</head>
<body>
<input type="hidden" id="path" value="${pageContext.request.contextPath}" />
	<div class="box-positon">
		<div class="rpos">当前位置: 用户管理 - 添加</div>
		<form class="ropt">
			<input type="submit" onclick="this.form.action='userlist.do';"
				value="返回列表" class="return-button" />
		</form>
		<div class="clear"></div>
	</div>
	<div class="body-box" style="float: right">
		<form id="jvForm" action="add.do" method="post" onsubmit="return chkAll()">
			<table cellspacing="1" cellpadding="2" width="100%" border="0"
				class="pn-ftable">
				<tbody>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired"></span> <span class="pn-frequired">${msg}</span>
						</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 用户名:</td>
						<td width="80%" class="pn-fcontent"><input type="text" class="required" name="loginname" id="loginname"  maxlength="100" onblur="chkloginname()"  />
						<span id="resultName"></span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 密码:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							class="required" name="password" id="password" maxlength="100"
							onblur="chkpassword()" /> <span id="resultPwd"></span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 确认密码:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							class="required" name="repwd" id="repwd" maxlength="100"
							onblur="chkRePwd()" /> <span id="resultRepwd"></span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h"><span
							class="pn-frequired">*</span> 真实姓名:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							class="required" name="realname" id="realname" maxlength="100"
							onblur="chkrealname()" /> <span id="resultRename"></span></td>
					</tr>

					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">性别:</td>
						<td width="80%" class="pn-fcontent"><input type="radio"
							name="sex" checked value="男" />男 <input type="radio" name="sex"
							value="女" />女</td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">出生日期:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							name="birthday" maxlength="80" class="Wdate"
							onclick="WdatePicker()" readonly="readonly" /></td>
					</tr>


					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">部门:</td>
						<td width="80%" class="pn-fcontent">
							<!--一级部门-->
							 <select id="dep1" name="dep1">
								<c:forEach items="${DLIST1}" var="d1">
									<option value="${d1.id}">${d1.name}</option>

								</c:forEach>
						</select> 
						<!--二级部门 --> 
						<select id="dep2" name="dept.id">
							<c:forEach items="${DLIST2}" var="d2">
									<option value="${d2.id}">${d2.name}</option>

								</c:forEach>
								
						</select>
						</td>
					</tr>

					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">邮箱:</td>
						<td width="80%" class="pn-fcontent"><input type="text"
							class="required" name="email" id="email" maxlength="80"
							onblur="chkemail()" /> <span id="resultEmail"></span></td>
					</tr>
					<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">头像:</td>
						<td width="80%" class="pn-fcontent">
						<input type="file"  name="file" onchange="upload()" /> 
						<img id="img" width="150px"  height="150px" /> <!--用于显示--> 
						<input type="hidden" name="picurl"  id="picurl" /> <!--用于带值--></td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td class="pn-fbutton" colspan="2"><input type="submit"
							class="submit" value="提交"  onclick="return confirm('是否确定提交');" />
							&nbsp; <input type="reset" class="reset" value="重置" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>

