package com.tpt.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection
{
	private final String userID = "sa";
	private final String passWord = "12346";
	private final String url="jdbc:sqlserver://localhost:1433;databaseName=timphong;user="+userID+";password="+passWord;
	
	public Connection getConnection() throws Exception
	{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url);
		
	}
}


