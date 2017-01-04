package com.yuxixinxi.pos.service.impl;

import java.util.List;

import org.apache.velocity.app.event.ReferenceInsertionEventHandler.referenceInsertExecutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuxixinxi.pos.mapper.MachineMapper;
import com.yuxixinxi.common.Constans;
import com.yuxixinxi.pos.entity.Machine;
import com.yuxixinxi.pos.entity.MachineVO;
import com.yuxixinxi.pos.service.IMachineService;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.springwind.service.support.BaseServiceImpl;

/**
 *
 * Machine 表数据服务层接口实现类
 *
 */
@Service
public class MachineServiceImpl extends BaseServiceImpl<MachineMapper, Machine> implements IMachineService {

	@Autowired
	private MachineMapper machineMapper;
	
	@Override
	public Machine getMachineByCode(String code) throws Exception {
		Machine machine = new Machine();
		machine.setDelFlag(Constans.Yes_no.NO);
		machine.setCode(code);
		List<Machine> machineList = selectList(machine);
		if (machineList.size()>1) {
			throw new Exception("此pos机的编码有重复~，编码："+code);
		}
		if (machineList.size()<=0) {
			throw new Exception("此编码的pos机不存在~，编码："+code);
		}
		return machineList.get(0);
		
	}

	@Override
	public boolean softDelByid(String id) {
		Machine machine = new Machine();
		machine.setId(id);
		machine.setDelFlag(Constans.Yes_no.YES);
		return updateSelectiveById(machine);
	}

	@Override
	public Page<MachineVO> findJoinMachinePageList(Page<MachineVO> page,Machine machine) {
		page.setRecords(machineMapper.findJoinMachineList(machine));
		return page;
	}

}