package com.wqh.modules.sys.dao;

import java.util.List;

import com.wqh.common.persistence.CrudDao;
import com.wqh.common.persistence.annotation.MyBatisDao;
import com.wqh.modules.sys.entity.Dict;

/**
 * 字典DAO接口
 * 
 * @version 2014-05-16
 */
@MyBatisDao
public interface DictDao extends CrudDao<Dict> {

	public List<String> findTypeList(Dict dict);
	
	public List<Dict> findTypeDetailList(Dict dict);
	
	public List<Dict> findPageList(Dict dict);
	
	public List<Dict> getType(Dict dict);
	
	public Dict getByType(Dict dict);

}
