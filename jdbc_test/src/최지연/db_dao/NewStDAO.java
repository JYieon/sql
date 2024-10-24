package 최지연.db_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db_common.DBConnect;
import 최지연.db_dto.NewStDTO;

//db 관련 코드
public class NewStDAO {
	Connection con = DBConnect.getConnect2();;
	PreparedStatement ps;
	ResultSet rs;
	public NewStDAO() {
		con = DBConnect.getConnect2();
	}
	
	public void getList() {
		String sql = "select * from newst";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getString("id"));
				System.out.println("--------------------");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<NewStDTO> getList2() {
		String sql = "select * from newst";
		ArrayList<NewStDTO> list = new ArrayList<NewStDTO>();
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				NewStDTO dto = new NewStDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public NewStDTO selectOne(String inputId) {
		NewStDTO dto = null;
		String sql = "select * from newst where id = '" + inputId + "'";
		try {
			ps = con.prepareStatement(sql); //실행
			rs = ps.executeQuery(); //결과값
			if(rs.next()) {
				//System.out.println("존재하는 id : " + rs.getString("id"));
				dto = new NewStDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
			}
//			else {
//				System.out.println("존재하지 않는 id"); 
//				//aaa를 치면 error가 나버림 why? ' '가 없어서! 문자형은 생략가능해서 다른 숫자를 치면 else문이 실행되었는데 문자는 ''가 필요해서 error가 남. sql문 수정
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int insert(String id, String name, int age) {
		String sql = "insert into newst values(?,?,?)"; //나중에 값을 채워넣는 방법
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setInt(3, age); //?채워주기
			//insert행 삽입시 숫자가 반환됨
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("동일한 아이디 입력시 문제 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int update(String id, String name, int age) {
		String sql = "update newst set name = ?, age = ? where id = ?";
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,  name);
			ps.setInt(2,  age);
			ps.setString(3, id);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(String id) {
		String sql = "delete from newst where id = '" + id + "'";
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
}
