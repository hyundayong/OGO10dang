package svc.survey;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.survey.SurveyDAO;

public class SurveyCheckService {

	public boolean isSurveyComplete_M (String id) {
		boolean isSurveyComplete = false;
		Connection conn = getConnection();
		SurveyDAO surveyDAO = SurveyDAO.getInstance();
		surveyDAO.setConnection(conn);
		
		int SurveyCheck = surveyDAO.isSurveyComplete_M(id);
		if (SurveyCheck > 0) {
			isSurveyComplete = true;
		} else {
			System.out.println("service : MAN ���̺��� �ش� User�� �������� �����͸� ã�� �� ����");
		}
		close(conn);
		return isSurveyComplete;
	}
	
	public boolean isSurveyComplete_W (String id) {
		boolean isSurveyComplete = false;
		Connection conn = getConnection();
		SurveyDAO surveyDAO = SurveyDAO.getInstance();
		surveyDAO.setConnection(conn);
		
		int SurveyCheck = surveyDAO.isSurveyComplete_W(id);
		if (SurveyCheck > 0) {
			isSurveyComplete = true;
		} else {
			System.out.println("service : WOMAN ���̺��� �ش� User�� �������� �����͸� ã�� �� ����");
		}
		close(conn);
		return isSurveyComplete;
	}
	
	
}
