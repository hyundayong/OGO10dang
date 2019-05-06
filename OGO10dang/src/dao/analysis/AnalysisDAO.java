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
	
	public ArrayList<String[]> getMatchFood(BodyInfo bodyinfo) { // �ۼ��� SQL������ ���ĸ�� ���Ļ����� ArrayList�� �����ϴ� �޼ҵ�
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String[]> foodList = new ArrayList<String[]>();
		String sql = "";
		try {
			sql = foodMakeSQL(bodyinfo);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String[] food = new String[] {rs.getString(1), rs.getString(2) };
				foodList.add(food);
			}
		} catch(Exception e) {
			System.out.println("getMatchFood ���� : " + e);
		} finally {
			close(pstmt); close(rs);
		}
		return foodList;
	}
	
	public String foodMakeSQL(BodyInfo bodyinfo) { // FOODDICT_HM���� ���ĸ�� ���Ļ����� �������� SQL�� �ۼ� �޼ҵ�
		String sql = null;
		try {
			sql = "SELECT FOOD, FOODPHOTO FROM FOODDICT_HM WHERE ";
			if(bodyinfo.getSmoke().equals("y")) {
				sql += "SMOKE = 'Y' AND ";
			} else if(bodyinfo.getSmoke().equals("n")) {
				sql += "SMOKE = 'N' AND ";
			}
			if((bodyinfo.getDrink() == 3) || (bodyinfo.getDrink() == 4)) {
				sql += "DRINK = 'Y' AND ";
			} else if((bodyinfo.getDrink() == 1) || (bodyinfo.getDrink() == 2)) {
				sql += "DRINK = 'N' AND ";
			}
			if(bodyinfo.getPurpose().equals("diet")) {
				sql += "DIET = 'Y' AND ";
			}
			if(bodyinfo.getPurpose().equals("health")) {
				sql += "HEALTH = 'Y' AND ";
			}
			if(bodyinfo.getPurpose().equals("muscle")) {
				sql += "MUSCLE = 'Y' AND ";
			}
			sql = sql.substring(0, sql.length()-5); // SQL�� �������� AND�� ����
			System.out.println("sql : " + sql);
		} catch(Exception e) {
			System.out.println("foodMakeSQL ���� : " + e);
		} 
		return sql;
		
		
	} 
}
