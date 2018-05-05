package com.wqh.modules.sys.dao;

import com.wqh.common.persistence.CrudDao;
import com.wqh.common.persistence.annotation.MyBatisDao;
import com.wqh.modules.sys.entity.News;

/**
 * 新闻管理DAO接口
 * @author wanqh
 * @date 2017-12-14
 */
@MyBatisDao
public interface NewsDao extends CrudDao<News> {

}