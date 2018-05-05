package com.wqh.modules.sys.service;

import com.wqh.common.persistence.Page;
import com.wqh.common.service.CrudService;
import com.wqh.modules.sys.dao.NewsDao;
import com.wqh.modules.sys.entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * 新闻管理Service
 * @author wanqh
 * @date 2017-12-14
 */
@Service
@Transactional(readOnly = true)
public class NewsService extends CrudService<NewsDao, News> {

	@Autowired
	private NewsDao newsDao;
	

	@Autowired
	private TAttachsService attachsService;

	public News get(String id) {
		News news = super.get(id);
		news.setAttachs(attachsService.findByModule(news.getId()));
		return news;
	}
	
	public List<News> findList(News News) {
		News.getSqlMap().put("dsf", dataScopeFilter(News.getCurrentUser(), "o", "u", false));
		return super.findList(News);
	}
	
	public Page<News> findPage(Page<News> page, News News) {
		News.getSqlMap().put("dsf", dataScopeFilter(News.getCurrentUser(), "o", "u", false));
		return super.findPage(page, News);
	}
	
	@Transactional(readOnly = false)
	public void save(News News, HttpServletRequest request) throws IOException {
		super.save(News);

	}
	
	@Transactional(readOnly = false)
	public void delete(News News) {
		super.delete(News);
	}


}