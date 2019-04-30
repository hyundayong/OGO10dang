package action.analysis;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.analysis.AnalysisService;
import svc.survey.SurveyCheckService;
import svc.survey.SurveyProService;
import vo.ActionForward;
import vo.survey.BodyInfo;
public class AnalysisReadyCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		
		// ���ǿ� ����Ǿ��ִ� id�� �̿��ؼ� ��/�� �������� ���̺��� ��ȸ�ؼ� ������ �ִ��� Ȯ��.
		String id = (String)session.getAttribute("id");
		SurveyCheckService serveyCheck = new SurveyCheckService();
		
		// �������̺��� return �Ǹ� ����, �������̺��� return �Ǹ� ����.
		boolean manCount = serveyCheck.isSurveyComplete_M(id);
		boolean womanCount = serveyCheck.isSurveyComplete_W(id);
		
		forward = new ActionForward();
		forward.setRedirect(true);

		// ����, ���� ���̺��� �ش� ���̵�� �������簡 �Ǿ����� ������
		if (manCount == false && womanCount == false) { 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('���� �������縦 �Ϸ����ּ���.')");
			out.println("document.location.href='http://localhost:8088/ogo10dang_work/survey/surveyGenderSelect.jsp'");
			out.println("</script>");
		} else {	// �������縦 �Ϸ�������
			BodyInfo bodyInfoList = null;
			if(manCount) {
				SurveyProService selectSurveyService = new SurveyProService();
				bodyInfoList = selectSurveyService.getMBodyInfo(id);
				bodyInfoList.setGender("M");
				// ��ó: https://jeong-pro.tistory.com/87 [�⺻�⸦ �״� ���Ƹ��߾� �ڵ���α�]
				forward.setPath("/analysis/bodyAnalysis.jsp");
			} else if (womanCount) {
				SurveyProService selectSurveyService = new SurveyProService();
				bodyInfoList = selectSurveyService.getWBodyInfo(id);
				bodyInfoList.setGender("W");
				forward.setPath("/analysis/bodyAnalysis.jsp");
			}
			AnalysisService analysisService = new AnalysisService();
			analysisService.getexerciseList(bodyInfoList);
		}
		return forward;
	}
}
