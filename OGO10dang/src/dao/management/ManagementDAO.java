package dao.management;
import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.management.DailyProgram;

public class ManagementDAO {
	static private ManagementDAO manageDAO = new ManagementDAO();
	private ManagementDAO() { }
	public static ManagementDAO getInstance() {
		return manageDAO;
	}
	
	Connection conn;
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	//
	public DailyProgram selectDailyProgram(String selectDay) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DailyProgram dailyprogram = null;
		try {
			String sql = "select A.programday, A.exerciseName, A.exercisevolume, B.exerciselink "
					+ "from wexerciseprogram_hm A, wexercisedict_hm B "
					+ "where A.EXERCISENAME=B.EXERCISE and A.programday="+selectDay;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			dailyprogram = new DailyProgram();

			String[] exercisename = new String[4];
			String[] exercisevolume = new String[4];
			String[] exerciselink = new String[4];
			
			int i = 0;
				while(rs.next()) {
					exercisename[i] = rs.getString(2);
					exercisevolume[i] = rs.getString(3);
					exerciselink[i] = rs.getString(4);
					i++;
				}
				dailyprogram.setExercisename(exercisename);
				dailyprogram.setQuantity(exercisevolume);
				dailyprogram.setLink(exerciselink);
				
		} catch(Exception e) {
			System.out.println("ManagementDAO : selectDailyProgram 에러 : "+e);
			
		} finally {
			close(rs); close(pstmt);
		}
		return dailyprogram;
	}
	
	// 남자 운동 관리 테이블에서 조회된 데이터를 DailyProgram 클래스 내 배열에 저장하는 메소드 
	public DailyProgram selectDailyProgram_M(String selectDay) {	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DailyProgram dailyprogram = new DailyProgram();
		
		try {
			String sql = "SELECT A.PROGRAMDAY, A.EXERCISENAME, A.EXERCISEVOLUME, B.EXERCISELINK"
						+ "FROM MEXERCISEPROGRAM_HM A, MEXERCISEDICT_HM B"
						+ "WHERE A.EXERCISENAME = B.EXERCISE AND A.PROGRAMDAY = " + selectDay;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			String[] exercisename = new String[4];
			String[] exercisevolume = new String[4];
			String[] exerciselink = new String[4];
			
			while(rs.next()) {
				int i = 0;
				exercisename[i] = rs.getString(2);
				exercisevolume[i] = rs.getString(3);
				exerciselink[i] = rs.getString(4);
				i++;
			}
			dailyprogram.setExercisename(exercisename);
			dailyprogram.setQuantity(exercisevolume);
			dailyprogram.setLink(exerciselink);
			
			
			
		} catch(Exception e) {
			System.out.println("selectDailyProgram_M 에러 : " + e);
		} finally {
			close(rs); close(pstmt);
		}
		return dailyprogram;
	}
	
	public DailyProgram selectDaily_goodfood(String smoke, String drink, String purpose) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DailyProgram dailyprogram = null;
		String purpose1 = "";
		if (purpose.equals("diet")) {
			purpose1 = "diet";
		} else if (purpose.equals("health")) {
			purpose1="health";
		} else if (purpose.equals("muscle")) {
			purpose1="muscle";
		}
		try {
			String sql = "select FOOD from fooddict_hm where (smoke=? and drink=?) or "+purpose1+"=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, smoke);
			pstmt.setString(1, drink);
			pstmt.setString(1, purpose1);
			
			String[] goodfoods = new String[15];
			String[] goodfoods2 = new String[2];
			int i = 0;
			while(rs.next()) {
				goodfoods[i] = rs.getString(1);
			}

			for (int j = 0; i < goodfoods2.length; i++) {
				int ran = (int)(Math.random()*goodfoods.length);
				goodfoods2[j] = goodfoods[ran];
				if (goodfoods2[j] == goodfoods[ran]) {
					j--;
				}
			}
			dailyprogram.setGoodfood(goodfoods2);
		} catch(Exception e ) {
			e.printStackTrace();
		} finally {
			close(rs); close(pstmt);
		}
		return dailyprogram;
		
		
	}
	
	public DailyProgram selectDaily_badfood() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DailyProgram dailyprogram = null;
	
		try { // badfood가 종류가 별로 없고 굳이 나눌필요가 없어서 일반적으로 안좋은 음식같은것들이 나오도록 검색해보니 이 조건으로 나와서 sql문을 이렇게 고정시킴. 매개변수없이 요렇게만 검색!
			String sql = "select * from fooddict_hm where DRINK='N' or SMOKE='N' or diet='N'";
			pstmt = conn.prepareStatement(sql);
			
			String[] badfoods = new String[12];
			String[] badfoods2 = new String[2];
			int i = 0;
			while(rs.next()) {
				badfoods[i] = rs.getString(1);
			}

			for (int j = 0; i < badfoods2.length; i++) {
				int ran = (int)(Math.random()*badfoods.length);
				badfoods2[j] = badfoods[ran];
				if (badfoods2[j] == badfoods[ran]) {
					j--;
				}
			}
			dailyprogram.setBadfood(badfoods2);
		} catch(Exception e ) {
			e.printStackTrace();
		} finally {
			close(rs); close(pstmt);
		}
		return dailyprogram;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
