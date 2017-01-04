package com.yuxixinxi.pos.service;

import com.yuxixinxi.pos.entity.Company;
import com.baomidou.framework.service.ISuperService;

/**
 *
 * Company 表数据服务层接口
 *
 */
public interface ICompanyService extends ISuperService<Company> {
	public boolean softDelByid(String id);

}