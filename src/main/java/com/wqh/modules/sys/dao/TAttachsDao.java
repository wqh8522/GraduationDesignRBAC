package com.wqh.modules.sys.dao;

import java.util.List;

import com.wqh.common.persistence.CrudDao;
import com.wqh.common.persistence.annotation.MyBatisDao;
import com.wqh.modules.sys.entity.TAttachs;
import com.wqh.modules.sys.entity.TAttachs;

/**
 * 项目附件DAO接口
 * @author luoxuelin
 * @version 2017-07-15
 */
@MyBatisDao
public interface TAttachsDao extends CrudDao<TAttachs> {
	
	public List<TAttachs> findByModule(String moduleId);
	
}