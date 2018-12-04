package com.zs.pms.controller;

import java.security.interfaces.DSAKey;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDep;
import com.zs.pms.po.TUser;
import com.zs.pms.service.DeptService;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

/**
 *用户管理器
 * 
 * @author Administrator
 *
 */
@Controller
public class UserController {
	@Autowired
	UserService us;
	@Autowired
	DeptService ds;
	
	
	
@RequestMapping("/user/list.do")//二级url
public String list(QueryUser query,String page,ModelMap map){
	//page是空
	if (page==null||"".equals(page)) {
		page="1";//默认第一页
	}
	//带回分页数据
	map.addAttribute("LIST",us.queryByPage(query, Integer.parseInt(page)));
	//带回总页数
	map.addAttribute("PAGEOUT",us.queryByCount(query));
	//回带当前页数
	map.addAttribute("PAGE",page);
	//回带查询条件
	map.addAttribute("QUERY",query);
	//返回user/list.jsp
	return "user/list";
	
}
@RequestMapping("/user/toadd.do")
public String toadd(ModelMap map){
	List<TDep> list1=ds.queryByPid(0);
	map.addAttribute("DLIST1",list1);
	List<TDep> list2=ds.queryByPid(list1.get(0).getId());
	map.addAttribute("DLIST2", list2);
	return "user/add";
}
@RequestMapping("/user/getdep.do")
@ResponseBody
public List<TDep> getDept(int pid){
	List<TDep> list=ds.queryByPid(pid);
	return list;
}
@RequestMapping("/user/add.do")
public String add(TUser user,ModelMap map,HttpSession session){
	
	try {
		TUser cuser=(TUser)session.getAttribute("CUSER");
		user.setCreator(cuser.getId());
		user.setIsenabled(1);;
		us.insert(user);
		return "redirect:list.do";
	} catch (AppException e) {
		// TODO Auto-generated catch block
		map.addAttribute("MSG",e.getErrMsg());
		return this.toadd(map);
	}
}
/**
 * 删一条
 * 
 * @param id
 * @return
 */
@RequestMapping("/user/delete.do")
public String deleteOne(int id) {
	try {
		us.delete(id);
	} catch (AppException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} // where id=? 使用索引 效率高
	// 刷新
	return "redirect:list.do";
}

/**
 * 删多条
 * 
 * @param ids
 * @return
 */
@RequestMapping("/user/deletes.do")
public String deleteMany(int[] ids) {
	us.deleteByIds(ids); 
	// 刷新
	return "redirect:list.do";

}

@RequestMapping("/user/get.do")
public String get(int id, ModelMap map) {

	// 获得用户信息
	TUser user = us.queryById(id);

	/*
	 * 部门初始化
	 */
	// 获得一级部门列表
	List<TDep> list1 = ds.queryByPid(0);

	// 获得该用户所有一级部门下的二级部门
	List<TDep> list2 = ds.queryByPid(user.getDept().getPid());

	// 一级部门
	map.addAttribute("DLIST1", list1);
	// 二级部门
	map.addAttribute("DLIST2", list2);

	// 用户信息
	map.addAttribute("USER", user);
	return "user/update";
}

@RequestMapping("/user/update.do")
public String update(TUser user,HttpSession session,ModelMap map) {
	//当地登录人
	TUser cu = (TUser) session.getAttribute("CUSER");
	//修改人=当前登录人的id
	user.setUpdator(cu.getId());
	try {
		us.update(user);
		// 刷新
		return "redirect:list.do";
	} catch (AppException e) {
		// TODO Auto-generated catch block
		map.addAttribute("MSG", e.getErrMsg());
		return get(user.getId(), map);
	}
		
}

}