package com.wqh.modules.monitor.service;

import java.util.List;

import com.wqh.common.persistence.Page;
import com.wqh.common.service.CrudService;
import com.wqh.modules.monitor.dao.MonitorDao;
import com.wqh.modules.monitor.entity.Monitor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 系统监控Service
 * 
 * @version 2016-02-07
 */
@Service
@Transactional(readOnly = true)
public class MonitorService extends CrudService<MonitorDao, Monitor> {

	public Monitor get(String id) {
		return super.get(id);
	}
	
	public List<Monitor> findList(Monitor monitor) {
		return super.findList(monitor);
	}
	
	public Page<Monitor> findPage(Page<Monitor> page, Monitor monitor) {
		return super.findPage(page, monitor);
	}
	
	@Transactional(readOnly = false)
	public void save(Monitor monitor) {
		super.save(monitor);
	}
	
	@Transactional(readOnly = false)
	public void delete(Monitor monitor) {
		super.delete(monitor);
	}
	
}