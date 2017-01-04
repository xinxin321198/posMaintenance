package com.baomidou.springwind.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baomidou.kisso.annotation.Action;
import com.baomidou.kisso.annotation.Login;
import com.baomidou.kisso.annotation.Permission;
import com.baomidou.springwind.entity.User;
import com.baomidou.springwind.service.IUserService;

/**
 * <p>
 * 首页
 * </p>
 * 
 * @author hubin
 * @Date 2016-04-13
 */
@Controller
public class IndexController extends BaseController {

	/**
	 * 首页
	 */
	@Permission(action = Action.Skip)
	@RequestMapping(value={"/index",""})
	public String index(Model model) {
		User user = userService.selectById((long)1);
		model.addAttribute("user", user);
		return "/index";
	}

	/**
	 * 主页
	 */
	@Permission(action = Action.Skip)
	@RequestMapping("/home")
	public String home(Model model) {
		return "/home";
	}

	/**
	 * SW 捐赠
	 */
	@Permission(action = Action.Skip)
	@RequestMapping("/donate")
	public String donate() {
		return "/donate";
	}
}
