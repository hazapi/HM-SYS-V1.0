package com.hm.common.config;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
/**
 * tomcat 启动时会加载此类，然后执行相关方法
 * 完成初始化动作
 * 此对象要承担web.xml的作用
 * @author lord
 * Dec 12, 2018-6:58:34 PM
 */
public class AppWebInitializer extends 
    AbstractAnnotationConfigDispatcherServletInitializer {
	/**此方法中加载model(service,respository)*/
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[]{AppRootConfig.class};
	}
	/**此方法中加载View,Controller等相关组件*/
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[]{AppMvcConfig.class};
	}
	/**此方法中定义请求映射*/
	@Override
	protected String[] getServletMappings() {
		//由前端控制器处理所有以.do结尾的请求
		return new String[]{"*.do"};
	}
}
