package com.wqh.modules.sys.dao;

import com.wqh.common.persistence.CrudDao;
import com.wqh.common.persistence.annotation.MyBatisDao;
import com.wqh.modules.sys.entity.MyCalendar;
import com.wqh.common.persistence.CrudDao;
import com.wqh.common.persistence.annotation.MyBatisDao;


/**
 * 日历DAO接口
 * 
 * @version 2016-04-19
 */
@MyBatisDao
public interface MyCalendarDao extends CrudDao<MyCalendar> {
	
}