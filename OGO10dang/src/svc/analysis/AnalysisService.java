package svc.analysis;

import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.close;

import java.sql.Connection;
import java.util.ArrayList;

import dao.analysis.AnalysisDAO;
import vo.survey.BodyInfo;

public class AnalysisService {
	public ArrayList<String[]> getexerciseList(BodyInfo bodyinfo) {
		ArrayList<String[]> exerciseList = null;
		Connection conn = getConnection();
		AnalysisDAO analysisDAO = AnalysisDAO.getInstance();
		analysisDAO.setConnection(conn);
		
		if(bodyinfo.getGender().equals("M")) {
			exerciseList = analysisDAO.getexerciseList_M(bodyinfo);
		} else if(bodyinfo.getGender().equals("W")) {
			exerciseList = analysisDAO.getexerciseList_W(bodyinfo);
		}
		close(conn);
		return exerciseList;
	}
	
}
