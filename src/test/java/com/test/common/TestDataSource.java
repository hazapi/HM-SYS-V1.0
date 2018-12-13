package com.test.common;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;

public class TestDataSource extends TestBase {
	//测试连接池
	@Test
	public void testDruidSource() throws Exception {
		 DataSource ds=
		 ctx.getBean("dataSource",DataSource.class);
	     Connection conn=
	    		 ds.getConnection();
	     System.out.println(conn);
	}
}
