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
		
		// 세션에 저장되어있는 id를 이용해서 남/여 설문조사 테이블을 조회해서 정보가 있는지 확인.
		String id = (String)session.getAttribute("id");
		SurveyCheckService serveyCheck = new SurveyCheckService();
		
		// 남자테이블이 return 되면 남자, 여자테이블이 return 되면 여자.
		boolean manCount = serveyCheck.isSurveyComplete_M(id);
		boolean womanCount = serveyCheck.isSurveyComplete_W(id);
		
		forward = new ActionForward();
		forward.setRedirect(true);

		// 남자, 여자 테이블에서 해당 아이디로 설문조사가 되어있지 않으면
		if (manCount == false && womanCount == false) { 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('먼저 설문조사를 완료해주세요.')");
			out.println("document.location.href='http://localhost:8088/ogo10dang_work/survey/surveyGenderSelect.jsp'");
			out.println("</script>");
		} else {	// 설문조사를 완료했으면
			BodyInfo bodyInfoList = null;
			if(manCount) {
				SurveyProService selectSurveyService = new SurveyProService();
				bodyInfoList = selectSurveyService.getMBodyInfo(id);
				bodyInfoList.setGender("M");
				// 출처: https://jeong-pro.tistory.com/87 [기본기를 쌓는 정아마추어 코딩블로그]
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
