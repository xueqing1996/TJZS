package com.zs.pms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.pms.dao.ArticleDao;
import com.zs.pms.exception.AppException;
import com.zs.pms.po.TArticle;
import com.zs.pms.service.ArticleService;
import com.zs.pms.utils.Constants;
import com.zs.pms.vo.QueryArticle;

@Service
@Transactional //该业务支持事务
public class ArticleServiceImpl implements ArticleService{
	@Autowired
	private ArticleDao adao;

	@Override
	public List<TArticle> queryByCon(QueryArticle query) {
		// TODO Auto-generated method stub
		return adao.queryByCon(query);
	}

	@Override
	public void deleteByIds(int[] ids) {
		// TODO Auto-generated method stub
		adao.deleteByIds(ids);
	}
	
	@Override
	public void delete(int id) throws AppException {
		// TODO Auto-generated method stub
		adao.delete(id);
	}

	@Override
	public void update(TArticle article) throws AppException {
		// TODO Auto-generated method stub
		adao.update(article);
	}

	@Override
	public int insert(TArticle article) throws AppException {
		// TODO Auto-generated method stub
		return adao.insert(article);
	}

	@Override
	public TArticle queryById(int id) {
		// TODO Auto-generated method stub
		return adao.queryById(id);
	}

	@Override
	public List<TArticle> queryByPage(QueryArticle query, int page) {
		// TODO Auto-generated method stub
		query.setPage(page);
		return adao.queryByPage(query);
	}

	@Override
	public int queryPageCount(QueryArticle query) {
		int count=adao.queryCount(query);
		if (count%Constants.PAGECOUNT==0) {
			return count/Constants.PAGECOUNT;
		}else {
			return count/Constants.PAGECOUNT+1;
		}
	}
}
