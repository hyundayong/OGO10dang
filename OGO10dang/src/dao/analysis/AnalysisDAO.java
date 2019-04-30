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
	
	// ���� ���, � ��ũ ArrayList�� ��ȯ
	public ArrayList<String[]> getexerciseList_M(BodyInfo bodyinfo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String[]> exerciseList = new ArrayList<String[]>();
		try {
			String sql = exerciseMakeSQL_M(bodyinfo);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()) {
				String[] exercise = new String[] {	rs.getString(1), "#"	};	//rs.getString(2); �־������
				exerciseList.add(i, exercise);	i++;
			}
		} catch(Exception e) {
			System.out.println("AnalysisDAO : getexerciseList_M ���� : " + e);
		} finally {
			close(rs); close(pstmt);
		}
		return exerciseList;
	}
	
	// ���� ���, � ��ũ ArrayList�� ��ȯ
	public ArrayList<String[]> getexerciseList_W(BodyInfo bodyinfo) {
		// ���� �Ϸ�Ǹ� ���ڵ� �߰��� ��
		return null;
	}
	
	// � ��ȸ�ϴ� sql�� �ۼ�
	public String exerciseMakeSQL_M(BodyInfo bodyinfo) {
		String sql = "SELECT EXERCISE, EXERCISELINK FROM MEXERCISEDICT_HM WHERE ";
		ArrayList<String> subsql = new ArrayList<String>();
		if(bodyinfo.getExercise() == 4) {
			sql += "GRADE BETWEEN 3 AND 4 ";
		} else {
			sql += "GRADE=" + bodyinfo.getExercise() + " ";
		}
		int i = 0;
		if(bodyinfo.getArm() % 2 == 1) {
			subsql.add(i, "ARM='Y'");	i++;
		}
		if(bodyinfo.getChest() % 2 == 1) {
			subsql.add(i, "CHEST='Y'");	i++;
		}
		if(bodyinfo.getShoulder() == 1) {
			subsql.add(i, "SHOULDER='Y'");	i++;
		}
		if(bodyinfo.getBelly() % 2 == 1) {
			subsql.add(i, "BELLY='Y'");	i++;
		}
		if(bodyinfo.getLeg() % 2 == 1) {
			subsql.add(i, "LEG='Y'");	i++;
		}
		
		if(subsql.size() > 0) {
			sql += "INTERSECT SELECT EXERCISE, EXERCISELINK FROM MEXERCISEDICT_HM WHERE ";
			for(int j = 0; j < subsql.size(); j++) {
				sql += subsql.get(j) + " OR ";
			}
			sql = sql.substring(0, sql.length()-4);
		}
		return sql;
	}
}
