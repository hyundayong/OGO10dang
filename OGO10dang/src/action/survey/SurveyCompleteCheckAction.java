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
		
		// 세션에 저장되어있는 id를 이용해서 남/여 설문조사 테이블을 조회해서 정보가 있는지 확인.
		String id = (String)session.getAttribute("id");
		SurveyCheckService serveyCheck = new SurveyCheckService();
		
		// 남자테이블이 return 되면 남자, 여자테이블이 return 되면 여자.
		boolean manCount = serveyCheck.isSurveyComplete_M(id);
		boolean womanCount = serveyCheck.isSurveyComplete_W(id);
		
		forward = new ActionForward();
		forward.setRedirect(true);

		// 결과적으로 
		if (manCount) { //남자일때, 남자테이블에 이미 등록을 한 사람이면
			SurveyProService selectSurveyService = new SurveyProService();
			BodyInfo bodyInfoList = selectSurveyService.getMBodyInfo(id);
			request.setAttribute("bodyInfoList", bodyInfoList);
			session.setAttribute("gender", "M");
			forward.setPath("/survey/manSurveyFormResult.jsp");	// 남자결과페이지로 이동
		} else if (womanCount) { //여자일때
			SurveyProService selectSurveyService = new SurveyProService();
			BodyInfo bodyInfoList = selectSurveyService.getWBodyInfo(id);
			request.setAttribute("bodyInfoList", bodyInfoList);
			session.setAttribute("gender", "W");
			forward.setPath("/survey/womanSurveyFormResult.jsp");	// 여자결과페이지로 이동
		} else { // 설문조사 기록 없을때
			forward.setPath("/survey/surveyGenderSelect.jsp");
		}
		return forward;
	}
}
