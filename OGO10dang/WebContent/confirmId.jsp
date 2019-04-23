<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="svc.RegistProService" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String idvalidation = request.getParameter("idvalidation");
	RegistProService registProService = new RegistProService();
	boolean idavailable = registProService.idOverlapCheck(id);
	
	if(id.equals("")) { %>
		<br><br>
		<h4>아이디를 입력하세요</h4>
	<%}else if(idavailable){ %>
		<br><br>
		<h4>입력하신 <%=id %>는 사용하실 수 있는 ID입니다.</h4>
		<input type="button" value="닫기" onclick="setId()">
	<% } else { %>
		<br><br>
		<h4>이미 사용중인 ID 입니다.</h4>
	<% }  %>
	<script>
	function setId() {
		opener.document.registForm.id.value="<%=id %>";
		opener.document.registForm.idvalidation.value="true";
		this.close();
	}
	</script>
</body>
</html>
