package db_common;

import java.util.Scanner;
import 최지연.db_service.DBService;
import 최지연.db_service.DBServiceImpl;

public class MainClass {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		int num;
		DBService st = new DBServiceImpl();
		while(true) {
			System.out.println("1. new st 이동");
			System.out.println("2. 다른 사용자 이동");
			System.out.println("3. 종료");
			System.out.print(">>> ");
			num = input.nextInt();
			switch(num){
				case 1: 
					st.display();
					break;
				case 2: break;
				case 3: break;
			}
		}
	}
}
