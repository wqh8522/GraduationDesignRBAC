package com.jeeplus.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeeplus.common.config.Global;
import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.web.BaseController;
import com.jeeplus.modules.sys.entity.Log;
import com.jeeplus.modules.sys.service.LogService;
import com.jeeplus.modules.sys.utils.LogUtils;

/**
 * 日志Controller
 * 
 * @version 2013-6-2
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/log1")
public class LogController extends BaseController {

	@Autowired
	private LogService logService;
	
	@RequiresPermissions("sys:log1:list")
	@RequestMapping(value = {"list", ""})
	public String list(Log log, HttpServletRequest request, HttpServletResponse response, Model model) {
		log.setMethod("1");
		Page<Log> page = logService.findPage(new Page<Log>(request, response), log); 
        model.addAttribute("page", page);
        
		return "modules/sys/log/logList1";
	}
	

	
	/**
	 * 批量删除
	 */
	@RequiresPermissions("sys:log1:del")
	@RequestMapping(value = "deleteAll")
	public String deleteAll(String ids, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String idArray[] =ids.split(",");
		for(String id : idArray){
			logService.delete(logService.get(id));
		}
		String loginfo = "删除登录日志";
		LogUtils.saveLog(request, loginfo);
		addMessage(redirectAttributes, "删除登录日志成功");
		return "redirect:"+Global.getAdminPath()+"/sys/log1/?repage";
	}
	
	/**
	 * 批量删除
	 */
	@RequiresPermissions("sys:log1:del")
	@RequestMapping(value = "empty")
	public String empty(RedirectAttributes redirectAttributes, HttpServletRequest request) {
		logService.empty("1");
		String loginfo = "清空登录日志";
		LogUtils.saveLog(request, loginfo);
		addMessage(redirectAttributes, "清空登录日志成功");
		return "redirect:"+Global.getAdminPath()+"/sys/log1/?repage";
	}
}
