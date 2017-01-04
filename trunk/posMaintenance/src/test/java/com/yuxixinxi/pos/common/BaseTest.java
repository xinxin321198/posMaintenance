package com.yuxixinxi.pos.common;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;




@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring/app-tx.xml","/spring/app-datasource.xml","/spring/spring-framework.xml","/spring/app-ehcache.xml","/spring/app-quartz.xml"})
public class BaseTest extends AbstractTransactionalJUnit4SpringContextTests{

	


}
