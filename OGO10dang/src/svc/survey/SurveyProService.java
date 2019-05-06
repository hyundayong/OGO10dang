package svc.survey;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.survey.SurveyDAO;
import vo.survey.BodyInfo;

public class SurveyProService {
	// 설문조사 서비스 ~ ^^ 

	/*	-	Method: insertBodyInfo(설문 내용 데이터베이스 등록)
		-	Method: updateBodyInfo(설문 내용 수정)

	 */
	
	public void insertMBodyInfo (BodyInfo bodyinfo) {

		Connection conn = getConnection();
		SurveyDAO surveyDAO = SurveyDAO.getInstance();
		surveyDAO.setConnection(conn);
		
		int insertBodyInfo = surveyDAO.insertMBodyInfo(bodyinfo);
		if (insertBodyInfo > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
	}

	public void updateMBodyInfo (BodyInfo bodyinfo) {

		Connection conn = getConnection();
		SurveyDAO surveyDAO = SurveyDAO.getInstance();
		surveyDAO.setConnection(conn);
		
		int updateBodyInfo = surveyDAO.updateMBodyInfo(bodyinfo);
		if (updateBodyInfo > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
	}

	public void insertWBodyInfo (BodyInfo bodyinfo) {

		Connection conn = getConnection();
		SurveyDAO surveyDAO = SurveyDAO.getInstance();
		surveyDAO.setConnection(conn);
		
		int insertBodyInfo = surveyDAO.insertWBodyInfo(bodyinfo);
		if (insertBodyInfo > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
	}

	public void updateWBodyInfo (BodyInfo bodyinfo) {

		Connection conn = getConnection();
		SurveyDAO surveyDAO = SurveyDAO.getInstance();
		surveyDAO.setConnection(conn);
		
		int updateBodyInfo = surveyDAO.updateWBodyInfo(bodyinfo);
		if (updateBodyInfo > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
	}
	
	public BodyInfo getWBodyInfo (String id) throws Exception {
		BodyInfo bodyinfo_wList = null;
		
		
		
		Connection conn = getConnection();
		SurveyDAO surveyDAO = SurveyDAO.getInstance();
		surveyDAO.setConnection(conn);
		
		bodyinfo_wList = surveyDAO.selectWBodyInfo(id);
		close(conn);
		
		return bodyinfo_wList;
	}
	
	public BodyInfo getMBodyInfo (String id) throws Exception {
		BodyInfo bodyinfo_mList = null;
		
		Connection conn = getConnection();
		SurveyDAO surveyDAO = SurveyDAO.getInstance();
		surveyDAO.setConnection(conn);
		
		bodyinfo_mList = surveyDAO.selectMBodyInfo(id);
		close(conn);
		
		return bodyinfo_mList;
	}
}
