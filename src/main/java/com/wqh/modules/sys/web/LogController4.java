package com.wqh.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wqh.common.config.Global;
import com.wqh.common.persistence.Page;
import com.wqh.common.web.BaseController;
import com.wqh.modules.sys.entity.Log;
import com.wqh.modules.sys.service.LogService;
import com.wqh.modules.sys.utils.LogUtils;

/**
 * 登出日志Controller
 * 
 * @version 2013-6-2
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/log4")
public class LogController4 extends BaseController {

	@Autowired
	private LogService logService;
	
	@RequiresPermissions("sys:log4:list")
	@RequestMapping(value = {"list", ""})
	public String list(Log log, HttpServletRequest request, HttpServletResponse response, Model model) {
		log.setMethod("4");
		Page<Log> page = logService.findPage(new Page<Log>(request, response), log); 
        model.addAttribute("page", page);
		return "modules/sys/logList4";
	}

	
	/**
	 * 批量删除
	 */
	@RequiresPermissions("sys:log4:del")
	@RequestMapping(value = "deleteAll")
	public String deleteAll(String ids, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		String idArray[] =ids.split(",");
		for(String id : idArray){
			logService.delete(logService.get(id));
		}
		String loginfo = "删除错误日志";
		LogUtils.saveLog(request, loginfo);
		addMessage(redirectAttributes, "删除错误日志成功");
		return "redirect:"+Global.getAdminPath()+"/sys/log4/?repage";
	}
	
	/**
	 * 批量删除
	 */
	@RequiresPermissions("sys:log4:dell")
	@RequestMapping(value = "empty")
	public String empty(RedirectAttributes redirectAttributes, HttpServletRequest request) {
		logService.empty("4");
		String loginfo = "清空错误日志";
		LogUtils.saveLog(request, loginfo);
		addMessage(redirectAttributes, "清空错误日志成功");
		return "redirect:"+Global.getAdminPath()+"/sys/log4/?repage";
	}
}
