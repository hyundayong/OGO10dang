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
		
		// 세션에 저장되어있는 id를 이용해서 남/여 설문조사 테이블을 조회해서 정보가 있는지 확인.
		String id = (String)session.getAttribute("id");
		SurveyCheckService surveyCheck = new SurveyCheckService();
		
		// 남자테이블이 return 되면 남자, 여자테이블이 return 되면 여자.
		boolean manCount = surveyCheck.isSurveyComplete_M(id);
		boolean womanCount = surveyCheck.isSurveyComplete_W(id);
		
		forward = new ActionForward();
		forward.setRedirect(true);

		// 남자, 여자 테이블에서 해당 아이디로 설문조사가 되어있지 않으면
		if (manCount == false && womanCount == false) { 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('먼저 설문조사를 완료해주세요.')");
			out.println("document.location.href='http://localhost:8088/ogo0507_1217/survey/surveyGenderSelect.jsp'");
			out.println("</script>");
		} else {	// 설문조사를 완료했으면
			BodyInfo bodyInfoList = null;
			if(manCount) {		// 남자로 설문조사 했으면
				SurveyProService selectSurveyService = new SurveyProService();
				bodyInfoList = selectSurveyService.getMBodyInfo(id);		// 설문조사 결과 저장
				bodyInfoList.setGender("M");	// 성별 남자로 지정
			} else if (womanCount) {	// 여자로 설문조사 했으면
				SurveyProService selectSurveyService = new SurveyProService();	// 설문조사 결과 저장
				bodyInfoList = selectSurveyService.getWBodyInfo(id);
				bodyInfoList.setGender("W");
			}
			AnalysisService analysisService = new AnalysisService();
			ArrayList<String[]> exerciseList = analysisService.getMatchExercise(bodyInfoList);
			ArrayList<String[]> exerciseList_four = new ArrayList<String[]>();
			ArrayList<String[]> foodList = analysisService.getMatchFood(bodyInfoList);
			ArrayList<String[]> foodList_four = analysisService.getMatchFood(bodyInfoList);
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
			
			if(foodList.size() > 4) {
				int[] randnums = new int[4];
				for(int i = 0; i < 4; i++) {
					randnums[i] = (int)(Math.random()*foodList.size());
					for(int j = 0; j < i; j++) {
						if(randnums[i] == randnums[j]) {
							i--;
							break;		}
						}
					}
					for(int i = 0; i < randnums.length; i++) {
						foodList_four.add(i, foodList.get(randnums[i]));
					}
				} else {
					foodList_four = exerciseList;
				}
			request.setAttribute("exerciseList", exerciseList_four);		// 운동명, 운동 링크 저장
			request.setAttribute("bodyInfoList", bodyInfoList);		// 설문조사 결과 모두 저장(실질적으로 bodytype만 필요하긴 함)
			request.setAttribute("foodList", foodList_four);
			forward.setPath("/survey/bodyAnalysis.jsp");			// 체형 분석 결과 페이지로 이동
		}
		return forward;
	}
}
