package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TDep;

public interface DeptDao {
	//根据上级id获得部门列表
	public List<TDep> queryByPid(int pid);
	
}
