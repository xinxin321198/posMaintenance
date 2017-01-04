package com.yuxixinxi.pos.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baomidou.kisso.annotation.Permission;
import com.baomidou.springwind.controller.BaseController;
import com.baomidou.springwind.entity.User;
import com.yuxixinxi.pos.entity.Company;
import com.yuxixinxi.pos.entity.Machine;
import com.yuxixinxi.pos.entity.ServiceLog;
import com.yuxixinxi.pos.service.ICompanyService;
import com.yuxixinxi.pos.service.IMachineService;
import com.yuxixinxi.pos.service.IServiceLogService;
@Controller
@RequestMapping("/mobileservice")
public class MobileSerivceController extends BaseController {
	
	@Autowired
	private IMachineService posMachineService;
	@Autowired
	private ICompanyService posCompanyService;
	@Autowired
	private IServiceLogService posServiceLogService;
	
	@RequestMapping(value={"/index",""})
	@Permission("mobileservice")
	public String index(Model model){
		
		return "/mobileservice/index";
	}
	
	@RequestMapping("/serviceForm")
	@Permission("mobileservice")
	public String  serviceForm(Model model,Machine machine) throws Exception {
		machine = posMachineService.getMachineByCode(machine.getCode());
		Company company =new Company();
		company.setId(machine.getCompanyId());
		company = posCompanyService.selectOne(company);
		User user  = userService.selectById(getCurrentUserId());
		model.addAttribute("user", user);
		model.addAttribute("machine", machine);
		model.addAttribute("company", company);
		return "/mobileservice/serviceForm";
	}
	
	@RequestMapping("/serviceSave")
	@Permission("mobileservice")
	public String serviceSave(Model model,ServiceLog posServiceLog){
		try {
			Machine posMachine = new Machine();
			posMachine.setId(posServiceLog.getMachineId());
			posMachine = posMachineService.selectOne(posMachine);
			model.addAttribute("machine", posMachine);
			
			User user  = userService.selectById(getCurrentUserId());
			model.addAttribute("user", user);
			
			Company company =new Company();
			company.setId(posMachine.getCompanyId());
			company = posCompanyService.selectOne(company);
			model.addAttribute("company", company);
			
			posServiceLog.setServiceDate(new Date());
			posServiceLogService.insert(posServiceLog);
			model.addAttribute("posServiceLog", posServiceLog);
			model.addAttribute("color", "green");
			model.addAttribute("info", "维护信息提交成功！");
		} catch (Exception e) {
			model.addAttribute("color", "red");
			model.addAttribute("info", "维护信息提交失败！");
		}
		return "/mobileservice/saved";
	}
	
	
}
