package 최지연.db_service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Scanner;

import db_common.DBConnect;
import 최지연.db_dao.NewStDAO;
import 최지연.db_dto.NewStDTO;

public class DBServiceImpl implements DBService {
	NewStDAO dao;
	
	public DBServiceImpl() {
		dao = new NewStDAO();
	}
	
	@Override
	public void display() {
		Scanner input = new Scanner(System.in);
		int num;
		String inputId = null;
		boolean bool = true;
		while(bool) {
			System.out.println("1. 모든 데이터 확인(service)");
			System.out.println("2. 모든 데이터 확인(dao)"); //이 방법이 맞긴 함
			System.out.println("3. 검색 데이터 확인");
			System.out.println("4. 데이터 추가");
			System.out.println("5. 데이터 수정");
			System.out.println("6. 데이터 삭제");
			System.out.println("7. 종료");
			System.out.print(">>> ");
			num = input.nextInt();
			switch(num) {
				case 1: 
					Connection con = DBConnect.getConnect2();
					String sql = "select * from newst";
					
					try {
						PreparedStatement ps = con.prepareStatement(sql);
						ResultSet rs = ps.executeQuery();
						while(rs.next()) {
							System.out.println(rs.getString("id"));
							System.out.println("--------------------");
						}
					}catch (Exception e) {
						e.printStackTrace();
					}
					break;
				case 2: 
					System.out.println("--- dao 연동 출력 ---");
					//dao.getList();
					ArrayList<NewStDTO> list = dao.getList2();
					System.out.println("아이디\t이름\t나이");
					System.out.println("--------------------");
					for(int i = 0; i < list.size(); i++) { //for(NewStDTO d :list)
						NewStDTO d = list.get(i);
						System.out.println(
								d.getId() + "\t" + d.getName() + "\t" + d.getAge()
						);
					}
					break;
				case 3: 
					System.out.print("찾을 id 입력 : ");
					inputId = input.next();
					NewStDTO dto = dao.selectOne(inputId);
					if (dto != null) {
						System.out.println(inputId+"님의 정보");
						System.out.println("id : " + dto.getId());
						System.out.println("name : " + dto.getName());
						System.out.println("age : " + dto.getAge());
					}else {
						System.out.println("존재하지 않는 id입니다");
						System.out.println("다시 검색하세요");
					}
					break;
				case 4: 
					System.out.print("저장할 id : ");
					String id = input.next();
					System.out.print("저장할 name : ");
					String name = input.next();
					System.out.print("저장할 age : ");
					int age = input.nextInt();
					
					int result = dao.insert(id, name, age);
					if(result == 0) {
						System.out.println("문제가 발생했습니다");
					}else {
						System.out.println("회원가입이 완료되었습니다");
					}
				
					break;
				case 5: 
					System.out.print("id 입력 : ");
					id = input.next();
					System.out.print("수정할 name : ");
					name = input.next();
					System.out.print("수정할 age : ");
					age = input.nextInt();
					NewStDTO d = new NewStDTO();
					d.setId(id);
					d.setName(name);
					d.setAge(age);
					
					result = dao.update(id, name, age);
					if(result == 0) {
						System.out.println("수정 실패");
					}else {
						System.out.println("수정 완료");
					}
					break;
				case 6: 
					System.out.print("삭제할 id 입력 : ");
					id = input.next();
					
					NewStDTO dt = new NewStDTO();
					dt.setId(id);
					result = dao.delete(id);
					if(result == 1) {
						System.out.println("삭제 성공");
					}else {
						System.out.println("삭제 실패");
					}
					break;
				case 7: 
					System.out.println("종료합니다");
					bool = false;
					break;
			}
		}
		
//		System.out.println("disp연동");
//		Connection con = null;
//		System.out.println("연동 전 con : " + con);
////		DBConnect db = new DBConnect();
////		con = db.getConnect();
//		con = DBConnect.getConnect2();
//		System.out.println("연동 후 con : " + con);
	}

}
