package com.hm.common.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
/**
 * spring mvc配置类
 * @author lord
 * Dec 12, 2018-6:51:14 PM
 */
@ComponentScan(value="com.hm",
includeFilters={@Filter(type=FilterType.ANNOTATION,
               classes={Controller.class,ControllerAdvice.class})},
useDefaultFilters=false)
@EnableWebMvc
public class AppMvcConfig extends WebMvcConfigurerAdapter{
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		 registry.jsp("/WEB-INF/",".html");
	}
}
