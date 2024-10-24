package jdbc_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//1. db접속 2. 명령어 전달 3. 결과 받기

class DB{
	Connection con; //연결된 객체를 가지고 온다
	PreparedStatement ps; //명령어 전송
	ResultSet rs; //결과값을 받아온다
	public DB() {
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
	}
	
	public void getList() {
		String sql = "select * from newst";
		try {
			ps = con.prepareStatement(sql); //명령어를 토대로 실행객체를 얻어온다
			rs = ps.executeQuery(); //명령어를 실행
			while(rs.next()) {
				System.out.println(rs.getString("id"));
				System.out.println(rs.getString("name"));
				System.out.println(rs.getInt("age"));
				System.out.println("----------------------");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}

public class Ex01 {
	public static void main(String[] args) {
		DB db = new DB();
		db.getList();
	}
}
