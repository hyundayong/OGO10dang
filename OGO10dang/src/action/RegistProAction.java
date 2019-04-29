package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.RegistProService;
import vo.ActionForward;
import vo.RegistInfoBean;
import vo.Registration;

public class RegistProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Registration registBean = null;
		ActionForward forward = null;
		boolean isRegistSuccess = false;
		
		// 사용자가 회원가입시 입력한 정보 저장 클래스
		RegistInfoBean registInfoBean = new RegistInfoBean();
		HttpSession session = request.getSession();
		registInfoBean = (RegistInfoBean)session.getAttribute("userinfo");	// 사용자 입력 정보를 session에서 가져옴

		// 가입 완료시 사용자 정보를 최종적으로 저장할 클래스
		registBean = new Registration();
		
		String pw1 = request.getParameter("pw1");
		String pw2 = request.getParameter("pw2");

		if (registInfoBean.getIdvalidation().equals("false")) {	// 아이디 중복확인을 하지 않았을 때
			session.removeAttribute("userinfo");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 중복확인을 해주세요');");
			out.println("document.location.href='backRegistForm.jsp'");		// 기존에 입력한 값이 setting되어있는 회원가입폼으로 이동
			out.println("</script>");
		} else if (!(pw1.equals(pw2))) {	// 비밀번호 1,2가 일치하지 않을 때
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("document.location.href='backRegistForm.jsp'");		// 기존에 입력한 값이 setting되어있는 회원가입폼으로 이동
			out.println("</script>");
		} else if(registInfoBean.getEmailvalidation().equals("false")) {	// 이메일 본인인증을 하지 않았을 때
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이메일 인증을 완료해주세요');");
			out.println("document.location.href='backRegistForm.jsp'");		// 기존에 입력한 값이 setting되어있는 회원가입폼으로 이동
			out.println("</script>");
		} else {	// 위 조건 모두 만족 -> 회원가입 정보를 자바빈 객체에 set, -> 서비스객체 생성, import, 연결
			// 최종 정보를 자바빈 객체에 저장
			registBean.setName(request.getParameter("name"));
			registBean.setId(request.getParameter("id"));
			registBean.setPw(request.getParameter("pw1"));
			registBean.setTel(request.getParameter("tel"));
			registBean.setEmail(request.getParameter("email"));
			
			// 가입 service
			RegistProService registProService = new RegistProService();
			// 등록이 완료되면 true, 실패하면 false
			isRegistSuccess = registProService.registMember(registBean);
			
			if (!isRegistSuccess) {	// 다른 오류로 가입이 실패된 경우
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원가입에 실패하였습니다.');");
				out.println("history.back();");
				out.println("</script>");
			} else {	// 가입이 완료되어 회원정보가 최종 등록되면
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("mainPage.jsp");	// 메인 페이지로 이동하고
				session.removeAttribute("userinfo");	// 세션에 저장한 회원가입 자바빈 객체를 제거
			}
		}
		return forward;
	}

}
