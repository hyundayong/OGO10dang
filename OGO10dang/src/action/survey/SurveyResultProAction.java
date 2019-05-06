package action.survey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.survey.SurveyProService;
import vo.ActionForward;
import vo.survey.BodyInfo;

/////////// 결과페이지에서 수정을 눌렀을때 업데이트를 해주기 위해 만든 액션 클래스로, 아직 미완성 되었음. 
public class SurveyResultProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BodyInfo bodyinfoBean = new BodyInfo();	// 설문조사정보를 묶을 자바빈을 만들었당 
		ActionForward forward = null;		
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();	// 세션에 저장되어있는 id같은걸 확인해야하니깐 세션연결
		
		int score = 0;
		int muscle = 0;
		String bodytype = "";
		// 남자일때 - 팔. 가슴. 복부. 하체. // 1번 - 1점 / 2번 - 2점/ 3번 - 3점 / 4번 - 2점  
		if(request.getParameter("gender").equals("man")) {
			
			if (request.getParameter("arm").equals("4")) { muscle +=1; score += 2; } 
			else { score += Integer.parseInt(request.getParameter("arm")); }
			if (request.getParameter("chest").equals("4")) { muscle +=1; score += 2; } 
			else { score += Integer.parseInt(request.getParameter("chest")); }
			if (request.getParameter("belly").equals("4")) {muscle +=1; score += 2;} 
			else { score += Integer.parseInt(request.getParameter("belly")); }
			if (request.getParameter("leg").equals("4")) { muscle +=1; score += 2; } 
			else { score += Integer.parseInt(request.getParameter("leg"));}
			
			score+= Integer.parseInt(request.getParameter("shoulder"));
		} else { // 여자일때
			
			if (request.getParameter("arm").equals("4")) { muscle +=1; score += 2; } 
			else {score += Integer.parseInt(request.getParameter("arm")); }
			if (request.getParameter("belly").equals("4")) {muscle +=1; score += 2; } 
			else { score += Integer.parseInt(request.getParameter("belly")); }
			if (request.getParameter("thigh").equals("4")) { muscle +=1; score += 2; } 
			else { score += Integer.parseInt(request.getParameter("thigh")); }
			if (request.getParameter("calf").equals("4")) { muscle +=1; score += 2; } 
			else { score += Integer.parseInt(request.getParameter("calf")); }
			if (request.getParameter("hip").equals("4")) { muscle +=1; score += 2; } 
			else { score += Integer.parseInt(request.getParameter("hip")); }
		}
		
		if (muscle >= 3 ) { bodytype = "근육형"; } 
		else {
			if (score >= 5 && score <= 7) { bodytype = "마름"; } 
			else if (score >= 8 && score <= 12) { bodytype = "보통"; }
			else if (score >= 13 && score <= 15) { bodytype = "비만"; }
		}
		
		bodyinfoBean.setId((String)session.getAttribute("id"));
		// 설문 항목 총 14가지 정보
		bodyinfoBean.setName(request.getParameter("name"));
		bodyinfoBean.setGender(request.getParameter("gender"));
		bodyinfoBean.setAge(Integer.parseInt(request.getParameter("age")));
		bodyinfoBean.setHeight(Integer.parseInt(request.getParameter("height")));
		bodyinfoBean.setWeight(Integer.parseInt(request.getParameter("weight")));
		
		bodyinfoBean.setSmoke(request.getParameter("smoke"));
		bodyinfoBean.setDrink(Integer.parseInt(request.getParameter("drink")));
		bodyinfoBean.setExercise(Integer.parseInt(request.getParameter("exercise")));
		bodyinfoBean.setPurpose(request.getParameter("purpose"));
		
		bodyinfoBean.setArm(Integer.parseInt(request.getParameter("arm")));
		bodyinfoBean.setBelly(Integer.parseInt(request.getParameter("belly")));
		
		bodyinfoBean.setScore(score);
		bodyinfoBean.setMuscle(muscle);
		bodyinfoBean.setBodytype(bodytype);
		
		SurveyProService surveyProService = new SurveyProService();
		
		if (bodyinfoBean.getGender().equals("man")) {	// 남자일때 - 공통부분외에 추가되는 설문항목 3가지 더 저장하고 연결
			bodyinfoBean.setChest(Integer.parseInt(request.getParameter("chest")));
			bodyinfoBean.setShoulder(Integer.parseInt(request.getParameter("shoulder")));
			bodyinfoBean.setLeg(Integer.parseInt(request.getParameter("leg")));
			surveyProService.updateMBodyInfo(bodyinfoBean);
			
		} else if (bodyinfoBean.getGender().equals("woman")) { // 여자일때 - 공통부분외에 추가되는 설문항목 3가지 저장하고 연결
			bodyinfoBean.setThigh(Integer.parseInt(request.getParameter("thigh")));
			bodyinfoBean.setCalf(Integer.parseInt(request.getParameter("calf")));
			bodyinfoBean.setHip(Integer.parseInt(request.getParameter("hip")));
			surveyProService.updateWBodyInfo(bodyinfoBean);
		} else {
			System.out.println("SurveyResultProAction에서 String gender 확인 불가");
		}
		
		forward = new ActionForward();
		forward.setRedirect(true);
		
		// 완료하고나서 어디로 이동할지
		if (request.getParameter("gender").equals("man")) {
			request.setAttribute("bodyInfoList", bodyinfoBean);
			forward.setPath("/survey/manSurveyFormResult.jsp");
		} else if (request.getParameter("gender").equals("woman")) {
			request.setAttribute("bodyInfoList", bodyinfoBean);
			forward.setPath("/survey/womanSurveyFormResult.jsp");
		} else {
			System.out.println("SurveyProAction else 입장1");
		}
		return forward;
	}
}
