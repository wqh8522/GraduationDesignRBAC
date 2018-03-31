package com.jeeplus.modules.sys.dao;

import com.jeeplus.common.persistence.CrudDao;
import com.jeeplus.common.persistence.annotation.MyBatisDao;
import com.jeeplus.modules.sys.entity.SystemConfig;

/**
 * 系统配置DAO接口
 * 
 */
@MyBatisDao
public interface SystemConfigDao extends CrudDao<SystemConfig> {
	
}