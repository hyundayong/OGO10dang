<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int emailcode = (int)session.getAttribute("emailcode");
		int usercode = Integer.parseInt(request.getParameter("usercode"));
		
		if(emailcode == usercode) { %>
			<br><br>
			<h4>사용자가 인증되었습니다.</h4>
			<input type="button" value="닫기" onclick="setemail()">
		<%
			session.removeAttribute("emailcode");
			} else { %>
			<br><br>
			<h4>인증번호를 다시 확인해주세요.</h4>
		<% } %>
		<script>
			function setemail() {
			opener.document.registForm.emailvalidation.value="true";
			this.close();
			}
		</script>
</body>
</html>