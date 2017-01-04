package com.yuxixinxi.pos.service.impl;

import org.springframework.stereotype.Service;

import com.yuxixinxi.pos.mapper.ServiceLogMapper;
import com.yuxixinxi.common.Constans;
import com.yuxixinxi.pos.entity.Machine;
import com.yuxixinxi.pos.entity.ServiceLog;
import com.yuxixinxi.pos.service.IServiceLogService;
import com.baomidou.springwind.service.support.BaseServiceImpl;

/**
 *
 * ServiceLog 表数据服务层接口实现类
 *
 */
@Service
public class ServiceLogServiceImpl extends BaseServiceImpl<ServiceLogMapper, ServiceLog> implements IServiceLogService {

	@Override
	public boolean softDelByid(String id) {
		ServiceLog serviceLog = new ServiceLog();
		serviceLog.setId(id);;
		serviceLog.setDelFlag(Constans.Yes_no.YES);
		return updateSelectiveById(serviceLog);
	}


}