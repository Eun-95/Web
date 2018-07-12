package Conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	private static DBConnect DB = new DBConnect();
	private Connection conn = null;
	
	private String dbURL = "jdbc:mysql://203.255.177.208:3306/test3?serverTimezone=UTC";
	// test3데이터베이스에 접속하는 3306포트(=내컴퓨터의 mysql포트)
	private String dbID = "test3";
	private String dbPassword = "test1234";// 자신이 설정한 test3 비밀번호 입력
	private final static String DRIVER="com.mysql.jdbc.Driver"; // Driver는 매개체역할 Library
	
	public DBConnect() {
		
	}
	
	public static DBConnect getInstance() {
		return DB;
	}
	public Connection getConnection() {
		
		try {
			Class.forName(DRIVER);
			
			//데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
			conn= DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
