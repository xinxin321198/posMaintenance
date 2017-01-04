package com.yuxixinxi.pos.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.kisso.annotation.Permission;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.springwind.controller.BaseController;
import com.yuxixinxi.common.Constans;
import com.yuxixinxi.common.UUIDHelper;
import com.yuxixinxi.pos.entity.Machine;
import com.yuxixinxi.pos.entity.MachineVO;
import com.yuxixinxi.pos.service.ICompanyService;
import com.yuxixinxi.pos.service.IMachineService;


@Controller
@RequestMapping("/machine")
public class MachineController extends BaseController {

	@Autowired
	private IMachineService posMachineService;
	@Autowired
	private ICompanyService posCompanyService;
	
	@RequestMapping("/list")
	@Permission("machine")
	public String list(Model model){
		return "/machine/machineList";
	}
	
	@ResponseBody
	@Permission("machine")
	@RequestMapping("/getMachineList")
	public String getMachineList() {
		Machine machine = new Machine();
		machine.setDelFlag(Constans.Yes_no.NO);
		Page<MachineVO> page = getPage();
		page = posMachineService.findJoinMachinePageList(page, machine);
		
		return jsonPage(page);
	}
	
	
    @Permission("machine")
    @RequestMapping("/edit")
    public String edit(Model model, String id ) {
    	if ( id != null ) {
    		Machine machineParam = new Machine();
    		machineParam.setId(id);;
			model.addAttribute("machine",posMachineService.selectOne(machineParam));
		}
    	model.addAttribute("companyList",posCompanyService.selectList(null) );
        return "/machine/machineEdit";
    }
    
	@ResponseBody
	@Permission("machine")
	@RequestMapping("/ediMachine")
	public String editMachine( Machine posMachine ) {
		boolean rlt = false;
		if ( posMachine != null ) {
			if ( posMachine.getId() != null&&!posMachine.getId().equals("") ) {
				rlt = posMachineService.updateSelectiveById(posMachine);
			} else {
				posMachine.setId(UUIDHelper.getUUID());
				rlt = posMachineService.insertSelective(posMachine);
			}
		}
		return callbackSuccess(rlt);
	}
	
	
	@ResponseBody
	@Permission("machine")
	@RequestMapping("/delMachine/{id}")
	public String delMchine(@PathVariable String id) {
		boolean flag = posMachineService.softDelByid(id);
		return String.valueOf(flag);
	}
}
