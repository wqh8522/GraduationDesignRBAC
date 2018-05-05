package com.wqh.modules.sys.web;

import com.google.common.collect.Maps;
import com.wqh.common.config.Global;
import com.wqh.common.json.AjaxJson;
import com.wqh.common.persistence.Page;
import com.wqh.common.security.shiro.session.SessionDAO;
import com.wqh.common.servlet.ValidateCodeServlet;
import com.wqh.common.utils.CacheUtils;
import com.wqh.common.utils.CookieUtils;
import com.wqh.common.utils.IdGen;
import com.wqh.common.utils.StringUtils;
import com.wqh.common.web.BaseController;
import com.wqh.modules.sys.entity.*;
import com.wqh.modules.sys.security.FormAuthenticationFilter;
import com.wqh.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.wqh.modules.sys.service.DictService;
import com.wqh.modules.sys.utils.LogUtils;
import com.wqh.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 登录Controller
 *
 * @version 2013-5-31
 */
@Controller
public class LoginController extends BaseController {

    @Autowired
    private SessionDAO sessionDAO;

    @Autowired
    private DictService dictService;


    /**
     * 管理登录
     *
     * @throws IOException
     */
    @RequestMapping(value = "${adminPath}/login")
    public String login(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        Principal principal = UserUtils.getPrincipal();
        if (logger.isDebugEnabled()) {
            logger.debug("login, active session size: {}", sessionDAO.getActiveSessions(false).size());
        }

        // 如果已登录，再次访问主页，则退出原账号。
        if (Global.TRUE.equals(Global.getConfig("notAllowRefreshIndex"))) {
            CookieUtils.setCookie(response, "LOGINED", "false");
        }
        // 如果已经登录，则跳转到管理首页
        if (principal != null && !principal.isMobileLogin()) {
            return "redirect:" + adminPath;
        }


        SavedRequest savedRequest = WebUtils.getSavedRequest(request);//获取跳转到login之前的URL
        // 如果是手机没有登录跳转到到login，则返回JSON字符串
        if (savedRequest != null) {
            String queryStr = savedRequest.getQueryString();
            if (queryStr != null && (queryStr.contains("__ajax") || queryStr.contains("mobileLogin"))) {
                AjaxJson j = new AjaxJson();
                j.setSuccess(false);
                j.setErrorCode("0");
                j.setMsg("没有登录!");
                return renderString(response, j);
            }
        }


        return "modules/sys/sysLogin";
    }

    /**
     * 登录失败，真正登录的POST请求由Filter完成
     */
    @RequestMapping(value = "${adminPath}/login", method = RequestMethod.POST)
    public String loginFail(HttpServletRequest request, HttpServletResponse response, Model model) {
        Principal principal = UserUtils.getPrincipal();

        // 如果已经登录，则跳转到管理首页
        if (principal != null) {
            return "redirect:" + adminPath;
        }

        String username = WebUtils.getCleanParam(request, FormAuthenticationFilter.DEFAULT_USERNAME_PARAM);
        boolean rememberMe = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM);
        boolean mobile = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_MOBILE_PARAM);
        String exception = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
        String message = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM);

        if (StringUtils.isBlank(message) || StringUtils.equals(message, "null")) {
            message = "用户或密码错误, 请重试.";
        }

        model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, username);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM, rememberMe);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_MOBILE_PARAM, mobile);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, exception);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, message);

        if (logger.isDebugEnabled()) {
            logger.debug("login fail, active session size: {}, message: {}, exception: {}",
                    sessionDAO.getActiveSessions(false).size(), message, exception);
        }
        // 非授权异常，登录失败，验证码加1。
        if (!UnauthorizedException.class.getName().equals(exception)) {
            model.addAttribute("isValidateCodeLogin", isValidateCodeLogin(username, true, false));
        }
        // 验证失败清空验证码
        request.getSession().setAttribute(ValidateCodeServlet.VALIDATE_CODE, IdGen.uuid());
        // 如果是手机登录，则返回JSON字符串
        if (mobile) {
            AjaxJson j = new AjaxJson();
            j.setSuccess(false);
            j.setMsg(message);
            j.put("username", username);
            j.put("name", "");
            j.put("mobileLogin", mobile);
            j.put("JSESSIONID", "");
            return renderString(response, j.getJsonStr());
        }
        return "modules/sys/sysLogin";
    }

    /**
     * 管理登录
     *
     * @throws IOException
     */
    @RequestMapping(value = "${adminPath}/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        LogUtils.saveLog(request, "系统登出");
        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        Principal principal = UserUtils.getPrincipal();
        // 如果已经登录，则跳转到管理首页
        if (principal != null) {
            UserUtils.getSubject().logout();

        }

        HashMap<String, String> userSessions = (HashMap<String, String>) CacheUtils.get("USER_SESSIONS");
        if (userSessions != null) {
            userSessions.remove(principal.getSessionid());
        }
        CacheUtils.put("USER_SESSIONS", userSessions);

        // 如果是手机客户端退出跳转到login，则返回JSON字符串
        String ajax = request.getParameter("__ajax");
        if (ajax != null) {
            model.addAttribute("success", "1");
            model.addAttribute("msg", "退出成功");
            return renderString(response, model);
        }
        return "redirect:" + adminPath + "/login";
    }

    /**
     * 登录成功，进入管理首页
     */
    @RequiresPermissions("user")
    @RequestMapping(value = "${adminPath}")
    public String index(HttpServletRequest request, HttpServletResponse response) {
        Principal principal = UserUtils.getPrincipal();
        User user = UserUtils.getUser();

        HashMap<String, String> userSessions = (HashMap<String, String>) CacheUtils.get("USER_SESSIONS");
        if (userSessions == null) {
            userSessions = new HashMap<String, String>();
        }
        userSessions.put(principal.getSessionid(), user.getId());
        CacheUtils.put("USER_SESSIONS", userSessions);

        // 登录成功后，验证码计算器清零
        isValidateCodeLogin(principal.getLoginName(), false, true);

        if (logger.isDebugEnabled()) {
            logger.debug("show index, active session size: {}", sessionDAO.getActiveSessions(false).size());
        }

        // 如果已登录，再次访问主页，则退出原账号。
        if (Global.TRUE.equals(Global.getConfig("notAllowRefreshIndex"))) {
            String logined = CookieUtils.getCookie(request, "LOGINED");
            if (StringUtils.isBlank(logined) || "false".equals(logined)) {
                CookieUtils.setCookie(response, "LOGINED", "true");
            } else if (StringUtils.equals(logined, "true")) {
                UserUtils.getSubject().logout();
                return "redirect:" + adminPath + "/login";
            }
        }

        // 如果是手机登录，则返回JSON字符串
        if (principal.isMobileLogin()) {
            if (request.getParameter("login") != null) {
                return renderString(response, principal);
            }
            if (request.getParameter("index") != null) {
                return "modules/sys/sysIndex-ace";
            }
            return "redirect:" + adminPath + "/login";
        }

//		// 登录成功后，获取上次登录的当前站点ID
//		UserUtils.putCache("siteId", StringUtils.toLong(CookieUtils.getCookie(request, "siteId")));

//		System.out.println("==========================a");
//		try {
//			byte[] bytes = com.wqh.common.utils.FileUtils.readFileToByteArray(
//					com.wqh.common.utils.FileUtils.getFile("c:\\sxt.dmp"));
//			UserUtils.getSession().setAttribute("kkk", bytes);
//			UserUtils.getSession().setAttribute("kkk2", bytes);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
////		for (int i=0; i<1000000; i++){
////			//UserUtils.getSession().setAttribute("a", "a");
////			request.getSession().setAttribute("aaa", "aa");
////		}
//		System.out.println("==========================b");
        //
        //
        // 默认风格
        String indexStyle = "default";
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie == null || StringUtils.isEmpty(cookie.getName())) {
                continue;
            }
            if (cookie.getName().equalsIgnoreCase("theme")) {
                indexStyle = cookie.getValue();
            }
        }
        // 要添加自己的风格，复制下面三行即可
        if (StringUtils.isNotEmpty(indexStyle)
                && indexStyle.equalsIgnoreCase("ace")) {
            return "modules/sys/sysIndex-ace";
        }

        return "modules/sys/sysIndex-ace";
    }

    /**
     * 获取主题方案
     */
    @RequestMapping(value = "/theme/{theme}")
    public String getThemeInCookie(@PathVariable String theme, HttpServletRequest request, HttpServletResponse response) {
        if (StringUtils.isNotBlank(theme)) {
            CookieUtils.setCookie(response, "theme", theme);
        } else {
            theme = CookieUtils.getCookie(request, "theme");
        }
        return "redirect:" + request.getParameter("url");
    }

    /**
     * 是否是验证码登录
     *
     * @param useruame 用户名
     * @param isFail   计数加1
     * @param clean    计数清零
     * @return
     */
    @SuppressWarnings("unchecked")
    public static boolean isValidateCodeLogin(String useruame, boolean isFail, boolean clean) {
        Map<String, Integer> loginFailMap = (Map<String, Integer>) CacheUtils.get("loginFailMap");
        if (loginFailMap == null) {
            loginFailMap = Maps.newHashMap();
            CacheUtils.put("loginFailMap", loginFailMap);
        }
        Integer loginFailNum = loginFailMap.get(useruame);
        if (loginFailNum == null) {
            loginFailNum = 0;
        }
        if (isFail) {
            loginFailNum++;
            loginFailMap.put(useruame, loginFailNum);
        }
        if (clean) {
            loginFailMap.remove(useruame);
        }
        return loginFailNum >= 3;
    }


    /**
     * 首页
     *
     * @throws IOException
     */
    @RequestMapping(value = "${adminPath}/home")
    public String home(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {

        return "modules/sys/sysHome";

    }
}
