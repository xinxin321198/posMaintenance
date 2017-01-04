package com.yuxixinxi.pos.service;

import com.yuxixinxi.pos.entity.ServiceLog;
import com.baomidou.framework.service.ISuperService;

/**
 *
 * ServiceLog 表数据服务层接口
 *
 */
public interface IServiceLogService extends ISuperService<ServiceLog> {
	public boolean softDelByid(String id);

}