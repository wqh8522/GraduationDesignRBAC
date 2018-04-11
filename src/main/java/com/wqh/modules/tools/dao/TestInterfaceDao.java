package com.wqh.modules.tools.dao;

import com.wqh.common.persistence.CrudDao;
import com.wqh.common.persistence.annotation.MyBatisDao;
import com.wqh.modules.tools.entity.TestInterface;
import com.wqh.common.persistence.CrudDao;
import com.wqh.common.persistence.annotation.MyBatisDao;

/**
 * 接口DAO接口
 * 
 * @version 2016-01-07
 */
@MyBatisDao
public interface TestInterfaceDao extends CrudDao<TestInterface> {
	
}