package dao.analysis;
import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.survey.BodyInfo;

public class AnalysisDAO {
	static private AnalysisDAO preptDAO = new AnalysisDAO();
	private AnalysisDAO() { }
	public static AnalysisDAO getInstance() {
		return preptDAO;
	}
	
	Connection conn;
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	public ArrayList<String[]> getexerciseList_M(BodyInfo bodyinfo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String[]> exerciseList = null;
		try {
			String sql = "���� ����Ʈ�� ����� �޼ҵ� ���� �ʿ�";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String[] exercise = new String[] {	rs.getString(1), rs.getString(2)	};
				exerciseList.add(exercise);
			}
		} catch(Exception e) {
			System.out.println("getexerciseList_M ���� : " + e);
		}
		return exerciseList;
	}
	
	
	public ArrayList<String[]> getexerciseList_W(BodyInfo bodyinfo) {
		// ���� �Ϸ�Ǹ� ���ڵ� �߰��� ��
		return null;
	}
	
	public ArrayList<String[]> getfoodList(BodyInfo bodyinfo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String[]> foodList = null;
		try {
			String sql = "";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
			}
		} catch(Exception e) {
			System.out.println("getfoodList ���� : " + e);
		} finally {
			close(pstmt); close(rs);
		}
		return foodList;
	}
	
	public ArrayList<String[]> foodMakeSQL(BodyInfo bodyinfo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String[]> foodList = null;
		String sql = "";
		try {
			sql = "SELECT FOOD, FOODPHOTO FROM FOODDICT_HM WHERE ";
			if(bodyinfo.getSmoke() == "y") {
				sql += "SMOKE = 'Y' AND";
			} else if(bodyinfo.getSmoke() == "n") {
				sql += "SMOKE = 'N' AND";
			}
			if((bodyinfo.getDrink() == 3) || (bodyinfo.getDrink() == 4)) {
				sql += "DRINK = 'Y' AND";
			} else if((bodyinfo.getDrink() == 1) || (bodyinfo.getDrink() == 2)) {
				sql += "DRINK = 'N' AND";
			}
		} catch(Exception e) {
			System.out.println("foodMakeSQL ���� : " + e);
		} finally {
			close(rs); close(pstmt);
		}
		
		
	} 
	
}
