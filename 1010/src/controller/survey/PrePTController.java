package controller.survey;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.survey.SurveyCompleteCheckAction;
import action.survey.SurveyProAction;
import action.survey.SurveyResultProAction;
import vo.ActionForward;

@WebServlet("*.pre")
public class PrePTController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	  private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	request.setCharacterEncoding("utf-8");
	    	
	    	Action action = null;
	    	ActionForward forward = null;
	    	
	    	String requestURI = request.getRequestURI();
	    	String contextPath = request.getContextPath();
	    	String command = requestURI.substring(contextPath.length());

	    	if (command.equals("/manSurveyForm.pre") || command.equals("/womanSurveyForm.pre")) {
	    		action= new SurveyProAction();
	    		try {
	    			forward = action.execute(request,  response);
	    			forward.setRedirect(false);
	    		} catch(Exception e) {
	    			e.printStackTrace();
	    		}
	    	} else if (command.equals("/manSurveyFormResult.pre") || command.equals("/womanSurveyFormResult.pre")) {
	    		action= new SurveyResultProAction();
	    		try {
	    			forward = action.execute(request,  response);
	    			forward.setRedirect(false);
	    		} catch(Exception e) {
	    			e.printStackTrace();
	    		}
	    		
	    	} else if (command.equals("/surveyCompleteCheck.pre")){
	    		action= new SurveyCompleteCheckAction();
	    		try {
	    			forward = action.execute(request,  response);
	    			forward.setRedirect(false);
	    		} catch(Exception e) {
	    			e.printStackTrace();
	    		}
	    	} 
	    	if(forward != null) {
	    		if(forward.isRedirect()) {
	    			System.out.println("redirect");
	    			response.sendRedirect(forward.getPath());
	    		} else {
	    			System.out.println("dispatcher");
	    			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
	    			dispatcher.forward(request, response);
	    		}
	    	}
	    }
	    
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request,response);
		}
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request,response);
		}
}
