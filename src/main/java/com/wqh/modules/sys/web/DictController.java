package com.wqh.modules.sys.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.wqh.common.persistence.Page;
import com.wqh.common.utils.StringUtils;
import com.wqh.common.web.BaseController;
import com.wqh.modules.sys.entity.Dict;
import com.wqh.modules.sys.service.DictService;
import com.wqh.modules.sys.utils.LogUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 字典Controller
 * 
 * @version 2014-05-16
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/dict")
public class DictController extends BaseController {

	@Autowired
	private DictService dictService;
	
	@ModelAttribute
	public Dict get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return dictService.get(id);
		}else{
			return new Dict();
		}
	}
	
	@RequiresPermissions("sys:dict:list")
	@RequestMapping(value = {"list", ""})
	public String list(Dict dict, HttpServletRequest request, HttpServletResponse response, Model model) throws IllegalAccessException, InstantiationException, InvocationTargetException, NoSuchMethodException {
		List<String> typeList = dictService.findTypeList();
		model.addAttribute("typeList", typeList);
		
//        Page<Dict> page = dictService.findPage(new Page<Dict>(request, response), dict); 
//        model.addAttribute("page", page);
		String flag = "0";
		// 有查询条件，则进行明细查询
		if(dict!=null && (!StringUtils.isEmpty(dict.getType()) || !StringUtils.isEmpty(dict.getDescription()))){
			flag="1";
		}
		 Page<Dict> types = dictService.findPageList(new Page<Dict>(request, response), dict);
		 List<Dict> list = types.getList();
		 List<Dict> returnList = Lists.newArrayList();
		 // 进行明细查询
		 for(Dict d : list){
			 List<Dict> dd = dictService.getType(d);
			 String did = UUID.randomUUID().toString();
			 if("0".equals(flag)){
			 if(!CollectionUtils.isEmpty(dd)){
				 Dict dic =(Dict)BeanUtils.cloneBean(dd.get(0));
				 dic.setId(did);
				 dic.setParentId("0");
				 returnList.add(dic);
			 }
			 }
			
			if("1".equals(flag)){
			 for(Dict d1:dd){
				d1.setParentId(did); 
				 returnList.add(d1);
			 }
			}
		 }
       types.setList(returnList);
       
       model.addAttribute("page", types);
       model.addAttribute("flag", flag);
		return "modules/sys/dic/dictList";
	}

	@RequiresPermissions(value={"sys:dict:view","sys:dict:add","sys:dict:edit"},logical=Logical.OR)
	@RequestMapping(value = "form")
	public String form(Dict dict, Model model,String flag) {
		if(dict.getType()!=null){
			Dict dict1 =dictService.getByType(dict);
			dict.setDescription(dict1.getDescription());
		}
		model.addAttribute("dict", dict);
		model.addAttribute("flag",flag);
		return "modules/sys/dic/dictForm";
	}

	@RequiresPermissions(value={"sys:dict:add","sys:dict:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")//@Valid 
	public String save(Dict dict, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, dict)){
			return form(dict, model,"");
		}
		String loginfo = "";
		if (dict.getIsNewRecord()) {
			loginfo = "新增字典["+ dict.getDescription() + "-" + dict.getLabel() +"]";
		} else {
			loginfo = "修改字典["+ dict.getDescription() + "-" + dict.getLabel() +"]";
		}
		LogUtils.saveLog(request, loginfo);
		dictService.save(dict);
		addMessage(redirectAttributes, "保存字典'" + dict.getLabel() + "'成功");
		return "redirect:" + adminPath + "/sys/dict/list?repage&type="+dict.getType();
	}

	/**
	 * 删除字典
	 * @param dict
	 * @param type
	 * @param request
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("sys:dict:del")
	@RequestMapping(value = "delete")
	public String delete(Dict dict,String type, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		if(dict==null){
			dict = new Dict();
			dict.setType(type);
		}
		String loginfo = "删除字典["+ dict.getDescription() + "-" + dict.getLabel() +"]";
		LogUtils.saveLog(request, loginfo);
		dictService.delete(dict);
		addMessage(redirectAttributes, "删除字典成功");
		if(StringUtils.isBlank(type)){
			return "redirect:" + adminPath + "/sys/dict/?repage";
		}
		return "redirect:" + adminPath + "/sys/dict/list?repage&type="+dict.getType();
	}
	
	
	/**
	 * 批量删除字典
	 */
	@RequiresPermissions("sys:role:del")
	@RequestMapping(value = "deleteAll")
	public String deleteAll(String ids,String types, HttpServletRequest request, RedirectAttributes redirectAttributes) {

		if(StringUtils.isNotBlank(ids)){
			String idArray[] =ids.split(",");
			for(String id : idArray){
				Dict dict = dictService.get(id);
				String loginfo = "删除字典["+ dict.getDescription() + "-" + dict.getLabel() +"]";
				LogUtils.saveLog(request, loginfo);
				dictService.delete(dict);
			}
		}else if(StringUtils.isNotBlank(types)){
			String typeArray[] =types.split(",");
			for(String type :  typeArray){
				Dict dict = new Dict();
				dict.setType(type);
				String loginfo = "删除字典["+ type +"]";
				LogUtils.saveLog(request, loginfo);
				List<Dict> list = dictService.getType(dict);
				dictService.deleteAll(list);
			}
		}
		addMessage(redirectAttributes, "删除字典成功");
		return "redirect:" + adminPath + "/sys/dict/?repage";
	}

	
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String type, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		Dict dict = new Dict();
		dict.setType(type);
		List<Dict> list = dictService.findList(dict);
		for (int i=0; i<list.size(); i++){
			Dict e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("pId", e.getParentId());
			map.put("name", StringUtils.replace(e.getLabel(), " ", ""));
			mapList.add(map);
		}
		return mapList;
	}
	
	@ResponseBody
	@RequestMapping(value = "listData")
	public List<Dict> listData(@RequestParam(required=false) String type) {
		Dict dict = new Dict();
		dict.setType(type);
		return dictService.findList(dict);
	}

}
