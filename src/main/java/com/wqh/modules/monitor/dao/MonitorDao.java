package com.wqh.modules.monitor.dao;

import com.wqh.common.persistence.CrudDao;
import com.wqh.common.persistence.annotation.MyBatisDao;
import com.wqh.modules.monitor.entity.Monitor;

/**
 * 系统监控DAO接口
 * 
 * @version 2016-02-07
 */
@MyBatisDao
public interface MonitorDao extends CrudDao<Monitor> {
	
}