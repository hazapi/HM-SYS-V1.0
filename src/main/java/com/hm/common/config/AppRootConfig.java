package com.hm.common.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
/**
 * 此配置类整合数据源
 * @author lord
 * Dec 12, 2018-6:05:29 PM
 * @ComponentScan 用于指定要扫描哪些包中的Bean组件，
 * excludeFilters用于指定要排除对哪些Bean的扫描。
 */
@ComponentScan(value="com.hm",
excludeFilters={@Filter(type=FilterType.ANNOTATION,classes={Controller.class,ControllerAdvice.class})})
public class AppRootConfig {

}
