package com.zs.pms.controller;

import java.util.Date;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.utils.DateUtil;
import com.zs.pms.vo.QueryUser;

@Controller
public class FrameController {
	@Autowired
	UserService us;
	@RequestMapping("/tologin.do")
	public String tologin(){
		return "login";
	}
	@RequestMapping("/login.do")
	/**
	 * 检测登录
	 * @param query 登录名和密码
	 * @param model 验证码
	 * @param session 产生会话
	 * @param map 回带数据
	 * @return   返回页面 
	 */
	public String login(QueryUser query,String code,ModelMap map,HttpSession session){
		
		//验证码验证
		//从session中取得kaptcha生成的验证码
		String ocode = (String)session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		
		//验证码不相同
		if (!ocode.equals(code)) {
			//页面带回信息
			map.addAttribute("MSG", "验证码输入有误，请重新输入");
			 //回到登录页面
			return"login";
		}
		//验证码相同，校验登录
		TUser user;
		try {
			user =us.chkLogin(query);
			session.setAttribute("CUSER", user);
			//当前日期
			session.setAttribute("TODAY", DateUtil.getStrDate(new Date()));
			return "main";
		} 
		//业务异常
		catch (AppException e) {
			map.addAttribute("MSG", e.getErrMsg());
			//回到登录页面
			return "login";
		}
		//系统异常
		catch (Exception e1) {
			// TODO: handle exception
			e1.printStackTrace();
			return"error";
		}
		
	}
	@RequestMapping("/totop.do")
	/**
	 *  去top页
	 *  @return
	 */
	public String toTop(){
		return "top";
	}
	@RequestMapping("/toleft.do")
	//去左侧菜单
	public String toLeft(){
		return "left";
	}
	@RequestMapping("/toright.do")
	//去右侧页面
	public String toRight(){
		return "right";
	}
}
