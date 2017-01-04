package com.yuxixinxi.pos.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.junit.Test;

import com.yuxixinxi.common.JDBCHelper;

public class JDBCtest {
	
	@Test
	public void test() throws SQLException {
		Connection connection = JDBCHelper.getConn("jdbc:mysql://localhost:3306/posmaintenance?useUnicode=true&characterEncoding=utf8&user=root&password=root");
		Statement statement = JDBCHelper.getStatement(connection);
		ResultSet resultSet = JDBCHelper.getResultSet(statement, "select * from user");
		 while (resultSet.next()) {
	               System.out.println(resultSet.getString("id").toString());
	               System.out.println(resultSet.getString("loginName").toString());
	               System.out.println(resultSet.getString("password").toString());
	               System.out.println(resultSet.getString("type").toString());
	               System.out.println(resultSet.getString("status").toString());
	               System.out.println(resultSet.getString("crTime").toString());
	               System.out.println(resultSet.getString("lastTime").toString());
	        }
	}

}
