package action.management;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.management.ManagementService;
import svc.survey.SurveyCheckService;
import svc.survey.SurveyProService;
import vo.ActionForward;
import vo.management.DailyProgram;
import vo.survey.BodyInfo;

public class surveyFinishCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// ���ǿ� ����Ǿ��ִ� id�� �̿��ؼ� ��/�� �������� ���̺��� ��ȸ�ؼ� ������ �ִ��� Ȯ��.
		String id = (String)session.getAttribute("id");
		SurveyCheckService serveyCheck = new SurveyCheckService();
		
		// �������̺��� return �Ǹ� ����, �������̺��� return �Ǹ� ����.
		boolean manCount = serveyCheck.isSurveyComplete_M(id);
		boolean womanCount = serveyCheck.isSurveyComplete_W(id);
		
		forward = new ActionForward();
		forward.setRedirect(true);

		//
		
		
		// ��������� 
		if (manCount) { //�����϶�, �������̺� �̹� ����� �� ����̸�
			SurveyProService selectSurveyService = new SurveyProService();
			BodyInfo bodyInfoList = selectSurveyService.getMBodyInfo(id);
			
			String smoke = bodyInfoList.getSmoke();
			String drink = "N";
			String purpose = bodyInfoList.getPurpose();
			
			if (bodyInfoList.getDrink() >= 3) {
				drink = "Y";
			}
			
			ManagementService manageService = new ManagementService();
			DailyProgram goodFoodlist = manageService.getGoodfood(smoke, drink, purpose);
			DailyProgram badFoodlist = manageService.getBadfood();
			
			request.setAttribute("goodFoodList", goodFoodlist);
			request.setAttribute("badFoodlist", badFoodlist);
			// ��, ����, �����(purpose)�� DB���� �����ͼ� request�� �������ֱ�?..?
			
			session.setAttribute("gender", "M");
			forward.setPath("/mainPage.jsp");	// ���ڰ���������� �̵�...�ؾ������� ���� ��� Ȯ���� ���� �������� �̵��ϰ� �ص�.
		} else if (womanCount) { //�����϶�
			SurveyProService selectSurveyService = new SurveyProService();
			BodyInfo bodyInfoList = selectSurveyService.getWBodyInfo(id);
			
			String smoke = bodyInfoList.getSmoke();
			String drink = "N";
			String purpose = bodyInfoList.getPurpose();
			
			if (bodyInfoList.getDrink() >= 3) {
				drink = "Y";
			}
			
			ManagementService manageService = new ManagementService();
			DailyProgram goodFoodlist = manageService.getGoodfood(smoke, drink, purpose);
			DailyProgram badFoodlist = manageService.getBadfood();
			
			request.setAttribute("goodFoodList", goodFoodlist);
			request.setAttribute("badFoodlist", badFoodlist);
			
			session.setAttribute("gender", "W");
			forward.setPath("/management/dailyProgramForm.jsp");	// ���ڰ���������� �̵�
		} else { // �������� ��� ������
			out.println("<script>");
			out.println("alert('���� �������縦 �� �ּ���.');");
			out.println("</script>");
			forward.setPath("genderSelect.jsp");
		}
		return forward;
	}
}
