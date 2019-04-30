package action.survey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.survey.SurveyProService;
import vo.ActionForward;
import vo.survey.BodyInfo;

/////////// ������������� ������ �������� ������Ʈ�� ���ֱ� ���� ���� �׼� Ŭ������, ���� �̿ϼ� �Ǿ���. 
public class SurveyResultProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BodyInfo bodyinfoBean = new BodyInfo();	// �������������� ���� �ڹٺ��� ������� 
		ActionForward forward = null;		
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();	// ���ǿ� ����Ǿ��ִ� id������ Ȯ���ؾ��ϴϱ� ���ǿ���
		
		int score = 0;
		int muscle = 0;
		String bodytype = "";
		// �����϶� - ��. ����. ����. ��ü. // 1�� - 1�� / 2�� - 2��/ 3�� - 3�� / 4�� - 2��  
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
		} else { // �����϶�
			
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
		
		if (muscle >= 3 ) { bodytype = "������"; } 
		else {
			if (score >= 5 && score <= 7) { bodytype = "����"; } 
			else if (score >= 8 && score <= 12) { bodytype = "����"; }
			else if (score >= 13 && score <= 15) { bodytype = "��"; }
		}
		
		bodyinfoBean.setId((String)session.getAttribute("id"));
		// ���� �׸� �� 14���� ����
		bodyinfoBean.setName(request.getParameter("name"));
		bodyinfoBean.setGender(request.getParameter("gender"));
		bodyinfoBean.setAge(Integer.parseInt(request.getParameter("age")));
		bodyinfoBean.setAge(Integer.parseInt(request.getParameter("height")));
		bodyinfoBean.setAge(Integer.parseInt(request.getParameter("weight")));
		
		bodyinfoBean.setSmoke(request.getParameter("smoke"));
		bodyinfoBean.setDrink(Integer.parseInt(request.getParameter("drink")));
		bodyinfoBean.setExercise(Integer.parseInt(request.getParameter("exercise")));
		bodyinfoBean.setPurpose(request.getParameter("purpose"));
		
		bodyinfoBean.setArm(Integer.parseInt(request.getParameter("arm")));
		bodyinfoBean.setChest(Integer.parseInt(request.getParameter("chest")));
		bodyinfoBean.setShoulder(Integer.parseInt(request.getParameter("shoulder")));
		bodyinfoBean.setBelly(Integer.parseInt(request.getParameter("belly")));
		bodyinfoBean.setLeg(Integer.parseInt(request.getParameter("leg")));
		
		bodyinfoBean.setScore(score);
		bodyinfoBean.setMuscle(muscle);
		bodyinfoBean.setBodytype(bodytype);
		
		SurveyProService surveyProService = new SurveyProService();
		surveyProService.updateMBodyInfo(bodyinfoBean);
		
		forward = new ActionForward();
		forward.setRedirect(true);
		
		// �Ϸ��ϰ��� ���� �̵�����
		if (request.getParameter("gender").equals("man")) {
			forward.setPath("/survey/manSurveyFormResult.jsp");
		} else if (request.getParameter("gender").equals("woman")) {
			forward.setPath("/survey/womanSurveyFormResult.jsp");
		} else {
			System.out.println("SurveyProAction else ����1");
		}
		return forward;
	}
}
