package com.zs.pms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zs.pms.dao.DeptDao;
import com.zs.pms.po.TDep;
import com.zs.pms.service.DeptService;

@Service
public class DeptServiceImpl implements DeptService{
	@Autowired
	DeptDao dao;

	@Override
	/**
	 * 根据上级id获得部门信息
	 */
	public List<TDep> queryByPid(int pid) {
		// TODO Auto-generated method stub
		return dao.queryByPid(pid);
	}

}
