package com.zs.pms.po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.zs.pms.utils.DateUtil;
/**
 * 用户表的po
 * @author Administrator
 *
 */

public class TUser implements Serializable{
	 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String loginname;
	private String password;
	private String sex;
	private Date birthday;
	private String email;
	private TDep dept;
	private String realname;
	private int creator;
	private Date creatime;
	private int updator;
	private Date updatime;
	private String picurl;
	private int isenabled;
	private String birthdayTxt;
	private String isenabledTxt;
	public String getBirthdayTxt() {
		return DateUtil.getStrDate(birthday);
	}
	public void setBirthdayTxt(String birthdayTxt) {
		this.birthdayTxt = birthdayTxt;
	}
	public String getIsenabledTxt() {
		return isenabledTxt;
	}
	public void setIsenabledTxt(String isenabledTxt) {
		this.isenabledTxt = isenabledTxt;
	}
	private List<TPermission> permissions;
	private List<TPermission> menu = new ArrayList<>();
	public List<TPermission> getMenu() {
		//清空
		menu.clear();
		for(TPermission per1:permissions){
			//一级菜单
			if (per1.getPid()==0) {
				//装载一级菜单下的二级菜单
				for(TPermission per2:permissions){
					//一级菜单的id==二级菜单的pid
					//说明该权限是一级菜单的子权限
					if (per1.getId()==per2.getPid()) {
						per1.getChildren().add(per2);
					}
				}
				//将装载好的一级菜单放入菜单中
				menu.add(per1);
			}
		}
		return menu;
	}
	public void setMenu(List<TPermission> menu) {
		this.menu = menu;
	}
	public List<TPermission> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<TPermission> permissions) {
		this.permissions = permissions;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public TDep getDept() {
		return dept;
	}
	public void setDept(TDep dept) {
		this.dept = dept;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public Date getCreatime() {
		return creatime;
	}
	public void setCreatime(Date creatime) {
		this.creatime = creatime;
	}
	public int getUpdator() {
		return updator;
	}
	public void setUpdator(int updator) {
		this.updator = updator;
	}
	public Date getUpdatime() {
		return updatime;
	}
	public void setUpdatime(Date updatime) {
		this.updatime = updatime;
	}
	public String getPicurl() {
		return picurl;
	}
	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}
	public int getIsenabled() {
		return isenabled;
	}
	public void setIsenabled(int isenabled) {
		this.isenabled = isenabled;
	}
}