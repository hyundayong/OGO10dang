package action.analysis;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.analysis.AnalysisService;
import svc.survey.SurveyCheckService;
import svc.survey.SurveyProService;
import vo.ActionForward;
import vo.survey.BodyInfo;

public class AnalysisAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		
		// ���ǿ� ����Ǿ��ִ� id�� �̿��ؼ� ��/�� �������� ���̺��� ��ȸ�ؼ� ������ �ִ��� Ȯ��.
		String id = (String)session.getAttribute("id");
		SurveyCheckService surveyCheck = new SurveyCheckService();
		
		// �������̺��� return �Ǹ� ����, �������̺��� return �Ǹ� ����.
		boolean manCount = surveyCheck.isSurveyComplete_M(id);
		boolean womanCount = surveyCheck.isSurveyComplete_W(id);
		
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
			if(manCount) {		// ���ڷ� �������� ������
				SurveyProService selectSurveyService = new SurveyProService();
				bodyInfoList = selectSurveyService.getMBodyInfo(id);		// �������� ��� ����
				bodyInfoList.setGender("M");	// ���� ���ڷ� ����
			} else if (womanCount) {	// ���ڷ� �������� ������
				SurveyProService selectSurveyService = new SurveyProService();	// �������� ��� ����
				bodyInfoList = selectSurveyService.getWBodyInfo(id);
				bodyInfoList.setGender("W");
			}
			AnalysisService analysisService = new AnalysisService();
			ArrayList<String[]> exerciseList = analysisService.getexerciseList(bodyInfoList);
			ArrayList<String[]> foodList = analysisService.getMatchFood(bodyInfoList);
			
			request.setAttribute("exerciseList", exerciseList);		// ���, � ��ũ ����
			request.setAttribute("bodyInfoList", bodyInfoList);		// �������� ��� ��� ����(���������� bodytype�� �ʿ��ϱ� ��)
			request.setAttribute("foodList", foodList);
			forward.setPath("/analysis/bodyAnalysis.jsp");			// ü�� �м� ��� �������� �̵�
		}
		return forward;
	}
}
