package com.zs.pms.service;

import java.util.List;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TArticle;
import com.zs.pms.vo.QueryArticle;

public interface ArticleService {
//	条件查询
	public List<TArticle> queryByCon(QueryArticle query);
//	批量删除
	public void deleteByIds(int[] ids);
//	删除一条
	public void delete(int id)throws AppException;
//	修改
	public void update(TArticle article) throws AppException;
//	增加
	public int insert(TArticle article)throws AppException;
//	获得一条
	public TArticle queryById(int id);
//	查分页
	public List<TArticle> queryByPage(QueryArticle query,int page);
//	获得总页数
	public int queryPageCount(QueryArticle query);
}
