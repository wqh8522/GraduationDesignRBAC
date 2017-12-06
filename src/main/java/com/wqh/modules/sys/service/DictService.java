package com.wqh.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wqh.common.persistence.Page;
import com.wqh.common.service.CrudService;
import com.wqh.common.utils.CacheUtils;
import com.wqh.modules.sys.dao.DictDao;
import com.wqh.modules.sys.entity.Dict;
import com.wqh.modules.sys.utils.DictUtils;

/**
 * 字典Service
 * 
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class DictService extends CrudService<DictDao, Dict> {
	
	/**
	 * 查询字段类型列表
	 * @return
	 */
	public List<String> findTypeList(){
		return dao.findTypeList(new Dict());
	}
	
	public Page<Dict> findPageList(Page<Dict> page, Dict entity){
		entity.setPage(page);
		page.setList(dao.findPageList(entity));
		return page;
	}
	public List<Dict> getType(Dict entity){
		return dao.getType(entity);
	}
	public Dict getByType(Dict dict){
		return dao.getByType(dict);
	}

	@Transactional(readOnly = false)
	public void save(Dict dict) {
		super.save(dict);
		CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
	}

	@Transactional(readOnly = false)
	public void delete(Dict dict) {
		super.delete(dict);
		CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
	}
	
	

}
