package svc.analysis;

import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.close;

import java.sql.Connection;
import java.util.ArrayList;

import dao.analysis.AnalysisDAO;
import vo.survey.BodyInfo;

public class AnalysisService {
	
	// 운동명, 운동 링크 반환(여자, 남자별로 구분해서 exerciseList로 반환)
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
