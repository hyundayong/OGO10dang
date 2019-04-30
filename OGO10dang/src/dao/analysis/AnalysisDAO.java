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
	
	// 남자 운동명, 운동 링크 ArrayList로 반환
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
				String[] exercise = new String[] {	rs.getString(1), "#"	};	//rs.getString(2); 넣어줘야함
				exerciseList.add(i, exercise);	i++;
			}
		} catch(Exception e) {
			System.out.println("AnalysisDAO : getexerciseList_M 에러 : " + e);
		} finally {
			close(rs); close(pstmt);
		}
		return exerciseList;
	}
	
	// 남자 운동명, 운동 링크 ArrayList로 반환
	public ArrayList<String[]> getexerciseList_W(BodyInfo bodyinfo) {
		// 남자 완료되면 여자도 추가할 것
		return null;
	}
	
	// 운동 조회하는 sql문 작성
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
