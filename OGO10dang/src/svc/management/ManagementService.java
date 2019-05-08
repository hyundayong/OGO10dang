package svc.management;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.management.ManagementDAO;
import vo.management.DailyProgram;

public class ManagementService {
	public DailyProgram getDailyProgram(String selectDay) {
		Connection conn = getConnection();
		DailyProgram dailyprogram = null;
		
		ManagementDAO manageDAO = ManagementDAO.getInstance();
		manageDAO.setConnection(conn);
		
		dailyprogram = manageDAO.selectDailyProgram(selectDay);
		
		close(conn);
		return dailyprogram;
	}
	
	public DailyProgram getDailyProgram_M(String selectDay) { // ManagementDAO에 접근하는 메소드
		Connection conn = getConnection();
		DailyProgram dailyprogram = null;
		
		ManagementDAO managementDAO = ManagementDAO.getInstance();
		managementDAO.setConnection(conn);
		dailyprogram = managementDAO.selectDailyProgram_M(selectDay);
		
		close(conn);
		return dailyprogram;
	}
	
	public DailyProgram getGoodfood(String smoke, String drink, String purpose) {
		
		Connection conn = getConnection();
		DailyProgram dailyprogram = null;
		
		ManagementDAO manageDAO = ManagementDAO.getInstance();
		manageDAO.setConnection(conn);
		
		dailyprogram = manageDAO.selectDaily_goodfood(smoke, drink, purpose);
		close(conn);
		
		return dailyprogram;
	}
	
	public DailyProgram getBadfood() {
		
		Connection conn = getConnection();
		DailyProgram dailyprogram = null;
		
		ManagementDAO manageDAO = ManagementDAO.getInstance();
		manageDAO.setConnection(conn);
		
		dailyprogram = manageDAO.selectDaily_badfood();
		close(conn);
		
		return dailyprogram;
	}
	
}
