<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.RegistInfoBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean class="vo.RegistInfoBean" id="userinfo" scope="session"/>
	<jsp:setProperty name="userinfo" property="*" />
	<jsp:forward page="registForm.member" />
</body>
</html>