package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TArticle;
import com.zs.pms.vo.QueryArticle;
/**
 * 文章表的数据接口
 * @author Administrator
 *
 */
public interface ArticleDao {
	//通过条件查询
		public List<TArticle> queryByCon(QueryArticle query);
//		查分页
		public List<TArticle> queryByPage(QueryArticle query);
//		通过主键查询
		public TArticle queryById(int id);
//		批量删除
		public void deleteByIds(int[] ids);
//		修改
		public void update(TArticle article);
//		查询总条数
		public int queryCount(QueryArticle query);
//		增加
		public int insert(TArticle article);
//		删除
		public void delete(int id);
	}

