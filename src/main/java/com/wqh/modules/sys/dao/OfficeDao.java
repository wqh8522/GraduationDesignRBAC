package com.wqh.modules.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wqh.common.persistence.TreeDao;
import com.wqh.common.persistence.annotation.MyBatisDao;
import com.wqh.modules.sys.entity.Office;

/**
 * 机构DAO接口
 * 
 * @version 2014-05-16
 */
@MyBatisDao
public interface OfficeDao extends TreeDao<Office> {
	
	public Office getByCode(String code);
	
	public List<Office> getByCodes(@Param("code") String code);
}
