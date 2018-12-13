package com.hm.common.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import com.alibaba.druid.pool.DruidDataSource;

/**
 * @Configuration 用于标识此类为配置类
 * @PropertySource 注解用于定义要加载的资源，
 * 系统底层会对@PropertySource注解定义的文件内容进行解析,
 * 然后封装到Environment对象.
 * @Bean 注解用于定义和描述第三方的Bean对象
 * @author lord
 * Dec 12, 2018-6:16:09 PM
 */
@PropertySource(value="classpath:configs.properties")
@Configuration
public class AppDataSourceConfig {
	  /**配置数据源对象:druid*/
	 @Bean(value="dataSource",initMethod="init",destroyMethod="close")//等效于<bean id="" class="">
	 public DataSource newDruidDataSource(
			 Environment env){
	   //System.out.println("==newDruidDataSource==");
	   DruidDataSource ds=new DruidDataSource();
	   ds.setDriverClassName(env.getProperty("jdbcDriver"));
	   ds.setUrl(env.getProperty("jdbcUrl"));
	   ds.setUsername(env.getProperty("jdbcUser"));
	   ds.setPassword(env.getProperty("jdbcPassword"));
	   return ds;
	 }
}
