package com.test.common;

import org.junit.After;
import org.junit.Before;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.hm.common.config.AppRootConfig;
/**
 * 测试基类,初始化spring相关资源
 * @author lord
 * Dec 12, 2018-6:09:34 PM
 */
public class TestBase {
	//基于注解方式的Context对象
	protected AnnotationConfigApplicationContext ctx;
	@Before
	public void init() {
		ctx=new AnnotationConfigApplicationContext(AppRootConfig.class);
	}
	@After
	public void destory() {
		ctx.close();
	}
}
