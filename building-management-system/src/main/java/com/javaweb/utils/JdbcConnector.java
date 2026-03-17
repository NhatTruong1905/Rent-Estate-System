package com.javaweb.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class JdbcConnector {
	public static Connection getConnect() {
		try {
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/buildingdb", "root", "root@123");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
