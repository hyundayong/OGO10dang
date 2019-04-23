<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.Address" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Authenticator" %>
<%@ page import="util.Gmail" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.PrintWriter" %>
<%
int ran = (int)(Math.random()*(100000000) + 1);

String host = "http://localhost:8088/ogo10dang/";
String from = "ogo10dang@gmail.com";
String to = request.getParameter("email");
String subject = "사용자 인증 메일입니다.";
String content = "사용자 인증 코드는 " + ran + "입니다.";

Properties p = new Properties();
p.put("mail.smtp.user", from);
p.put("mail.smtp.host", "smtp.googlemail.com");
p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");

try {
	Authenticator auth = new Gmail();
	Session ses = Session.getInstance(p, auth);
	ses.setDebug(true);
	MimeMessage msg = new MimeMessage(ses);
	msg.setSubject(subject);
	Address fromAddr = new InternetAddress(from);
	msg.setFrom(fromAddr);
	Address toAddr = new InternetAddress(to);
	msg.addRecipient(Message.RecipientType.TO, toAddr);
	msg.setContent(content, "text/html; charset=UTF-8");
	Transport.send(msg);
	session.setAttribute("emailcode", ran);
} catch(Exception e) {
	System.out.println("emailSendAction.jsp 에러 : " + e);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('메일 전송 오류');");
	script.println("history.back();");
	script.println("</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 전송</title>
</head>
<body>
	<br>
	<h2>이메일이 전송되었습니다.</h2>
	<h2><%=request.getParameter("email") %></h2>
</script>
</body>
</html>
