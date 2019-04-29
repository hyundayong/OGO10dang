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
	
}
