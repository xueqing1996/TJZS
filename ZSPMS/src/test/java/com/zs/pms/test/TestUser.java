package com.zs.pms.test;

import java.util.Date;

import org.apache.logging.log4j.core.net.server.UdpSocketServer;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDep;
import com.zs.pms.po.TPermission;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationcontext.xml")
public class TestUser {
@Autowired
UserService us;

public void testlogin(){
	QueryUser query=new QueryUser();
	query.setLoginname("ning");
	query.setPassword("123");
	try {
		TUser user=us.chkLogin(query);
		System.out.println(user.getRealname());
		for(TPermission per:user.getPermissions()){
			System.out.println(per.getPname());
		}
		System.out.println("---------整理后--------");
		for(TPermission per1:user.getMenu()){
			System.out.println(per1.getPname());
			
			for(TPermission per2:per1.getChildren()){
				System.out.println("\t\t"+per2.getPname());
			}
		}
	} catch (AppException e) {
		// TODO Auto-generated catch block
		System.out.println(e.getErrMsg());
		
	}catch(Exception e1){
		e1.printStackTrace();
	}
	
	
	
}

public void test(){
	QueryUser query=new QueryUser();
	/*query.setLoginname("test1");
	query.setPassword("1");*/
	query.setIsenabled(1);
	query.setPage(1);
	us.queryByCon(query);
	
	
}

public void testdelete(){
	int [] ids={1,2};
	us.deleteByIds(ids);
}
@Test
public void testUpdate(){
	TUser user=new TUser();
	user.setId(3430);
	user.setSex("女");
	user.setRealname("小宁");
	user.setPicurl("111.jpg");
	try {
		us.update(user);
	} catch (AppException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

public void testAdd(){
	TUser user = new TUser();
	user.setBirthday(new Date());
	//部门
	TDep dep = new TDep();
	dep.setId(887);
	user.setDept(dep);
	user.setLoginname("nin43");
	user.setPassword("4321");
	user.setEmail("qwe@133.com");
	
	user.setRealname("宁宁");
	user.setPicurl("qqq.jpg");
	user.setSex("女");
	user.setCreator(1000);
	try {
		us.insert(user);
	} catch (AppException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
}

public void testPage(){
	QueryUser query =new QueryUser();
	System.out.println("当前总页数"+us.queryByCount(query));
	for(TUser user:us.queryByPage(query, 2)){
		System.out.println(user.getRealname());
	}
}
}
