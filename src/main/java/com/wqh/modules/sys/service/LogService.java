package com.wqh.modules.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wqh.common.persistence.Page;
import com.wqh.common.service.CrudService;
import com.wqh.common.utils.DateUtils;
import com.wqh.modules.sys.dao.LogDao;
import com.wqh.modules.sys.entity.Log;

/**
 * 日志Service
 * 
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class LogService extends CrudService<LogDao, Log> {

	@Autowired
	private LogDao logDao;
	
	public Page<Log> findPage(Page<Log> page, Log log) {
		
		// 设置默认时间范围，默认当前月
		if (log.getBeginDate() == null){
			log.setBeginDate(DateUtils.setDays(DateUtils.parseDate(DateUtils.getDate()), 1));
		}
		if (log.getEndDate() == null){
			log.setEndDate(DateUtils.addMonths(log.getBeginDate(), 1));
		}
		
		return super.findPage(page, log);
		
	}
	
	/**
	 * 删除全部数据
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void empty(String id){
		
		logDao.empty(id);
	}
	
}
