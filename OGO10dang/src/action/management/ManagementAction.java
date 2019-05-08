package action.management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.management.ManagementService;
import svc.survey.SurveyCheckService;
import vo.ActionForward;
import vo.management.DailyProgram;

public class ManagementAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		
		String selectDay = request.getParameter("number");
		String id = (String)session.getAttribute("id");
		SurveyCheckService serveyCheck = new SurveyCheckService();
		boolean manCount = serveyCheck.isSurveyComplete_M(id);
		boolean womanCount = serveyCheck.isSurveyComplete_W(id);
		forward = new ActionForward();
		forward.setRedirect(true);
		
		if(manCount) {
			ManagementService manageService = new ManagementService();
			DailyProgram dailyprogram_m = manageService.getDailyProgram_M(selectDay);
			request.setAttribute("dailyprogram_m", dailyprogram_m);
			forward.setPath("/management/dailyProgramForm2.jsp?number="+selectDay);
		} else if(womanCount) {
			// ���� ���� - ���񽺿��� selectDailyProgramDAO�� ������Ѽ�
			// DAO���� [vo] DailyProgram�� �迭�� ������ ������ ����.
			ManagementService manageService = new ManagementService();
			DailyProgram dailyprogram = manageService.getDailyProgram(selectDay);
			
			request.setAttribute("dailyprogram",dailyprogram);
			forward.setPath("/management/dailyProgramForm2.jsp?number="+selectDay);
		}
		// ������ ������ ������������ ���ư��°� ���� �����Ƿ� 
		// ����������.jsp ������ input value���� ���⼭ request.set~���� �����Ų ����
		// get���� �ҷ��ͼ� value�� <%= %>�� �����־ ��µǵ��� �ϸ� �� �� ����.
		return forward;
	}

}
