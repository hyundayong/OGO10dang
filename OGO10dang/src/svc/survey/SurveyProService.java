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
		
		System.out.println("bodyinfo_wList.Name [Service~]= "+bodyinfo_wList.getName());
		System.out.println("bodyinfo_wList.Age = "+bodyinfo_wList.getAge());
		System.out.println("bodyinfo_wList.Height = "+bodyinfo_wList.getHeight());
		System.out.println("bodyinfo_wList.Weight = "+bodyinfo_wList.getWeight());
		System.out.println("bodyinfo_wList.Smoke = "+bodyinfo_wList.getSmoke());
		System.out.println("bodyinfo_wList.Drink = "+bodyinfo_wList.getDrink());
		System.out.println("bodyinfo_wList.Exercise = "+bodyinfo_wList.getExercise());
		System.out.println("bodyinfo_wList.Purpose = "+bodyinfo_wList.getPurpose());
		System.out.println("bodyinfo_wList.Arm = "+bodyinfo_wList.getArm());
		System.out.println("bodyinfo_wList.Belly = "+bodyinfo_wList.getBelly());
		System.out.println("bodyinfo_wList.Thigh = "+bodyinfo_wList.getThigh());
		System.out.println("bodyinfo_wList.Calf = "+bodyinfo_wList.getThigh());
		System.out.println("bodyinfo_wList.Hip = "+bodyinfo_wList.getHip());
		
		
		return bodyinfo_wList;
	}
	
	public BodyInfo getMBodyInfo (String id) throws Exception {
		BodyInfo bodyinfo_mList = null;
		
		Connection conn = getConnection();
		SurveyDAO surveyDAO = SurveyDAO.getInstance();
		surveyDAO.setConnection(conn);
		
		bodyinfo_mList = surveyDAO.selectMBodyInfo(id);
		close(conn);
		
		System.out.println("bodyinfo_mList.Name [Service~]= "+bodyinfo_mList.getName());
		System.out.println("bodyinfo_mList.Age = "+bodyinfo_mList.getAge());
		System.out.println("bodyinfo_mList.Height = "+bodyinfo_mList.getHeight());
		System.out.println("bodyinfo_mList.Weight = "+bodyinfo_mList.getWeight());
		System.out.println("bodyinfo_mList.Smoke = "+bodyinfo_mList.getSmoke());
		System.out.println("bodyinfo_mList.Drink = "+bodyinfo_mList.getDrink());
		System.out.println("bodyinfo_mList.Exercise = "+bodyinfo_mList.getExercise());
		System.out.println("bodyinfo_mList.Purpose = "+bodyinfo_mList.getPurpose());
		System.out.println("bodyinfo_mList.Arm = "+bodyinfo_mList.getArm());
		System.out.println("bodyinfo_mList.Belly = "+bodyinfo_mList.getChest());
		System.out.println("bodyinfo_mList.Thigh = "+bodyinfo_mList.getShoulder());
		System.out.println("bodyinfo_mList.Calf = "+bodyinfo_mList.getBelly());
		System.out.println("bodyinfo_mList.Hip = "+bodyinfo_mList.getLeg());
		
		
		return bodyinfo_mList;
	}
}
