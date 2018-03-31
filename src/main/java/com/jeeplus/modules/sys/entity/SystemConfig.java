package com.jeeplus.modules.sys.entity;

import org.hibernate.validator.constraints.Length;

import com.jeeplus.common.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;
import org.springframework.web.multipart.MultipartFile;

/**
 * 系统配置Entity
 * 
 * @version 2016-02-07
 */
public class SystemConfig extends DataEntity<SystemConfig> {


	private static final long serialVersionUID = 1L;
	private String smtp;		// 邮箱服务器地址
	private String port;		// 邮箱服务器端口
	private String mailName;		// 系统邮箱地址
	private String mailPassword;		// 系统邮箱密码
	private String smsName;		// 短信用户名
	private String smsPassword;		// 短信密码
	private String sysname;			// 系统名称
	private String syslogo;		// 系统图标
	private String loginback;	// 登陆背景图

	private MultipartFile syslogoimg; // logo图片
	private MultipartFile sysfavicon; // favicon图片
	private MultipartFile sysback; // 登陆背景图片

	private boolean test = false;
	public SystemConfig() {
		super();
	}

	public SystemConfig(String id){
		super(id);
	}

	@Length(min=0, max=64, message="邮箱服务器地址长度必须介于 0 和 64 之间")
	@ExcelField(title="邮箱服务器地址", align=2, sort=1)
	public String getSmtp() {
		return smtp;
	}

	public void setSmtp(String smtp) {
		this.smtp = smtp;
	}

	@Length(min=0, max=64, message="邮箱服务器端口长度必须介于 0 和 64 之间")
	@ExcelField(title="邮箱服务器端口", align=2, sort=2)
	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	@Length(min=0, max=64, message="系统邮箱地址长度必须介于 0 和 64 之间")
	@ExcelField(title="系统邮箱地址", align=2, sort=3)
	public String getMailName() {
		return mailName;
	}

	public void setMailName(String mailName) {
		this.mailName = mailName;
	}

	@Length(min=0, max=64, message="系统邮箱密码长度必须介于 0 和 64 之间")
	@ExcelField(title="系统邮箱密码", align=2, sort=4)
	public String getMailPassword() {
		return mailPassword;
	}

	public void setMailPassword(String mailPassword) {
		this.mailPassword = mailPassword;
	}

	@Length(min=0, max=64, message="短信用户名长度必须介于 0 和 64 之间")
	@ExcelField(title="短信用户名", align=2, sort=5)
	public String getSmsName() {
		return smsName;
	}

	public void setSmsName(String smsName) {
		this.smsName = smsName;
	}

	@Length(min=0, max=64, message="短信密码长度必须介于 0 和 64 之间")
	@ExcelField(title="短信密码", align=2, sort=6)
	public String getSmsPassword() {
		return smsPassword;
	}

	public void setSmsPassword(String smsPassword) {
		this.smsPassword = smsPassword;
	}

	public void setTest(boolean test) {
		this.test = test;
	}

	public boolean isTest() {
		return test;
	}

	@Length(min=0, max=64, message="系统名称长度必须介于 0 和 64 之间")
	public String getSysname() {
		return sysname;
	}

	public void setSysname(String sysname) {
		this.sysname = sysname;
	}

	public String getSyslogo() {
		return syslogo;
	}

	public void setSyslogo(String syslogo) {
		this.syslogo = syslogo;
	}

	public MultipartFile getSyslogoimg() {
		return syslogoimg;
	}

	public void setSyslogoimg(MultipartFile syslogoimg) {
		this.syslogoimg = syslogoimg;
	}

	public MultipartFile getSysfavicon() {
		return sysfavicon;
	}

	public void setSysfavicon(MultipartFile sysfavicon) {
		this.sysfavicon = sysfavicon;
	}

	public String getLoginback() {
		return loginback;
	}

	public void setLoginback(String loginback) {
		this.loginback = loginback;
	}

	public MultipartFile getSysback() {
		return sysback;
	}

	public void setSysback(MultipartFile sysback) {
		this.sysback = sysback;
	}
	
}