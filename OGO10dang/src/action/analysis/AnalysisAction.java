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
			out.println("document.location.href='http://localhost:8088/ogo10dang_yk/survey/surveyGenderSelect.jsp'");
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
			ArrayList<String[]> exerciseList = analysisService.getMatchExercise(bodyInfoList);
			ArrayList<String[]> exerciseList_four = new ArrayList<String[]>();
			if(exerciseList.size() > 4) {
			int[] randnums = new int[4];
			for(int i = 0; i < 4; i++) {
				randnums[i] = (int)(Math.random()*exerciseList.size());
				for(int j = 0; j < i; j++) {
					if(randnums[i] == randnums[j]) {
						i--;
						break;		}
					}
				}
				for(int i = 0; i < randnums.length; i++) {
					exerciseList_four.add(i, exerciseList.get(randnums[i]));
				}
			} else {
				exerciseList_four = exerciseList;
			}
			
			request.setAttribute("exerciseList", exerciseList_four);		// ���, � ��ũ ����
			request.setAttribute("bodyInfoList", bodyInfoList);		// �������� ��� ��� ����(���������� bodytype�� �ʿ��ϱ� ��)
			forward.setPath("/survey/bodyAnalysis.jsp");			// ü�� �м� ��� �������� �̵�
		}
		return forward;
	}
}
