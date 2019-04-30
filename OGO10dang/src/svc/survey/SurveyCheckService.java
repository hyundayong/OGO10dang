package svc.survey;

import java.sql.Connection;
import static db.JdbcUtil.*;
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
