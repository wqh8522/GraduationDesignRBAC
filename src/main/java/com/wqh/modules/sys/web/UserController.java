package com.wqh.modules.sys.web;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.wqh.common.utils.*;
import com.wqh.modules.sys.dao.RoleDao;
import com.wqh.common.beanvalidator.BeanValidators;
import com.wqh.common.config.Global;
import com.wqh.common.json.AjaxJson;
import com.wqh.common.persistence.Page;
import com.wqh.common.utils.*;
import com.wqh.common.utils.excel.ExportExcel;
import com.wqh.common.utils.excel.ImportExcel;
import com.wqh.common.web.BaseController;
import com.wqh.modules.sys.dao.MenuDao;
import com.wqh.modules.sys.dao.RoleDao;
import com.wqh.modules.sys.dao.UserDao;
import com.wqh.modules.sys.entity.*;
import com.wqh.modules.sys.service.OfficeService;
import com.wqh.modules.sys.service.SystemConfigService;
import com.wqh.modules.sys.service.SystemService;
import com.wqh.modules.sys.utils.LogUtils;
import com.wqh.modules.sys.utils.UserUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.wqh.common.beanvalidator.BeanValidators;
import com.wqh.common.config.Global;
import com.wqh.common.json.AjaxJson;
import com.wqh.common.persistence.Page;
import com.wqh.common.utils.excel.ExportExcel;
import com.wqh.common.utils.excel.ImportExcel;
import com.wqh.common.web.BaseController;
import com.wqh.modules.sys.dao.MenuDao;
import com.wqh.modules.sys.dao.UserDao;
import com.wqh.modules.sys.entity.Menu;
import com.wqh.modules.sys.entity.Office;
import com.wqh.modules.sys.entity.Role;
import com.wqh.modules.sys.entity.SystemConfig;
import com.wqh.modules.sys.entity.User;
import com.wqh.modules.sys.service.OfficeService;
import com.wqh.modules.sys.service.SystemConfigService;
import com.wqh.modules.sys.service.SystemService;
import com.wqh.modules.sys.utils.LogUtils;
import com.wqh.modules.sys.utils.UserUtils;

/**
 * 用户Controller
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/user")
public class UserController extends BaseController {

    @Autowired
    private SystemConfigService systemConfigService;

    @Autowired
    private SystemService systemService;
    @Autowired
    private UserDao userDao;
    @Autowired
    private com.wqh.modules.sys.service.OfficeService OfficeService;
    @Autowired
    private MenuDao menuDao;

    @Autowired
    private RoleDao roleDao;

    @ModelAttribute
    public User get(@RequestParam(required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return systemService.getUser(id);
        } else {
            return new User();
        }
    }

    @RequiresPermissions("sys:user:index")
    @RequestMapping(value = {"index"})
    public String index(User user, Model model) {

        return "modules/sys/user/userIndex";
    }

    @RequiresPermissions("sys:user:index")
    @RequestMapping(value = {"list", ""})
    public String list(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<User> page = systemService.findUser(new Page<User>(request, response), user);
        for (User u : page.getList()) {
            List<Role> list = roleDao.findList(new Role(u));
            if (u.getRole() == null) {
                u.setRole(new Role());
            }
            String name = Collections3.extractToString(list, "name", ",");
            u.getRole().setName(name);
        }
        model.addAttribute("page", page);
        return "modules/sys/user/userList";
    }


    @RequiresPermissions(value = {"sys:user:view", "sys:user:add", "sys:user:edit"}, logical = Logical.OR)
    @RequestMapping(value = "form")
    public String form(User user, Model model) {
        if (user != null && StringUtils.isNotBlank(user.getId())) {
            if (user.getCompany() == null || user.getCompany().getId() == null) {
                user.setCompany(UserUtils.getUser().getCompany());
            }
            if (user.getOffice() == null || user.getOffice().getId() == null) {
                user.setOffice(UserUtils.getUser().getOffice());
            }
            List<Role> list = roleDao.findList(new Role(user));
            if (list != null && list.size() > 0) {
                if (user.getRole() == null) {
                    user.setRole(new Role());
                }
                String roleNames = Collections3.extractToString(list, "name", ",");
                String roleIds = Collections3.extractToString(list, "id", ",");
                user.getRole().setName(roleNames);
                user.getRole().setId(roleIds);
            }
        }
        model.addAttribute("user", user);
        model.addAttribute("allRoles", systemService.findAllRole());
        return "modules/sys/user/userForm";
    }

    /**
     * 角色设置表单
     *
     * @param user
     * @param model
     * @return
     */
    @RequiresPermissions("sys:user:roleset")
    @RequestMapping(value = "roleform")
    public String roleform(User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("allRoles", systemService.findAllRole());
        return "modules/sys/user/userRoleset";
    }

    /**
     * 保存角色
     *
     * @param user
     * @param request
     * @param model
     * @param redirectAttributes
     * @return
     */
    @RequiresPermissions("sys:user:roleset")
    @RequestMapping(value = "saverole")
    public String saveRole(User user, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
        // 角色数据有效性验证，过滤不在授权内的角色
        List<Role> roleList = Lists.newArrayList();
        List<String> roleIdList = user.getRoleIdList();
        for (Role r : systemService.findAllRole()) {
            if (roleIdList.contains(r.getId())) {
                roleList.add(r);
            }
        }
        user.setRoleList(roleList);
        // 保存用户信息
        systemService.saveUser(user);
        // 清除当前用户缓存
        if (user.getLoginName().equals(UserUtils.getUser().getLoginName())) {
            UserUtils.clearCache();
            //UserUtils.getCacheMap().clear();
        }
        String loginfo = "保存用户[" + user.getName() + "]角色";
        LogUtils.saveLog(request, loginfo);
        addMessage(redirectAttributes, "保存用户'" + user.getLoginName() + "'角色成功");
        return "redirect:" + adminPath + "/sys/user/list?repage";
    }

    /**
     * 保存用户
     *
     * @param user
     * @param request
     * @param model
     * @param redirectAttributes
     * @return
     */
    @RequiresPermissions(value = {"sys:user:add", "sys:user:edit"}, logical = Logical.OR)
    @RequestMapping(value = "save")
    public String save(User user, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
        // 修正引用赋值问题，不知道为何，Company和Office引用的一个实例地址，修改了一个，另外一个跟着修改。
        user.setCompany(new Office(request.getParameter("company.id")));
        user.setOffice(new Office(request.getParameter("office.id")));
        // 如果新密码为空，则不更换密码
        if (StringUtils.isNotBlank(user.getNewPassword())) {
            user.setPassword(SystemService.entryptPassword(user.getNewPassword()));
        }
        if (!beanValidator(model, user)) {
            return form(user, model);
        }
        if (!"true".equals(checkLoginName(user.getOldLoginName(), user.getLoginName()))) {
            addMessage(model, "保存用户'" + user.getLoginName() + "'失败，登录名已存在");
            return form(user, model);
        }
        // 角色数据有效性验证，过滤不在授权内的角色
        List<Role> roleList = Lists.newArrayList();
        String roleIds = user.getRole().getId();
        for (Role r : systemService.findAllRole()) {
            if (roleIds.contains(r.getId())) {
                roleList.add(r);
            }
        }
        user.setRoleList(roleList);
        // 保存用户信息
        systemService.saveUser(user);
        // 清除当前用户缓存
        if (user.getLoginName().equals(UserUtils.getUser().getLoginName())) {
            UserUtils.clearCache();
            //UserUtils.getCacheMap().clear();
        }
        String loginfo = "";
        if (user.getIsNewRecord()) {
            loginfo = "新增用户[" + user.getName() + "]";
        } else {
            loginfo = "修改用户[" + user.getName() + "]";
        }
        LogUtils.saveLog(request, loginfo);
        addMessage(redirectAttributes, "保存用户'" + user.getLoginName() + "'成功");
        return "redirect:" + adminPath + "/sys/user/list?repage";
    }

    /**
     * 批量删除
     *
     * @param user
     * @param request
     * @param redirectAttributes
     * @return
     */
    @RequiresPermissions("sys:user:del")
    @RequestMapping(value = "delete")
    public String delete(User user, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        if (UserUtils.getUser().getId().equals(user.getId())) {
            addMessage(redirectAttributes, "删除用户失败, 不允许删除当前用户");
        } else if (User.isAdmin(user.getId())) {
            addMessage(redirectAttributes, "删除用户失败, 不允许删除超级管理员用户");
        } else {
            systemService.deleteUser(user);
            addMessage(redirectAttributes, "删除用户成功");
            String loginfo = "删除用户[" + user.getName() + "]";
            LogUtils.saveLog(request, loginfo);
        }
        return "redirect:" + adminPath + "/sys/user/list?repage";
    }

    /**
     * 批量删除用户
     */
    @RequiresPermissions("sys:user:del")
    @RequestMapping(value = "deleteAll")
    public String deleteAll(String ids, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        String idArray[] = ids.split(",");
        for (String id : idArray) {
            User user = systemService.getUser(id);
            if (UserUtils.getUser().getId().equals(user.getId())) {
                addMessage(redirectAttributes, "删除用户失败, 不允许删除当前用户");
            } else if (User.isAdmin(user.getId())) {
                addMessage(redirectAttributes, "删除用户失败, 不允许删除超级管理员用户");
            } else {
                systemService.deleteUser(user);
                addMessage(redirectAttributes, "删除用户成功");
                String loginfo = "删除用户[" + user.getName() + "]";
                LogUtils.saveLog(request, loginfo);
            }
        }
        return "redirect:" + adminPath + "/sys/user/list?repage";
    }

    /**
     * 导出用户数据
     *
     * @param user
     * @param request
     * @param response
     * @param redirectAttributes
     * @return
     */
    @RequiresPermissions("sys:user:export")
    @RequestMapping(value = "export", method = RequestMethod.POST)
    public String exportFile(User user, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
        try {
            String fileName = "用户数据" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
            Page<User> page = systemService.findUser(new Page<User>(request, response, -1), user);
            for (User u : page.getList()) {
                u.setRoleList(roleDao.findList(new Role(u)));
            }
            new ExportExcel("用户数据", User.class).setDataList(page.getList()).write(response, fileName).dispose();
            return null;
        } catch (Exception e) {
            addMessage(redirectAttributes, "导出用户失败！失败信息：" + e.getMessage());
        }
        return "redirect:" + adminPath + "/sys/user/list?repage";
    }

    /**
     * 导入用户数据
     *
     * @param file
     * @param redirectAttributes
     * @return
     */
    @RequiresPermissions("sys:user:import")
    @RequestMapping(value = "import", method = RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
        try {
            int successNum = 0;
            int failureNum = 0;
            StringBuilder failureMsg = new StringBuilder();
            ImportExcel ei = new ImportExcel(file, 1, 0);
            List<User> list = ei.getDataList(User.class);
            for (User user : list) {
                try {
                    if ("true".equals(checkLoginName("", user.getLoginName()))) {
                        user.setPassword(SystemService.entryptPassword("111111"));
                        BeanValidators.validateWithException(validator, user);
                        systemService.saveUser(user);
                        successNum++;
                    } else {
                        failureMsg.append("<br/>登录名 " + user.getLoginName() + " 已存在; ");
                        failureNum++;
                    }
                } catch (ConstraintViolationException ex) {
                    failureMsg.append("<br/>登录名 " + user.getLoginName() + " 导入失败：");
                    List<String> messageList = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
                    for (String message : messageList) {
                        failureMsg.append(message + "; ");
                        failureNum++;
                    }
                } catch (Exception ex) {
                    failureMsg.append("<br/>登录名 " + user.getLoginName() + " 导入失败：" + ex.getMessage());
                }
            }
            if (failureNum > 0) {
                failureMsg.insert(0, "，失败 " + failureNum + " 条用户，导入信息如下：");
            }
            addMessage(redirectAttributes, "已成功导入 " + successNum + " 条用户" + failureMsg);
        } catch (Exception e) {
            addMessage(redirectAttributes, "导入用户失败！失败信息：" + e.getMessage());
        }
        return "redirect:" + adminPath + "/sys/user/list?repage";
    }


    /**
     * 导入Excel数据
     */
//	@RequiresPermissions("sys:user:import2")
//    @RequestMapping(value = "import2", method=RequestMethod.POST)
//    public String importFile2(MultipartFile file, RedirectAttributes redirectAttributes) {
//		try {
//			int successNum = 0;
//			int failureNum = 0;
//			StringBuilder failureMsg = new StringBuilder();
//			ImportExcel ei = new ImportExcel(file, 1, 0);
//			List<String[]> list = new ArrayList<String[]>();
//
//			int hs = ei.getLastDataRowNum();
//			for (int i = 2; i < hs; i++) {
//
//				Object no = ei.getCellValue(ei.getRow(i), 0);
//				Object codes = ei.getCellValue(ei.getRow(i), 1);
//				if(no==null || "".equals(no)||codes==null || "".equals(codes)){
//					failureNum++;
//					continue;
//				}
//				String[] objs = {no.toString(),codes.toString()};
//
//				list.add(objs);
//			}
//
//			for (String[] objs : list){
//				try{
//					System.out.println(objs);
//					 User user =  userDao.findUniqueByProperty("no", objs[0]);
//					 if(user==null){
//						failureNum++;
//						continue;
//					 }
//					 String codes = "'"+objs[1]+"'";
//					 codes = codes.replaceAll(";", "','");
//					 System.out.println(codes);
//					 List<Office> offcies = OfficeService.getByCodes(objs[1].replaceAll(";", ","));
//					System.out.println(offcies+"00000000000000000000000000000");
//					 if(CollectionUtils.isEmpty(offcies)){
//						 failureNum++;
//							continue;
//					 }
//					 String ids = "";
//					 String names = "";
//					 for(Office o : offcies){System.out.println(o);
//						  ids = ids+o.getId()+",";
//						  names = names+o.getName()+",";
//					 }
//					 user.setOtherOrgIds(ids.substring(0,ids.length()-1));
//					 user.setOtherOrgNames(names.substring(0,names.length()-1));
//					 userDao.updateUserInfo(user);
//					successNum++;
//				}catch(ConstraintViolationException ex){
//					failureNum++;
//					System.out.println("1"+ex);
//				}catch (Exception ex) {
//					failureNum++;
//					System.out.println("2"+ex);
//				}
//			}
//			if (failureNum>0){
//				failureMsg.insert(0, "，失败 "+failureNum+" 条问卷试题记录。");
//			}
//			addMessage(redirectAttributes, "已成功导入 "+successNum+" 条问卷试题记录"+failureMsg);
//		} catch (Exception e) {
//			addMessage(redirectAttributes, "导入问卷试题失败！失败信息："+e.getMessage());
//			e.printStackTrace();
//		}
//		return "redirect:" + adminPath + "/sys/user/list?repage";
//    }

    /**
     * 下载导入用户数据模板
     *
     * @param response
     * @param redirectAttributes
     * @return
     */
    @RequiresPermissions("sys:user:import")
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
        try {
            String fileName = "用户数据导入模板.xlsx";
            List<User> list = Lists.newArrayList();
            list.add(UserUtils.getUser());
            new ExportExcel("用户数据", User.class, 2).setDataList(list).write(response, fileName).dispose();
            return null;
        } catch (Exception e) {
            addMessage(redirectAttributes, "导入模板下载失败！失败信息：" + e.getMessage());
        }
        return "redirect:" + adminPath + "/sys/user/index?repage";
    }


    /**
     * 下载兼职导入数据模板
     */

    @RequestMapping(value = "import2/template")
    public String importFileTemplate2(HttpServletResponse response, RedirectAttributes redirectAttributes) {
        try {
            String fileName = "兼职数据导入模板.xlsx";
            String path = Thread.currentThread().getContextClassLoader().getResource("").toString();
            path = path.substring(path.indexOf("/") + 1);
            path += "attachs" + File.separator + "兼职数据导入模板.xlsx";
            fileName = URLEncoder.encode(fileName, "UTF-8");
            File file = new File(path);
            response.setContentLength((int) file.length());
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName);// 设置在下载框默认显示的文件名  
            response.setContentType("application/octet-stream");// 指明response的返回对象是文件流  
            FileInputStream fileInputStream = new FileInputStream(file);
            BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
            byte[] b = new byte[bufferedInputStream.available()];
            bufferedInputStream.read(b);
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(b);
            bufferedInputStream.close();
            outputStream.flush();
            outputStream.close();
            return null;
        } catch (Exception e) {
            addMessage(redirectAttributes, "导入模板下载失败！失败信息：" + e.getMessage());
        }
        return "redirect:" + adminPath + "/sys/user/list?repage";
    }


    /**
     * 验证登录名是否有效
     *
     * @param oldLoginName
     * @param loginName
     * @return
     */
    @ResponseBody
    @RequiresPermissions(value = {"sys:user:add", "sys:user:edit"}, logical = Logical.OR)
    @RequestMapping(value = "checkLoginName")
    public String checkLoginName(String oldLoginName, String loginName) {
        if (loginName != null && loginName.equals(oldLoginName)) {
            return "true";
        } else if (loginName != null && systemService.getUserByLoginName(loginName) == null) {
            return "true";
        }
        return "false";
    }

    /**
     * 用户信息显示
     *
     * @param user
     * @param model
     * @return
     */
    @RequiresPermissions("user")
    @RequestMapping(value = "info")
    public String info(HttpServletResponse response, Model model) {
        User currentUser = UserUtils.getUser();
        model.addAttribute("user", currentUser);
        model.addAttribute("Global", new Global());
        return "modules/sys/user/userInfo";
    }

    /**
     * 用户信息显示编辑保存
     *
     * @param user
     * @param model
     * @return
     */
    @RequiresPermissions("user")
    @RequestMapping(value = "infoEdit")
    public String infoEdit(User user, boolean __ajax, HttpServletRequest request, HttpServletResponse response, Model model) {
        User currentUser = UserUtils.getUser();
        if (StringUtils.isNotBlank(user.getName())) {
            if (user.getName() != null)
                currentUser.setName(user.getName());
            if (user.getEmail() != null)
                currentUser.setEmail(user.getEmail());
            if (user.getPhone() != null)
                currentUser.setPhone(user.getPhone());
            if (user.getMobile() != null)
                currentUser.setMobile(user.getMobile());
            if (user.getRemarks() != null)
                currentUser.setRemarks(user.getRemarks());
//			if(user.getPhoto() !=null )
//				currentUser.setPhoto(user.getPhoto());
            systemService.updateUserInfo(currentUser);
            if (__ajax) {//手机访问
                AjaxJson j = new AjaxJson();
                j.setSuccess(true);
                j.setMsg("修改个人资料成功!");
                return renderString(response, j);
            }
            model.addAttribute("user", currentUser);
            model.addAttribute("Global", new Global());
            model.addAttribute("message", "保存用户信息成功");
            String loginfo = "修改用户[" + user.getName() + "]";
            LogUtils.saveLog(request, loginfo);
            return "modules/sys/user/userInfo";
        }
        model.addAttribute("user", currentUser);
        model.addAttribute("Global", new Global());
        return "modules/sys/user/userInfoEdit";
    }


    /**
     * 用户头像显示编辑保存
     *
     * @param user
     * @param model
     * @return
     */
    @RequiresPermissions("user")
    @RequestMapping(value = "imageEdit")
    public String imageEdit(User user, boolean __ajax, HttpServletResponse response, Model model) {
        User currentUser = UserUtils.getUser();
        if (StringUtils.isNotBlank(user.getName())) {
            if (user.getPhoto() != null)
                currentUser.setPhoto(user.getPhoto());
            systemService.updateUserInfo(currentUser);
            if (__ajax) {//手机访问
                AjaxJson j = new AjaxJson();
                j.setSuccess(true);
                j.setMsg("修改个人头像成功!");
                return renderString(response, j);
            }
            model.addAttribute("message", "保存用户信息成功");
            return "modules/sys/user/userInfo";
        }
        model.addAttribute("user", currentUser);
        model.addAttribute("Global", new Global());
        return "modules/sys/user/userImageEdit";
    }

    /**
     * 用户头像显示编辑保存
     *
     * @param user
     * @param model
     * @return
     * @throws IOException
     * @throws IllegalStateException
     */
    @RequiresPermissions("user")
    @RequestMapping(value = "imageUpload")
    public String imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws IllegalStateException, IOException {
        User currentUser = UserUtils.getUser();

        // 判断文件是否为空
        if (!file.isEmpty()) {
            // 文件保存路径
            String realPath = Global.USERFILES_BASE_URL
                    + UserUtils.getPrincipal() + "/images/";
            // 转存文件
            FileUtils.createDirectory(Global.getUserfilesBaseDir() + realPath);
            file.transferTo(new File(Global.getUserfilesBaseDir() + realPath + file.getOriginalFilename()));
            currentUser.setPhoto(request.getContextPath() + realPath + file.getOriginalFilename());
            systemService.updateUserInfo(currentUser);
        }

        return "modules/sys/user/userImageEdit";
    }

    /**
     * 返回用户信息
     *
     * @return
     */
    @RequiresPermissions("user")
    @ResponseBody
    @RequestMapping(value = "infoData")
    public AjaxJson infoData() {
        AjaxJson j = new AjaxJson();
        j.setSuccess(true);
        j.setErrorCode("-1");
        j.setMsg("获取个人信息成功!");
        j.put("data", UserUtils.getUser());
        return j;
    }


    /**
     * 修改个人用户密码
     *
     * @param oldPassword
     * @param newPassword
     * @param model
     * @return
     */
    @RequiresPermissions("user")
    @RequestMapping(value = "modifyPwd")
    public String modifyPwd(String oldPassword, String newPassword, Model model, HttpServletRequest request) {
        User user = UserUtils.getUser();
        if (StringUtils.isNotBlank(oldPassword) && StringUtils.isNotBlank(newPassword)) {
            if (SystemService.validatePassword(oldPassword, user.getPassword())) {
                systemService.updatePasswordById(user.getId(), user.getLoginName(), newPassword);
                model.addAttribute("message", "修改密码成功");
                String loginfo = "修改用户[" + user.getName() + "]密码";
                LogUtils.saveLog(request, loginfo);
            } else {
                model.addAttribute("message", "修改密码失败，旧密码错误");
            }
            return "modules/sys/user/userInfo";
        }
        model.addAttribute("user", user);
        return "modules/sys/user/userModifyPwd";
    }

    /**
     * 保存签名
     */
    @ResponseBody
    @RequestMapping(value = "saveSign")
    public AjaxJson saveSign(User user, boolean __ajax, HttpServletResponse response, Model model) throws Exception {
        AjaxJson j = new AjaxJson();
        User currentUser = UserUtils.getUser();
        currentUser.setSign(user.getSign());
        systemService.updateUserInfo(currentUser);
        j.setMsg("设置签名成功");
        return j;
    }

    @RequiresPermissions("user")
    @ResponseBody
    @RequestMapping(value = "treeData")
    public List<Map<String, Object>> treeData(@RequestParam(required = false) String officeId, HttpServletResponse response) {
        List<Map<String, Object>> mapList = Lists.newArrayList();
        List<User> list = systemService.findUserByOfficeId(officeId);
        for (int i = 0; i < list.size(); i++) {
            User e = list.get(i);
            Map<String, Object> map = Maps.newHashMap();
            map.put("id", "u_" + e.getId());
            map.put("pId", officeId);
            map.put("name", StringUtils.replace(e.getName(), " ", ""));
            mapList.add(map);
        }
        return mapList;
    }

    /**
     * web端ajax验证用户名是否可用
     *
     * @param loginName
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "validateLoginName")
    public boolean validateLoginName(String loginName, HttpServletResponse response) {

        User user = userDao.findUniqueByProperty("login_name", loginName);
        if (user == null) {
            return true;
        } else {
            return false;
        }

    }

    /**
     * web端ajax验证手机号是否可以注册（数据库中不存在）
     */
    @ResponseBody
    @RequestMapping(value = "validateMobile")
    public boolean validateMobile(String mobile, HttpServletResponse response, Model model) {
        User user = userDao.findUniqueByProperty("mobile", mobile);
        if (user == null) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * web端ajax验证手机号是否已经注册（数据库中已存在）
     */
    @ResponseBody
    @RequestMapping(value = "validateMobileExist")
    public boolean validateMobileExist(String mobile, HttpServletResponse response, Model model) {
        User user = userDao.findUniqueByProperty("mobile", mobile);
        if (user != null) {
            return true;
        } else {
            return false;
        }
    }

    @ResponseBody
    @RequestMapping(value = "resetPassword")
    public AjaxJson resetPassword(String mobile, HttpServletResponse response, Model model) {
        SystemConfig config = systemConfigService.get("1");//获取短信配置的用户名和密码
        AjaxJson j = new AjaxJson();
        if (userDao.findUniqueByProperty("mobile", mobile) == null) {
            j.setSuccess(false);
            j.setMsg("手机号不存在!");
            j.setErrorCode("1");
            return j;
        }
        User user = userDao.findUniqueByProperty("mobile", mobile);
        String newPassword = String.valueOf((int) (Math.random() * 900000 + 100000));
        try {
            String result = UserUtils.sendPass(config.getSmsName(), config.getSmsPassword(), mobile, newPassword);
            if (!result.equals("100")) {
                j.setSuccess(false);
                j.setErrorCode("2");
                j.setMsg("短信发送失败，密码重置失败，错误代码：" + result + "，请联系管理员。");
            } else {
                j.setSuccess(true);
                j.setErrorCode("-1");
                j.setMsg("短信发送成功，密码重置成功!");
                systemService.updatePasswordById(user.getId(), user.getLoginName(), newPassword);
            }
        } catch (IOException e) {
            j.setSuccess(false);
            j.setErrorCode("3");
            j.setMsg("因未知原因导致短信发送失败，请联系管理员。");
        }
        return j;
    }

    @ResponseBody
    @RequestMapping(value = "getUserData")
    public JSONObject getUserData(String sessionid, Model model) {
        JSONObject obj = new JSONObject();
        if (sessionid == null || sessionid.equals("")) {
            obj.put("result_code", "500");
            obj.put("result_msg", "参数错误");
        } else {
            HashMap<String, String> userSessions = (HashMap<String, String>) CacheUtils.get("USER_SESSIONS");
            HashMap<String, String> userMenus = (HashMap<String, String>) CacheUtils.get("USER_SESSION_MENUS");
            if (userSessions == null || !userSessions.containsKey(sessionid)) {
                obj.put("result_code", "500");
                obj.put("result_msg", "参数错误或session已过期");
            } else {
                String userid = userSessions.get(sessionid);
                User user = UserUtils.get(userid);
                obj.put("result_code", "200");
                obj.put("result_msg", "成功");

                JSONObject result = new JSONObject();
                result.put("usercode", user.getNo());
                result.put("username", user.getName());

                // 机构
                JSONObject offices = new JSONObject();
                offices.put("officeid", user.getOffice().getId());
                if (user.getOtherOrgIds() != null && !user.getOtherOrgIds().equals("")) {
                    String[] ids = user.getOtherOrgIds().split(",");
                    JSONArray parts = new JSONArray();
                    for (String id : ids) {
                        JSONObject org = new JSONObject();
                        org.put("id", id);
                        parts.add(org);
                    }
                    offices.put("parttime", parts);
                }
                result.put("offices", offices);


                // 菜单
                JSONObject menuObj = new JSONObject();
                String menuid = userMenus.get(sessionid);
                Menu menu = systemService.getMenu(menuid);
                menuObj.put("menu_id", menu.getId());
                menuObj.put("menu_name", menu.getName());
                result.put("menu", menuObj);

                obj.put("result", result);

                // 角色
                JSONArray roles = new JSONArray();
                Role role = new Role();
                role.setUser(user);
                List<Role> roleList = systemService.findRole(role);
                for (Role r : roleList) {
                    JSONObject ro = new JSONObject();
                    ro.put("roleid", r.getId());
                    ro.put("data_scope", r.getDataScope());

                    // 查询角色按钮
                    JSONArray childs = new JSONArray();
                    Menu param = new Menu();
                    param.setParentIds(menuid);
                    param.setRoleid(r.getId());
                    List<Menu> menus = systemService.findByRoleMenu(param);
                    for (Menu m : menus) {
                        JSONObject mobj = new JSONObject();
                        mobj.put("name", m.getName());
                        mobj.put("tag", m.getPermission());
                        childs.add(mobj);
                    }
                    ro.put("buttons", childs);


                    roles.add(ro);
                }
                result.put("roles", roles);
            }
        }
        return obj;
    }

}
