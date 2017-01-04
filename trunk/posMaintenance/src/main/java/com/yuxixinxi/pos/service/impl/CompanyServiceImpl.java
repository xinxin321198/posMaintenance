package com.yuxixinxi.pos.service.impl;

import org.springframework.stereotype.Service;

import com.yuxixinxi.pos.mapper.CompanyMapper;
import com.yuxixinxi.common.Constans;
import com.yuxixinxi.pos.entity.Company;
import com.yuxixinxi.pos.entity.Machine;
import com.yuxixinxi.pos.service.ICompanyService;
import com.baomidou.springwind.service.support.BaseServiceImpl;

/**
 *
 * Company 表数据服务层接口实现类
 *
 */
@Service
public class CompanyServiceImpl extends BaseServiceImpl<CompanyMapper, Company> implements ICompanyService {

	@Override
	public boolean softDelByid(String id) {
		Company company  = new Company();
		company.setId(id);
		company.setDelFlag(Constans.Yes_no.YES);
		return updateSelectiveById(company);
	}


}