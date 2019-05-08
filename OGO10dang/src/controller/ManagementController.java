package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.management.ManagementAction;
import action.management.surveyFinishCheckAction;
import vo.ActionForward;

@WebServlet("*.manage")
public class ManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ManagementController() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	
    	Action action = null;
    	ActionForward forward = null;
    	
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command = requestURI.substring(contextPath.length());
    	
    	if (command.equals("/management/dailyForm.manage")) {
    		action = new ManagementAction();
    		try {
    			forward = action.execute(request, response);
    			// number를 들고가야하니까 여기서도 dispatcher로 해줘야하는걸까?
    			forward.setRedirect(false); 
    		} catch(Exception e) {
    			e.printStackTrace();
    		}
    	} else if (command.equals("/management/surveyFinishCheck.manage")){
    		System.out.println("surveyFinishCheck.manage로 controller 들어왔는지 확인하기.");
    		action = new surveyFinishCheckAction();
    		try {
    			forward = action.execute(request, response);
    			forward.setRedirect(false); 
    		} catch(Exception e) {
    			e.printStackTrace();
    		}
    	}else {
    		
    		
    	}
    	
    	
    	
    	if(forward != null) {
    		if(forward.isRedirect()) {
    			System.out.println("redirect");
    			response.sendRedirect(forward.getPath());
    		} else {
    			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
    			System.out.println("dispatcher");
    			dispatcher.forward(request, response);
    		}
    	}
  
	}
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
