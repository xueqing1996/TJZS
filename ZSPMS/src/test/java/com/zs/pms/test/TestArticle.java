package com.zs.pms.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TArticle;
import com.zs.pms.po.TChannel;
import com.zs.pms.service.ArticleService;
import com.zs.pms.vo.QueryArticle;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationcontext.xml")
public class TestArticle {
	@Autowired
	ArticleService as;
	
	public void test() {
		QueryArticle query=new QueryArticle();
		//query.setLoginname("test1");
		//query.setPassword("12345");
		query.setIshot(1);;		
		as.queryByCon(query);
	}
	
	public void testDelete(){

		try {
			as.delete(8);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void testUpdate(){
		TArticle article=new TArticle();
		article.setId(1);
		article.setAuthor("haha");
		article.setTitle("hehe");;
		try {
			as.update(article);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Test
	public void testAdd(){
		TArticle article=new TArticle();
		
		article.setTitle("vvvvvv");
		article.setAcontent("efdsdfi");
		article.setAuthor("sad");
		TChannel channel=new TChannel();
		channel.setId(3);
		article.setChannel(channel);
		article.setIsremod(1);
		article.setIshot(1);
		article.setCreator(2);
		try {
			as.insert(article);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void testPage(){
		QueryArticle query=new QueryArticle();
		System.out.println("当前页数"+as.queryPageCount(query));
		for(TArticle article:as.queryByPage(query, 1)){
			System.out.println(article.getAuthor());
		}
		
		
	}
}
