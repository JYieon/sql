package db_common;

import java.sql.Connection;
import java.sql.DriverManager;
//한명이 만들어서 배포
public class DBConnect {
	public Connection getConnect() { //연결된 객체만 가져온다
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//Ojdbc를 사용하기 위해 기능을 등록하는 것. db연결을 위한 우선순위 1번
			//고정적인 값. 바뀌지 않음
			System.out.println("드라이브 로드 성공");
			String id, pwd, url;
			id = "c##choi";
			pwd = "test123";
			url = "jdbc:oracle:thin:@localhost:1521:xe";
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("연결 성공");
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		return con;
	}
	
	public static Connection getConnect2() { //연결된 객체만 가져온다
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//Ojdbc를 사용하기 위해 기능을 등록하는 것. db연결을 위한 우선순위 1번
			//고정적인 값. 바뀌지 않음
			System.out.println("드라이브 로드 성공");
			String id, pwd, url;
			id = "c##choi";
			pwd = "test123";
			url = "jdbc:oracle:thin:@localhost:1521:xe";
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("연결 성공");
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		return con;
	}
}
