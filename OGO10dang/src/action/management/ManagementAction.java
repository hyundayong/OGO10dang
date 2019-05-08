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
			// 서비스 연결 - 서비스에서 selectDailyProgramDAO로 연결시켜서
			// DAO에서 [vo] DailyProgram에 배열로 정보를 저장할 예정.
			ManagementService manageService = new ManagementService();
			DailyProgram dailyprogram = manageService.getDailyProgram(selectDay);
			
			request.setAttribute("dailyprogram",dailyprogram);
			forward.setPath("/management/dailyProgramForm2.jsp?number="+selectDay);
		}
		// 정보를 가지고 관리페이지로 돌아가는것 까지 했으므로 
		// 관리페이지.jsp 에서는 input value값을 여기서 request.set~으로 저장시킨 값을
		// get으로 불러와서 value에 <%= %>로 적어주어서 출력되도록 하면 될 것 같다.
		return forward;
	}

}
