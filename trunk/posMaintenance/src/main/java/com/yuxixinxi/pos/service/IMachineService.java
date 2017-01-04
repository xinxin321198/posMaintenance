package com.yuxixinxi.pos.service;

import com.yuxixinxi.pos.entity.Machine;
import com.yuxixinxi.pos.entity.MachineVO;
import com.yuxixinxi.pos.mapper.MachineMapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.framework.service.ISuperService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

/**
 *
 * Machine 表数据服务层接口
 *
 */
public interface IMachineService extends ISuperService<Machine> {
	public Machine getMachineByCode(String code) throws Exception ;
	public boolean softDelByid(String id);
	public Page<MachineVO> findJoinMachinePageList(Page<MachineVO> page,Machine machine);
}