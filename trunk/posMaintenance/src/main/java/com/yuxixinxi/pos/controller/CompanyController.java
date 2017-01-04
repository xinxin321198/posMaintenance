package com.yuxixinxi.pos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baomidou.springwind.controller.BaseController;

@Controller
@RequestMapping("/company")
public class CompanyController extends BaseController {

	@RequestMapping("/list")
	public String list(Model model){
		return "";
	}
	
	@RequestMapping("/form")
	public String form(Model model){
		return "";
	}
}
