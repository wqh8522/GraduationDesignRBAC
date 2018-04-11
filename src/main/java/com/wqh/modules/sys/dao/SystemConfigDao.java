package com.wqh.modules.sys.dao;

import com.wqh.common.persistence.CrudDao;
import com.wqh.common.persistence.annotation.MyBatisDao;
import com.wqh.modules.sys.entity.SystemConfig;
import com.wqh.modules.sys.entity.SystemConfig;

/**
 * 系统配置DAO接口
 * 
 */
@MyBatisDao
public interface SystemConfigDao extends CrudDao<SystemConfig> {
	
}