package com.wqh.modules.sys.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.wqh.common.config.Global;
import com.wqh.common.utils.StringUtils;
import com.wqh.common.web.BaseController;
import com.wqh.modules.sys.entity.Office;
import com.wqh.modules.sys.entity.User;
import com.wqh.modules.sys.service.OfficeService;
import com.wqh.modules.sys.utils.DictUtils;
import com.wqh.modules.sys.utils.LogUtils;
import com.wqh.modules.sys.utils.UserUtils;

/**
 * 机构Controller
 * 
 * @version 2013-5-15
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/office")
public class OfficeController extends BaseController {

	@Autowired
	private OfficeService officeService;
	
	@ModelAttribute("office")
	public Office get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return officeService.get(id);
		}else{
			return new Office();
		}
	}
//
//	@RequiresPermissions("sys:office:index")
//	@RequestMapping(value = {""})
//	public String index(Office office, Model model) {
////        model.addAttribute("list", officeService.findAll());
//		return "modules/sys/office/officeIndex";
//	}

	@RequiresPermissions("sys:office:index")
	@RequestMapping(value = {"list",""})
	public String list(Office office, Model model) {
		if(office==null || office.getParentIds() == null){
			 model.addAttribute("list", officeService.findList(false));
		}else{
			 model.addAttribute("list", officeService.findList(office));
		}
		return "modules/sys/office/officeList";
	}
	
	@RequiresPermissions(value={"sys:office:view","sys:office:add","sys:office:edit"},logical=Logical.OR)
	@RequestMapping(value = "form")
	public String form(Office office, Model model) {
		User user = UserUtils.getUser();
		if (office.getParent()==null || office.getParent().getId()==null){
			office.setParent(user.getOffice());
		}
		office.setParent(officeService.get(office.getParent().getId()));
		if (office.getArea()==null){
			office.setArea(user.getOffice().getArea());
		}
		// 自动获取排序号
		if (StringUtils.isBlank(office.getId())&&office.getParent()!=null){
			int size = 0;
			List<Office> list = officeService.findAll();
			for (int i=0; i<list.size(); i++){
				Office e = list.get(i);
				if (e.getParent()!=null && e.getParent().getId()!=null
						&& e.getParent().getId().equals(office.getParent().getId())){
					size++;
				}
			}
			office.setCode(office.getParent().getCode() + StringUtils.leftPad(String.valueOf(size > 0 ? size+1 : 1), 3, "0"));
		}
		model.addAttribute("office", office);
		return "modules/sys/office/officeForm";
	}
	
	@RequiresPermissions(value={"sys:office:add","sys:office:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public String save(Office office, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, office)){
			return form(office, model);
		}
		String loginfo = "";
		if (office.getIsNewRecord()) {
			loginfo = "新增机构["+ office.getName() +"]";
		} else {
			loginfo = "修改机构["+ office.getName() +"]";
		}
		LogUtils.saveLog(request, loginfo);
		officeService.save(office);
		
		if(office.getChildDeptList()!=null){
			Office childOffice = null;
			for(String id : office.getChildDeptList()){
				childOffice = new Office();
				childOffice.setName(DictUtils.getDictLabel(id, "sys_office_common", "未知"));
				childOffice.setParent(office);
				childOffice.setArea(office.getArea());
				childOffice.setType("2");
				childOffice.setGrade(String.valueOf(Integer.valueOf(office.getGrade())+1));
				childOffice.setUseable(Global.YES);
				if (office.getIsNewRecord()) {
					loginfo = "新增机构["+ office.getName() +"]";
				} else {
					loginfo = "修改机构["+ office.getName() +"]";
				}
				LogUtils.saveLog(request, loginfo);
				officeService.save(childOffice);
			}
		}
		
		addMessage(redirectAttributes, "保存机构'" + office.getName() + "'成功");
		String id = "0".equals(office.getParentId()) ? "" : office.getParentId();
		return "redirect:" + adminPath + "/sys/office/list";
	}
	
	@RequiresPermissions("sys:office:del")
	@RequestMapping(value = "delete")
	public String delete(Office office, HttpServletRequest request, RedirectAttributes redirectAttributes) {
//		if (Office.isRoot(id)){
//			addMessage(redirectAttributes, "删除机构失败, 不允许删除顶级机构或编号空");
//		}else{
			String loginfo = "删除机构["+ office.getName() +"]";
			LogUtils.saveLog(request, loginfo);
			officeService.delete(office);
			addMessage(redirectAttributes, "删除机构成功");
//		}
		return "redirect:" + adminPath + "/sys/office/list";
	}

	/**
	 * 获取机构JSON数据。
	 * @param extId 排除的ID
	 * @param type	类型
	 * @param response
	 * @return
	 */
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, @RequestParam(required=false) String type,
											  @RequestParam(required=false) Long grade, @RequestParam(required=false) Boolean isAll, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Office> list = officeService.findList(isAll);
		for (int i=0; i<list.size(); i++){
			Office e = list.get(i);
			if ((StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1))
					&& (type == null || (type != null && (type.equals("1") ? type.equals(e.getType()) : true)))){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("pIds", e.getParentIds());
				map.put("name", e.getName());
				if (type != null && "3".equals(type)){
					map.put("isParent", true);
				}
				mapList.add(map);
			}
		}
		return mapList;
	}
}
