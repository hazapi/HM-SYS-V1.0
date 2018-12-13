package com.test.common;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

public class TestMyBatis extends TestBase {
	@Test
	public void testSqlSessionFactory()throws Exception {
		SqlSessionFactory ssf=
		ctx.getBean("sqlSessionFactory", SqlSessionFactory.class);
		System.out.println(ssf);
	}
}
