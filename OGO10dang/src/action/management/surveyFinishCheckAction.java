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
		
		// 세션에 저장되어있는 id를 이용해서 남/여 설문조사 테이블을 조회해서 정보가 있는지 확인.
		String id = (String)session.getAttribute("id");
		SurveyCheckService serveyCheck = new SurveyCheckService();
		
		// 남자테이블이 return 되면 남자, 여자테이블이 return 되면 여자.
		boolean manCount = serveyCheck.isSurveyComplete_M(id);
		boolean womanCount = serveyCheck.isSurveyComplete_W(id);
		
		forward = new ActionForward();
		forward.setRedirect(true);

		//
		
		
		// 결과적으로 
		if (manCount) { //남자일때, 남자테이블에 이미 등록을 한 사람이면
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
			// 흡연, 음주, 운동목적(purpose)를 DB에서 가져와서 request에 전달해주기?..?
			
			session.setAttribute("gender", "M");
			forward.setPath("/mainPage.jsp");	// 남자결과페이지로 이동...해야하지만 아직 없어서 확인을 위해 메인으로 이동하게 해둠.
		} else if (womanCount) { //여자일때
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
			forward.setPath("/management/dailyProgramForm.jsp");	// 여자결과페이지로 이동
		} else { // 설문조사 기록 없을때
			out.println("<script>");
			out.println("alert('먼저 설문조사를 해 주세요.');");
			out.println("</script>");
			forward.setPath("genderSelect.jsp");
		}
		return forward;
	}
}
