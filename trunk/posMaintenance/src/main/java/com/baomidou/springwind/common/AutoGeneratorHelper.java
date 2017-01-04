package com.baomidou.springwind.common;

import com.baomidou.kisso.common.util.EnvUtil;
import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.ConfigGenerator;

/**
 * 
 * 自动生成映射工具类
 * 
 * @author hubin
 *
 */
public class AutoGeneratorHelper {

	/**
	 * 
	 * 测试 run 执行
	 * 
	 * <p>
	 * 配置方法查看 {@link ConfigGenerator}
	 * </p>
	 * 
	 */
	public static void main( String[] args ) {
		ConfigGenerator cg = new ConfigGenerator();
		cg.setEntityPackage("com.yuxixinxi.pos.entity");
		cg.setMapperPackage("com.yuxixinxi.pos.mapper");
		cg.setServicePackage("com.yuxixinxi.pos.service");
		cg.setSuperServiceImpl("com.baomidou.springwind.service.support.BaseServiceImpl");
		cg.setIdType(IdType.UUID);
		if (EnvUtil.isLinux()) {
			cg.setSaveDir("/Users/hubin/springwind/");
		} else {
			cg.setSaveDir("C:/springwind/");
		}
		cg.setDbDriverName("com.mysql.jdbc.Driver");
		cg.setDbUser("root");
		cg.setDbPassword("root");
		cg.setDbUrl("jdbc:mysql://127.0.0.1:3306/posmaintenance?characterEncoding=utf8");
		cg.setDbPrefix(true);//true，实体类不包含表前缀，false，实体类包含表前缀
		cg.setColumnHump(false);//字段不是驼峰命名，实体类生成会自动去下划线
		AutoGenerator.run(cg);
	}
	
}
