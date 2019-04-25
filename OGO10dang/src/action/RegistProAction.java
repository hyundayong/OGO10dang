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
		
		// ����ڰ� ȸ�����Խ� �Է��� ���� ���� Ŭ����
		RegistInfoBean registInfoBean = new RegistInfoBean();
		HttpSession session = request.getSession();
		registInfoBean = (RegistInfoBean)session.getAttribute("userinfo");	// ����� �Է� ������ session���� ������

		// ���� �Ϸ�� ����� ������ ���������� ������ Ŭ����
		registBean = new Registration();
		
		String pw1 = request.getParameter("pw1");
		String pw2 = request.getParameter("pw2");

		if (registInfoBean.getIdvalidation().equals("false")) {	// ���̵� �ߺ�Ȯ���� ���� �ʾ��� ��
			session.removeAttribute("userinfo");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('���̵� �ߺ�Ȯ���� ���ּ���');");
			out.println("document.location.href='backRegistForm.jsp'");		// ������ �Է��� ���� setting�Ǿ��ִ� ȸ������������ �̵�
			out.println("</script>");
		} else if (!(pw1.equals(pw2))) {	// ��й�ȣ 1,2�� ��ġ���� ���� ��
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.');");
			out.println("document.location.href='backRegistForm.jsp'");		// ������ �Է��� ���� setting�Ǿ��ִ� ȸ������������ �̵�
			out.println("</script>");
		} else if(registInfoBean.getEmailvalidation().equals("false")) {	// �̸��� ���������� ���� �ʾ��� ��
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('�̸��� ������ �Ϸ����ּ���');");
			out.println("document.location.href='backRegistForm.jsp'");		// ������ �Է��� ���� setting�Ǿ��ִ� ȸ������������ �̵�
			out.println("</script>");
		} else {	// �� ���� ��� ���� -> ȸ������ ������ �ڹٺ� ��ü�� set, -> ���񽺰�ü ����, import, ����
			// ���� ������ �ڹٺ� ��ü�� ����
			registBean.setName(request.getParameter("name"));
			registBean.setId(request.getParameter("id"));
			registBean.setPw(request.getParameter("pw1"));
			registBean.setTel(request.getParameter("tel"));
			registBean.setEmail(request.getParameter("email"));
			
			// ���� service
			RegistProService registProService = new RegistProService();
			// ����� �Ϸ�Ǹ� true, �����ϸ� false
			isRegistSuccess = registProService.registMember(registBean);
			
			if (!isRegistSuccess) {	// �ٸ� ������ ������ ���е� ���
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('ȸ�����Կ� �����Ͽ����ϴ�.');");
				out.println("history.back();");
				out.println("</script>");
			} else {	// ������ �Ϸ�Ǿ� ȸ�������� ���� ��ϵǸ�
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("mainPage.jsp");	// ���� �������� �̵��ϰ�
				session.removeAttribute("userinfo");	// ���ǿ� ������ ȸ������ �ڹٺ� ��ü�� ����
			}
		}
		return forward;
	}

}
