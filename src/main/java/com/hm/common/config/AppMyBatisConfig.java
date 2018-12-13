package com.hm.common.config;

import java.io.IOException;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
/**
 * mybatis整合配置
 * @author lord
 * Dec 12, 2018-6:45:46 PM
 */
@Configuration
@MapperScan(basePackages="com.hm.**.dao")
public class AppMyBatisConfig {
	 @Bean("sqlSessionFactory")
	 public SqlSessionFactoryBean newSqlSessionFactoryBean(
			 @Autowired DataSource dataSource) throws IOException{
		 SqlSessionFactoryBean fBean=new SqlSessionFactoryBean();
		 fBean.setDataSource(dataSource);
		 Resource[] mapperLocations=
new PathMatchingResourcePatternResolver()
		 .getResources("classpath:mapper/sys/*.xml");
		 fBean.setMapperLocations(mapperLocations);
		 return fBean;
	 }
}
