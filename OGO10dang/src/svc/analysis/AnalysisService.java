package svc.analysis;

import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.close;

import java.sql.Connection;
import java.util.ArrayList;

import dao.analysis.AnalysisDAO;
import vo.survey.BodyInfo;

public class AnalysisService {
	
	// ���, � ��ũ ��ȯ(����, ���ں��� �����ؼ� exerciseList�� ��ȯ)
	public ArrayList<String[]> getMatchExercise(BodyInfo bodyinfo) {
		ArrayList<String[]> exerciseList = null;
		Connection conn = getConnection();
		AnalysisDAO analysisDAO = AnalysisDAO.getInstance();
		analysisDAO.setConnection(conn);
		
		if(bodyinfo.getGender().equals("M")) {
			exerciseList = analysisDAO.getMatchExercise_M(bodyinfo);
		} else if(bodyinfo.getGender().equals("W")) {
			exerciseList = analysisDAO.getMatchExercise_W(bodyinfo);
		}
		close(conn);
		return exerciseList;
	}
	
	public ArrayList<String[]> getMatchFood(BodyInfo bodyinfo) {
		ArrayList<String[]> foodList = null;
		Connection conn = getConnection();
		AnalysisDAO analysisDAO = AnalysisDAO.getInstance();
		analysisDAO.setConnection(conn);
		
		if(bodyinfo.getGender().equals("M") || bodyinfo.getGender().equals("W")) {
			foodList = analysisDAO.getMatchFood(bodyinfo);
		}
		close(conn);
		return foodList;
	}
	
}
