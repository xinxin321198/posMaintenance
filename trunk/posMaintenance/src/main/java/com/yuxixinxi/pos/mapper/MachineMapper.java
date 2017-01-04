package com.yuxixinxi.pos.mapper;

import com.yuxixinxi.pos.entity.Machine;
import com.yuxixinxi.pos.entity.MachineVO;

import java.util.List;

import com.baomidou.mybatisplus.mapper.AutoMapper;

/**
 *
 * Machine 表数据库控制层接口
 *
 */
public interface MachineMapper extends AutoMapper<Machine> {

	List<MachineVO> findJoinMachineList(Machine machine);
}