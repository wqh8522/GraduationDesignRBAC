package com.wqh.modules.sys.entity;


import com.wqh.common.persistence.DataEntity;
import com.wqh.common.utils.excel.annotation.ExcelField;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

/**
 * 新闻管理Entity
 * @author wanqh
 * @date 2017-12-14
 */
public class News extends DataEntity<News> {

	private static final long serialVersionUID = 1L;
	private String title;		// 新闻标题
	private String content;		// 新闻正文
	private String type;		// 类型

	/**附件id*/
	private String fileId; //废




	public List<TAttachs> attachs;
	/**附件*/
	private MultipartFile[] news_File;

	/**创建人所在单位*/
	private Office office;

	/**开始时间*/
	private Date startDate;

	/**结束时间*/
	private Date stopDate;


	public News() {
		super();
	}

	public News(String id){
		super(id);
	}

	@ExcelField(title="新闻标题", align=2, sort=7)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@ExcelField(title="新闻正文", align=2, sort=8)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getStopDate() {
		return stopDate;
	}

	public void setStopDate(Date stopDate) {
		this.stopDate = stopDate;
	}

	public MultipartFile[] getNews_File() {
		return news_File;
	}

	public void setNews_File(MultipartFile[] news_File) {
		this.news_File = news_File;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public List<TAttachs> getAttachs() {
		return attachs;
	}

	public void setAttachs(List<TAttachs> attachs) {
		this.attachs = attachs;
	}
}