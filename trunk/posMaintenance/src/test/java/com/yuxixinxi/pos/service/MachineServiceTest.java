package com.yuxixinxi.pos.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.transaction.TransactionConfiguration;

import com.baomidou.springwind.mapper.RolePermissionMapper;
import com.yuxixinxi.common.UUIDHelper;
import com.yuxixinxi.pos.common.BaseTest;
import com.yuxixinxi.pos.entity.Company;
import com.yuxixinxi.pos.entity.Machine;
import com.yuxixinxi.pos.entity.MachineVO;
import com.yuxixinxi.pos.mapper.MachineMapper;

@TransactionConfiguration(defaultRollback = false)
public class MachineServiceTest extends BaseTest {

	@Autowired
	private IMachineService posMachineService;
	
	@Autowired
	private ICompanyService posCompanyService;
	
	@Autowired
	private MachineMapper machineMapper;
	
	@Autowired
	private RolePermissionMapper rolePermissionMapper;
	
	//@Test
	public void insertTestData(){
		for (int i = 0; i < 10; i++) {
			//company
			Company company = new Company();
			String  companyId = UUIDHelper.getUUID();
			company.setId(companyId);
			company.setName("商家"+i);
			company.setDelFlag("0");
			company.setMobile("电话"+i);
			company.setPhone("座机"+i);
			company.setRemarks("商家备注"+i);
			company.setAddress("地址"+i);
			posCompanyService.insert(company);
			
			Machine machine = new Machine();
			machine.setCode(String.valueOf(i));
			machine.setCompanyId(companyId);
			machine.setDelFlag("0");
			machine.setRemarks("备注");
			posMachineService.insert(machine);
		}
	}
	
	@Test
	public void findVoList(){
		Machine machineParam = new Machine();
		List<MachineVO> machineVOList = machineMapper.findJoinMachineList(machineParam);
		for (int i = 0; i < machineVOList.size(); i++) {
			MachineVO vo = machineVOList.get(i);
			System.out.println(vo.getCompany().getName());
		}
	}
	
	
	@Test
	public void findList(){
		Machine machineParam = new Machine();
		List<Machine> machineList = posMachineService.selectList(machineParam);
		for (int i = 0; i < machineList.size(); i++) {
			Machine machine =machineList.get(i);
			System.out.println(machine.getCode());
		}
	}
	
	@Test
	public void test(){
		List<Long> integer = rolePermissionMapper.selecPermissionIdsByRoleId((long)1);
		for (Long long1 : integer) {
			System.out.println(long1);
		}
	}
	

}
