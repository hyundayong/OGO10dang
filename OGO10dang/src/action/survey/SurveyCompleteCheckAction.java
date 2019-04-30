package action.survey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.survey.SurveyCheckService;
import svc.survey.SurveyProService;
import vo.ActionForward;
import vo.survey.BodyInfo;

public class SurveyCompleteCheckAction implements Action {

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

		// ��������� 
		if (manCount) { //�����϶�, �������̺� �̹� ����� �� ����̸�
			SurveyProService selectSurveyService = new SurveyProService();
			BodyInfo bodyInfoList = selectSurveyService.getMBodyInfo(id);
			request.setAttribute("bodyInfoList", bodyInfoList);
			forward.setPath("/survey/manSurveyFormResult.jsp");	// ���ڰ���������� �̵�
		} else if (womanCount) { //�����϶�
			SurveyProService selectSurveyService = new SurveyProService();
			BodyInfo bodyInfoList = selectSurveyService.getWBodyInfo(id);
			request.setAttribute("bodyInfoList", bodyInfoList);
			forward.setPath("/survey/womanSurveyFormResult.jsp");	// ���ڰ���������� �̵�
		} else { // �������� ��� ������
			forward.setPath("/survey/surveyGenderSelect.jsp");
		}
		return forward;
	}
}
